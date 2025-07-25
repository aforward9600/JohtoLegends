DoPlayerTurn:
	call SetPlayerTurn

	ld a, [wBattlePlayerAction]
	and a ; BATTLEPLAYERACTION_USEMOVE?
	ret nz

	jr DoTurn

DoEnemyTurn:
	call SetEnemyTurn

	ld a, [wLinkMode]
	and a
	jr z, DoTurn

	ld a, [wBattleAction]
	cp BATTLEACTION_STRUGGLE
	jr z, DoTurn
	cp BATTLEACTION_SWITCH1
	ret nc

	; fallthrough

DoTurn:
; Read in and execute the user's move effects for this turn.

	xor a
	ld [wTurnEnded], a

	; Effect command checkturn is called for every move.
	call CheckTurn

	ld a, [wTurnEnded]
	and a
	ret nz

	call UpdateMoveData

DoMove:
; Get the user's move effect.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	ld c, a
	ld b, 0
	ld hl, MoveEffectsPointers
	add hl, bc
	add hl, bc
	ld a, BANK(MoveEffectsPointers)
	call GetFarHalfword

	ld de, wBattleScriptBuffer

.GetMoveEffect:
	ld a, BANK(MoveEffects)
	call GetFarByte
	inc hl
	ld [de], a
	inc de
	cp endmove_command
	jr nz, .GetMoveEffect

; Start at the first command.
	ld hl, wBattleScriptBuffer
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ld a, h
	ld [wBattleScriptBufferAddress + 1], a

.ReadMoveEffectCommand:
; ld a, [wBattleScriptBufferAddress++]
	ld a, [wBattleScriptBufferAddress]
	ld l, a
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a

	ld a, [hli]

	push af
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ld a, h
	ld [wBattleScriptBufferAddress + 1], a
	pop af

; endturn_command (-2) is used to terminate branches without ending the read cycle.
	cp endturn_command
	ret nc

; The rest of the commands (01-af) are read from BattleCommandPointers.
	push bc
	dec a
	ld c, a
	ld b, 0
	ld hl, BattleCommandPointers
	add hl, bc
	add hl, bc
	pop bc

	ld a, BANK(BattleCommandPointers)
	call GetFarHalfword

	call .execute_command
	jr .ReadMoveEffectCommand

.execute_command
	bit 7, h
	res 7, h
	ld a, BANK("Effect Commands Extra")
	jp nz, FarCall
	jp hl

CheckTurn:
BattleCommand_CheckTurn:
; checkturn

; Repurposed as hardcoded turn handling. Useless as a command.

; Move $ff immediately ends the turn.
	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	inc a
	jp z, EndTurn

	xor a
	ld [wAttackMissed], a
	ld [wEffectFailed], a
	ld [wKickCounter], a
	ld [wAlreadyDisobeyed], a
	ld [wAlreadyFailed], a
	ld [wSomeoneIsRampaging], a

	ld a, EFFECTIVE
	ld [wTypeModifier], a

	ldh a, [hBattleTurn]
	and a
	jp nz, CheckEnemyTurn

CheckPlayerTurn:
	ld hl, wPlayerSubStatus4
	bit SUBSTATUS_RECHARGE, [hl]
	jr z, .no_recharge

	res SUBSTATUS_RECHARGE, [hl]
	ld hl, MustRechargeText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.no_recharge

	ld hl, wBattleMonStatus
	ld a, [hl]
	and SLP
	jr z, .not_asleep

	push af

	call CheckNeutralGas
	jr z, .SkipSleepAbility

	ld a, [wPlayerAbility]
	cp INSOMNIA
	jr z, .woke_up_ability
	cp VITAL_SPIRIT
	jr z, .woke_up_ability
	cp EARLY_BIRD
	jr nz, .SkipSleepAbility
	pop af
	dec a
	ld [wBattleMonStatus], a
	and SLP
	jr z, .woke_up
	jr .AfterEarlyBird

.SkipSleepAbility
	pop af
.AfterEarlyBird
	dec a
	ld [wBattleMonStatus], a
	and SLP
	jr z, .woke_up

	xor a
	ld [wNumHits], a
	ld de, ANIM_SLP
	call FarPlayBattleAnimation
	jr .fast_asleep

.woke_up_ability
	pop af
.woke_up
	ld hl, WokeUpText
	call StdBattleTextbox
	call CantMove
	call UpdateBattleMonInParty
	ld hl, UpdatePlayerHUD
	call CallBattleCore
	ld a, $1
	ldh [hBGMapMode], a
	jr .not_asleep

.fast_asleep
	ld hl, FastAsleepText
	call StdBattleTextbox

	; Snore and Sleep Talk bypass sleep.
	ld a, [wCurPlayerMove]
	ld hl, .sleep_bypass_moves
	call CheckMoveInList
	jr c, .not_asleep
	call CantMove
	jp EndTurn

.sleep_bypass_moves
	dw SNORE
	dw SLEEP_TALK
	dw -1

.not_asleep

	ld hl, wBattleMonStatus
	bit FRZ, [hl]
	jr z, .not_frozen

	; Flame Wheel and Sacred Fire thaw the user.
	ld a, [wCurPlayerMove]
	ld hl, .thawing_moves
	call CheckMoveInList
	jr c, .not_frozen

	ld hl, FrozenSolidText
	call StdBattleTextbox

	call CantMove
	jp EndTurn

.thawing_moves
	dw FLAME_WHEEL
	dw SACRED_FIRE
	dw -1

.not_frozen

	ld hl, wPlayerSubStatus3
	bit SUBSTATUS_FLINCHED, [hl]
	jr z, .not_flinched

	res SUBSTATUS_FLINCHED, [hl]
	ld hl, FlinchedText
	call StdBattleTextbox
	call CheckNeutralGas
	jr z, .SkipSteadfast
	ld a, [wPlayerAbility]
	cp STEADFAST
	jr nz, .SkipSteadfast
	call BattleCommand_SpeedUp
	ld a, [wAttackMissed]
	and a
	jr nz, .SkipSteadfast
	ld hl, SteadfastText
	call StdBattleTextbox

.SkipSteadfast
	call CantMove
	jp EndTurn

.not_flinched

	ld hl, wPlayerDisableCount
	ld a, [hl]
	and a
	jr z, .not_disabled

	dec a
	ld [hl], a
	and $f
	jr nz, .not_disabled

	ld [hl], a
	ld [wDisabledMove], a
	ld hl, DisabledNoMoreText
	call StdBattleTextbox

.not_disabled

	ld a, [wPlayerSubStatus3]
	add a
	jr nc, .not_confused
	ld hl, wPlayerConfuseCount
	dec [hl]
	jr nz, .confused

	ld hl, wPlayerSubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	ld hl, ConfusedNoMoreText
	call StdBattleTextbox
	jr .not_confused

.confused
	ld hl, IsConfusedText
	call StdBattleTextbox
	xor a
	ld [wNumHits], a
	ld de, ANIM_CONFUSED
	call FarPlayBattleAnimation

	; 50% chance of hitting itself
	call BattleRandom
	cp 50 percent + 1
	jr nc, .not_confused

	; clear confusion-dependent substatus
	ld hl, wPlayerSubStatus3
	ld a, [hl]
	and 1 << SUBSTATUS_CONFUSED
	ld [hl], a

	call HitConfusion
	call CantMove
	jp EndTurn

.not_confused

	ld a, [wPlayerSubStatus1]
	add a ; bit SUBSTATUS_ATTRACT
	jr nc, .not_infatuated

	ld hl, InLoveWithText
	call StdBattleTextbox
	xor a
	ld [wNumHits], a
	ld de, ANIM_IN_LOVE
	call FarPlayBattleAnimation

	; 50% chance of infatuation
	call BattleRandom
	cp 50 percent + 1
	jr c, .not_infatuated

	ld hl, InfatuationText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.not_infatuated

	; We can't disable a move that doesn't exist.
	ld a, [wDisabledMove]
	and a
	jr z, .no_disabled_move

	; Are we using the disabled move?
	ld hl, wCurPlayerMove
	cp [hl]
	jr nz, .no_disabled_move

	call MoveDisabled
	call CantMove
	jp EndTurn

.no_disabled_move

	ld hl, wBattleMonStatus
	bit PAR, [hl]
	ret z

	; 25% chance to be fully paralyzed
	call BattleRandom
	cp 25 percent
	ret nc

	ld hl, FullyParalyzedText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

CantMove:
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	res SUBSTATUS_ROLLOUT, [hl]

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	ld a, [hl]
	and $ff ^ (1 << SUBSTATUS_RAMPAGE | 1 << SUBSTATUS_CHARGED)
	ld [hl], a

	farcall ResetFuryCutterCount

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	push hl
	ld hl, .fly_dig_moves
	call CheckMoveInList
	pop hl
	ret nc

	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	jp AppearUserRaiseSub

.fly_dig_moves
	dw FLY
	dw DIG
	dw -1

OpponentCantMove:
	call BattleCommand_SwitchTurn
	call CantMove
	jp BattleCommand_SwitchTurn

CheckEnemyTurn:
	ld hl, wEnemySubStatus4
	bit SUBSTATUS_RECHARGE, [hl]
	jr z, .no_recharge

	res SUBSTATUS_RECHARGE, [hl]
	ld hl, MustRechargeText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.no_recharge

	ld hl, wEnemyMonStatus
	ld a, [hl]
	and SLP
	jr z, .not_asleep

	push af

	call CheckNeutralGas
	jr z, .SkipSleepAbility

	ld a, [wEnemyAbility]
	cp INSOMNIA
	jr z, .woke_up_ability
	cp VITAL_SPIRIT
	jr z, .woke_up_ability
	cp EARLY_BIRD
	jr nz, .SkipSleepAbility
	pop af
	dec a
	ld [wEnemyMonStatus], a
	and a
	jr z, .woke_up
	jr .AfterEarlyBird

.SkipSleepAbility
	pop af
.AfterEarlyBird
	dec a
	ld [wEnemyMonStatus], a
	and a
	jr z, .woke_up

	ld hl, FastAsleepText
	call StdBattleTextbox
	xor a
	ld [wNumHits], a
	ld de, ANIM_SLP
	call FarPlayBattleAnimation
	jr .fast_asleep

.woke_up_ability
	pop af
.woke_up
	ld hl, WokeUpText
	call StdBattleTextbox
	call CantMove
	call UpdateEnemyMonInParty
	ld hl, UpdateEnemyHUD
	call CallBattleCore
	ld a, $1
	ldh [hBGMapMode], a
	jr .not_asleep

.fast_asleep
	; Snore and Sleep Talk bypass sleep.
	ld a, [wCurEnemyMove]
	ld hl, .sleep_bypass_moves
	call CheckMoveInList
	jr c, .not_asleep
	call CantMove
	jp EndTurn

.sleep_bypass_moves
	dw SNORE
	dw SLEEP_TALK
	dw -1

.not_asleep

	ld hl, wEnemyMonStatus
	bit FRZ, [hl]
	jr z, .not_frozen

	; Flame Wheel and Sacred Fire thaw the user.
	ld a, [wCurEnemyMove]
	ld hl, .thawing_moves
	call CheckMoveInList
	jr c, .not_frozen

	ld hl, FrozenSolidText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.thawing_moves
	dw FLAME_WHEEL
	dw SACRED_FIRE
	dw -1

.not_frozen

	ld hl, wEnemySubStatus3
	bit SUBSTATUS_FLINCHED, [hl]
	jr z, .not_flinched

	res SUBSTATUS_FLINCHED, [hl]
	ld hl, FlinchedText
	call StdBattleTextbox

	call CantMove
	jp EndTurn

.not_flinched

	ld hl, wEnemyDisableCount
	ld a, [hl]
	and a
	jr z, .not_disabled

	dec a
	ld [hl], a
	and $f
	jr nz, .not_disabled

	ld [hl], a
	ld [wEnemyDisabledMove], a

	ld hl, DisabledNoMoreText
	call StdBattleTextbox

.not_disabled

	ld a, [wEnemySubStatus3]
	add a ; bit SUBSTATUS_CONFUSED
	jr nc, .not_confused

	ld hl, wEnemyConfuseCount
	dec [hl]
	jr nz, .confused

	ld hl, wEnemySubStatus3
	res SUBSTATUS_CONFUSED, [hl]
	ld hl, ConfusedNoMoreText
	call StdBattleTextbox
	jr .not_confused

.confused
	ld hl, IsConfusedText
	call StdBattleTextbox

	xor a
	ld [wNumHits], a
	ld de, ANIM_CONFUSED
	call FarPlayBattleAnimation

	; 50% chance of hitting itself
	call BattleRandom
	cp 50 percent + 1
	jr nc, .not_confused

	; clear confusion-dependent substatus
	ld hl, wEnemySubStatus3
	ld a, [hl]
	and 1 << SUBSTATUS_CONFUSED
	ld [hl], a

	ld hl, HurtItselfText
	call StdBattleTextbox

	call HitSelfInConfusion
	call BattleCommand_DamageCalc
	call BattleCommand_LowerSub

	xor a
	ld [wNumHits], a

	; Flicker the monster pic unless flying or underground.
	ld de, ANIM_HIT_CONFUSION
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, PlayFXAnimID

	ld c, TRUE
	call DoEnemyDamage
	call BattleCommand_RaiseSub
	call CantMove
	jp EndTurn

.not_confused

	ld a, [wEnemySubStatus1]
	add a ; bit SUBSTATUS_ATTRACT
	jr nc, .not_infatuated

	ld hl, InLoveWithText
	call StdBattleTextbox
	xor a
	ld [wNumHits], a
	ld de, ANIM_IN_LOVE
	call FarPlayBattleAnimation

	; 50% chance of infatuation
	call BattleRandom
	cp 50 percent + 1
	jr c, .not_infatuated

	ld hl, InfatuationText
	call StdBattleTextbox
	call CantMove
	jp EndTurn

.not_infatuated

	; We can't disable a move that doesn't exist.
	ld a, [wEnemyDisabledMove]
	and a
	jr z, .no_disabled_move

	; Are we using the disabled move?
	ld hl, wCurEnemyMove
	cp [hl]
	jr nz, .no_disabled_move

	call MoveDisabled

	call CantMove
	jp EndTurn

.no_disabled_move

	ld hl, wEnemyMonStatus
	bit PAR, [hl]
	ret z

	; 25% chance to be fully paralyzed
	call BattleRandom
	cp 25 percent
	ret nc

	ld hl, FullyParalyzedText
	call StdBattleTextbox
	farcall CantMove

	; fallthrough

EndTurn:
	ld a, $1
	ld [wTurnEnded], a
	jp ResetDamage

MoveDisabled:
	; Make sure any charged moves fail
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_CHARGED, [hl]

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName

	ld hl, DisabledMoveText
	jp StdBattleTextbox

HitConfusion:
	ld hl, HurtItselfText
	call StdBattleTextbox

	xor a
	ld [wCriticalHit], a

	call HitSelfInConfusion
	call BattleCommand_DamageCalc
	call BattleCommand_LowerSub

	xor a
	ld [wNumHits], a

	; Flicker the monster pic unless flying or underground.
	ld de, ANIM_HIT_CONFUSION
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, PlayFXAnimID

	ld hl, UpdatePlayerHUD
	call CallBattleCore
	ld a, $1
	ldh [hBGMapMode], a
	ld c, TRUE
	call DoPlayerDamage
	jp BattleCommand_RaiseSub

BattleCommand_CheckObedience:
; checkobedience

	; Enemy can't disobey
	ldh a, [hBattleTurn]
	and a
	ret nz

	call CheckUserIsCharging
	ret nz

	; If we've already checked this turn
	ld a, [wAlreadyDisobeyed]
	and a
	ret nz

	xor a
	ld [wAlreadyDisobeyed], a

	; No obedience in link battles
	; (since no handling exists for enemy)
	ld a, [wLinkMode]
	and a
	ret nz

	ld a, [wInBattleTowerBattle]
	and a
	ret nz

	; If the monster's id doesn't match the player's,
	; some conditions need to be met.
	ld a, MON_ID
	call BattlePartyAttr

	ld a, [wPlayerID]
	cp [hl]
	jr nz, .obeylevel
	inc hl
	ld a, [wPlayerID + 1]
	cp [hl]
	ret z

.obeylevel
	; The maximum obedience level is constrained by owned badges:
	ld hl, wJohtoBadges

	; risingbadge
	bit RISINGBADGE, [hl]
	ld a, MAX_LEVEL + 1
	jr nz, .getlevel

	; stormbadge
	bit STORMBADGE, [hl]
	ld a, 70
	jr nz, .getlevel

	; fogbadge
	bit FOGBADGE, [hl]
	ld a, 50
	jr nz, .getlevel

	; hivebadge
	bit HIVEBADGE, [hl]
	ld a, 30
	jr nz, .getlevel

	; no badges
	ld a, 10

.getlevel
; c = obedience level
; d = monster level
; b = c + d

	ld b, a
	ld c, a

	ld a, [wBattleMonLevel]
	ld d, a

	add b
	ld b, a

; No overflow (this should never happen)
	jr nc, .checklevel
	ld b, $ff

.checklevel
; If the monster's level is lower than the obedience level, it will obey.
	ld a, c
	cp d
	ret nc

; Random number from 0 to obedience level + monster level
.rand1
	call BattleRandom
	swap a
	cp b
	jr nc, .rand1

; The higher above the obedience level the monster is,
; the more likely it is to disobey.
	cp c
	ret c

; Sleep-only moves have separate handling, and a higher chance of
; being ignored. Lazy monsters like their sleep.
	call IgnoreSleepOnly
	ret c

; Another random number from 0 to obedience level + monster level
.rand2
	call BattleRandom
	cp b
	jr nc, .rand2

; A second chance.
	cp c
	jr c, .UseInstead

; No hope of using a move now.

; b = number of levels the monster is above the obedience level
	ld a, d
	sub c
	ld b, a

; The chance of napping is the difference out of 256.
	call BattleRandom
	swap a
	sub b
	jr c, .Nap

; The chance of not hitting itself is the same.
	cp b
	jr nc, .DoNothing

	ld hl, WontObeyText
	call StdBattleTextbox
	call HitConfusion
	jp .EndDisobedience

.Nap:
	call BattleRandom
	add a
	swap a
	and SLP
	jr z, .Nap

	ld [wBattleMonStatus], a

	ld hl, BeganToNapText
	jr .Print

.DoNothing:
	; 4 random choices
	call BattleRandom
	and %11

	ld hl, LoafingAroundText
	and a ; 0
	jr z, .Print

	ld hl, WontObeyText
	dec a ; 1
	jr z, .Print

	ld hl, TurnedAwayText
	dec a ; 2
	jr z, .Print

	ld hl, IgnoredOrdersText

.Print:
	call StdBattleTextbox
	jp .EndDisobedience

.UseInstead:
; Can't use another move if the monster only has one!
	ld a, [wBattleMonMoves + 1]
	and a
	jr z, .DoNothing

; Don't bother trying to handle Disable.
	ld a, [wDisabledMove]
	and a
	jr nz, .DoNothing

	ld hl, wBattleMonPP
	ld de, wBattleMonMoves
	ld b, 0
	ld c, NUM_MOVES

.GetTotalPP:
	ld a, [hli]
	and PP_MASK
	add b
	ld b, a

	dec c
	jr z, .CheckMovePP

; Stop at undefined moves.
	inc de
	ld a, [de]
	and a
	jr nz, .GetTotalPP

.CheckMovePP:
	ld hl, wBattleMonPP
	ld a, [wCurMoveNum]
	ld e, a
	ld d, 0
	add hl, de

; Can't use another move if only one move has PP.
	ld a, [hl]
	and PP_MASK
	cp b
	jr z, .DoNothing

; Make sure we can actually use the move once we get there.
	ld a, 1
	ld [wAlreadyDisobeyed], a

	ld a, [w2DMenuNumRows]
	ld b, a

; Save the move we originally picked for afterward.
	ld a, [wCurMoveNum]
	ld c, a
	push af

.RandomMove:
	call BattleRandom
	maskbits NUM_MOVES

	cp b
	jr nc, .RandomMove

; Not the move we were trying to use.
	cp c
	jr z, .RandomMove

