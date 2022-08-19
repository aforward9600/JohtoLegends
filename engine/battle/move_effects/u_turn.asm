BattleCommand_UTurn:
; uturn

	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy_turn

	farcall CheckPlayerHasMonToSwitchTo
	ret z

	call UpdateUserInParty
	ld c, 20
	call DelayFrames
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	ld hl, UTurnOutPlayerText
	call StdBattleTextbox

	call BattleCommand_Teleport.PlayerUTurn
	callfar PursuitSwitch
	ret

.enemy_turn:
	farcall FindAliveEnemyMons
	ret c

	ld a, [wBattleMode]
	dec a
	ret z

	call UpdateEnemyMonInParty
	ld a, $1
	ld [wKickCounter], a

	ld hl, UTurnOutEnemyText
	call StdBattleTextbox

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
