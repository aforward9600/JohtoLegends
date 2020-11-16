BattleCommand_Hex:
; hex
; get the opponent's status condition
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
; Return if it's 0 (no condition)
	and a
	ret z
; if's not 0, so double damage
	jp DoubleDamage