; Make sure it has PP.
	ld [wCurMoveNum], a
	ld hl, wBattleMonPP
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	and PP_MASK
	jr z, .RandomMove

; Use it.
	ld a, [wCurMoveNum]
	ld c, a
	ld b, 0
	ld hl, wBattleMonMoves
	add hl, bc
	ld a, [hl]
	ld [wCurPlayerMove], a

	call SetPlayerTurn
	call UpdateMoveData
	call DoMove

; Restore original move choice.
	pop af
	ld [wCurMoveNum], a

.EndDisobedience:
	xor a
	ld [wLastPlayerMove], a
	ld [wLastPlayerCounterMove], a

	; Break Encore too.
	ld hl, wPlayerSubStatus5
	res SUBSTATUS_ENCORED, [hl]
	xor a
	ld [wPlayerEncoreCount], a

	jp EndMoveEffect

IgnoreSleepOnly:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar

	; Snore and Sleep Talk bypass sleep.
	ld hl, .sleep_moves
	call CheckMoveInList
	ret nc

	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	ret z

; 'ignored orders…sleeping!'
	ld hl, IgnoredSleepingText
	call StdBattleTextbox

	call EndMoveEffect

	scf
	ret

.sleep_moves
	dw SNORE
	dw SLEEP_TALK
	dw -1

CheckUserIsCharging:
	ldh a, [hBattleTurn]
	and a
	ld a, [wPlayerCharging] ; player
	jr z, .end
	ld a, [wEnemyCharging] ; enemy
.end
	and a
	ret

BattleCommand_DoTurn:
	call CheckUserIsCharging
	ret nz

	ld hl, wBattleMonPP
	ld de, wPlayerSubStatus3
	ld bc, wPlayerTurnsTaken

	ldh a, [hBattleTurn]
	and a
	jr z, .proceed

	ld hl, wEnemyMonPP
	ld de, wEnemySubStatus3
	ld bc, wEnemyTurnsTaken

.proceed

; If we've gotten this far, this counts as a turn.
	ld a, [bc]
	inc a
	ld [bc], a

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld bc, STRUGGLE
	call CompareMove
	ret z

	ld a, [de]
	and 1 << SUBSTATUS_IN_LOOP | 1 << SUBSTATUS_RAMPAGE
	ret nz

	call .consume_pp
	ld a, b
	and a
	jp nz, EndMoveEffect

	; SubStatus5
	inc de
	inc de

	ld a, [de]
	bit SUBSTATUS_TRANSFORMED, a
	ret nz

	ldh a, [hBattleTurn]
	and a

	ld hl, wPartyMon1PP
	ld a, [wCurBattleMon]
	jr z, .player

; mimic this part entirely if wildbattle
	ld a, [wBattleMode]
	dec a
	jr z, .wild

	ld hl, wOTPartyMon1PP
	ld a, [wCurOTMon]

.player
	call GetPartyLocation
	push hl
	call CheckMimicUsed
	pop hl
	ret c

.consume_pp
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurMoveNum]
	jr z, .okay
	ld a, [wCurEnemyMoveNum]

.okay
	push af
	call CheckNeutralGas
	jr z, .IgnorePressure
	call GetTargetAbility
	cp PRESSURE
	jr nz, .IgnorePressure
	pop af
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and PP_MASK
	jr z, .out_of_pp
	dec [hl]
	dec [hl]
	ld b, 0
	ret

.IgnorePressure
	pop af
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and PP_MASK
	jr z, .out_of_pp
	dec [hl]
	ld b, 0
	ret

.wild
	ld hl, wEnemyMonMoves
	ld a, [wCurEnemyMoveNum]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ld bc, MIMIC
	call CompareMove
	jr z, .mimic
	ld hl, wWildMonMoves
	add hl, de
	ld a, [hl]
	call CompareMove
	ret z

.mimic
	ld hl, wWildMonPP
	call .consume_pp
	ret

.out_of_pp
	call BattleCommand_MoveDelay
; get move effect
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
; continuous?
	ld hl, .continuousmoves
	ld de, 1
	call IsInArray

; 'has no pp left for [move]'
	ld hl, HasNoPPLeftText
	jr c, .print
; 'but no pp is left for the move'
	ld hl, NoPPLeftText
.print
	call StdBattleTextbox
	ld b, 1
	ret

.continuousmoves
	db EFFECT_RAZOR_WIND
	db EFFECT_SKY_ATTACK
	db EFFECT_SKULL_BASH
	db EFFECT_SOLARBEAM
	db EFFECT_FLY
	db EFFECT_ROLLOUT
	db EFFECT_RAMPAGE
	db -1

CheckMimicUsed:
	ldh a, [hBattleTurn]
	and a
	ld a, [wCurMoveNum]
	jr z, .player
	ld a, [wCurEnemyMoveNum]

.player
	ld c, a
	ld a, MON_MOVES
	call UserPartyAttr

	ld b, 0
	add hl, bc
	ld a, [hl]
	ld bc, MIMIC
	call CompareMove
	jr nz, .mimic

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	call CompareMove
	jr z, .mimic

	scf
	ret

.mimic
	and a
	ret

BattleCommand_Critical:
; critical

; Determine whether this attack's hit will be critical.

	xor a
	ld [wCriticalHit], a

	call CheckNeutralGas
	jr z, .SkipShellArmor
	call GetTargetAbility
	cp SHELL_ARMOR
	ret z
	cp BATTLE_ARMOR
	ret z

.SkipShellArmor
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	and a
	ret z

	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonItem
	ld a, [wEnemyMonSpecies]
	jr nz, .Item
	ld hl, wBattleMonItem
	ld a, [wBattleMonSpecies]

.Item:
	ld c, 0
	ld b, [hl]
	call GetPokemonIndexFromID

	ld a, l
	sub LOW(CHANSEY)
	if HIGH(CHANSEY) == 0
		or h
	else
		jr nz, .Farfetchd
		if HIGH(CHANSEY) == 1
			dec h
		else
			ld a, h
			cp HIGH(CHANSEY)
		endc
	endc
	jr nz, .Farfetchd
	ld a, b
	cp LUCKY_PUNCH
	jr nz, .FocusEnergy

; +2 critical level
	ld c, 2
	jr .Tally

.Farfetchd:
	ld a, l
	sub LOW(FARFETCH_D)
	if HIGH(FARFETCH_D) == 0
		or h
	else
		jr nz, .FocusEnergy
		if HIGH(FARFETCH_D) == 1
			dec h
		else
			ld a, h
			cp HIGH(FARFETCH_D)
		endc
	endc
	jr nz, .FocusEnergy
	ld a, b
	cp STICK
	jr nz, .FocusEnergy

; +2 critical level
	ld c, 2
	jr .Tally

.FocusEnergy:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_FOCUS_ENERGY, a
	jr z, .CheckCritical

; +1 critical level
	inc c

.CheckCritical:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call GetMoveIndexFromID
	ld de, 2
	ld hl, CriticalHitMoves
	push bc
	ld b, h
	ld c, l
	call IsInHalfwordArray
	pop bc
	jr nc, .ScopeLens

; +2 critical level
	inc c
	inc c

.ScopeLens:
	push bc
	call GetUserItem
	ld a, b
	cp HELD_CRITICAL_UP ; Increased critical chance. Only Scope Lens has this.
	pop bc
	jr nz, .CheckSuperLuck

; +1 critical level
	inc c

.CheckSuperLuck:
	call CheckNeutralGas
	jr z, .Tally
	call GetUserAbility
	cp SUPER_LUCK
	jr nz, .Tally

	inc c

.Tally:
	ld hl, CriticalHitChances
	ld b, 0
	add hl, bc
	call BattleRandom
	cp [hl]
	ret nc
	ld a, 1
	ld [wCriticalHit], a
	ret

BattleCommand_Stab:
; STAB = Same Type Attack Bonus
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld bc, STRUGGLE
	call CompareMove
	ret z

	ld hl, wBattleMonType1
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemyMonType1
	ld a, [hli]
	ld d, a
	ld e, [hl]

	push hl
	farcall ChangeTypeForRoost
	pop hl

	ldh a, [hBattleTurn]
	and a
	jr z, .go ; Who Attacks and who Defends

	push de ;changing this code to not have to run the roost check twice and so it can know which register is which side
	ld d, b
	ld e, c
	pop bc

.go
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	and TYPE_MASK
	ld [wCurType], a

	push hl
	push de
	push bc
	farcall DoWeatherModifiers
	pop bc
	pop de
	pop hl

	ld a, [wCurType]
	cp b
	jr z, .stab
	cp c
	jr z, .stab

	jr .SkipStab

.stab
	ld hl, wCurDamage + 1
	ld a, [hld]
	ld h, [hl]
	ld l, a

	push af
	call CheckNeutralGas
	jr z, .IgnoreAdaptability
	call GetUserAbility
	cp ADAPTABILITY
	jr z, .AdaptabilitySTAB
.IgnoreAdaptability
	pop af
	ld b, h
	ld c, l
	srl b
	rr c
	add hl, bc
	jr .FinishStab

.AdaptabilitySTAB
	pop af
	ld b, h
	ld c, l
	add hl, bc
.FinishStab
	ld a, h
	ld [wCurDamage], a
	ld a, l
	ld [wCurDamage + 1], a

	ld hl, wTypeModifier
	set 7, [hl]

.SkipStab:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	ld b, a
	ld hl, TypeMatchups

.TypesLoop:
	ld a, [hli]

	cp -1
	jr z, .end

	; foresight
	cp -2
	jr nz, .SkipForesightCheck
	call CheckNeutralGas
	jr z, .DoForesightCheck
	call GetUserAbility
	cp SCRAPPY
	jr z, .end
.DoForesightCheck
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .end

	jr .TypesLoop

.SkipForesightCheck:
	cp b
	jr nz, .SkipType
	ld a, [hl]
	cp d
	jr z, .GotMatchup
	cp e
	jr z, .GotMatchup
	jr .SkipType

.GotMatchup:
	push hl
	push bc
	inc hl
	ld a, [wTypeModifier]
	and %10000000
	ld b, a
; If the target is immune to the move, treat it as a miss and calculate the damage as 0
	ld a, [hl]
	and a
	jr nz, .NotImmune
	inc a
	ld [wAttackMissed], a
	xor a
.NotImmune:
	ldh [hMultiplier], a
	add b
	ld [wTypeModifier], a

	xor a
	ldh [hMultiplicand + 0], a

	ld hl, wCurDamage
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hld]
	ldh [hMultiplicand + 2], a

	call Multiply

	ldh a, [hProduct + 1]
	ld b, a
	ldh a, [hProduct + 2]
	or b
	ld b, a
	ldh a, [hProduct + 3]
	or b
	jr z, .ok ; This is a very convoluted way to get back that we've essentially dealt no damage.

; Take the product and divide it by 10.
	ld a, 10
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	or b
	jr nz, .ok

	ld a, 1
	ldh [hMultiplicand + 2], a

.ok
	ldh a, [hMultiplicand + 1]
	ld [hli], a
	ldh a, [hMultiplicand + 2]
	ld [hl], a
	pop bc
	pop hl

.SkipType:
	inc hl
	inc hl
	jr .TypesLoop

.end
	call BattleCheckTypeMatchup
	ld a, [wTypeMatchup]
	ld b, a
	ld a, [wTypeModifier]
	and %10000000
	or b
	ld [wTypeModifier], a
	ret

BattleCheckTypeMatchup:
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .get_type
	ld hl, wBattleMonType1
.get_type
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar ; preserves hl, de, and bc
CheckTypeMatchup:
	push hl
	push de
	push bc
	and TYPE_MASK
	ld d, a
	ld b, [hl]
	inc hl
	ld c, [hl]

	farcall ChangeTypeForOpponentRoost

	ld a, 10 ; 1.0
	ld [wTypeMatchup], a
	ld hl, TypeMatchups
.TypesLoop:
	ld a, [hli]
	cp -1
	jr z, .End
	cp -2
	jr nz, .Next
	call CheckNeutralGas
	jr z, .SkipScrappy
	call GetUserAbility
	cp SCRAPPY
	jr z, .End
.SkipScrappy:
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	jr nz, .End
	jr .TypesLoop

.Next:
	cp d
	jr nz, .Nope
	ld a, [hli]
	cp b
	jr z, .Yup
	cp c
	jr z, .Yup
	jr .Nope2

.Nope:
	inc hl
.Nope2:
	inc hl
	jr .TypesLoop

.Yup:
	xor a
	ldh [hDividend + 0], a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, [hli]
	ldh [hMultiplicand + 2], a
	ld a, [wTypeMatchup]
	ldh [hMultiplier], a
	call Multiply
	ld a, 10
	ldh [hDivisor], a
	push bc
	ld b, 4
	call Divide
	pop bc
	ldh a, [hQuotient + 3]
	ld [wTypeMatchup], a
	jr .TypesLoop

.End:
	pop bc
	pop de
	pop hl
	ret

BattleCommand_ResetTypeMatchup:
; Reset the type matchup multiplier to 1.0, if the type matchup is not 0.
; If there is immunity in play, the move automatically misses.
	call BattleCheckTypeMatchup
	ld a, [wTypeMatchup]
	and a
	ld a, 10 ; 1.0
	jr nz, .reset
	call ResetDamage
	xor a
	ld [wTypeModifier], a
	inc a
	ld [wAttackMissed], a
	ret

.reset
	ld [wTypeMatchup], a
	ret

BattleCommand_CheckHit:
; checkhit

	call .DreamEater
	jp z, .Miss

	call .Protect
	jp nz, .Miss

	farcall PranksterCheck
	ld a, [wAttackMissed]
	and a
	jp nz, .Miss

	farcall ArmorTailCheck
	ld a, [wAttackMissed]
	and a
	jp nz, .ArmorTail

	call .DrainSub
	jp z, .Miss

	call .LockOn
	ret nz

	call .AirBalloon
	jp z, .Miss

	call CheckNeutralGas
	jr z, .SkipAccuracyAbilities
	call GetUserAbility
	cp NO_GUARD
	ret z
	call GetTargetAbility
	cp NO_GUARD
	ret z

.SkipAccuracyAbilities:
	call .FlyDigMoves
	jp nz, .Miss

	call CheckNeutralGas
	jr z, .SkipCloudNine

	call CheckCloudNine
	jr z, .SkipWeather

.SkipCloudNine
	call .ThunderRain
	ret z

	call .BlizzardHail
	ret z

.SkipWeather
	call .XAccuracy
	ret nz

	; Perfect-accuracy moves
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ALWAYS_HIT
	ret z
	cp EFFECT_VITAL_THROW
	ret z

	cp EFFECT_PLAY_NICE
	ret z

	call .StatModifiers

	ld a, [wPlayerMoveStruct + MOVE_ACC]
	ld b, a
	ldh a, [hBattleTurn]
	and a
	jr z, .CheckItems
	ld a, [wEnemyMoveStruct + MOVE_ACC]
	ld b, a

.CheckItems:
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, b
	ldh [hMultiplicand + 2], a
	call GetUserItem
	ld a, b
	cp HELD_ACCURACY_BOOST
	jr nz, .check_brightpowder
	ld a, c ; % miss
	add 100
	ldh [hMultiplier], a
	call Multiply
	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide

.check_brightpowder:
	call GetOpponentItem
	ld a, b
	cp HELD_BRIGHTPOWDER
	jr nz, .skip_brightpowder
	ld a, 100
	ldh [hMultiplier], a
	call Multiply
	ld a, c ; % miss
	add 100
	ldh [hDivisor], a
	ld b, 4
	call Divide

.skip_brightpowder
	ldh a, [hMultiplicand + 0]
	ld b, a
	ldh a, [hMultiplicand +1]
	or b
	ret nz ; If either upper byte of result has data, then we are over 100%
	ldh a, [hMultiplicand +2]
	cp -1
	ret z ; $ff = 100%
	ld b, a
	call BattleRandom
	cp b
	ret c

.Miss:
; Keep the damage value intact if we're using (Hi) Jump Kick.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_JUMP_KICK
	jr z, .Missed
	call ResetDamage

.Missed:
	ld a, 1
	ld [wAttackMissed], a
	ret

.DreamEater:
; Return z if we're trying to eat the dream of
; a monster that isn't sleeping.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_DREAM_EATER
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and SLP
	ret

.Protect:
; Return nz if the opponent is protected.
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	ret z

	ld c, 40
	call DelayFrames

; 'protecting itself!'
	ld hl, ProtectingItselfText
	call StdBattleTextbox

	ld c, 40
	call DelayFrames

	ld a, 1
	and a
	ret

.LockOn:
; Return nz if we are locked-on and aren't trying to use Earthquake,
; Fissure or Magnitude on a monster that is flying.
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_LOCK_ON, [hl]
	res SUBSTATUS_LOCK_ON, [hl]
	ret z

	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_FLYING, a
	ld hl, .DigMoves
	jr nz, .check_move_in_list
	ld a, 1
	and a
	ret

.AirBalloon:
	call GetOpponentItem
	ld a, b
	cp HELD_AIR_BALLOON
	ret nz
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp GROUND
	ret nz
	ld c, 40
	call DelayFrames

	ld hl, AirBalloonText
	call StdBattleTextbox
	ld c, 40
	call DelayFrames

	ld a, 0
	and a
	ret

.DrainSub:
; Return z if using an HP drain move on a substitute.
	call CheckSubstituteOpp
	jr z, .not_draining_sub

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar

	cp EFFECT_LEECH_HIT
	ret z
	cp EFFECT_DREAM_EATER
	ret z

.not_draining_sub
	ld a, 1
	and a
	ret

.FlyDigMoves:
; Check for moves that can hit underground/flying opponents.
; Return z if the current move can hit the opponent.

	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret z

	bit SUBSTATUS_FLYING, a
	ld hl, .FlyMoves
	jr nz, .check_move_in_list
	ld hl, .DigMoves
.check_move_in_list
	; returns z (and a = 0) if the current move is in a given list, or nz (and a = 1) if not
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call CheckMoveInList
	sbc a
	inc a
	ret

.FlyMoves:
	dw GUST
	dw WHIRLWIND
	dw THUNDER
	dw TWISTER
	dw HURRICANE
	dw SKY_UPPERCUT
	dw -1

.DigMoves:
	dw EARTHQUAKE
	dw FISSURE
	dw MAGNITUDE
	dw -1

.ThunderRain:
; Return z if the current move always hits in rain, and it is raining.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_THUNDER
	jr z, .PerfectThunder
	cp EFFECT_HURRICANE
	ret nz

.PerfectThunder
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	ret

.BlizzardHail:
; Return z if the current move always hits in hail, and it is hailing.
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_BLIZZARD
	ret nz

	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	ret


.XAccuracy:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_X_ACCURACY, a
	ret

.ArmorTail:
	call BattleCommand_MoveDelay
	ld hl, ArmorTailText
	call StdBattleTextbox
	jp EndMoveEffect

.StatModifiers:
	ldh a, [hBattleTurn]
	and a

	; load the user's accuracy into b and the opponent's evasion into c.
	ld hl, wPlayerMoveStruct + MOVE_ACC
	ld a, [wPlayerAccLevel]
	ld b, a
	ld a, [wEnemyEvaLevel]
	ld c, a

	jr z, .got_acc_eva

	ld hl, wEnemyMoveStruct + MOVE_ACC
	ld a, [wEnemyAccLevel]
	ld b, a
	ld a, [wPlayerEvaLevel]
	ld c, a

.got_acc_eva
	cp b
	jr c, .skip_foresight_check

	; if the target's evasion is greater than the user's accuracy,
	; check the target's foresight status
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_IDENTIFIED, a
	ret nz

.skip_foresight_check
	; subtract evasion from 14
	ld a, MAX_STAT_LEVEL + 1
	sub c
	ld c, a
	; store the base move accuracy for math ops
	xor a
	ldh [hMultiplicand + 0], a
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
	push hl
	ld d, 2 ; do this twice, once for the user's accuracy and once for the target's evasion

