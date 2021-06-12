BattleCommand_WakeUpSlap:
; Doubles power on sleeping opponents (unless behind a Substitute)
	farcall CheckSubstituteOpp
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and SLP
	ret z

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	sla [hl]
	ret

BattleCommand_AwakenOpponent:
; Doubles power on sleeping opponents (unless behind a Substitute)
	ld a, [wEffectFailed]
	and a
	ret nz

	ld a, [wTypeModifier]
	and $7f
	ret z

	farcall CheckSubstituteOpp
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld a, [hl]
	and SLP
	ret z
	ld [hl], 0

	call BattleCommand_SwitchTurn
	ld hl, WokeUpText
	call StdBattleTextbox
	jp BattleCommand_SwitchTurn
