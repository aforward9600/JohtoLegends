BattleCommand_ShellSmash:
; shellsmash

; Defense
	call ResetMiss
	ld a, DEFENSE
	call LowerStat
	call BattleCommand_SwitchTurn
	call BattleCommand_StatDownMessage

; Special Defense
	call ResetMiss
	ld a, SP_DEFENSE
	call LowerStat
	call BattleCommand_StatDownMessage

	call BattleCommand_SwitchTurn

; Attack
	call ResetMiss
	call BattleCommand_AttackUp2
	call BattleCommand_StatUpMessage

; Special Attack
	call ResetMiss
	call BattleCommand_SpecialAttackUp2
	call BattleCommand_StatUpMessage

; Speed
	call ResetMiss
	call BattleCommand_SpeedUp2
	jp   BattleCommand_StatUpMessage