.accuracy_loop
	; look up the multiplier from the table
	push bc
	ld hl, AccuracyLevelMultipliers
	dec b
	sla b
	ld c, b
	ld b, 0
	add hl, bc
	pop bc
	; multiply by the first byte in that row...
	ld a, [hli]
	ldh [hMultiplier], a
	call Multiply
	; ... and divide by the second byte
	ld a, [hl]
	ldh [hDivisor], a
	ld b, 4
	call Divide
	; minimum accuracy is $0001
	ldh a, [hQuotient + 3]
	ld b, a
	ldh a, [hQuotient + 2]
	or b
	jr nz, .min_accuracy
	ldh [hQuotient + 2], a
	ld a, 1
	ldh [hQuotient + 3], a

.min_accuracy
	; do the same thing to the target's evasion
	ld b, c
	dec d
	jr nz, .accuracy_loop

	push af
	call CheckNeutralGas
	jr z, .FinishEvasionAbilities
	call GetUserAbility
	cp COMPOUNDEYES
	jr z, .CompoundEyes
	cp HUSTLE
	jr nz, .NoHustle
	farcall HustleCheck
	jr nc, .NoHustle
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_OHKO
	jr nz, .HustleLoss
.NoHustle
	pop af
.CheckTargetEvasionAbilities
	push af
	call GetUserAbility
	cp MOLD_BREAKER
	jr z, .FinishEvasionAbilities
	call GetTargetAbility
	cp SAND_VEIL
	jr z, .CheckSand
	cp SNOW_CLOAK
	jr z, .CheckHail
	cp TANGLED_FEET
	jr z, .TangledFeet
	cp WONDER_SKIN
	jr z, .WonderSkin
.FinishEvasionAbilities
	pop af

.FinishEvasion
	; if the result is more than 2 bytes, max out at 100%
	ldh a, [hQuotient + 2]
	and a
	ldh a, [hQuotient + 3]
	jr z, .finish_accuracy
	ld a, $ff

.finish_accuracy
	pop hl
	ld [hl], a
	ret

.HustleLoss
	pop af
	ld a, 80
	call AccuracyCalc
	jr .CheckTargetEvasionAbilities

.CompoundEyes
	pop af
	ld a, 30
	add 100
	call AccuracyCalc
	jr .CheckTargetEvasionAbilities

.CheckSand
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr nz, .FinishEvasionAbilities
	pop af
	ld a, 80
	call AccuracyCalc
	jr .FinishEvasion

.CheckHail
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	jr nz, .FinishEvasionAbilities
	pop af
	ld a, 80
	call AccuracyCalc
	jr .FinishEvasion

.TangledFeet
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVar
	bit SUBSTATUS_CONFUSED, a
	jr z, .FinishEvasionAbilities
	pop af
	ld a, 50
	call AccuracyCalc
	jr .FinishEvasion

.WonderSkin
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp STATUS
	jr c, .FinishEvasionAbilities
	pop af
	ld a, 50
	call AccuracyCalc
	jr .FinishEvasion

AccuracyCalc:
	ldh [hMultiplier], a
	call Multiply

	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	jp Divide

BattleCommand_EffectChance:
; effectchance

	xor a
	ld [wEffectFailed], a
	call CheckSubstituteOpp
	jr nz, .failed

	push hl
	ld hl, wPlayerMoveStruct + MOVE_CHANCE
	ldh a, [hBattleTurn]
	and a
	jr z, .got_move_chance
	ld hl, wEnemyMoveStruct + MOVE_CHANCE
.got_move_chance
	call CheckNeutralGas
	jr z, .SkipSereneGrace
	call GetUserAbility
	cp SERENE_GRACE
	jr nz, .SkipSereneGrace
	ld a, [hl]
	add a, a
	jr .FinishSereneGrace
.SkipSereneGrace
	ld a, [hl]
.FinishSereneGrace
	sub 100 percent
	; If chance was 100%, RNG won't be called (carry not set)
	; Thus chance will be subtracted from 0, guaranteeing a carry
	call c, BattleRandom
	cp [hl]
	pop hl
	ret c

.failed
	ld a, 1
	ld [wEffectFailed], a
	and a
	ret

BattleCommand_LowerSub:
; lowersub

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret z

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	bit SUBSTATUS_CHARGED, a
	jr nz, .already_charged

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_RAZOR_WIND
	jr z, .charge_turn
	cp EFFECT_SKY_ATTACK
	jr z, .charge_turn
	cp EFFECT_SKULL_BASH
	jr z, .charge_turn
	cp EFFECT_SOLARBEAM
	jr z, .charge_turn
	cp EFFECT_FLY
	jr z, .charge_turn

.already_charged
	call .Rampage
	jr z, .charge_turn

	call CheckUserIsCharging
	ret nz

.charge_turn
	call _CheckBattleScene
	jr c, .mimic_anims

	xor a
	ld [wNumHits], a
	inc a
	ld [wKickCounter], a
	ld hl, SUBSTITUTE
	call GetMoveIDFromIndex
	jp LoadAnim

.mimic_anims
	call BattleCommand_LowerSubNoAnim
	jp BattleCommand_MoveDelay

.Rampage:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ROLLOUT
	jr z, .rollout_rampage
	cp EFFECT_RAMPAGE
	jr z, .rollout_rampage

	ld a, 1
	and a
	ret

.rollout_rampage
	ld a, [wSomeoneIsRampaging]
	and a
	ld a, 0
	ld [wSomeoneIsRampaging], a
	ret

BattleCommand_MoveAnim:
; moveanim
	call BattleCommand_LowerSub
	call BattleCommand_MoveAnimNoSub
	jp BattleCommand_RaiseSub

BattleCommand_MoveAnimNoSub:
	ld a, [wAttackMissed]
	and a
	jp nz, BattleCommand_MoveDelay

	ldh a, [hBattleTurn]
	and a
	ld de, wPlayerRolloutCount
	ld a, BATTLEANIM_ENEMY_DAMAGE
	jr z, .got_rollout_count
	ld de, wEnemyRolloutCount
	ld a, BATTLEANIM_PLAYER_DAMAGE

.got_rollout_count
	ld [wNumHits], a
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_MULTI_HIT
	jr z, .alternate_anim
	cp EFFECT_CONVERSION
	jr z, .alternate_anim
	cp EFFECT_DOUBLE_HIT
	jr z, .alternate_anim
	cp EFFECT_POISON_MULTI_HIT
	jr z, .alternate_anim
	cp EFFECT_TRIPLE_KICK
	jr z, .triplekick
	xor a
	ld [wKickCounter], a

.triplekick
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call SetMoveAnimationID
	call PlaySelectedFXAnim

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld hl, .fly_dig_moves
	call CheckMoveInList
	ret nc
	jp AppearUserLowerSub

.fly_dig_moves
	dw FLY
	dw DIG
	dw -1

.alternate_anim
	ld a, [wKickCounter]
	and 1
	xor 1
	ld [wKickCounter], a
	ld a, [de]
	cp 1
	push af
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call SetMoveAnimationID
	pop af
	jr z, .play_anim
	xor a
	ld [wNumHits], a
.play_anim
	jp PlaySelectedFXAnim

BattleCommand_StatUpAnim:
	ld a, [wAttackMissed]
	and a
	jp nz, BattleCommand_MoveDelay

	xor a
	jr BattleCommand_StatUpDownAnim

BattleCommand_StatDownAnim:
	ld a, [wAttackMissed]
	and a
	jp nz, BattleCommand_MoveDelay

	ldh a, [hBattleTurn]
	and a
	ld a, BATTLEANIM_ENEMY_STAT_DOWN
	jr z, BattleCommand_StatUpDownAnim
	ld a, BATTLEANIM_WOBBLE

	; fallthrough

BattleCommand_StatUpDownAnim:
	ld [wNumHits], a
	xor a
	ld [wKickCounter], a
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	call SetMoveAnimationID
	jp PlaySelectedFXAnim

BattleCommand_SwitchTurn:
; switchturn

	ldh a, [hBattleTurn]
	xor 1
	ldh [hBattleTurn], a
	ret

BattleCommand_RaiseSub:
; raisesub

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret z

	call _CheckBattleScene
	jp c, BattleCommand_RaiseSubNoAnim

	xor a
	ld [wNumHits], a
	ld a, $2
	ld [wKickCounter], a
	ld hl, SUBSTITUTE
	call GetMoveIDFromIndex
	jp LoadAnim

BattleCommand_FailureText:
; failuretext
; If the move missed or failed, load the appropriate
; text, and end the effects of multi-turn or multi-
; hit moves.
	ld a, [wAttackMissed]
	and a
	ret z

	call GetFailureResultText
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr

	push hl
	ld hl, .fly_dig_moves
	call CheckMoveInList
	pop hl
	jr c, .fly_dig

; Move effect:
	inc hl
	ld a, [hl]

	cp EFFECT_MULTI_HIT
	jr z, .multihit
	cp EFFECT_DOUBLE_HIT
	jr z, .multihit
	cp EFFECT_POISON_MULTI_HIT
	jr z, .multihit
	jp EndMoveEffect

.multihit
	call BattleCommand_RaiseSub
	jp EndMoveEffect

.fly_dig
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	call AppearUserRaiseSub
	jp EndMoveEffect

.fly_dig_moves
	dw FLY
	dw DIG
	dw -1

BattleCommand_ApplyDamage:
; applydamage

	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_ENDURE, a
	jr z, .check_item

	farcall BattleCommand_FalseSwipe
	ld b, 0
	jr nc, .damage
	ld b, 1
	jr .damage

.check_item
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipSturdy
	call GetTargetAbility
	cp STURDY
	jr nz, .SkipSturdy
	farcall CheckOpponentFullHP
	jr nz, .damage
	farcall BattleCommand_FalseSwipe
	ld b, 0
	jr nc, .damage
	call GetTargetAbility
	ld b, a
	farcall FarLoadAbilityName
	ld b, a
	and a
	ld b, 2
	jr .damage
.SkipSturdy
	call GetOpponentItem
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	ld a, b
	cp HELD_FOCUS_BAND
	ld b, 0
	jr z, .focus_band
	cp HELD_FOCUS_SASH
	jr nz, .damage

; check if target is at full HP
	farcall CheckOpponentFullHP
	jr nz, .damage
	farcall BattleCommand_FalseSwipe
	ld b, 0
	jr nc, .damage
	callfar ConsumeHeldItem
	ld b, 2
	jr .damage

.focus_band
	call BattleRandom
	cp c
	jr nc, .damage
	farcall BattleCommand_FalseSwipe
	ld b, 0
	jr nc, .damage
	ld b, 2

.damage
	push bc
	call .update_damage_taken
	ld c, FALSE
	ldh a, [hBattleTurn]
	and a
	jr nz, .damage_player
	call DoEnemyDamage
	jr .done_damage

.damage_player
	call DoPlayerDamage

.done_damage
	pop bc
	ld a, b
	and a
	ret z

	dec a
	jr nz, .focus_band_text
	ld hl, EnduredText
	jp StdBattleTextbox

.focus_band_text
	ld hl, HungOnText
	call StdBattleTextbox
	call CheckNeutralGas
	ret z
	call GetUserAbility
	cp UNBURDEN
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS1
	call GetBattleVarAddr
	set SUBSTATUS_UNBURDEN, [hl]
	ld hl, UnburdenText
	jp StdBattleTextbox

.update_damage_taken
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz

	ld de, wPlayerDamageTaken + 1
	ldh a, [hBattleTurn]
	and a
	jr nz, .got_damage_taken
	ld de, wEnemyDamageTaken + 1

.got_damage_taken
	ld a, [wCurDamage + 1]
	ld b, a
	ld a, [de]
	add b
	ld [de], a
	dec de
	ld a, [wCurDamage]
	ld b, a
	ld a, [de]
	adc b
	ld [de], a
	ret nc
	ld a, $ff
	ld [de], a
	inc de
	ld [de], a
	ret

GetFailureResultText:
	ld hl, DoesntAffectText
	ld de, DoesntAffectText
	ld a, [wTypeModifier]
	and $7f
	jr z, .got_text
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_FUTURE_SIGHT
	ld hl, ButItFailedText
	ld de, ItFailedText
	jr z, .got_text
	ld hl, AttackMissedText
	ld de, AttackMissed2Text
	ld a, [wCriticalHit]
	cp -1
	jr nz, .got_text
	ld hl, UnaffectedText
.got_text
	call FailText_CheckOpponentProtect
	xor a
	ld [wCriticalHit], a

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_JUMP_KICK
	ret nz

	call CheckNeutralGas
	jr z, .SkipMagicGuard
	call GetUserAbility
	cp MAGIC_GUARD
	jr z, .MagicGuard
.SkipMagicGuard
	ld a, [wTypeModifier]
	and $7f
	ret z

	ld hl, wCurDamage
	ld a, [hli]
	ld b, [hl]
rept 3
	srl a
	rr b
endr
	ld [hl], b
	dec hl
	ld [hli], a
	or b
	jr nz, .do_at_least_1_damage
	inc a
	ld [hl], a
.do_at_least_1_damage
	ld hl, CrashedText
	call StdBattleTextbox
	ld a, $1
	ld [wKickCounter], a
	call LoadMoveAnim
	ld c, TRUE
	ldh a, [hBattleTurn]
	and a
	jp nz, DoEnemyDamage
	jp DoPlayerDamage

.MagicGuard
	ld hl, CrashedText
	jp StdBattleTextbox

FailText_CheckOpponentProtect:
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVar
	bit SUBSTATUS_PROTECT, a
	jr z, .not_protected
	ld h, d
	ld l, e
.not_protected
	jp StdBattleTextbox

BattleCommand_StartLoop:
; startloop

	ld hl, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyRolloutCount
.ok
	xor a
	ld [hl], a
	ret

BattleCommand_SuperEffectiveLoopText:
; supereffectivelooptext

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOOP, a
	ret nz

	; fallthrough

BattleCommand_SuperEffectiveText:
; supereffectivetext

	ld a, [wTypeModifier]
	and $7f
	cp 10 ; 1.0
	ret z
	ld hl, SuperEffectiveText
	jr nc, .print
	ld hl, NotVeryEffectiveText
.print
	jp StdBattleTextbox

BattleCommand_CheckFaint:
; checkfaint

; Faint the opponent if its HP reached zero
;  and faint the user along with it if it used Destiny Bond.
; Ends the move effect if the opponent faints.

	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP

.got_hp
	ld a, [hli]
	or [hl]
	ret nz

	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_DESTINY_BOND, a
	jr z, .no_dbond

	ld hl, TookDownWithItText
	call StdBattleTextbox

	ldh a, [hBattleTurn]
	and a
	ld hl, wEnemyMonMaxHP + 1
	bccoord 2, 2 ; hp bar
	ld a, 0
	jr nz, .got_max_hp
	ld hl, wBattleMonMaxHP + 1
	bccoord 10, 9 ; hp bar
	ld a, 1

.got_max_hp
	ld [wWhichHPBar], a
	ld a, [hld]
	ld [wBuffer1], a
	ld a, [hld]
	ld [wBuffer2], a
	ld a, [hl]
	ld [wBuffer3], a
	xor a
	ld [hld], a
	ld a, [hl]
	ld [wBuffer4], a
	xor a
	ld [hl], a
	ld [wBuffer5], a
	ld [wBuffer6], a
	ld h, b
	ld l, c
	predef AnimateHPBar
	call RefreshBattleHuds

	call BattleCommand_SwitchTurn
	xor a
	ld [wNumHits], a
	inc a
	ld [wKickCounter], a
	ld hl, DESTINY_BOND
	call GetMoveIDFromIndex
	call LoadAnim
	call BattleCommand_SwitchTurn

	jr .finish

.no_dbond
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_MULTI_HIT
	jr z, .multiple_hit_raise_sub
	cp EFFECT_DOUBLE_HIT
	jr z, .multiple_hit_raise_sub
	cp EFFECT_POISON_MULTI_HIT
	jr z, .multiple_hit_raise_sub
	cp EFFECT_TRIPLE_KICK
	jr nz, .finish

.multiple_hit_raise_sub
	call BattleCommand_RaiseSub

.finish
	call CheckNeutralGas
	jp z, EndMoveEffect
	call GetUserAbility
	cp MOXIE
	jp nz, EndMoveEffect
	call BattleCommand_MoveDelay
	call BattleCommand_AttackUp
	ld hl, MoxieText
	call StdBattleTextbox
	jp EndMoveEffect

BattleCommand_BuildOpponentRage:
; buildopponentrage

	jp .start

.start
	ld a, [wAttackMissed]
	and a
	ret nz

	call GetOpponentItem
	ld a, [hl]
	cp AIR_BALLOON
	jr nz, .no_air_balloon
	callfar ConsumeHeldItem
	ld hl, AirBalloonPoppedText
	jp StdBattleTextbox

.no_air_balloon
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_RAGE, a
	ret z

	ld de, wEnemyRageCounter
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld de, wPlayerRageCounter
.player
	ld a, [de]
	inc a
	ret z
	ld [de], a

	call BattleCommand_SwitchTurn
	ld hl, RageBuildingText
	call StdBattleTextbox
	jp BattleCommand_SwitchTurn

EndMoveEffect:
	ld a, [wBattleScriptBufferAddress]
	ld l, a
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

DittoMetalPowder:
	ld a, MON_SPECIES
	call BattlePartyAttr
	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .Ditto
	ld a, [wTempEnemyMonSpecies]

.Ditto:
	push hl
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(DITTO)
	if HIGH(DITTO) == 0
		or h
		pop hl
	else
		ld a, h
		pop hl
		ret nz
		if HIGH(DITTO) == 1
			dec a
		else
			cp HIGH(DITTO)
		endc
	endc
	ret nz

	push bc
	call GetOpponentItem
	ld a, [hl]
	cp METAL_POWDER
	pop bc
	ret nz

	ld a, c
	srl a
	add c
	ld c, a
	ret nc

	srl b
	ld a, b
	and a
	jr nz, .done
	inc b
.done
	scf
	rr c
	ret

UnevolvedEviolite:
; get the defender's species
	ld a, MON_SPECIES
	call BattlePartyAttr
	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .got_species
	ld a, [wTempEnemyMonSpecies]

.got_species
	push hl
	push bc
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	farcall GetFarByte
	pop bc
	pop hl
	and a
	ret z

; check if the defender's item is Eviolite
	push bc
	call GetOpponentItem
	ld a, b
	cp HELD_EVIOLITE
	pop bc
	ret nz

; boost the relevant defense stat in bc by 50%
	ld a, c
	srl a
	add c
	ld c, a
	ret nc

	srl b
	ld a, b
	and a
	jr nz, .done
	inc b
.done
	scf
	rr c
	ret

BattleCommand_DamageStats:
; damagestats

	ldh a, [hBattleTurn]
	and a
	jp nz, EnemyAttackDamage

	; fallthrough

PlayerAttackDamage:
; Return move power d, player level e, enemy defense c and player attack b.

	call ResetDamage

	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipUnaware
	ld a, [wPlayerAbility]
	cp UNAWARE
	jr z, .PlayerUnawareAttack
	ld a, [wEnemyAbility]
	cp UNAWARE
	jr nz, .SkipUnaware
.PlayerUnawareAttack
	jp UnawareCheck

.SkipUnaware
	ld hl, wPlayerMoveStructPower
	ld a, [hli]
	and a
	ld d, a
	ret z

	ld a, [hl]
	cp SPECIAL
	jr nc, .special

.physical
	ld hl, wEnemyMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call HailDefBoost

	call CheckNeutralGas
	jr z, .SkipPhysicalInfiltrator
	ld a, [wPlayerAbility]
	cp INFILTRATOR
	jr z, .physicalcrit

