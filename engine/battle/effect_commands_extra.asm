CallBattleCore2:
	ld a, BANK("Battle Core")
	rst FarCall
	ret

BattleCommand_UsedMoveText:
; usedmovetext
	farcall DisplayUsedMoveText
	ret

BattleCommand_DamageVariation:
; damagevariation

; Modify the damage spread between 85% and 100%.

; Because of the method of division the probability distribution
; is not consistent. This makes the highest damage multipliers
; rarer than normal.

; No point in reducing 1 or 0 damage.
	ld hl, wCurDamage
	ld a, [hli]
	and a
	jr nz, .go
	ld a, [hl]
	cp 2
	ret c

.go
; Start with the maximum damage.
	xor a
	ldh [hMultiplicand + 0], a
	dec hl
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a

	farcall EffectiveDefensiveAbilities

; Multiply by 85-100%...
.loop
	call BattleRandom
	rrca
	cp 85 percent + 1
	jr c, .loop

	ldh [hMultiplier], a
	call Multiply

; ...divide by 100%...
	ld a, $ff ; 100%
	ldh [hDivisor], a
	ld b, $4
	call Divide

; ...to get .85-1.00x damage.
	ldh a, [hQuotient + 2]
	ld hl, wCurDamage
	ld [hli], a
	ldh a, [hQuotient + 3]
	ld [hl], a
	ret

BattleCommand_CriticalText:
; criticaltext
; Prints the message for critical hits or one-hit KOs.

; If there is no message to be printed, wait 20 frames.
	ld a, [wCriticalHit]
	and a
	jr z, .wait

	dec a
	add a
	ld hl, .texts
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call StdBattleTextbox

	xor a
	ld [wCriticalHit], a

	call CheckNeutralGas
	jr z, .wait
	call GetTargetAbility
	cp ANGER_POINT
	jr nz, .wait
	call BattleCommand_SwitchTurn2
	farcall BattleCommand_AttackUp2
	ld a, [wAttackMissed]
	and a
	jr nz, .CriticalSwitch
	call BattleCommand_SwitchTurn2
	ld a, 5
	call BattleCommand_SwitchTurn2
.AngerPointLoop
	push af
	farcall BattleCommand_AttackUp2
	pop af
	dec a
	jr nz, .AngerPointLoop
	call BattleCommand_SwitchTurn2
	ld hl, AngerPointText
	call StdBattleTextbox

.wait
	ld c, 20
	jp DelayFrames

.texts
	dw CriticalHitText
	dw OneHitKOText

.CriticalSwitch
	call BattleCommand_SwitchTurn2
	jr .wait

BattleCommand_RageDamage:
; ragedamage

	ld a, [wCurDamage]
	ld h, a
	ld b, a
	ld a, [wCurDamage + 1]
	ld l, a
	ld c, a
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerRageCounter]
	jr z, .rage_loop
	ld a, [wEnemyRageCounter]
.rage_loop
	and a
	jr z, .done
	dec a
	add hl, bc
	jr nc, .rage_loop
	ld hl, $ffff
.done
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a
	ret

BattleCommand_ClearMissDamage:
; clearmissdamage
	ld a, [wAttackMissed]
	and a
	ret z

	jp ResetDamage

BattleCommand_Curl:
; curl
	ld a, BATTLE_VARS_SUBSTATUS2
	call GetBattleVarAddr
	set SUBSTATUS_CURLED, [hl]
	ret

BattleCommand_TrapTarget:
; traptarget

	ld a, [wAttackMissed]
	and a
	ret nz
	ld hl, wEnemyWrapCount
	ld de, wEnemyTrappingMove
	ldh a, [hBattleTurn]
	and a
	jr z, .got_trap
	ld hl, wPlayerWrapCount
	ld de, wPlayerTrappingMove

.got_trap
	ld a, [hl]
	and a
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	call BattleRandom
	; trapped for 2-5 turns
	and %11
	inc a
	inc a
	inc a
	ld [hl], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld [de], a
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld hl, .Traps

