BattleCommand_Venoshock:
; venoshock
; get the opponent's status condition
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
; return if it's 0 (no condition)
	and $8
	and a
	ret z
; it's (1 << PSN), so double damage
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	sla [hl]
	ret