.SkipPhysicalInfiltrator
	ld a, [wEnemyScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcrit
	sla c
	rl b

.physicalcrit
	ld hl, wBattleMonAttack
	call CheckDamageStatsCritical
	jr c, .thickclub

	ld hl, wEnemyDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wPlayerAttack
	jr .thickclub

.special
	ld hl, wEnemyMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call SandstormSpDefBoost

	call CheckNeutralGas
	jr z, .SkipSpecialInfiltrator
	ld a, [wPlayerAbility]
	cp INFILTRATOR
	jr z, .specialcrit

.SkipSpecialInfiltrator
	ld a, [wEnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcrit
	sla c
	rl b

.specialcrit
	ld hl, wBattleMonSpclAtk
	call CheckDamageStatsCritical
	jr c, .lightball

	ld hl, wEnemySpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wPlayerSpAtk

.lightball
; Note: Returns player special attack at hl in hl.
	call LightBallBoost
	jr .done

.thickclub
; Note: Returns player attack at hl in hl.
	call ThickClubBoost

.done
	call TruncateHL_BC

	ld a, [wBattleMonLevel]
	ld e, a
	call DittoMetalPowder
	call UnevolvedEviolite

	ld a, 1
	and a
	ret

TruncateHL_BC:
.loop
; Truncate 16-bit values hl and bc to 8-bit values b and c respectively.
; b = hl, c = bc

	ld a, h
	or b
	jr z, .finish

	srl b
	rr c
	srl b
	rr c

	ld a, c
	or b
	jr nz, .done_bc
	inc c

.done_bc
	srl h
	rr l
	srl h
	rr l

	ld a, l
	or h
	jr nz, .finish
	inc l

.finish
; If we go back to the loop point,
; it's the same as doing this exact
; same check twice.
	ld a, h
	or b
	jr nz, .loop

	ld b, l
	ret

CheckDamageStatsCritical:
; Return carry if boosted stats should be used in damage calculations.
; Unboosted stats should be used if the attack is a critical hit,
;  and the stage of the opponent's defense is higher than the user's attack.

	ld a, [wCriticalHit]
	and a
	scf
	ret z

	push hl
	push bc
	ldh a, [hBattleTurn]
	and a
	jr nz, .enemy
	ld a, [wPlayerMoveStructType]
	cp SPECIAL
; special
	ld a, [wPlayerSAtkLevel]
	ld b, a
	ld a, [wEnemySDefLevel]
	jr nc, .end
; physical
	ld a, [wPlayerAtkLevel]
	ld b, a
	ld a, [wEnemyDefLevel]
	jr .end

.enemy
	ld a, [wEnemyMoveStructType]
	cp SPECIAL
; special
	ld a, [wEnemySAtkLevel]
	ld b, a
	ld a, [wPlayerSDefLevel]
	jr nc, .end
; physical
	ld a, [wEnemyAtkLevel]
	ld b, a
	ld a, [wPlayerDefLevel]
.end
	cp b
	pop bc
	pop hl
	ret

ThickClubBoost:
; Return in hl the stat value at hl.

; If the attacking monster is Cubone or Marowak and
; it's holding a Thick Club, double it.
	push bc
	push de
	ld bc, CUBONE
	ld d, THICK_CLUB
	call SpeciesItemBoost
	if MAROWAK == (CUBONE + 1)
		inc bc
	else
		ld bc, MAROWAK
	endc
	call DoubleStatIfSpeciesHoldingItem
	pop de
	pop bc
	ret

LightBallBoost:
; Return in hl the stat value at hl.

; If the attacking monster is Pikachu and it's
; holding a Light Ball, double it.
	push bc
	push de
	ld bc, PIKACHU
	ld d, LIGHT_BALL
	call SpeciesItemBoost
	if RAICHU == (PIKACHU + 1)
		inc bc
	else
		ld bc, RAICHU
	endc
	call DoubleStatIfSpeciesHoldingItem
	pop de
	pop bc
	ret

SpeciesItemBoost:
; Return in hl the stat value at hl.

; If the attacking monster is species bc and
; it's holding item d, double it.

	ld a, [hli]
	ld l, [hl]
	ld h, a
	; fallthrough

DoubleStatIfSpeciesHoldingItem:
; If the attacking monster is species bc and
; it's holding item d, double the stat in hl.

	push hl
	ld a, MON_SPECIES
	call BattlePartyAttr

	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr z, .CompareSpecies
	ld a, [wTempEnemyMonSpecies]
.CompareSpecies:

	call GetPokemonIndexFromID
	ld a, h
	cp b
	ld a, l
	pop hl
	ret nz
	cp c
	ret nz

	push hl
	call GetUserItem
	ld a, [hl]
	pop hl
	cp d
	ret nz

; Double the stat
	sla l
	rl h
	ret

EnemyAttackDamage:
	call ResetDamage

	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipUnaware
	ld a, [wEnemyAbility]
	cp UNAWARE
	jr z, .EnemyUnawareAttack
	ld a, [wPlayerAbility]
	cp UNAWARE
	jr nz, .SkipUnaware
.EnemyUnawareAttack
	jp UnawareCheck

.SkipUnaware
; No damage dealt with 0 power.
	ld hl, wEnemyMoveStructPower
	ld a, [hli] ; hl = wEnemyMoveStructType
	ld d, a
	and a
	ret z

	ld a, [hl]
	cp SPECIAL
	jr nc, .Special

.physical
	ld hl, wBattleMonDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call HailDefBoost

	call CheckNeutralGas
	jr z, .SkipPhysicalInfiltrator
	ld a, [wEnemyAbility]
	cp INFILTRATOR
	jr z, .specialcrit

.SkipPhysicalInfiltrator
	ld a, [wPlayerScreens]
	bit SCREENS_REFLECT, a
	jr z, .physicalcrit
	sla c
	rl b

.physicalcrit
	ld hl, wEnemyMonAttack
	call CheckDamageStatsCritical
	jr c, .thickclub

	ld hl, wPlayerDefense
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemyAttack
	jr .thickclub

.Special:
	ld hl, wBattleMonSpclDef
	ld a, [hli]
	ld b, a
	ld c, [hl]

	call SandstormSpDefBoost

	call CheckNeutralGas
	jr z, .SkipSpecialInfiltrator
	ld a, [wEnemyAbility]
	cp INFILTRATOR
	jr z, .specialcrit

.SkipSpecialInfiltrator
	ld a, [wPlayerScreens]
	bit SCREENS_LIGHT_SCREEN, a
	jr z, .specialcrit
	sla c
	rl b

.specialcrit
	ld hl, wEnemyMonSpclAtk
	call CheckDamageStatsCritical
	jr c, .lightball
	ld hl, wPlayerSpDef
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wEnemySpAtk

.lightball
	call LightBallBoost
	jr .done

.thickclub
	call ThickClubBoost

.done
	call TruncateHL_BC

	ld a, [wEnemyMonLevel]
	ld e, a
	call DittoMetalPowder
	call UnevolvedEviolite

	ld a, 1
	and a
	ret

HitSelfInConfusion:
	call ResetDamage
	ldh a, [hBattleTurn]
	and a
	ld hl, wBattleMonDefense
	ld de, wPlayerScreens
	ld a, [wBattleMonLevel]
	jr z, .got_it

	ld hl, wEnemyMonDefense
	ld de, wEnemyScreens
	ld a, [wEnemyMonLevel]
.got_it
	push af
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, [de]
	bit SCREENS_REFLECT, a
	jr z, .mimic_screen

	sla c
	rl b
.mimic_screen
	dec hl
	dec hl
	dec hl
	ld a, [hli]
	ld l, [hl]
	ld h, a
	call TruncateHL_BC
	ld d, 40
	pop af
	ld e, a
	ret

BattleCommand_DamageCalc:
; damagecalc

; Return a damage value for move power d, player level e, enemy defense c and player attack b.

; Return 1 if successful, else 0.

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar

; Selfdestruct and Explosion halve defense.
	cp EFFECT_SELFDESTRUCT
	jr nz, .dont_selfdestruct

	srl c
	jr nz, .dont_selfdestruct
	inc c

.dont_selfdestruct

; Variable-hit moves and Conversion can have a power of 0.
	cp EFFECT_MULTI_HIT
	jr z, .skip_zero_damage_check

	cp EFFECT_CONVERSION
	jr z, .skip_zero_damage_check

; No damage if move power is 0.
	ld a, d
	and a
	ret z

.skip_zero_damage_check
; Minimum defense value is 1.
	ld a, c
	and a
	jr nz, .not_dividing_by_zero
	ld c, 1
.not_dividing_by_zero

	xor a
	ld hl, hDividend
	ld [hli], a
	ld [hli], a
	ld [hl], a

; Level * 2
	ld a, e
	add a
	jr nc, .level_not_overflowing
	ld [hl], 1
.level_not_overflowing
	inc hl
	ld [hli], a

; / 5
	ld a, 5
	ld [hld], a
	push bc
	ld b, 4
	call Divide
	pop bc

; + 2
	inc [hl]
	inc [hl]

; * bp
	inc hl
	ld [hl], d
	call Multiply

; * Attack
	ld [hl], b
	call Multiply

; / Defense
	ld [hl], c
	ld b, 4
	call Divide

; / 50
	ld [hl], 50
	ld b, $4
	call Divide

; Item boosts

	farcall CheckBoostingAbilities

	call GetUserItem

	ld a, b
	and a
	jp z, .DoneItem

	cp HELD_LIFE_ORB
	jr z, .LifeOrb

	cp HELD_CATEGORY_BOOST
	jr z, .CategoryBoost

	cp HELD_CHOICE_BOOST
	jr z, .ChoiceBoost

	ld hl, TypeBoostItems

.NextItem:
	ld a, [hli]
	cp -1
	jp z, .DoneItem

; Item effect
	cp b
	ld a, [hli]
	jr nz, .NextItem

; Type
	ld b, a
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp b
	jr nz, .DoneItem

; * 100 + item effect amount
	ld a, c
	add 100
	ldh [hMultiplier], a
	call Multiply

; / 100
	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide
	jr .DoneItem

.LifeOrb:
	ld a, 30
	add 100
	ldh [hMultiplier], a
	call Multiply

	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide
	jr .DoneItem

.CategoryBoost:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp SPECIAL
	jr nc, .special
; physical
	ld a, [hl]
	cp POWER_BAND
	jr z, .doCategoryBoost
	jr .DoneItem

.special:
	ld a, [hl]
	cp SPECIALSPECS
	jr nz, .DoneItem

.doCategoryBoost:
	ld a, 10
	add 100
	ldh [hMultiplier], a
	call Multiply

	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide
	jr .DoneItem

.ChoiceBoost:
	ld a, c
	cp SP_ATTACK
	jr z, .choice_specs
	and a
	jr nz, .DoneItem ; Must be Scarf, so no boost

; Choice Band
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp SPECIAL
	jr c, .doChoiceBoost
	jr .DoneItem

.choice_specs:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp SPECIAL
	jr c, .DoneItem

.doChoiceBoost:
	ld a, 50
	add 100
	ldh [hMultiplier], a
	call Multiply

	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide

.DoneItem:
; Critical hits
	call .CriticalMultiplier

; Update wCurDamage (capped at 997).
	ld hl, wCurDamage
	ld b, [hl]
	ldh a, [hProduct + 3]
	add b
	ldh [hProduct + 3], a
	jr nc, .dont_cap_1

	ldh a, [hProduct + 2]
	inc a
	ldh [hProduct + 2], a
	and a
	jr z, .Cap

.dont_cap_1
	ldh a, [hProduct]
	ld b, a
	ldh a, [hProduct + 1]
	or a
	jr nz, .Cap

	ldh a, [hProduct + 2]
	cp HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1)
	jr c, .dont_cap_2

	cp HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1) + 1
	jr nc, .Cap

	ldh a, [hProduct + 3]
	cp LOW(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1)
	jr nc, .Cap

.dont_cap_2
	inc hl

	ldh a, [hProduct + 3]
	ld b, [hl]
	add b
	ld [hld], a

	ldh a, [hProduct + 2]
	ld b, [hl]
	adc b
	ld [hl], a
	jr c, .Cap

	ld a, [hl]
	cp HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1)
	jr c, .dont_cap_3

	cp HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1) + 1
	jr nc, .Cap

	inc hl
	ld a, [hld]
	cp LOW(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE + 1)
	jr c, .dont_cap_3

.Cap:
	ld a, HIGH(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE)
	ld [hli], a
	ld a, LOW(MAX_STAT_VALUE - MIN_NEUTRAL_DAMAGE)
	ld [hld], a

.dont_cap_3
; Minimum neutral damage is 2 (bringing the cap to 999).
	inc hl
	ld a, [hl]
	add MIN_NEUTRAL_DAMAGE
	ld [hld], a
	jr nc, .dont_floor
	inc [hl]
.dont_floor

	ld a, 1
	and a
	ret

.CriticalMultiplier:
	ld a, [wCriticalHit]
	and a
	ret z

	call CheckNeutralGas
	jr z, .SkipSniper
	call GetUserAbility
	cp SNIPER
	jr nz, .SkipSniper

; x3
	xor a
	ldh [hMultiplicand + 0], a
	ldh a, [hQuotient + 2]
	ldh [hMultiplicand + 1], a
	ldh a, [hQuotient + 3]
	ldh [hMultiplicand + 2], a
	ld a, 30
	ldh [hMultiplier], a
	call Multiply
	ld a, 10
	ldh [hDivisor], a
	ld b, 4
	call Divide

	ldh a, [hQuotient + 3]
	ldh [hProduct + 3], a

	ldh a, [hQuotient + 2]
	ldh [hProduct + 2], a
	jr .CritCap

.SkipSniper
; x2
	ldh a, [hQuotient + 3]
	add a
	ldh [hProduct + 3], a

	ldh a, [hQuotient + 2]
	rl a
	ldh [hProduct + 2], a

; Cap at $ffff.
.CritCap
	ret nc

	ld a, $ff
	ldh [hProduct + 2], a
	ldh [hProduct + 3], a

	ret

BattleCommand_ConstantDamage:
; constantdamage

	ld hl, wBattleMonLevel
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wEnemyMonLevel

.got_turn
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_LEVEL_DAMAGE
	ld b, [hl]
	ld a, 0
	jr z, .got_power

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_PSYWAVE
	jr z, .psywave

	cp EFFECT_SUPER_FANG
	jr z, .super_fang

	cp EFFECT_REVERSAL
	jr z, .reversal

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	ld b, a
	ld a, $0
	jr .got_power

.psywave
	ld a, b
	srl a
	add b
	ld b, a
.psywave_loop
	call BattleRandom
	and a
	jr z, .psywave_loop
	cp b
	jr nc, .psywave_loop
	ld b, a
	ld a, 0
	jr .got_power

.super_fang
	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP
.got_hp
	ld a, [hli]
	srl a
	ld b, a
	ld a, [hl]
	rr a
	push af
	ld a, b
	pop bc
	and a
	jr nz, .got_power
	or b
	ld a, 0
	jr nz, .got_power
	ld b, 1
	jr .got_power

.got_power
	ld hl, wCurDamage
	ld [hli], a
	ld [hl], b
	ret

.reversal
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .reversal_got_hp
	ld hl, wEnemyMonHP
.reversal_got_hp
	xor a
	ldh [hDividend], a
	ldh [hMultiplicand + 0], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hli]
	ldh [hMultiplicand + 2], a
	ld a, 48
	ldh [hMultiplier], a
	call Multiply
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ldh [hDivisor], a
	ld a, b
	and a
	jr z, .skip_to_divide

	ldh a, [hProduct + 4]
	srl b
	rr a
	srl b
	rr a
	ldh [hDivisor], a
	ldh a, [hProduct + 2]
	ld b, a
	srl b
	ldh a, [hProduct + 3]
	rr a
	srl b
	rr a
	ldh [hDividend + 3], a
	ld a, b
	ldh [hDividend + 2], a

.skip_to_divide
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
	ld b, a
	ld hl, FlailReversalPower

.reversal_loop
	ld a, [hli]
	cp b
	jr nc, .break_loop
	inc hl
	jr .reversal_loop

.break_loop
	ldh a, [hBattleTurn]
	and a
	ld a, [hl]
	jr nz, .notPlayersTurn

	ld hl, wPlayerMoveStructPower
	ld [hl], a
	push hl
	call PlayerAttackDamage
	jr .notEnemysTurn

.notPlayersTurn
	ld hl, wEnemyMoveStructPower
	ld [hl], a
	push hl
	call EnemyAttackDamage

.notEnemysTurn
	call BattleCommand_DamageCalc
	pop hl
	ld [hl], 1
	ret

BattleCommand_DefrostOpponent:
; defrostopponent
; Thaw the opponent if frozen, and
; raise the user's Attack one stage.

	call AnimateCurrentMove

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	call Defrost

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld a, [hl]
	push hl
	push af

	ld a, EFFECT_ATTACK_UP
	ld [hl], a
	call BattleCommand_StatUp

	pop af
	pop hl
	ld [hl], a
	ret

FarPlayBattleAnimation:
; play animation de

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	ret nz

	; fallthrough

PlayFXAnimID:
	ld a, e
	ld [wFXAnimID], a
	ld a, d
	ld [wFXAnimID + 1], a
PlaySelectedFXAnim:
	ld c, 3
	call DelayFrames
	callfar PlayBattleAnim
	ret

DoEnemyDamage:
	ld hl, wCurDamage
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr z, .did_no_damage

	ld a, c
	and a
	jr nz, .ignore_substitute
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, DoSubstituteDamage

.ignore_substitute
	; Substract wCurDamage from wEnemyMonHP.
	;  store original HP in little endian wBuffer3/4
	ld a, [hld]
	ld b, a
	ld a, [wEnemyMonHP + 1]
	ld [wBuffer3], a
	sub b
	ld [wEnemyMonHP + 1], a
	ld a, [hl]
	ld b, a
	ld a, [wEnemyMonHP]
	ld [wBuffer4], a
	sbc b
	ld [wEnemyMonHP], a
	jr nc, .no_underflow

	ld a, [wBuffer4]
	ld [hli], a
	ld a, [wBuffer3]
	ld [hl], a
	xor a
	ld hl, wEnemyMonHP
	ld [hli], a
	ld [hl], a

.no_underflow
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld [wBuffer2], a
	ld a, [hl]
	ld [wBuffer1], a
	ld hl, wEnemyMonHP
	ld a, [hli]
	ld [wBuffer6], a
	ld a, [hl]
	ld [wBuffer5], a

	hlcoord 2, 2
	xor a
	ld [wWhichHPBar], a
	predef AnimateHPBar
.did_no_damage
	jp RefreshBattleHuds

DoPlayerDamage:
	ld hl, wCurDamage
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr z, .did_no_damage

	ld a, c
	and a
	jr nz, .ignore_substitute
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, DoSubstituteDamage

.ignore_substitute
	; Substract wCurDamage from wBattleMonHP.
	;  store original HP in little endian wBuffer3/4
	;  store new HP in little endian wBuffer5/6
	ld a, [hld]
	ld b, a
	ld a, [wBattleMonHP + 1]
	ld [wBuffer3], a
	sub b
	ld [wBattleMonHP + 1], a
	ld [wBuffer5], a
	ld b, [hl]
	ld a, [wBattleMonHP]
	ld [wBuffer4], a
	sbc b
	ld [wBattleMonHP], a
	ld [wBuffer6], a
	jr nc, .no_underflow

	ld a, [wBuffer4]
	ld [hli], a
	ld a, [wBuffer3]
	ld [hl], a
	xor a
	ld hl, wBattleMonHP
	ld [hli], a
	ld [hl], a
	ld hl, wBuffer5
	ld [hli], a
	ld [hl], a

.no_underflow
	ld hl, wBattleMonMaxHP
	ld a, [hli]
	ld [wBuffer2], a
	ld a, [hl]
	ld [wBuffer1], a

	hlcoord 10, 9
	ld a, 1
	ld [wWhichHPBar], a
	predef AnimateHPBar
.did_no_damage
	jp RefreshBattleHuds

DoSubstituteDamage:
	ld hl, SubTookDamageText
	call StdBattleTextbox

	ld de, wEnemySubstituteHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld de, wPlayerSubstituteHP
.got_hp

	ld hl, wCurDamage
	ld a, [hli]
	and a
	jr nz, .broke

	ld a, [de]
	sub [hl]
	ld [de], a
	jr z, .broke
	jr nc, .done

.broke
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	res SUBSTATUS_SUBSTITUTE, [hl]

	ld hl, SubFadedText
	call StdBattleTextbox

	call BattleCommand_SwitchTurn
	call BattleCommand_LowerSubNoAnim
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVar
	and 1 << SUBSTATUS_FLYING | 1 << SUBSTATUS_UNDERGROUND
	call z, AppearUserLowerSub
	call BattleCommand_SwitchTurn

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	cp EFFECT_MULTI_HIT
	jr z, .ok
	cp EFFECT_DOUBLE_HIT
	jr z, .ok
	cp EFFECT_POISON_MULTI_HIT
	jr z, .ok
	cp EFFECT_TRIPLE_KICK
	jr z, .ok
	xor a
	ld [hl], a