.find_trap_text
	ld a, [hli]
	cp c
	ld a, [hli]
	jr nz, .next_trap_text
	cp b
	jr z, .found_trap_text
.next_trap_text
	inc hl
	inc hl
	jr .find_trap_text

.found_trap_text
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp StdBattleTextbox

.Traps:
	dw BIND,      UsedBindText      ; 'used BIND on'
	dw WRAP,      WrappedByText     ; 'was WRAPPED by'
	dw FIRE_SPIN, FireSpinTrapText  ; 'was trapped!'
	dw CLAMP,     ClampedByText     ; 'was CLAMPED by'
	dw WHIRLPOOL, WhirlpoolTrapText ; 'was trapped!'
	dw SAND_TOMB, WhirlpoolTrapText ; 'was trapped!'

BattleCommand_Recoil:
; recoil

	call CheckNeutralGas
	jr z, .NoMagicGuard
	call GetUserAbility
	cp ROCK_HEAD
	jr z, .CheckStruggle
	cp MAGIC_GUARD
	jr nz, .NoMagicGuard
.CheckStruggle
	ld hl, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .get_last_move
	ld hl, wEnemyMonMoves
.get_last_move
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVar
	and a
	ld b, a
	push bc
	ld bc, STRUGGLE
	call CompareMove
	pop bc
	ret nz

.NoMagicGuard
	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonMaxHP
.got_hp
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld d, a
; get 1/4 damage or 1 HP, whichever is higher
	ld a, [wCurDamage]
	ld b, a
	ld a, [wCurDamage + 1]
	ld c, a
	srl b
	rr c
	srl b
	rr c
	ld a, b
	or c
	jr nz, .min_damage
	inc c
.min_damage
	ld a, [hli]
	ld [wBuffer2], a
	ld a, [hl]
	ld [wBuffer1], a
	dec hl
	dec hl
	ld a, [hl]
	ld [wBuffer3], a
	sub c
	ld [hld], a
	ld [wBuffer5], a
	ld a, [hl]
	ld [wBuffer4], a
	sbc b
	ld [hl], a
	ld [wBuffer6], a
	jr nc, .dont_ko
	xor a
	ld [hli], a
	ld [hl], a
	ld hl, wBuffer5
	ld [hli], a
	ld [hl], a
.dont_ko
	hlcoord 10, 9
	ldh a, [hBattleTurn]
	and a
	ld a, 1
	jr z, .animate_hp_bar
	hlcoord 2, 2
	xor a
.animate_hp_bar
	ld [wWhichHPBar], a
	predef AnimateHPBar
	call RefreshBattleHuds
	ld hl, RecoilText
	jp StdBattleTextbox

BattleCommand_RechargeNextTurn:
; rechargenextturn
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_RECHARGE, [hl]
	ret

BattleCommand_DoubleFlyingDamage:
; doubleflyingdamage
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_FLYING, a
	ret z
	jr DoubleDamage

BattleCommand_DoubleUndergroundDamage:
; doubleundergrounddamage
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_UNDERGROUND, a
	ret z

	; fallthrough

DoubleDamage:
	ld hl, wCurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	jr nc, .quit

	ld a, $ff
	ld [hli], a
	ld [hl], a
.quit
	ret

BattleCommand_DoubleMinimizeDamage:
; doubleminimizedamage

	ld hl, wEnemyMinimized
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wPlayerMinimized
.ok
	ld a, [hl]
	and a
	ret z
	ld hl, wCurDamage + 1
	sla [hl]
	dec hl
	rl [hl]
	ret nc
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ret

TryLowerStat2:
; Lower stat c from stat struct hl (buffer de).

	push bc
	sla c
	ld b, 0
	add hl, bc
	; add de, c
	ld a, c
	add e
	ld e, a
	jr nc, .no_carry
	inc d
.no_carry
	pop bc

; The lowest possible stat is 1.
	ld a, [hld]
	sub 1
	jr nz, .not_min
	ld a, [hl]
	and a
	ret z

