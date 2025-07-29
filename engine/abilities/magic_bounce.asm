BattleCommand_MagicBounce:
	call CheckUserNeutralGasMoldBreaker
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

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	ret nz

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld b, a
	push bc
	call BattleCommand_SwitchTurn2

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
	call BattleCommand_SwitchTurn2
	ret

.SwaggerCheck
	call GetTargetAbility
	cp OWN_TEMPO
	ret nz
	farcall AnimateFailedMove
	ld hl, SwaggerOwnTempoText
	jp StdBattleTextbox