.ok
	call RefreshBattleHuds
.done
	jp ResetDamage

UpdateMoveData:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVarAddr
	ld d, h
	ld e, l

	ld a, BATTLE_VARS_MOVE
	call GetBattleVar
	ld [wCurSpecies], a
	ld [wNamedObjectIndexBuffer], a

	call GetMoveData
	call GetMoveName
	jp CopyName1

CheckForStatusIfAlreadyHasAny:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld d, h
	ld e, l
	and SLP
	ld hl, AlreadyAsleepText
	ret nz

	ld a, [de]
	bit FRZ, a
	ld hl, AlreadyFrozenText
	ret nz

	bit PAR, a
	ld hl, AlreadyParalyzedText
	ret nz

	bit PSN, a
	ld hl, AlreadyPoisonedText
	ret nz

	bit BRN, a
	ld hl, AlreadyBurnedText
	ret

BattleCommand_SleepTarget:
; sleeptarget
	call CheckForStatusIfAlreadyHasAny
	jr nz, .fail

	ld a, [wAttackMissed]
	and a
	jp nz, PrintDidntAffect2

	ld hl, DidntAffect1Text

	call CheckSubstituteOpp
	jr nz, .fail

	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipVitalSpirit

	call GetTargetAbility
	cp VITAL_SPIRIT
	jr z, .protected_by_ability
	cp INSOMNIA
	jr z, .protected_by_ability
	cp LEAF_GUARD
	jr nz, .SkipVitalSpirit
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr nz, .SkipVitalSpirit
	call AnimateFailedMove
	call GetTargetAbility
	ld b, a
	farcall FarLoadAbilityName
	ld a, b
	and a
	ld hl, ProtectedByText
	jp StdBattleTextbox
	
.SkipVitalSpirit:
	call AnimateCurrentMove
	ld b, $7
	ld a, [wInBattleTowerBattle]
	and a
	jr z, .random_loop
	ld b, $3

.random_loop
	call BattleRandom
	and b
	jr z, .random_loop
	cp 7
	jr z, .random_loop
	inc a
	ld [de], a
	call UpdateOpponentInParty
	call RefreshBattleHuds

	ld hl, FellAsleepText
	call StdBattleTextbox

	farcall UseHeldStatusHealingItem

	jp z, OpponentCantMove
	ret

.protected_by_ability
	ld hl, InsomniaText

.fail
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextbox

BattleCommand_PoisonTarget:
; poisontarget

	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipImmunity
	call GetTargetAbility
	cp IMMUNITY
	ret z
	cp LEAF_GUARD
	jr z, .LeafGuard
.SkipImmunity
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [wTypeModifier]
	and $7f
	ret z
	call CheckIfTargetIsPoisonType
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz

	call PoisonOpponent
	ld de, ANIM_PSN
	call PlayOpponentBattleAnim
	call RefreshBattleHuds

	ld hl, WasPoisonedText
	call StdBattleTextbox

	farcall SynchronizeCheck

	farcall UseHeldStatusHealingItem
	ret

.LeafGuard
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
	jr .SkipImmunity

BattleCommand_Poison:
; poison

	ld hl, DoesntAffectText
	ld a, [wTypeModifier]
	and $7f
	jp z, .failed

	call CheckIfTargetIsPoisonType
	jp z, .failed

	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipImmunity
	call GetTargetAbility
	cp IMMUNITY
	jp z, .Immunity
	cp LEAF_GUARD
	jr z, .LeafGuard
.SkipImmunity
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	ld b, a
	ld hl, AlreadyPoisonedText
	and 1 << PSN
	jp nz, .failed

.do_poison
	ld hl, AvoidStatusText
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and a
	jr nz, .failed

	call CheckSubstituteOpp
	jr nz, .failed
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	call .check_toxic
	jr z, .toxic

	call .apply_poison
	ld hl, WasPoisonedText
	call StdBattleTextbox
	jr .finished

.toxic
	set SUBSTATUS_TOXIC, [hl]
	xor a
	ld [de], a
	call .apply_poison

	ld hl, BadlyPoisonedText
	call StdBattleTextbox

.finished
	farcall SynchronizeCheck
	farcall UseHeldStatusHealingItem
	ret

.failed
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextbox

.apply_poison
	call AnimateCurrentMove
	call PoisonOpponent
	jp RefreshBattleHuds

.check_toxic
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVarAddr
	ldh a, [hBattleTurn]
	and a
	ld de, wEnemyToxicCount
	jr z, .ok
	ld de, wPlayerToxicCount
.ok
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_TOXIC
	ret

.LeafGuard
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr nz, .SkipImmunity
.Immunity
	jp _PreventAbilityText

CheckIfTargetIsPoisonType:
	ld de, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wBattleMonType1
.ok
	ld a, [de]
	inc de
	cp POISON
	ret z
	ld a, [de]
	cp POISON
	ret

PoisonOpponent:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PSN, [hl]
	jp UpdateOpponentInParty

BattleCommand_DrainTarget:
; draintarget
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipLiquidOoze
	call GetTargetAbility
	cp LIQUID_OOZE
	jr z, LiquidOoze
.SkipLiquidOoze
	call SapHealth
	ld hl, SuckedHealthText
	jp StdBattleTextbox

LiquidOoze:
	farcall _LiquidOoze
	ret

BattleCommand_EatDream:
; eatdream
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipLiquidOoze
	call GetTargetAbility
	cp LIQUID_OOZE
	jr z, LiquidOoze
.SkipLiquidOoze
	call SapHealth
	ld hl, DreamEatenText
	jp StdBattleTextbox

SapHealth:
	; Divide damage by 2, store it in hDividend
	ld hl, wCurDamage
	ld a, [hli]
	srl a
	ldh [hDividend], a
	ld b, a
	ld a, [hl]
	rr a
	ldh [hDividend + 1], a
	or b
	jr nz, .at_least_one
	ld a, 1
	ldh [hDividend + 1], a
.at_least_one

	ld hl, wBattleMonHP
	ld de, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .battlemonhp
	ld hl, wEnemyMonHP
	ld de, wEnemyMonMaxHP
.battlemonhp

	; Store current HP in little endian wBuffer3/4
	ld bc, wBuffer4
	ld a, [hli]
	ld [bc], a
	ld a, [hl]
	dec bc
	ld [bc], a

	; Store max HP in little endian wBuffer1/2
	ld a, [de]
	dec bc
	ld [bc], a
	inc de
	ld a, [de]
	dec bc
	ld [bc], a

	; Add hDividend to current HP and copy it to little endian wBuffer5/6
	ldh a, [hDividend + 1]
	ld b, [hl]
	add b
	ld [hld], a
	ld [wBuffer5], a
	ldh a, [hDividend]
	ld b, [hl]
	adc b
	ld [hli], a
	ld [wBuffer6], a
	jr c, .max_hp

	; Substract current HP from max HP (to see if we have more than max HP)
	ld a, [hld]
	ld b, a
	ld a, [de]
	dec de
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	inc de
	sbc b
	jr nc, .finish

.max_hp
	; Load max HP into current HP and copy it to little endian wBuffer5/6
	ld a, [de]
	ld [hld], a
	ld [wBuffer5], a
	dec de
	ld a, [de]
	ld [hli], a
	ld [wBuffer6], a
	inc de

.finish
	ldh a, [hBattleTurn]
	and a
	hlcoord 10, 9
	ld a, $1
	jr z, .hp_bar
	hlcoord 2, 2
	xor a
.hp_bar
	ld [wWhichHPBar], a
	predef AnimateHPBar
	call RefreshBattleHuds
	jp UpdateBattleMonInParty

BattleCommand_BurnTarget:
; burntarget

	xor a
	ld [wNumHits], a
	call CheckSubstituteOpp
	ret nz
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipWaterVeil
	call GetTargetAbility
	cp WATER_VEIL
	ret z
	cp LEAF_GUARD
	jr z, .LeafGuard
.SkipWaterVeil
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	jp nz, Defrost
	ld a, [wTypeModifier]
	and $7f
	ret z
	call CheckMoveTypeMatchesTarget ; Don't burn a Fire-type
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz

	call BurnOpponent

	ld hl, WasBurnedText
	call StdBattleTextbox

	farcall SynchronizeCheck
	farcall UseHeldStatusHealingItem
	ret

.LeafGuard
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
	jr .SkipWaterVeil

BurnOpponent:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set BRN, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore
	ld de, ANIM_BRN
	call PlayOpponentBattleAnim
	jp RefreshBattleHuds

Defrost:
	ld a, [hl]
	and 1 << FRZ
	ret z

	xor a
	ld [hl], a

	ldh a, [hBattleTurn]
	and a
	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Status
	jr z, .ok
	ld hl, wPartyMon1Status
	ld a, [wCurBattleMon]
.ok

	call GetPartyLocation
	xor a
	ld [hl], a
	call UpdateOpponentInParty

	ld hl, DefrostedOpponentText
	jp StdBattleTextbox

BattleCommand_FreezeTarget:
; freezetarget

	xor a
	ld [wNumHits], a
	call CheckSubstituteOpp
	ret nz
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipMagmaArmor
	call GetTargetAbility
	cp MAGMA_ARMOR
	ret z
	cp LEAF_GUARD
	jr z, .LeafGuard
.SkipMagmaArmor
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [wTypeModifier]
	and $7f
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
	call CheckMoveTypeMatchesTarget ; Don't freeze an Ice-type
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set FRZ, [hl]
	call UpdateOpponentInParty
	ld de, ANIM_FRZ
	call PlayOpponentBattleAnim
	call RefreshBattleHuds

	ld hl, WasFrozenText
	call StdBattleTextbox

	farcall UseHeldStatusHealingItem
	ret nz

	call OpponentCantMove
	call EndRechargeOpp
	ld hl, wEnemyJustGotFrozen
	ldh a, [hBattleTurn]
	and a
	jr z, .finish
	ld hl, wPlayerJustGotFrozen
.finish
	ld [hl], $1
	ret

.LeafGuard
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
	jr .SkipMagmaArmor

BattleCommand_ParalyzeTarget:
; paralyzetarget

	xor a
	ld [wNumHits], a
	call CheckSubstituteOpp
	ret nz
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipLimber
	call GetTargetAbility
	cp LIMBER
	ret z
	cp LEAF_GUARD
	jr z, .LeafGuard
.SkipLimber
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [wTypeModifier]
	and $7f
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PAR, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore
	ld de, ANIM_PAR
	call PlayOpponentBattleAnim
	call RefreshBattleHuds
	call PrintParalyze
	farcall SynchronizeCheck
	ld hl, UseHeldStatusHealingItem
	jp CallBattleCore

.LeafGuard:
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
	jp .SkipLimber

BattleCommand_SleepHit:
; sleephit
	xor a
	ld [wNumHits], a
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	and a
	ret nz
	ld a, [wTypeModifier]
	and $7f
	ret z
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipAbilities
	call GetTargetAbility
	cp VITAL_SPIRIT
	ret z
	cp INSOMNIA
	ret z
	cp LEAF_GUARD
	jr nz, .SkipAbilities
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret z
.SkipAbilities
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	ld d, h
	ld e, l
	ld b, 7
	ld a, [wInBattleTowerBattle]
	and a
	jr z, .random_loop
	ld b, 3

.random_loop
	call BattleRandom
	and b
	jr z, .random_loop
	cp 7
	jr z, .random_loop
	inc a
	ld [de], a
	call UpdateOpponentInParty
	call RefreshBattleHuds

	ld hl, FellAsleepText
	call StdBattleTextbox

	farcall UseHeldStatusHealingItem

	jp z, OpponentCantMove
	ret

.finish
	ld [hl], $1
	ret

BattleCommand_Burn:
; burn
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipWaterVeil
	call GetTargetAbility
	cp WATER_VEIL
	jr z, .WaterVeil
	cp LEAF_GUARD
	jr z, .LeafGuard
.SkipWaterVeil
	call CheckForStatusIfAlreadyHasAny
	jr nz, .hasstatus
	ld a, [wTypeModifier]
	and $7f
	jr z, .didnt_affect
	call CheckMoveTypeMatchesTarget ; Don't burn a Fire-type
	jr z, .didnt_affect
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	call CheckSubstituteOpp
	jr nz, .failed
	ld c, 30
	call DelayFrames
	call AnimateCurrentMove
	ld a, $1
	ldh [hBGMapMode], a
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set BRN, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore
	call UpdateBattleHuds
	ld hl, WasBurnedText
	call StdBattleTextbox
	farcall SynchronizeCheck
	ld hl, UseHeldStatusHealingItem
	jp CallBattleCore

.hasstatus
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextbox

.failed
	jp PrintDidntAffect2

.didnt_affect
	call AnimateFailedMove
	jp PrintDoesntAffect

.LeafGuard
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr nz, .SkipWaterVeil
.WaterVeil
	jp _PreventAbilityText

BattleCommand_AttackUp:
; attackup
	ld b, ATTACK
	jr BattleCommand_StatUp

BattleCommand_DefenseUp:
; defenseup
	ld b, DEFENSE
	jr BattleCommand_StatUp

BattleCommand_SpeedUp:
; speedup
	ld b, SPEED
	jr BattleCommand_StatUp

BattleCommand_SpecialAttackUp:
; specialattackup
	ld b, SP_ATTACK
	jr BattleCommand_StatUp

BattleCommand_SpecialDefenseUp:
; specialdefenseup
	ld b, SP_DEFENSE
	jr BattleCommand_StatUp

BattleCommand_AccuracyUp:
; accuracyup
	ld b, ACCURACY
	jr BattleCommand_StatUp

BattleCommand_EvasionUp:
; evasionup
	ld b, EVASION
	jr BattleCommand_StatUp

BattleCommand_AttackUp2:
; attackup2
	ld b, $10 | ATTACK
	jr BattleCommand_StatUp

BattleCommand_DefenseUp2:
; defenseup2
	ld b, $10 | DEFENSE
	jr BattleCommand_StatUp

BattleCommand_SpeedUp2:
; speedup2
	ld b, $10 | SPEED
	jr BattleCommand_StatUp

BattleCommand_SpecialAttackUp2:
; specialattackup2
	ld b, $10 | SP_ATTACK
	jr BattleCommand_StatUp

BattleCommand_SpecialDefenseUp2:
; specialdefenseup2
	ld b, $10 | SP_DEFENSE
	jr BattleCommand_StatUp

BattleCommand_AccuracyUp2:
; accuracyup2
	ld b, $10 | ACCURACY
	jr BattleCommand_StatUp

BattleCommand_EvasionUp2:
; evasionup2
	ld b, $10 | EVASION
	jr BattleCommand_StatUp

BattleCommand_StatUp:
; statup
	call CheckNeutralGas
	jr z, StatUpSkipContrary
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerContrary
	ld a, [wEnemyAbility]
	jr .ContinueContrary
.PlayerContrary
	ld a, [wPlayerAbility]
.ContinueContrary
	cp CONTRARY
	jp z, StatDownSkipContrary
StatUpSkipContrary:
	call RaiseStat
	ld a, [wFailedMessage]
	and a
	ret nz
	jp MinimizeDropSub

RaiseStat::
	ld a, b
	ld [wLoweredStat], a
	ld hl, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .got_stat_levels
	ld hl, wEnemyStatLevels