.not_min
	ldh a, [hBattleTurn]
	and a
	jr z, .Player

	call BattleCommand_SwitchTurn2
	farcall CalcPlayerStats
	call BattleCommand_SwitchTurn2
	jr .end

.Player:
	call BattleCommand_SwitchTurn2
	farcall CalcEnemyStats
	call BattleCommand_SwitchTurn2
.end
	ld a, 1
	and a
	ret

PrintNothingHappened:
; 'but nothing happened!'
	ld hl, NothingHappenedText
	jp StdBattleTextbox

BattleCommand_SwitchTurn2:
; switchturn

	ldh a, [hBattleTurn]
	xor 1
	ldh [hBattleTurn], a
	ret

ArmorTailCheck:
	call CheckUserNeutralGasMoldBreaker
	ret z
	call GetTargetAbility
	cp ARMOR_TAIL
	ret nz
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_FAKE_OUT
	jr z, .ArmorTailBlocked
	cp EFFECT_SUCKER_PUNCH
	jr z, .ArmorTailBlocked
	cp EFFECT_PRIORITY_HIT
	jr z, .ArmorTailBlocked
	call GetUserAbility
	cp TRIAGE
	jr z, .Triage
	cp PRANKSTER
	ret nz
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp STATUS
	ret c
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	ld hl, PranksterEffects
	ld de, 1
	call IsInArray
	ret nc

.ArmorTailBlocked:
	ld a, 1
	ld [wAttackMissed], a
	ret

.Triage:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_STRENGTH_SAP
	jr z, .ArmorTailBlocked
	cp EFFECT_LEECH_HIT
	jr z, .ArmorTailBlocked
	cp EFFECT_DREAM_EATER
	jr z, .ArmorTailBlocked
	ret

PranksterEffects:
	db EFFECT_SLEEP
	db EFFECT_ATTACK_DOWN
	db EFFECT_DEFENSE_DOWN
	db EFFECT_SPEED_DOWN
	db EFFECT_SP_ATK_DOWN
	db EFFECT_ACCURACY_DOWN
	db EFFECT_EVASION_DOWN
	db EFFECT_TOXIC
	db EFFECT_CONFUSE
	db EFFECT_ATTACK_DOWN_2
	db EFFECT_DEFENSE_DOWN_2
	db EFFECT_SPEED_DOWN_2
	db EFFECT_SP_DEF_DOWN_2
	db EFFECT_POISON
	db EFFECT_PARALYZE
	db EFFECT_LEECH_SEED
	db EFFECT_DISABLE
	db EFFECT_ENCORE
	db EFFECT_LOCK_ON
	db EFFECT_FORESIGHT
	db EFFECT_MEAN_LOOK
	db EFFECT_SPITE
	db EFFECT_PERISH_SONG
	db EFFECT_SWAGGER
	db EFFECT_ATTRACT
	db EFFECT_STRENGTH_SAP
	db EFFECT_PLAY_NICE
	db EFFECT_FLATTER
	db EFFECT_BURN
	db -1
	

PranksterCheck:
	call CheckNeutralGas
	ret z

.ContinuePrankster
	call GetUserAbility
	cp PRANKSTER
	ret nz

.CheckForStatus
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp STATUS
	ret c
;	ld a, BATTLE_VARS_MOVE_EFFECT
;	call GetBattleVar
;	ld hl, PranksterEffects
;	ld de, 1
;	call IsInArray
;	jr nc, .OverwritePriority
	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr nz, .GotPlayerType
	ld hl, wEnemyMonType1
.GotPlayerType
	ld a, [hli]
	cp DARK
	jr z, .IsDarkType
	ld a, [hl]
	cp DARK
	ret nz

.IsDarkType
	ld a, 1
	ld [wAttackMissed], a
	ret

BattleCommand_Superpower:
	farcall ResetMiss
	call CheckNeutralGas
	jr z, .SkipContrary
	call GetUserAbility
	cp CONTRARY
	jr z, SuperpowerContrary
.SkipContrary
	ld b, ATTACK
	farcall LowerStatPop
	call MoveFirstSwitchTurn
	farcall ResetMiss
	ld b, DEFENSE
	farcall LowerStatPop
	jp MoveSecondSwitchTurn

