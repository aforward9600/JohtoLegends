BattleCommand_MagicBounce:
	call CheckNeutralGas
	ret z
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_SWAGGER
	jr z, .SwaggerCheck
	cp EFFECT_FLATTER
	jr z, .SwaggerCheck
	call GetTargetAbility
	cp MAGIC_BOUNCE
	ret nz

	call GetUserAbility
	cp MOLD_BREAKER
	ret z

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	ret nz

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld b, a
	push bc
	farcall BattleCommand_SwitchTurn

	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	ld a, [hl]
	pop bc
	ld [hl], b
	push af

	ld a, b
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	ld hl, BouncedBackText
	call StdBattleTextbox

	farcall UpdateMoveData
	farcall BattleCommand_LowerSub
	farcall ResetTurn
	ld a, BATTLE_VARS_MOVE
	call GetBattleVarAddr
	pop af
	ld [hl], a
	farcall UpdateMoveData
	farcall BattleCommand_SwitchTurn
	ret

.SwaggerCheck
	call GetTargetAbility
	cp OWN_TEMPO
	ret nz
	farcall AnimateFailedMove
	ld hl, SwaggerOwnTempoText
	jp StdBattleTextbox
