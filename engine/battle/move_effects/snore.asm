BattleCommand_Snore:
; snore
	ld a, BATTLE_VARS_STATUS
	farcall GetBattleVar
	and SLP
	ret nz
	farcall ResetDamage
	ld a, $1
	ld [wAttackMissed], a
	farcall FailMove
	jp EndMoveEffect
