BattleCommand_SheerForce:
	call CheckNeutralGas
	ret z
	call GetUserAbility
	cp MOLD_BREAKER
	jr z, .SkipShieldDust
	call GetTargetAbility
	cp SHIELD_DUST
	jr z, .SkipSheerForceCheck
.SkipShieldDust
	call GetUserAbility
	cp SHEER_FORCE
	ret nz

.SkipSheerForceCheck
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	ld hl, SheerForceEffects
	ld de, 1
	call IsInArray
	jr c, .SheerForceEffectRemoval
	ret

.SheerForceEffectRemoval:
	farcall EndMoveEffect
	ret

SheerForceEffectCheck:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	ld hl, SheerForceEffects
	ld de, 1
	call IsInArray
	ret