SuperpowerContrary:
	ld b, ATTACK
	farcall RaiseStat
	call MoveFirstSwitchTurn
	farcall ResetMiss
	ld b, DEFENSE
	farcall RaiseStat
	jp MoveSecondSwitchTurn

BattleCommand_CloseCombat:
	farcall ResetMiss
	call CheckNeutralGas
	jr z, .SkipContrary
	call GetUserAbility
	cp CONTRARY
	jr z, CloseCombatContrary
.SkipContrary
	ld b, DEFENSE
	farcall LowerStatPop
	call MoveFirstSwitchTurn
	farcall ResetMiss
	ld b, SP_DEFENSE
	farcall LowerStatPop
	jp MoveSecondSwitchTurn

CloseCombatContrary:
	ld b, DEFENSE
	farcall RaiseStat
	call MoveFirstSwitchTurn

	farcall ResetMiss
	ld b, SP_DEFENSE
	farcall RaiseStat
	jp MoveSecondSwitchTurn

BattleCommand_HammerArm:
	farcall ResetMiss
	call CheckNeutralGas
	jr z, .SkipContrary
	call GetUserAbility
	cp CONTRARY
	jr z, HammerArmContrary
.SkipContrary
	ld b, SPEED
	farcall LowerStatPop
HammerArmMessage:
	call BattleCommand_SwitchTurn2
	farcall BattleCommand_StatDownMessage
	jp BattleCommand_SwitchTurn2

HammerArmContrary:
	ld b, SPEED
	farcall RaiseStat
	jr HammerArmMessage

MoveFirstSwitchTurn:
	call BattleCommand_SwitchTurn2
	farcall BattleCommand_StatDownMessage
	ret

MoveSecondSwitchTurn:
	farcall BattleCommand_StatDownMessage
	jp BattleCommand_SwitchTurn2

BattleCommand_Defiant:
	ld a, [wFailedMessage]
	and a
	ret nz
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_CURSE
	jr nz, .CheckDefiant
	cp EFFECT_SHELL_SMASH
	jr nz, .CheckDefiant
	ret

.CheckDefiant
	call CheckNeutralGas
	ret z
	call GetTargetAbility
	cp DEFIANT
	jr z, .Defiant
	cp COMPETITIVE
	jr z, .Competitive
	ret

.Defiant:
	call BattleCommand_SwitchTurn2
	farcall BattleCommand_AttackUp2
	call BattleCommand_SwitchTurn2
	ld a, [wFailedMessage]
	and a
	ret nz
	ld hl, DefiantText
	jp StdBattleTextbox

.Competitive:
	call BattleCommand_SwitchTurn2
	farcall BattleCommand_SpecialAttackUp2
	call BattleCommand_SwitchTurn2
	ld a, [wFailedMessage]
	and a
	ret nz
	ld hl, CompetitiveText
	jp StdBattleTextbox

CheckUserIsCharging2:
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerCharging] ; player
	jr z, .end
	ld a, [wEnemyCharging] ; enemy
.end
	and a
	ret

LoadMoveAnim2:
	xor a
	ld [wNumHits], a

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and a
	ret z

	; fallthrough

LoadAnim2:
	call SetMoveAnimationID2
	; fallthrough

PlayUserBattleAnim2:
	push hl
	push de
	push bc
	callfar PlayBattleAnim
	pop bc
	pop de
	pop hl
	ret

SetMoveAnimationID2:
	push hl
	call GetMoveIndexFromID
	ld a, l
	ld [wFXAnimID], a
	ld a, h
	ld [wFXAnimID + 1], a
	pop hl
	ret

CheckOpponentWentFirst2:
; Returns a=0, z if user went first
; Returns a=1, nz if opponent went first
	push bc
	ld a, [wEnemyGoesFirst] ; 0 if player went first
	ld b, a
	ldh a, [hBattleTurn] ; 0 if it's the player's turn
	xor b ; 1 if opponent went first
	pop bc
	ret