.got_stat_levels
	ld a, [wAttackMissed]
	and a
	jp nz, .stat_raise_failed
	ld a, [wEffectFailed]
	and a
	jp nz, .stat_raise_failed
	ld a, [wLoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	inc b
	ld a, $d
	cp b
	jp c, .cant_raise_stat
	ld a, [wLoweredStat]
	and $f0
	jr z, .got_num_stages
	inc b
	ld a, $d
	cp b
	jr nc, .got_num_stages
	ld b, a
.got_num_stages
	ld [hl], b
	push hl
	ld a, c
	cp $5
	jr nc, .done_calcing_stats
	ld hl, wBattleMonStats + 1
	ld de, wPlayerStats
	ldh a, [hBattleTurn]
	and a
	jr z, .got_stats_pointer
	ld hl, wEnemyMonStats + 1
	ld de, wEnemyStats
.got_stats_pointer
	push bc
	sla c
	ld b, 0
	add hl, bc
	ld a, c
	add e
	ld e, a
	jr nc, .no_carry
	inc d
.no_carry
	pop bc
	ld a, [hld]
	sub LOW(MAX_STAT_VALUE)
	jr nz, .not_already_max
	ld a, [hl]
	sbc HIGH(MAX_STAT_VALUE)
	jp z, .stats_already_max
.not_already_max
	ldh a, [hBattleTurn]
	and a
	jr z, .calc_player_stats
	call CalcEnemyStats
	jr .done_calcing_stats

.calc_player_stats
	call CalcPlayerStats
.done_calcing_stats
	pop hl
	xor a
	ld [wFailedMessage], a
	ret

.stats_already_max
	pop hl
	dec [hl]
	; fallthrough

.cant_raise_stat
	ld a, $2
	ld [wFailedMessage], a
	ld a, $1
	ld [wAttackMissed], a
	ret

.stat_raise_failed
	ld a, $1
	ld [wFailedMessage], a
	ret

MinimizeDropSub:
; Lower the substitute if we're minimizing

	ld de, wPlayerMinimized
	ld hl, DropPlayerSub
	ldh a, [hBattleTurn]
	and a
	jr z, .do_player
	ld de, wEnemyMinimized
	ld hl, DropEnemySub
.do_player
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld bc, MINIMIZE
	call CompareMove
	ret nz

	ld a, $1
	ld [de], a
	call _CheckBattleScene
	ret nc

	xor a
	ldh [hBGMapMode], a
	call CallBattleCore
	call WaitBGMap
	jp BattleCommand_MoveDelay

_PreventStatDrop:
	farcall PreventStatDrop
	jp EndMoveEffect

BattleCommand_AttackDown:
; attackdown
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipAbilities
	call GetTargetAbility
	cp HYPER_CUTTER
	jr z, _PreventStatDrop
	cp CLEAR_BODY
	jr z, _PreventStatDrop
.SkipAbilities
	ld a, ATTACK
	jp BattleCommand_StatDown

BattleCommand_DefenseDown:
; defensedown
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipAbilities
	call GetTargetAbility
	cp BIG_PECKS
	jr z, _PreventStatDrop
	cp CLEAR_BODY
	jr z, _PreventStatDrop
.SkipAbilities
	ld a, DEFENSE
	jp BattleCommand_StatDown

BattleCommand_SpeedDown:
; speeddown
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipAbilities
	call GetTargetAbility
	cp CLEAR_BODY
	jr z, _PreventStatDrop
.SkipAbilities
	ld a, SPEED
	jp BattleCommand_StatDown

BattleCommand_SpecialAttackDown:
; specialattackdown
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipAbilities
	call GetTargetAbility
	cp CLEAR_BODY
	jr z, _PreventStatDrop
.SkipAbilities
	ld a, SP_ATTACK
	jp BattleCommand_StatDown

BattleCommand_SpecialDefenseDown:
; specialdefensedown
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipAbilities
	call GetTargetAbility
	cp CLEAR_BODY
	jp z, _PreventStatDrop
.SkipAbilities
	ld a, SP_DEFENSE
	jp BattleCommand_StatDown

BattleCommand_AccuracyDown:
; accuracydown
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipAbilities
	call GetTargetAbility
	cp CLEAR_BODY
	jp z, _PreventStatDrop
	cp ILLUMINATE
	jp z, _PreventStatDrop
	cp KEEN_EYE
	jp z, _PreventStatDrop
.SkipAbilities
	ld a, ACCURACY
	jr BattleCommand_StatDown

BattleCommand_EvasionDown:
; evasiondown
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipAbilities
	call GetTargetAbility
	cp CLEAR_BODY
	jp z, _PreventStatDrop
.SkipAbilities
	ld a, EVASION
	jr BattleCommand_StatDown

BattleCommand_AttackDown2:
; attackdown2
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipAbilities
	call GetTargetAbility
	cp HYPER_CUTTER
	jp z, _PreventStatDrop
	cp CLEAR_BODY
	jp z, _PreventStatDrop
.SkipAbilities
	ld a, $10 | ATTACK
	jr BattleCommand_StatDown

BattleCommand_DefenseDown2:
; defensedown2
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipAbilities
	call GetTargetAbility
	cp BIG_PECKS
	jp z, _PreventStatDrop
	cp CLEAR_BODY
	jp z, _PreventStatDrop
.SkipAbilities
	ld a, $10 | DEFENSE
	jr BattleCommand_StatDown

BattleCommand_SpeedDown2:
; speeddown2
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipAbilities
	call GetTargetAbility
	cp CLEAR_BODY
	jp z, _PreventStatDrop
.SkipAbilities
	ld a, $10 | SPEED
	jr BattleCommand_StatDown

BattleCommand_SpecialAttackDown2:
; specialattackdown2
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipAbilities
	call GetTargetAbility
	cp CLEAR_BODY
	jp z, _PreventStatDrop
.SkipAbilities
	ld a, $10 | SP_ATTACK
	jr BattleCommand_StatDown

BattleCommand_SpecialDefenseDown2:
; specialdefensedown2
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipAbilities
	call GetTargetAbility
	cp CLEAR_BODY
	jp z, _PreventStatDrop
.SkipAbilities
	ld a, $10 | SP_DEFENSE
	jr BattleCommand_StatDown

BattleCommand_AccuracyDown2:
; accuracydown2

BattleCommand_EvasionDown2:
; evasiondown2

BattleCommand_StatDown:
; statdown
	ld b, a
	call CheckNeutralGas
	jr z, StatDownSkipContrary
	call GetTargetAbility
	cp CONTRARY
	jp z, StatUpSkipContrary
StatDownSkipContrary:
	ld a, b
	ld [wLoweredStat], a

	call CheckMist
	jp nz, .Mist

	ld hl, wEnemyStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .GetStatLevel
	ld hl, wPlayerStatLevels

.GetStatLevel:
; Attempt to lower the stat.
	ld a, [wLoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	dec b
	jp z, .CantLower

; Sharply lower the stat if applicable.
	ld a, [wLoweredStat]
	and $f0
	jr z, .GotAmountToLower
	dec b
	jr nz, .GotAmountToLower
	inc b

.GotAmountToLower:
	call CheckSubstituteOpp
	jr nz, .Failed

	ld a, [wAttackMissed]
	and a
	jr nz, .Failed

	ld a, [wEffectFailed]
	and a
	jr nz, .Failed

	call CheckHiddenOpponent
	jr nz, .Failed

; Accuracy/Evasion reduction don't involve stats.
	ld [hl], b
	ld a, c
	cp ACCURACY
	jr nc, .Hit

	push hl
	ld hl, wEnemyMonAttack + 1
	ld de, wEnemyStats
	ldh a, [hBattleTurn]
	and a
	jr z, .do_enemy
	ld hl, wBattleMonAttack + 1
	ld de, wPlayerStats
.do_enemy
	call TryLowerStat
	pop hl
	jr z, .CouldntLower

.Hit:
	xor a
	ld [wFailedMessage], a
	ret

.CouldntLower:
	inc [hl]
.CantLower:
	ld a, 3
	ld [wFailedMessage], a
	ld a, 1
	ld [wAttackMissed], a
	ret

.Failed:
	ld a, 1
	ld [wFailedMessage], a
	ld [wAttackMissed], a
	ret

.Mist:
	ld a, 2
	ld [wFailedMessage], a
	ld a, 1
	ld [wAttackMissed], a
	ret

CheckMist:
	call CheckNeutralGas
	jr z, .SkipInfiltrator
	call GetUserAbility
	cp INFILTRATOR
	jr z, .dont_check_mist
.SkipInfiltrator
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ATTACK_DOWN
	jr c, .dont_check_mist
	cp EFFECT_EVASION_DOWN + 1
	jr c, .check_mist
	cp EFFECT_ATTACK_DOWN_2
	jr c, .dont_check_mist
	cp EFFECT_SP_ATK_DOWN_2 + 1
	jr c, .check_mist
	cp EFFECT_ATTACK_DOWN_HIT
	jr c, .dont_check_mist
	cp EFFECT_ACCURACY_DOWN_HIT + 1
	jr c, .check_mist
	cp EFFECT_ALL_DOWN_HIT
	jr c, .dont_check_mist
	cp EFFECT_PLAY_NICE + 1
	jr c, .check_mist
.dont_check_mist
	xor a
	ret

.check_mist
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_MIST, a
	ret

BattleCommand_StatUpMessage:
	call CheckNeutralGas
	jr z, StatUpMessageSkipContrary
	call GetTargetAbility
	cp CONTRARY
	jr z, StatDownMessageSkipContrary2
StatUpMessageSkipContrary:
	ld a, [wFailedMessage]
	and a
	ret nz
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, .stat
	jp BattleTextbox

.stat
	text_far UnknownText_0x1c0cc6
	text_asm
	ld hl, .up
	ld a, [wLoweredStat]
	and $f0
	ret z
	ld hl, .wayup
	ret

.wayup
	text_far UnknownText_0x1c0cd0
	text_end

.up
	text_far UnknownText_0x1c0ce0
	text_end

StatDownMessageSkipContrary2:
	call BattleCommand_SwitchTurn
	call StatDownMessageSkipContrary
	jp BattleCommand_SwitchTurn

BattleCommand_StatDownMessage:
	call CheckNeutralGas
	jr z, StatDownMessageSkipContrary
	call GetTargetAbility
	cp CONTRARY
	jp z, StatUpMessageSkipContrary2
StatDownMessageSkipContrary:
	ld a, [wFailedMessage]
	and a
	ret nz
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, .stat
	jp BattleTextbox

.stat
	text_far UnknownText_0x1c0ceb
	text_asm
	ld hl, .fell
	ld a, [wLoweredStat]
	and $f0
	ret z
	ld hl, .sharplyfell
	ret

.sharplyfell
	text_far UnknownText_0x1c0cf5
	text_end

.fell
	text_far UnknownText_0x1c0d06
	text_end

StatUpMessageSkipContrary2:
	call BattleCommand_SwitchTurn
	call StatUpMessageSkipContrary
	jp BattleCommand_SwitchTurn

TryLowerStat:
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

	call BattleCommand_SwitchTurn
	call CalcPlayerStats
	call BattleCommand_SwitchTurn
	jr .end

.Player:
	call BattleCommand_SwitchTurn
	call CalcEnemyStats
	call BattleCommand_SwitchTurn
.end
	ld a, 1
	and a
	ret

BattleCommand_StatUpFailText:
; statupfailtext
	call CheckNeutralGas
	jr z, StatUpFailSkipContrary
	call GetTargetAbility
	cp CONTRARY
	jp z, StatDownFailSkipContrary2
StatUpFailSkipContrary:
	ld a, [wFailedMessage]
	and a
	ret z
	push af
	call BattleCommand_MoveDelay
	pop af
	dec a
	jp z, TryPrintButItFailed
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, WontRiseAnymoreText
	jp StdBattleTextbox

StatDownFailSkipContrary2:
	call BattleCommand_SwitchTurn
	call StatDownFailSkipContrary
	jp BattleCommand_SwitchTurn

BattleCommand_StatDownFailText:
; statdownfailtext
	call CheckNeutralGas
	jr z, StatDownFailSkipContrary
	call GetTargetAbility
	cp CONTRARY
	jp z, StatUpFailSkipContrary2
StatDownFailSkipContrary:
	ld a, [wFailedMessage]
	and a
	ret z
	push af
	call BattleCommand_MoveDelay
	pop af
	dec a
	jp z, TryPrintButItFailed
	dec a
	ld hl, ProtectedByMistText
	jp z, StdBattleTextbox
	ld a, [wLoweredStat]
	and $f
	ld b, a
	inc b
	call GetStatName
	ld hl, WontDropAnymoreText
	jp StdBattleTextbox

StatUpFailSkipContrary2:
	call BattleCommand_SwitchTurn
	call StatUpFailSkipContrary
	jp BattleCommand_SwitchTurn

GetStatName:
	ld hl, StatNames
	ld c, "@"
.CheckName:
	dec b
	jr z, .Copy
.GetName:
	ld a, [hli]
	cp c
	jr z, .CheckName
	jr .GetName

.Copy:
	ld de, wStringBuffer2
	ld bc, wStringBuffer3 - wStringBuffer2
	jp CopyBytes

BattleCommand_AllStatsUp:
; allstatsup

; Attack
	call ResetMiss
	call BattleCommand_AttackUp
	call BattleCommand_StatUpMessage

; Defense
	call ResetMiss
	call BattleCommand_DefenseUp
	call BattleCommand_StatUpMessage

; Speed
	call ResetMiss
	call BattleCommand_SpeedUp
	call BattleCommand_StatUpMessage

; Special Attack
	call ResetMiss
	call BattleCommand_SpecialAttackUp
	call BattleCommand_StatUpMessage

; Special Defense
	call ResetMiss
	call BattleCommand_SpecialDefenseUp
	jp   BattleCommand_StatUpMessage

BattleCommand_AllStatsDown:
; allstatsdown

; Attack
	call ResetMiss
	call BattleCommand_AttackDown
	call BattleCommand_StatDownMessage
	farcall BattleCommand_Defiant

; Defense
	call ResetMiss
	call BattleCommand_DefenseDown
	call BattleCommand_StatDownMessage
	farcall BattleCommand_Defiant

; Speed
	call ResetMiss
	call BattleCommand_SpeedDown
	call BattleCommand_StatDownMessage
	farcall BattleCommand_Defiant

; Special Attack
	call ResetMiss
	call BattleCommand_SpecialAttackDown
	call BattleCommand_StatDownMessage
	farcall BattleCommand_Defiant

; Special Defense
	call ResetMiss
	call BattleCommand_SpecialDefenseDown
	call BattleCommand_StatDownMessage
	farcall BattleCommand_Defiant
	ret

ResetMiss:
BattleCommand_ResetMiss:
	xor a
	ld [wAttackMissed], a
	ret

LowerStatPop::
	ld a, b
LowerStat:
	ld [wLoweredStat], a

	ld hl, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr z, .got_target
	ld hl, wEnemyStatLevels

.got_target
	ld a, [wLoweredStat]
	and $f
	ld c, a
	ld b, 0
	add hl, bc
	ld b, [hl]
	dec b
	jr z, .cant_lower_anymore

	ld a, [wLoweredStat]
	and $f0
	jr z, .got_num_stages
	dec b
	jr nz, .got_num_stages
	inc b

.got_num_stages
	ld [hl], b
	ld a, c
	cp 5
	jr nc, .accuracy_evasion

	push hl
	ld hl, wBattleMonStats + 1
	ld de, wPlayerStats
	ldh a, [hBattleTurn]
	and a
	jr z, .got_target_2
	ld hl, wEnemyMonStats + 1
	ld de, wEnemyStats

.got_target_2
	call TryLowerStat
	pop hl
	jr z, .failed

.accuracy_evasion
	ldh a, [hBattleTurn]
	and a
	jr z, .player

	call CalcEnemyStats

	jr .finish

.player
	call CalcPlayerStats

.finish
	xor a
	ld [wFailedMessage], a
	ret

.failed
	inc [hl]

.cant_lower_anymore
	ld a, 2
	ld [wFailedMessage], a
	ret

BattleCommand_TriStatusChance:
; tristatuschance

	call BattleCommand_EffectChance

.loop
	; 1/3 chance of each status
	call BattleRandom
	swap a
	and %11
	jr z, .loop
	dec a
	ld hl, .ptrs
	rst JumpTable
	ret

.ptrs
	dw BattleCommand_ParalyzeTarget ; paralyze
	dw BattleCommand_FreezeTarget ; freeze
	dw BattleCommand_BurnTarget ; burn

BattleCommand_RaiseSubNoAnim:
	ld hl, GetBattleMonBackpic
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerTurn
	ld hl, GetEnemyMonFrontpic
.PlayerTurn:
	xor a
	ldh [hBGMapMode], a
	call CallBattleCore
	jp WaitBGMap

BattleCommand_LowerSubNoAnim:
	ld hl, DropPlayerSub
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerTurn
	ld hl, DropEnemySub
.PlayerTurn:
	xor a
	ldh [hBGMapMode], a
	call CallBattleCore
	jp WaitBGMap

CalcPlayerStats:
	ld hl, wPlayerAtkLevel
	ld de, wPlayerStats
	ld bc, wBattleMonAttack

	ld a, 5
	call CalcBattleStats

	call BattleCommand_SwitchTurn

	call ApplyChoiceScarfOnSpeed

	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore

;	ld hl, MachoBraceEffectOnSpeed
;	call CallBattleCore

	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore

	jp BattleCommand_SwitchTurn

CalcEnemyStats:
	ld hl, wEnemyAtkLevel
	ld de, wEnemyStats
	ld bc, wEnemyMonAttack

	ld a, 5
	call CalcBattleStats

	call BattleCommand_SwitchTurn

	call ApplyChoiceScarfOnSpeed

	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore

;	ld hl, MachoBraceEffectOnSpeed
;	call CallBattleCore

	ld hl, ApplyBrnEffectOnAttack
	call CallBattleCore

	jp BattleCommand_SwitchTurn

CalcBattleStats:
.loop
	push af
	ld a, [hli]
	push hl
	push bc

	ld c, a
	dec c
	ld b, 0
	ld hl, StatLevelMultipliers
	add hl, bc
	add hl, bc

	xor a
	ldh [hMultiplicand + 0], a
	ld a, [de]
	ldh [hMultiplicand + 1], a
	inc de
	ld a, [de]
	ldh [hMultiplicand + 2], a
	inc de

	ld a, [hli]
	ldh [hMultiplier], a
	call Multiply

	ld a, [hl]
	ldh [hDivisor], a
	ld b, 4
	call Divide

	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	or b
	jr nz, .check_maxed_out

	ld a, 1
	ldh [hQuotient + 3], a
	jr .not_maxed_out

.check_maxed_out
	ldh a, [hQuotient + 3]
	cp LOW(MAX_STAT_VALUE)
	ld a, b
	sbc HIGH(MAX_STAT_VALUE)
	jr c, .not_maxed_out

	ld a, LOW(MAX_STAT_VALUE)
	ldh [hQuotient + 3], a
	ld a, HIGH(MAX_STAT_VALUE)
	ldh [hQuotient + 2], a

.not_maxed_out
	pop bc
	ldh a, [hQuotient + 2]
	ld [bc], a
	inc bc
	ldh a, [hQuotient + 3]
	ld [bc], a
	inc bc
	pop hl
	pop af
	dec a
	jr nz, .loop

	ret

BattleCommand_CheckRampage:
; checkrampage

	ld de, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld de, wEnemyRolloutCount
.player
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_RAMPAGE, [hl]
	ret z
	ld a, [de]
	dec a
	ld [de], a
	jr nz, .continue_rampage

	res SUBSTATUS_RAMPAGE, [hl]
	call BattleCommand_SwitchTurn
	call SafeCheckSafeguard
	push af
	call BattleCommand_SwitchTurn
	pop af
	jr nz, .continue_rampage

	set SUBSTATUS_CONFUSED, [hl]
	call BattleRandom
	and %00000001
	inc a
	inc a
	inc de ; ConfuseCount
	ld [de], a
.continue_rampage
	ld b, rampage_command
	jp SkipToBattleCommand

BattleCommand_Rampage:
; rampage

; No rampage during Sleep Talk.
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	ret nz

	ld de, wPlayerRolloutCount
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wEnemyRolloutCount
.ok
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_RAMPAGE, [hl]
; Rampage for 1 or 2 more turns
	call BattleRandom
	and %00000001
	inc a
	ld [de], a
	ld a, 1
	ld [wSomeoneIsRampaging], a
	ret

INCLUDE "engine/battle/move_effects/teleport.asm"

SetBattleDraw:
	ld a, [wBattleResult]
	and BATTLERESULT_BITMASK
	or DRAW
	ld [wBattleResult], a
	ret

BattleCommand_ForceSwitch:
; forceswitch

	ld a, [wBattleType]
	cp BATTLETYPE_SHINY
	jp z, .fail
	cp BATTLETYPE_TRAP
	jp z, .fail
	cp BATTLETYPE_CELEBI
	jp z, .fail
	cp BATTLETYPE_SUICUNE
	jp z, .fail
	cp BATTLETYPE_MEWTWO
	jp z, .fail
	cp BATTLETYPE_HO_OH
	jp z, .fail
	cp BATTLETYPE_LUGIA
	jp z, .fail
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipSuctionCups
	call GetTargetAbility
	cp SUCTION_CUPS
	jp z, .SuctionCups
.SkipSuctionCups
	ldh a, [hBattleTurn]
	and a
	jp nz, .force_player_switch
	ld a, [wAttackMissed]
	and a
	jr nz, .missed
	ld a, [wBattleMode]
	dec a
	jr nz, .trainer
	ld a, [wCurPartyLevel]
	ld b, a
	ld a, [wBattleMonLevel]
	cp b
	jr nc, .wild_force_flee
	add b
	ld c, a
	inc c
.random_loop_wild
	call BattleRandom
	cp c
	jr nc, .random_loop_wild
	srl b
	srl b
	cp b
	jr nc, .wild_force_flee
.missed
	jp .fail

.wild_force_flee
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a
	ld [wForcedSwitch], a
	call SetBattleDraw
	ld a, [wPlayerMoveStructAnimation]
	jp .succeed

.trainer
	farcall FindAliveEnemyMons
	jr c, .switch_fail
	ld a, [wEnemyGoesFirst]
	and a
	jr z, .switch_fail
	call UpdateEnemyMonInParty
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld c, $14
	call DelayFrames
	hlcoord 1, 0
	lb bc, 4, 10
	call ClearBox
	ld c, 20
	call DelayFrames
	ld a, [wOTPartyCount]
	ld b, a
	ld a, [wCurOTMon]
	ld c, a
; select a random enemy mon to switch to
.random_loop_trainer
	call BattleRandom
	and $7
	cp b
	jr nc, .random_loop_trainer
	cp c
	jr z, .random_loop_trainer
	push af
	push bc
	ld hl, wOTPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .random_loop_trainer
	ld a, d
	inc a
	ld [wEnemySwitchMonIndex], a
	callfar ForceEnemySwitch

	ld hl, DraggedOutText
	call StdBattleTextbox

	farcall SetEnemyAbility
	farcall SentOutAbility

	ld hl, SpikesDamage
	jp CallBattleCore

.switch_fail
	jp .fail

.force_player_switch
	ld a, [wAttackMissed]
	and a
	jr nz, .player_miss

	ld a, [wBattleMode]
	dec a
	jr nz, .vs_trainer

	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	jr nc, .wild_succeed_playeristarget

	add b
	ld c, a
	inc c
.wild_random_loop_playeristarget
	call BattleRandom
	cp c
	jr nc, .wild_random_loop_playeristarget

	srl b
	srl b
	cp b
	jr nc, .wild_succeed_playeristarget

.player_miss
	jp .fail

.wild_succeed_playeristarget
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a
	ld [wForcedSwitch], a
	call SetBattleDraw
	ld a, [wEnemyMoveStructAnimation]
	jp .succeed

.vs_trainer
	call CheckPlayerHasMonToSwitchTo
	jr c, .fail

	ld a, [wEnemyGoesFirst]
	cp $1
	jr z, .switch_fail

	farcall BattleCommand_SwitchTurn
	farcall PlayerSwitchAbilities
	farcall BattleCommand_SwitchTurn

	call UpdateBattleMonInParty
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld c, 20
	call DelayFrames
	hlcoord 9, 7
	lb bc, 5, 11
	call ClearBox
	ld c, 20
	call DelayFrames
	ld a, [wPartyCount]
	ld b, a
	ld a, [wCurBattleMon]
	ld c, a
.random_loop_trainer_playeristarget
	call BattleRandom
	and $7
	cp b
	jr nc, .random_loop_trainer_playeristarget

	cp c
	jr z, .random_loop_trainer_playeristarget

	push af
	push bc
	ld hl, wPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .random_loop_trainer_playeristarget

	ld a, d
	ld [wCurPartyMon], a
	ld hl, SwitchPlayerMon
	call CallBattleCore

	ld hl, DraggedOutText
	call StdBattleTextbox

	farcall SetPlayerAbility
	farcall SentOutAbility

	ld hl, SpikesDamage
	jp CallBattleCore

.fail
	call BattleCommand_LowerSub
	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSub
	jp PrintButItFailed

.SuctionCups
	call BattleCommand_LowerSub
	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSub
	ld hl, SuctionCupsText
	call StdBattleTextbox
	call AnimateFailedMove
	jp EndMoveEffect

.succeed
	push af
	call SetBattleDraw
	ld a, $1
	ld [wKickCounter], a
	call AnimateCurrentMove
	ld c, 20
	call DelayFrames
	pop af

	ld hl, FledInFearText
	ld bc, ROAR
	call CompareMove
	jr z, .do_text
	ld hl, BlownAwayText
.do_text
	jp StdBattleTextbox

BattleCommand_SwitchHit:
; switchhit

	ld a, [wBattleType]
	cp BATTLETYPE_SHINY
	jp z, .fail_hit
	cp BATTLETYPE_TRAP
	jp z, .fail_hit
	cp BATTLETYPE_CELEBI
	jp z, .fail_hit
	cp BATTLETYPE_SUICUNE
	jp z, .fail_hit
	cp BATTLETYPE_MEWTWO
	jp z, .fail_hit
	cp BATTLETYPE_HO_OH
	jp z, .fail_hit
	cp BATTLETYPE_LUGIA
	jp z, .fail_hit
	cp BATTLETYPE_REGI
	jp z, .fail_hit
	ldh a, [hBattleTurn]
	and a
	jp nz, .force_player_switch_hit
	ld a, [wAttackMissed]
	and a
	jr nz, .missed_hit
	ld a, [wBattleMode]
	dec a
	jr nz, .trainer_hit
	ld a, [wCurPartyLevel]
	ld b, a
	ld a, [wBattleMonLevel]
	cp b
	jr nc, .wild_force_flee_hit
	add b
	ld c, a
	inc c
.random_loop_wild_hit
	call BattleRandom
	cp c
	jr nc, .random_loop_wild_hit
	srl b
	srl b
	cp b
	jr nc, .wild_force_flee_hit
.missed_hit
	jp .fail_hit

.wild_force_flee_hit
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a
	ld [wForcedSwitch], a
	call SetBattleDraw
	ld a, [wPlayerMoveStructAnimation]
	jp .succeed_hit

.trainer_hit
	call FindAliveEnemyMons
	jr c, .switch_fail_hit
	ld a, [wEnemyGoesFirst]
	and a
	jr z, .switch_fail_hit
	call UpdateEnemyMonInParty
	ld a, $1
	ld [wKickCounter], a
	ld a, [wOTPartyCount]
	ld b, a
	ld a, [wCurOTMon]
	ld c, a
; select a random enemy mon to switch to
.random_loop_trainer_hit
	call BattleRandom
	and $7
	cp b
	jr nc, .random_loop_trainer_hit
	cp c
	jr z, .random_loop_trainer_hit
	push af
	push bc
	ld hl, wOTPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .random_loop_trainer_hit
	ld a, d
	inc a
	ld [wEnemySwitchMonIndex], a
	callfar ForceEnemySwitch

	ld hl, DraggedOutText
	call StdBattleTextbox

	farcall SetEnemyAbility
	farcall SentOutAbility

	ld hl, SpikesDamage
	jp CallBattleCore

.switch_fail_hit
	jp .fail_hit

.force_player_switch_hit
	ld a, [wAttackMissed]
	and a
	jr nz, .player_miss_hit

	ld a, [wBattleMode]
	dec a
	jr nz, .vs_trainer_hit

	ld a, [wBattleMonLevel]
	ld b, a
	ld a, [wCurPartyLevel]
	cp b
	jr nc, .wild_succeed_playeristarget_hit

	add b
	ld c, a
	inc c
.wild_random_loop_playeristarget_hit
	call BattleRandom
	cp c
	jr nc, .wild_random_loop_playeristarget_hit

	srl b
	srl b
	cp b
	jr nc, .wild_succeed_playeristarget_hit

.player_miss_hit
	jr .fail_hit

.wild_succeed_playeristarget_hit
	call UpdateBattleMonInParty
	xor a
	ld [wNumHits], a
	inc a
	ld [wForcedSwitch], a
	call SetBattleDraw
	ld a, [wEnemyMoveStructAnimation]
	jr .succeed_hit

.vs_trainer_hit
	call CheckPlayerHasMonToSwitchTo
	jr c, .fail_hit

	ld a, [wEnemyGoesFirst]
	cp $1
	jr z, .switch_fail_hit

	call UpdateBattleMonInParty
	ld a, $1
	ld [wKickCounter], a
	ld a, [wPartyCount]
	ld b, a
	ld a, [wCurBattleMon]
	ld c, a
.random_loop_trainer_playeristarget_hit
	call BattleRandom
	and $7
	cp b
	jr nc, .random_loop_trainer_playeristarget_hit

	cp c
	jr z, .random_loop_trainer_playeristarget_hit

	push af
	push bc
	ld hl, wPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	pop bc
	pop de
	jr z, .random_loop_trainer_playeristarget_hit

	ld a, d
	ld [wCurPartyMon], a
	ld hl, SwitchPlayerMon
	call CallBattleCore

	ld hl, DraggedOutText
	call StdBattleTextbox

	farcall SetPlayerAbility
	farcall SentOutAbility

	ld hl, SpikesDamage
	jp CallBattleCore

.fail_hit
	call BattleCommand_LowerSub
	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSub
	ret

.succeed_hit
	push af
	call SetBattleDraw
	ld a, $1
	ld [wKickCounter], a
	pop af

	ld hl, BlownAwayText
.do_text_hit
	jp StdBattleTextbox

CheckPlayerHasMonToSwitchTo:
	ld a, [wPartyCount]
	ld d, a
	ld e, 0
	ld bc, PARTYMON_STRUCT_LENGTH
.loop
	ld a, [wCurBattleMon]
	cp e
	jr z, .next

	ld a, e
	ld hl, wPartyMon1HP
	call AddNTimes
	ld a, [hli]
	or [hl]
	jr nz, .not_fainted

.next
	inc e
	dec d
	jr nz, .loop

	scf
	ret

.not_fainted
	and a
	ret

BattleCommand_EndLoop:
; endloop

; Loop back to 'critical'.

	ld de, wPlayerRolloutCount
	ld bc, wPlayerDamageTaken
	ldh a, [hBattleTurn]
	and a
	jr z, .got_addrs
	ld de, wEnemyRolloutCount
	ld bc, wEnemyDamageTaken
.got_addrs

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOOP, [hl]
	jp nz, .in_loop
	set SUBSTATUS_IN_LOOP, [hl]
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld a, [hl]
	cp EFFECT_POISON_MULTI_HIT
	jr z, .twineedle
	cp EFFECT_DOUBLE_HIT
	ld a, 1
	jr z, .double_hit
	ld a, [hl]
	cp EFFECT_TRIPLE_KICK
	jr nz, .not_triple_kick
.reject_triple_kick_sample
	call BattleRandom
	and $3
	jr z, .reject_triple_kick_sample
	dec a
	jr nz, .double_hit
	ld a, 1
	ld [bc], a
	jr .done_loop

.not_triple_kick
	call CheckNeutralGas
	jr z, .not_skill_link
	call GetUserAbility
	cp SKILL_LINK
	jr nz, .not_skill_link
	ld a, 4
	jr .double_hit
.not_skill_link
	call BattleRandom
	and $3
	cp 2
	jr c, .got_number_hits
	call BattleRandom
	and $3
.got_number_hits
	inc a
.double_hit
	ld [de], a
	inc a
	ld [bc], a
	jr .loop_back_to_critical

.twineedle
	ld a, 1
	jr .double_hit

.in_loop
	ld a, [de]
	dec a
	ld [de], a
	jr nz, .loop_back_to_critical
.done_loop
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	res SUBSTATUS_IN_LOOP, [hl]

	ld hl, PlayerHitTimesText
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hit_n_times_text
	ld hl, EnemyHitTimesText
.got_hit_n_times_text

	push bc
	call StdBattleTextbox
	pop bc
	xor a
	ld [bc], a
	ret

.loop_back_to_critical
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a
	ld a, [wBattleScriptBufferAddress]
	ld l, a
.not_critical
	ld a, [hld]
	cp critical_command
	jr nz, .not_critical
	inc hl
	ld a, h
	ld [wBattleScriptBufferAddress + 1], a
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ret

BattleCommand_FakeOut:
	; Only allow this move on the first turn.
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerTurnsTaken
	ld b, 0
	jr z, .got_turns_taken
	ld hl, wEnemyTurnsTaken
	inc b
.got_turns_taken
	; Fail if we didn't move first.
	ld a, [wEnemyGoesFirst]
	xor b
	jr nz, .failed

	; Only allow on the first turn.
	ld a, [hl]
	dec a
	ret z

.failed
	call AnimateFailedMove
	call PrintButItFailed
	jp EndMoveEffect

BattleCommand_DefensiveAbilities:
	farcall CheckDefensiveAbilities
	ret

BattleCommand_GyroBall:
	farcall GyroBallEffect
	ret

BattleCommand_FlinchTarget:
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipFlinchAbility
	call GetTargetAbility
	cp INNER_FOCUS
	ret z
.SkipFlinchAbility
	call CheckSubstituteOpp
	ret nz

	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	and 1 << FRZ | SLP
	ret nz

	call CheckOpponentWentFirst
	ret nz

	ld a, [wEffectFailed]
	and a
	ret nz

	; fallthrough

FlinchTarget:
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	set SUBSTATUS_FLINCHED, [hl]
	jp EndRechargeOpp

CheckOpponentWentFirst:
; Returns a=0, z if user went first
; Returns a=1, nz if opponent went first
	push bc
	ld a, [wEnemyGoesFirst] ; 0 if player went first
	ld b, a
	ldh a, [hBattleTurn] ; 0 if it's the player's turn
	xor b ; 1 if opponent went first
	pop bc
	ret

BattleCommand_HeldFlinch:
; kingsrock

	ld a, [wAttackMissed]
	and a
	ret nz

	farcall CheckContactAbilities

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_SUPER_FANG
	ret z
	cp EFFECT_PSYWAVE
	ret z
	cp EFFECT_STATIC_DAMAGE
	ret z
	cp EFFECT_COUNTER
	ret z
	cp EFFECT_OHKO
	ret z

	call GetUserItem
	ld a, b
	cp HELD_FLINCH
	jr z, .flinch
	cp HELD_LIFE_ORB
	jr z, .lifeorb
	ret

.flinch:
	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipAbilities
	call GetTargetAbility
	cp INNER_FOCUS
	ret z
	cp SHIELD_DUST
	ret z
.SkipAbilities
	call CheckSubstituteOpp
	ret nz
	call BattleCommand_CheckFaint
	ret nz
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVarAddr
	ld d, h
	ld e, l
	call GetUserItem
	call BattleRandom
	cp c
	ret nc
	call EndRechargeOpp
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	set SUBSTATUS_FLINCHED, [hl]
	ret

.lifeorb:
	call CheckNeutralGas
	jr z, .continuelifeorb
	call GetUserAbility
	cp MAGIC_GUARD
	ret z
	cp SHEER_FORCE
	jr nz, .continuelifeorb
	farcall SheerForceEffectCheck
	ret c

.continuelifeorb
	call .checkfaint
	ret z
	xor a
	farcall GetEighthMaxHP
	farcall SubtractHPFromUser
	ld hl, BattleText_UserLostSomeOfItsHP
	jp StdBattleTextbox

.checkfaint:
	; if we fainted, abort the move sequence
	farcall HasUserFainted
	ret nz
	call EndMoveEffect
	xor a
	ret

BattleCommand_OHKO:
; ohko

	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipSturdy
	call GetTargetAbility
	cp STURDY
	jr z, .no_effect
.SkipSturdy
	call ResetDamage
	ld a, [wTypeModifier]
	and $7f
	jr z, .no_effect
	ld hl, wEnemyMonLevel
	ld de, wBattleMonLevel
	ld bc, wPlayerMoveStruct + MOVE_ACC
	ldh a, [hBattleTurn]
	and a
	jr z, .got_move_accuracy
	push hl
	ld h, d
	ld l, e
	pop de
	ld bc, wEnemyMoveStruct + MOVE_ACC
.got_move_accuracy
	ld a, [de]
	sub [hl]
	jr c, .no_effect
	add a
	ld e, a
	ld a, [bc]
	add e
	jr nc, .finish_ohko
	ld a, $ff
.finish_ohko
	ld [bc], a
	call BattleCommand_CheckHit
	ld hl, wCurDamage
	ld a, $ff
	ld [hli], a
	ld [hl], a
	ld a, $2
	ld [wCriticalHit], a
	ret

.no_effect
	ld a, $ff
	ld [wCriticalHit], a
	ld a, $1
	ld [wAttackMissed], a
	ret

BattleCommand_CheckCharge:
; checkcharge

	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	bit SUBSTATUS_CHARGED, [hl]
	ret z
	res SUBSTATUS_CHARGED, [hl]
	res SUBSTATUS_UNDERGROUND, [hl]
	res SUBSTATUS_FLYING, [hl]
	ld b, charge_command
	jp SkipToBattleCommand

BattleCommand_Charge:
; charge

	call BattleCommand_ClearText
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and SLP
	jr z, .awake

	call BattleCommand_MoveDelay
	call BattleCommand_RaiseSub
	call PrintButItFailed
	jp EndMoveEffect

.awake
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	set SUBSTATUS_CHARGED, [hl]

	ld hl, IgnoredOrders2Text
	ld a, [wAlreadyDisobeyed]
	and a
	call nz, StdBattleTextbox

	call BattleCommand_LowerSub
	xor a
	ld [wNumHits], a
	inc a
	ld [wKickCounter], a
	call LoadMoveAnim
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld h, a
	ld bc, FLY
	call CompareMove
	ld a, 1 << SUBSTATUS_FLYING
	jr z, .got_move_type
	if HIGH(FLY) != HIGH(DIG)
		ld bc, DIG
	else
		ld c, LOW(DIG)
	endc
	ld a, h
	call CompareMove
	ld a, 1 << SUBSTATUS_UNDERGROUND
	jr z, .got_move_type
	call BattleCommand_RaiseSub
	xor a

.got_move_type
	; a will contain the substatus 3 bit to set (1 << bit), or 0 if none (not flying/digging underground)
	and a
	ld l, a
	push hl
	call nz, DisappearUser
	ld a, BATTLE_VARS_SUBSTATUS3
	call GetBattleVarAddr
	pop bc
	ld a, c
	or [hl]
	ld [hl], a
	call CheckUserIsCharging
	jr nz, .mimic
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	ld [hl], b
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld [hl], b

.mimic
	call ResetDamage

	ld hl, .UsedText
	call BattleTextbox

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_SKULL_BASH
	ld b, endturn_command
	jp z, SkipToBattleCommand
	jp EndMoveEffect

.UsedText:
	text_far UnknownText_0x1c0d0e ; "<USER>"
	text_asm
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	push bc
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld de, 4
	ld hl, .move_messages
	call IsInHalfwordArray ; hl will point to the low byte of the found item
	jr c, .found_text
	ld hl, .move_messages
.found_text
	inc hl
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc
	ret

.move_messages
	dw RAZOR_WIND,  .RazorWind
	dw SOLARBEAM,   .Solarbeam
	dw SKULL_BASH,  .SkullBash
	dw SKY_ATTACK,  .SkyAttack
	dw FLY,         .Fly
	dw DIG,         .Dig
	dw SOLAR_BLADE, .Solarbeam
	dw -1

.RazorWind:
; 'made a whirlwind!'
	text_far UnknownText_0x1c0d12
	text_end

.Solarbeam:
; 'took in sunlight!'
	text_far UnknownText_0x1c0d26
	text_end

.SkullBash:
; 'lowered its head!'
	text_far UnknownText_0x1c0d3a
	text_end

.SkyAttack:
; 'is glowing!'
	text_far UnknownText_0x1c0d4e
	text_end

.Fly:
; 'flew up high!'
	text_far UnknownText_0x1c0d5c
	text_end

.Dig:
; 'dug a hole!'
	text_far UnknownText_0x1c0d6c
	text_end

;INCLUDE "engine/battle/move_effects/wake_up_slap.asm"

BattleCommand_ConfuseTarget:
; confusetarget

	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipOwnTempo
	call GetTargetAbility
	cp OWN_TEMPO
	ret z
.SkipOwnTempo
	ld a, [wEffectFailed]
	and a
	ret nz
	call SafeCheckSafeguard
	ret nz
	call CheckSubstituteOpp
	ret nz
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	ret nz
	jr BattleCommand_FinishConfusingTarget

BattleCommand_Confuse:
; confuse

	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipOwnTempo
	call GetTargetAbility
	cp OWN_TEMPO
	jr z, .OwnTempo
.SkipOwnTempo
	ld a, BATTLE_VARS_SUBSTATUS3_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CONFUSED, [hl]
	jr z, .not_already_confused
	call AnimateFailedMove
	ld hl, AlreadyConfusedText
	jp StdBattleTextbox

.OwnTempo
	call _PreventAbilityText
	jp EndMoveEffect

.not_already_confused
	call CheckSubstituteOpp
	jr nz, BattleCommand_Confuse_CheckSnore_Swagger_ConfuseHit
	ld a, [wAttackMissed]
	and a
	jr nz, BattleCommand_Confuse_CheckSnore_Swagger_ConfuseHit
BattleCommand_FinishConfusingTarget:
	ld bc, wEnemyConfuseCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_confuse_count
	ld bc, wPlayerConfuseCount

.got_confuse_count
	set SUBSTATUS_CONFUSED, [hl]
	; confused for 2-5 turns
	call BattleRandom
	and %11
	inc a
	inc a
	ld [bc], a

	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_CONFUSE_HIT
	jr z, .got_effect
	cp EFFECT_SNORE
	jr z, .got_effect
	cp EFFECT_SWAGGER
	jr z, .got_effect
	cp EFFECT_FLATTER
	jr z, .got_effect
	call AnimateCurrentMove

.got_effect
	ld de, ANIM_CONFUSED
	call PlayOpponentBattleAnim

	ld hl, BecameConfusedText
	call StdBattleTextbox

	call GetOpponentItem
	ld a, b
	cp HELD_HEAL_STATUS
	jr z, .heal_confusion
	cp HELD_HEAL_CONFUSION
	ret nz
.heal_confusion
	ld hl, UseConfusionHealingItem
	jp CallBattleCore

BattleCommand_Confuse_CheckSnore_Swagger_ConfuseHit:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_CONFUSE_HIT
	ret z
	cp EFFECT_SNORE
	ret z
	cp EFFECT_SWAGGER
	ret z
	jp PrintDidntAffect2

_PreventAbilityText:
	farcall PreventAbilityText
	ret

BattleCommand_Paralyze:
; paralyze

	call CheckUserNeutralGasMoldBreaker
	jr z, .SkipLimber
	call GetTargetAbility
	cp LIMBER
	jr z, .Limber
	cp LEAF_GUARD
	jr z, .LeafGuard
.SkipLimber
	call CheckForStatusIfAlreadyHasAny
	jr nz, .hasstatus
	ld a, [wTypeModifier]
	and $7f
	jr z, .didnt_affect
	ld a, [wAttackMissed]
	and a
	jr nz, .failed
	call CheckSubstituteOpp
	jr nz, .failed
	ld c, 30
	call DelayFrames
	call AnimateCurrentMove
	ld a, $1
	ldh [hBGMapMode], a
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVarAddr
	set PAR, [hl]
	call UpdateOpponentInParty
	ld hl, ApplyPrzEffectOnSpeed
	call CallBattleCore
	call UpdateBattleHuds
	call PrintParalyze
	farcall SynchronizeCheck
	ld hl, UseHeldStatusHealingItem
	jp CallBattleCore

.hasstatus
	push hl
	call AnimateFailedMove
	pop hl
	jp StdBattleTextbox

.failed
	jp PrintDidntAffect2

.LeafGuard
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr nz, .SkipLimber
.Limber
	jp _PreventAbilityText

.didnt_affect
	call AnimateFailedMove
	jp PrintDoesntAffect

CheckMoveTypeMatchesTarget:
; Compare move type to opponent type.
; Return z if matching the opponent type,
; unless the move is Normal (Tri Attack).

	push hl

	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonType1
.ok

	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp NORMAL
	jr z, .normal

	cp [hl]
	jr z, .return

	inc hl
	cp [hl]

.return
	pop hl
	ret

.normal
	ld a, 1
	and a
	pop hl
	ret

EndRechargeOpp:
	push hl
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVarAddr
	res SUBSTATUS_RECHARGE, [hl]
	pop hl
	ret

INCLUDE "engine/battle/move_effects/leech_seed.asm"

INCLUDE "engine/battle/move_effects/shell_smash.asm"

INCLUDE "engine/battle/move_effects/sucker_punch.asm"

BattleCommand_ResetStats:
; resetstats

	ld a, 7 ; neutral
	ld hl, wPlayerStatLevels
	call .Fill
	ld hl, wEnemyStatLevels
	call .Fill

	ldh a, [hBattleTurn]
	push af

	call SetPlayerTurn
	call CalcPlayerStats
	call SetEnemyTurn
	call CalcEnemyStats

	pop af
	ldh [hBattleTurn], a

	call AnimateCurrentMove

	ld hl, EliminatedStatsText
	jp StdBattleTextbox

.Fill:
	ld b, wPlayerStatLevelsEnd - wPlayerStatLevels
.next
	ld [hli], a
	dec b
	jr nz, .next
	ret

BattleCommand_Heal:
; heal

	ld de, wBattleMonHP
	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
.got_hp
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld b, a
	push hl
	push de
	push bc
	ld c, 2
	call CompareBytes
	pop bc
	pop de
	pop hl
	jp z, .hp_full
	ld a, b
	ld bc, REST
	call CompareMove
	jr nz, .not_rest

	push hl
	push de
	push af
	call CheckNeutralGas
	jr z, .SkipAbilities
	call GetUserAbility
	cp INSOMNIA
	jr z, .CantRest
	cp VITAL_SPIRIT
	jr z, .CantRest
	cp LEAF_GUARD
	jr nz, .SkipAbilities
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr z, .CantRest

.SkipAbilities
	call BattleCommand_MoveDelay
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	res SUBSTATUS_TOXIC, [hl]
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	ld a, [hl]
	and a
	ld [hl], REST_SLEEP_TURNS + 1
	ld hl, WentToSleepText
	jr z, .no_status_to_heal
	ld hl, RestedText
.no_status_to_heal
	call StdBattleTextbox
	ldh a, [hBattleTurn]
	and a
	jr nz, .calc_enemy_stats
	call CalcPlayerStats
	jr .got_stats

.calc_enemy_stats
	call CalcEnemyStats
.got_stats
	pop af
	pop de
	pop hl

.not_rest
	jr z, .restore_full_hp
	ld hl, GetHalfMaxHP
	call CallBattleCore
	jr .finish

.CantRest:
	pop de
	pop hl
	pop af
	call AnimateFailedMove
	ld hl, RestInsomniaText
	jp StdBattleTextbox

.restore_full_hp
	ld hl, GetMaxHP
	call CallBattleCore
.finish
	call AnimateCurrentMove
	call BattleCommand_SwitchTurn
	ld hl, RestoreHP
	call CallBattleCore
	call BattleCommand_SwitchTurn
	call UpdateUserInParty
	call RefreshBattleHuds
	ld hl, RegainedHealthText
	jp StdBattleTextbox

.hp_full
	call AnimateFailedMove
	ld hl, HPIsFullText
	jp StdBattleTextbox

INCLUDE "engine/battle/move_effects/transform.asm"

BattleEffect_ButItFailed:
	call AnimateFailedMove
	jp PrintButItFailed

ClearLastMove:
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr
	xor a
	ld [hl], a

	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	xor a
	ld [hl], a
	ret

ResetActorDisable:
	ldh a, [hBattleTurn]
	and a
	jr z, .player

	xor a
	ld [wEnemyDisableCount], a
	ld [wEnemyDisabledMove], a
	ret

.player
	xor a
	ld [wPlayerDisableCount], a
	ld [wDisabledMove], a
	ret

BattleCommand_Screen:
; screen
	call GetUserItem
	ld a, b
	push af
	ld hl, wPlayerScreens
	ld bc, wPlayerLightScreenCount
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens_pointer
	ld hl, wEnemyScreens
	ld bc, wEnemyLightScreenCount

.got_screens_pointer
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_LIGHT_SCREEN
	jr nz, .Reflect

	bit SCREENS_LIGHT_SCREEN, [hl]
	jr nz, .failed
	set SCREENS_LIGHT_SCREEN, [hl]
	pop af
	cp HELD_LIGHT_CLAY
	jr z, .LightClayLightScreen
	ld a, 5
	jr .AfterLightScreen

.LightClayLightScreen
	ld a, 8
.AfterLightScreen
	ld [bc], a
	ld hl, LightScreenEffectText
	jr .good

.Reflect:
	bit SCREENS_REFLECT, [hl]
	jr nz, .failed
	set SCREENS_REFLECT, [hl]

	; LightScreenCount -> ReflectCount
	inc bc

	pop af
	cp HELD_LIGHT_CLAY
	jr z, .LightClayReflect
	ld a, 5
	jr .AfterReflect

.LightClayReflect
	ld a, 8
.AfterReflect
	ld [bc], a
	ld hl, ReflectEffectText

.good
	call AnimateCurrentMove
	jp StdBattleTextbox

.failed
	pop af
	call AnimateFailedMove
	jp PrintButItFailed

PrintDoesntAffect:
; 'it doesn't affect'
	ld hl, DoesntAffectText
	jp StdBattleTextbox

TryPrintButItFailed:
	ld a, [wAlreadyFailed]
	and a
	ret nz

	; fallthrough

PrintButItFailed:
; 'but it failed!'
	ld hl, ButItFailedText
	jp StdBattleTextbox

FailMove:
	call AnimateFailedMove
	; fallthrough

FailMimic:
	ld hl, ButItFailedText ; 'but it failed!'
	ld de, ItFailedText    ; 'it failed!'
	jp FailText_CheckOpponentProtect

PrintDidntAffect:
; 'it didn't affect'
	ld hl, DidntAffect1Text
	jp StdBattleTextbox

PrintDidntAffect2:
	call AnimateFailedMove
	ld hl, AvoidStatusText ; 'it didn't affect'
	ld de, ProtectingItselfText ; 'protecting itself'
	jp FailText_CheckOpponentProtect

PrintParalyze:
; 'paralyzed! maybe it can't attack!'
	ld hl, ParalyzedText
	jp StdBattleTextbox

CheckSubstituteOpp:
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret

INCLUDE "engine/battle/move_effects/selfdestruct.asm"

INCLUDE "engine/battle/move_effects/mirror_move.asm"

INCLUDE "engine/battle/move_effects/metronome.asm"

CheckUserMove:
; Return z if the user has move a.
	ld b, a
	ld de, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld de, wEnemyMonMoves
.ok

	ld c, NUM_MOVES
.loop
	ld a, [de]
	inc de
	cp b
	ret z

	dec c
	jr nz, .loop

	ld a, 1
	and a
	ret

ResetTurn:
	ld hl, wPlayerCharging
	ldh a, [hBattleTurn]
	and a
	jr z, .player
	ld hl, wEnemyCharging

.player
	ld [hl], 1
	xor a
	ld [wAlreadyDisobeyed], a
	call DoMove
	jp EndMoveEffect

BattleCommand_ArenaTrap:
; arenatrap

; Doesn't work on an absent opponent.

	call CheckHiddenOpponent
	jr nz, .failed

; Don't trap if the opponent is already trapped.

	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	bit SUBSTATUS_CANT_RUN, [hl]
	jr nz, .failed

; Otherwise trap the opponent.

	set SUBSTATUS_CANT_RUN, [hl]
	call AnimateCurrentMove
	ld hl, CantEscapeNowText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed

BattleCommand_Defrost:
; defrost

; Thaw the user.

	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	bit FRZ, [hl]
	ret z
	res FRZ, [hl]

; Don't update the enemy's party struct in a wild battle.

	ldh a, [hBattleTurn]
	and a
	jr z, .party

	ld a, [wBattleMode]
	dec a
	jr z, .done

.party
	ld a, MON_STATUS
	call UserPartyAttr
	res FRZ, [hl]

.done
	call RefreshBattleHuds
	ld hl, WasDefrostedText
	jp StdBattleTextbox

INCLUDE "engine/battle/move_effects/curse.asm"

INCLUDE "engine/battle/move_effects/protect.asm"

INCLUDE "engine/battle/move_effects/endure.asm"

INCLUDE "engine/battle/move_effects/spikes.asm"

INCLUDE "engine/battle/move_effects/perish_song.asm"

INCLUDE "engine/battle/move_effects/sandstorm.asm"

INCLUDE "engine/battle/move_effects/hail.asm"

INCLUDE "engine/battle/move_effects/rollout.asm"

INCLUDE "engine/battle/move_effects/return.asm"

INCLUDE "engine/battle/move_effects/safeguard.asm"

SafeCheckSafeguard:
	call CheckNeutralGas
	jr z, .SkipInfiltrator
	call GetUserAbility
	cp INFILTRATOR
	ret z

.SkipInfiltrator
	push hl
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wPlayerScreens

.got_turn
	bit SCREENS_SAFEGUARD, [hl]
	pop hl
	ret

BattleCommand_CheckSafeguard:
; checksafeguard
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_turn
	ld hl, wPlayerScreens
.got_turn
	bit SCREENS_SAFEGUARD, [hl]
	ret z
	ld a, 1
	ld [wAttackMissed], a
	call BattleCommand_MoveDelay
	ld hl, SafeguardProtectText
	call StdBattleTextbox
	jp EndMoveEffect

BattleCommand_HealMorn:
; healmorn
	ld b, MORN_F
	jr BattleCommand_TimeBasedHealContinue

BattleCommand_HealDay:
; healday
	ld b, DAY_F
	jr BattleCommand_TimeBasedHealContinue

BattleCommand_HealNite:
; healnite
	ld b, NITE_F
	; fallthrough

BattleCommand_TimeBasedHealContinue:
; Weather-sensitive heal.

	ld hl, wBattleMonMaxHP
	ld de, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .start
	ld hl, wEnemyMonMaxHP
	ld de, wEnemyMonHP

.start
; Index for .Multipliers
; Default restores half max HP.
	ld c, 1

; Don't bother healing if HP is already full.
	inc c ; Temporarily increase c to compare bytes correctly
	push bc
	call CompareBytes
	pop bc
	jr z, .Full
	dec c ; Return c to its original value

.Weather:
	ld a, [wBattleWeather]
	and a
	jr z, .Heal

; x2 in sun
; /2 in rain/sandstorm
	inc c
	cp WEATHER_SUN
	jr z, .Heal
	dec c
	dec c

.Heal:
	ld b, 0
	ld hl, .Multipliers
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, BANK(GetMaxHP)
	rst FarCall

	call AnimateCurrentMove
	call BattleCommand_SwitchTurn

	callfar RestoreHP

	call BattleCommand_SwitchTurn
	call UpdateUserInParty

; 'regained health!'
	ld hl, RegainedHealthText
	jp StdBattleTextbox

.Full:
	call AnimateFailedMove

; 'hp is full!'
	ld hl, HPIsFullText
	jp StdBattleTextbox

.Multipliers:
	dw GetQuarterMaxHP
	dw GetHalfMaxHP
	dw GetTwoThirdsMaxHP

INCLUDE "engine/battle/move_effects/hidden_power.asm"

INCLUDE "engine/battle/move_effects/rain_dance.asm"

INCLUDE "engine/battle/move_effects/sunny_day.asm"

INCLUDE "engine/battle/move_effects/belly_drum.asm"

INCLUDE "engine/battle/move_effects/psych_up.asm"

INCLUDE "engine/battle/move_effects/mirror_coat.asm"

BattleCommand_SkipSunCharge:
; mimicsuncharge
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret nz
	ld b, charge_command
	jp SkipToBattleCommand

INCLUDE "engine/battle/move_effects/future_sight.asm"

INCLUDE "engine/battle/move_effects/thunder.asm"

INCLUDE "engine/battle/move_effects/blizzard.asm"

CheckHiddenOpponent:
; BUG: This routine is completely redundant and introduces a bug, since BattleCommand_CheckHit does these checks properly.
	xor a
	ret

GetUserItem:
; Return the effect of the user's item in bc, and its id at hl.
	ld hl, wBattleMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wEnemyMonItem
.go
	push hl
	call IsOpponentItemUsable
	pop hl
	ld b, [hl]
	jr z, GetItemHeldEffect
	ld bc, 0
	ret

GetOpponentItem:
; Return the effect of the opponent's item in bc, and its id at hl.
	ld hl, wEnemyMonItem
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld hl, wBattleMonItem
.go
	ld b, [hl]

	; Check if item is usable
	push hl
	call IsOpponentItemUsable
	pop hl
	jr z, GetItemHeldEffect
	ld bc, 0
	ret

GetItemHeldEffect:
; Return the effect of item b in bc.
	ld a, b
	and a
	ret z

	push hl
	ld hl, ItemAttributes + ITEMATTR_EFFECT
	dec a
	ld c, a
	ld b, 0
	ld a, ITEMATTR_STRUCT_LENGTH
	call AddNTimes
	ld a, BANK(ItemAttributes)
	call GetFarHalfword
	ld b, l
	ld c, h
	pop hl
	ret

AnimateCurrentMoveEitherSide:
	push hl
	push de
	push bc
	ld a, [wKickCounter]
	push af
	call BattleCommand_LowerSub
	pop af
	ld [wKickCounter], a
	call PlayDamageAnim
	call BattleCommand_RaiseSub
	pop bc
	pop de
	pop hl
	ret

AnimateCurrentMove:
	push hl
	push de
	push bc
	ld a, [wKickCounter]
	push af
	call BattleCommand_LowerSub
	pop af
	ld [wKickCounter], a
	call LoadMoveAnim
	call BattleCommand_RaiseSub
	pop bc
	pop de
	pop hl
	ret

PlayDamageAnim:
	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and a
	ret z

	call SetMoveAnimationID

	ldh a, [hBattleTurn]
	and a
	ld a, BATTLEANIM_ENEMY_DAMAGE
	jr z, .player
	ld a, BATTLEANIM_PLAYER_DAMAGE

.player
	ld [wNumHits], a

	jp PlayUserBattleAnim

LoadMoveAnim:
	xor a
	ld [wNumHits], a

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	and a
	ret z

	; fallthrough

LoadAnim:
	call SetMoveAnimationID
	; fallthrough

PlayUserBattleAnim:
	push hl
	push de
	push bc
	callfar PlayBattleAnim
	pop bc
	pop de
	pop hl
	ret

SetMoveAnimationID:
	push hl
	call GetMoveIndexFromID
	ld a, l
	ld [wFXAnimID], a
	ld a, h
	ld [wFXAnimID + 1], a
	pop hl
	ret

PlayOpponentBattleAnim:
	ld a, e
	ld [wFXAnimID], a
	ld a, d
	ld [wFXAnimID + 1], a
	xor a
	ld [wNumHits], a

	push hl
	push de
	push bc
	call BattleCommand_SwitchTurn

	callfar PlayBattleAnim

	call BattleCommand_SwitchTurn
	pop bc
	pop de
	pop hl
	ret

CallBattleCore:
	ld a, BANK("Battle Core")
	rst FarCall
	ret

AnimateFailedMove:
	call BattleCommand_LowerSub
	call BattleCommand_MoveDelay
	jp BattleCommand_RaiseSub

BattleCommand_MoveDelay:
; movedelay
; Wait 40 frames.
	ld c, 40
	jp DelayFrames

BattleCommand_ClearText:
; cleartext

; Used in multi-hit moves.
	ld hl, .text
	jp BattleTextbox

.text:
	text_end

SkipToBattleCommand:
; Skip over commands until reaching command b.
	ld a, [wBattleScriptBufferAddress + 1]
	ld h, a
	ld a, [wBattleScriptBufferAddress]
	ld l, a
.loop
	ld a, [hli]
	cp b
	jr nz, .loop

	ld a, h
	ld [wBattleScriptBufferAddress + 1], a
	ld a, l
	ld [wBattleScriptBufferAddress], a
	ret

DisappearUser:
	farcall _DisappearUser
	ret

AppearUserLowerSub:
	farcall _AppearUserLowerSub
	ret

AppearUserRaiseSub:
	farcall _AppearUserRaiseSub
	ret

_CheckBattleScene:
; Checks the options.  Returns carry if battle animations are disabled.
	push hl
	push de
	push bc
	farcall CheckBattleScene
	pop bc
	pop de
	pop hl
	ret

CheckMoveInList:
	; checks if the move ID in a belongs to a list of moves in hl
	push bc
	push de
	push hl
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	pop hl
	ld de, 2
	call IsInHalfwordArray
	pop de
	pop bc
	ret

INCLUDE "engine/battle/move_effects/avalanche.asm"

SandstormSpDefBoost: 
; First, check if Sandstorm is active.
	call CheckCloudNine
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	ret nz

; Then, check the opponent's types.
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonType1
.ok
	ld a, [hli]
	cp ROCK
	jr z, .start_boost
	ld a, [hl]
	cp ROCK
	ret nz

.start_boost
	ld h, b
	ld l, c
	srl b
	rr c
	add hl, bc
	ld b, h
	ld c, l
	ret

ApplyChoiceScarfOnSpeed:
	Call GetOpponentItem
	ld a, b
	cp HELD_CHOICE_BOOST
	ret nz
	ld a, c
	cp SPEED
	ret nz
	ldh a, [hBattleTurn]
	and a
	jr z, .enemy
; load wBattleMonSpeed into hMultiplicand
	ld hl, wBattleMonSpeed
	xor a
	ldh [hMultiplicand + 0], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
; Multiply by 150
	ld a, 50
	add 100
	ldh [hMultiplier], a
	call Multiply
; Divide by 100
	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide
; load hQuotient back into wBattleMonSpeed
	ldh a, [hQuotient + 2]
	ld hl, wBattleMonSpeed
	ld [hli], a
	ldh a, [hQuotient + 3]
	ld [hl], a
	ret

.enemy:
; load wEnemyMonSpeed into hMultiplicand
	ld hl, wEnemyMonSpeed
	xor a
	ldh [hMultiplicand + 0], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
; Multiply by 150
	ld a, 50
	add 100
	ldh [hMultiplier], a
	call Multiply
; Divide by 100
	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide
; load hQuotient back into wEnemyMonSpeed
	ldh a, [hQuotient + 2]
	ld hl, wEnemyMonSpeed
	ld [hli], a
	ldh a, [hQuotient + 3]
	ld [hl], a
	ret

MachoBraceEffectOnSpeed::
	call GetOpponentItem
	ld a, b
	cp HELD_MACHO_BRACE
	ret nz
	ldh a, [hBattleTurn]
	and a
	jr z, .enemy
	ld hl, wBattleMonSpeed + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .player_ok
	ld b, $1 ; min speed

.player_ok
	ld [hl], b
	ret

.enemy
	ld hl, wEnemyMonSpeed + 1
	ld a, [hld]
	ld b, a
	ld a, [hl]
	srl a
	rr b
	srl a
	rr b
	ld [hli], a
	or b
	jr nz, .enemy_ok
	ld b, $1 ; min speed

.enemy_ok
	ld [hl], b
	ret

HailDefBoost: 
; First, check if Hail is active.
	call CheckCloudNine
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	ret nz

; Then, check the opponent's types.
	ld hl, wEnemyMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonType1
.ok
	ld a, [hli]
	cp ICE
	jr z, .start_boost
	ld a, [hl]
	cp ICE
	ret nz

.start_boost
	ld h, b
	ld l, c
	srl b
	rr c
	add hl, bc
	ld b, h
	ld c, l
	ret
