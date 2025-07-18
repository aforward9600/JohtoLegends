BattleCommand_Selfdestruct:
	call CheckUserNeutralGasMoldBreaker
	jr z, .ContinueSelfdestruct
	call GetTargetAbility
	cp DAMP
	jr z, .FailSelfdestruct
.ContinueSelfdestruct
	farcall StubbedTrainerRankings_Selfdestruct
	ld a, BATTLEANIM_PLAYER_DAMAGE
	ld [wNumHits], a
	ld c, 3
	call DelayFrames
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	xor a
	ld [hli], a
	inc hl
	ld [hli], a
	ld [hl], a
	ld a, $1
	ld [wKickCounter], a
	call BattleCommand_LowerSub
	call LoadMoveAnim
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	res SUBSTATUS_LEECH_SEED, [hl]
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	res SUBSTATUS_DESTINY_BOND, [hl]
	call _CheckBattleScene
	ret nc
	farcall DrawPlayerHUD
	farcall DrawEnemyHUD
	call WaitBGMap
	jp RefreshBattleHuds

.FailSelfdestruct
	ld c, 3
	call DelayFrames
	ld hl, BattleText_Damp
	call StdBattleTextbox
	jp EndMoveEffect
