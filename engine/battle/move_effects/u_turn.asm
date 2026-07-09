BattleCommand_UTurn:
; uturn

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy_turn

	call CheckPlayerHasMonToSwitchTo
	ret z

	farcall PlayerSwitchAbilities

	call UpdateUserInParty
	ld c, 20
	call DelayFrames
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	ld hl, UTurnOutPlayerText
	call StdBattleTextbox

	ld hl, wEnemyMonHP
	ld a, [hli]
	or [hl]
	jr nz, .Skip
	ld a, 1
	ld [wEnemyMonFainted], a

.Skip
	call BattleCommand_Teleport.PlayerUTurn
	callfar PursuitSwitch
	ret

.enemy_turn:
	farcall FindAliveEnemyMons
	ret c

	farcall EnemySwitchAbilities

	ld a, [wBattleMode]
	dec a
	ret z

	call UpdateEnemyMonInParty
	ld a, $1
	ld [wKickCounter], a

	ld hl, UTurnOutEnemyText
	call StdBattleTextbox

	ld hl, wBattleMonHP
	ld a, [hli]
	or [hl]
	jp nz, BattleCommand_Teleport.enemy_uturn
	ld a, 1
	ld [wPlayerMonFainted], a

	jp BattleCommand_Teleport.enemy_uturn

BattleCommand_UTurnAnim:
; uturnanim

; unique animation if used as the last Pokemon
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy_turn

	farcall CheckPlayerHasMonToSwitchTo
	jp nz, BattleCommand_MoveAnim
	jp .reappear

.enemy_turn:
	farcall FindAliveEnemyMons
	jp nc, BattleCommand_MoveAnim
.reappear:
	ld a, 1
	ld [wBattleAnimParam], a
	jp PlayDamageAnim
