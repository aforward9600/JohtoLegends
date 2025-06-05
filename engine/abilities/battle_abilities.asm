SetPlayerAbility::

;	ld de, ENGINE_ABILITIES_OFF
;	farcall CheckEngineFlag
;	jr nc, .NoAbility

	ld a, [wCurBattleMon]
	ld hl, wPartyMon1CaughtAbility
	call GetPartyLocation
	ld a, [wBattleMonSpecies]
	ld c, a
	call GetAbility
.FinishPlayerAbility:
	ld [wPlayerAbility], a
	ret

;.NoAbility:
;	ld a, NO_ABILITY
;	jr .FinishPlayerAbility

SetEnemyAbility::

;	ld de, ENGINE_ABILITIES_OFF
;	farcall CheckEngineFlag
;	jr nc, .NoAbility

	ld a, [wBattleMode]
	dec a
	jr z, .WildAbilities

	ld a, 0
	jr .FinishEnemyAbility

.WildAbilities
	call Random
	cp 10 percent + 1
	jr c, .HiddenAbility

	call Random
	cp 50 percent + 1
	jr c, .secondability

	ld a, 0
	jr .FinishEnemyAbility

.secondability
	ld a, 1
	jr .FinishEnemyAbility

.HiddenAbility
	ld a, 2
.FinishEnemyAbility
	ld [wEnemyMonAbility], a
	ld hl, wEnemyMonAbility
	ld a, [wEnemyMonSpecies]
	ld c, a
	call GetAbility
.FullyFinishEnemyAbility:
	ld [wEnemyAbility], a
	ret

.NoAbility:
	ld a, NO_ABILITY
	jr .FullyFinishEnemyAbility

SentOutAbilityBoth::
	ld a, [wEnemyAbility]
	cp NEUTRAL_GAS
	jp z, EnemyNeutralGas
	ld a, [wPlayerAbility]
	cp NEUTRAL_GAS
	jp z, PlayerNeutralGas
	ld de, wBattleMonSpeed
	ld hl, wEnemyMonSpeed
	ld c, 2
	call CompareBytes
	jr z, .speed_tie
	jr nc, .player_goes_first
.enemy_goes_first
	farcall BattleCommand_SwitchTurn
	call EnemyAbilityFirst
	farcall BattleCommand_SwitchTurn
	call PlayerAbilityFirst
	ret

.player_goes_first
	call PlayerAbilityFirst
	farcall BattleCommand_SwitchTurn
	call EnemyAbilityFirst
	farcall BattleCommand_SwitchTurn
	ret

.speed_tie
	call BattleRandom
	cp 50 percent + 1
	jr c, .player_goes_first
	jr .enemy_goes_first

SentOutAbility::
	ldh a, [hBattleTurn]
	and a
	jr z, PlayerAbilityFirst

EnemyAbilityFirst:
	ld a, [wEnemyAbility]
	cp NEUTRAL_GAS
	jp z, EnemyNeutralGas
	jr DoEntranceAbilities

PlayerAbilityFirst:
	ld a, [wPlayerAbility]
	ld a, [wPlayerAbility]
	cp NEUTRAL_GAS
	jp z, PlayerNeutralGas
DoEntranceAbilities:
	ld de, 3
	ld hl, .FirstAbilities
	call IsInArray
	jp nc, .NoFirstAbility
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.FirstAbilities:
	dbw INTIMIDATE,       .Intimidate
	dbw TRACE,            .Trace
	dbw MOLD_BREAKER,     .MoldBreaker
	dbw PRESSURE,         .Pressure
	dbw SCREEN_CLEAN,     .ScreenClean
	dbw FRISK,            .Frisk
	dbw UNNERVE,          .Unnerve
	dbw CLOUD_NINE,       .CloudNine
	dbw DROUGHT,          .Drought
	dbw SNOW_WARNING,     .SnowWarning
	dbw DRIZZLE,          .Drizzle
	dbw SANDSTREAM,       .Sandstream
	dbw DOWNLOAD,         .Download
	dbw SLOW_START,       .SlowStart
	db -1

.Intimidate:
	call GetTargetAbility
	ld hl, NoIntimidateAbilities
	ld de, 1
	call IsInArray
	jr c, .IntimidateBlocked
	farcall BattleCommand_AttackDown
	ld hl, IntimidateText
	call StdBattleTextbox
	call GetTargetAbility
	cp RATTLED
	jp z, RattledAbility
	cp DEFIANT
	ret nz
	jp DefiantAbility

.IntimidateBlocked:
	ld hl, AttackNotLoweredText
	jp StdBattleTextbox

.Trace:
	call GetTargetAbility
	cp TRACE
	ret z
	cp NEUTRAL_GAS
	ret z
	call MoveDelayAbility
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerTrace
	ld a, [wPlayerAbility]
	ld [wEnemyAbility], a
	call Ability_LoadAbilityName
	ld a, b
	and a
	ld hl, EnemyTraceText
	jp StdBattleTextbox

.PlayerTrace:
	ld a, [wEnemyAbility]
	ld [wPlayerAbility], a
	call Ability_LoadAbilityName
	ld a, b
	and a
	ld hl, PlayerTraceText
	jp StdBattleTextbox

.MoldBreaker:
	call MoveDelayAbility
	ld hl, BattleText_MoldBreaker
	jp StdBattleTextbox

.Pressure:
	call MoveDelayAbility
	ld hl, PressureText
	jp StdBattleTextbox

.ScreenClean:
	ld hl, wEnemyScreens
	ld a, [hl]
	res SCREENS_REFLECT, [hl]
	res SCREENS_LIGHT_SCREEN, [hl]
	call .CheckScreens

.PlayerScreens:
	ld hl, wPlayerScreens
	ld a, [hl]
	res SCREENS_REFLECT, [hl]
	res SCREENS_LIGHT_SCREEN, [hl]
	jp .CheckScreens

.CheckScreens
	push af
	and 1 << SCREENS_REFLECT
	jr z, .reflect_done
.reflect_done
	pop af
	and 1 << SCREENS_LIGHT_SCREEN
	ret z
	call MoveDelayAbility
	ld hl, ScreenCleanText
	jp StdBattleTextbox

.Frisk:
	farcall GetOpponentItem
	ld a, [hl]
	and a
	ret z
	farcall GetOpponentItem
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	call MoveDelayAbility
	ld hl, FriskText
	jp StdBattleTextbox

.Unnerve:
	call MoveDelayAbility
	ld hl, UnnerveText
	jp StdBattleTextbox

.CloudNine:
	call MoveDelayAbility
	ld hl, CloudNineText
	jp StdBattleTextbox

.Drought:
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	ld de, ANIM_IN_SUN
	farcall FarPlayBattleAnimation
	ld hl, SunGotBrightText
	jp StdBattleTextbox

.SnowWarning:
	ld a, WEATHER_HAIL
	ld [wBattleWeather], a
	ld de, ANIM_IN_HAIL
	farcall FarPlayBattleAnimation
	ld hl, HailStartsText
	jp StdBattleTextbox

.Drizzle:
	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	ld de, ANIM_IN_RAIN
	farcall FarPlayBattleAnimation
	ld hl, DownpourText
	jp StdBattleTextbox

.Sandstream:
	ld a, WEATHER_SANDSTORM
	ld [wBattleWeather], a
	ld de, ANIM_IN_SANDSTORM
	farcall FarPlayBattleAnimation
	ld hl, SandstormBrewedText
	jp StdBattleTextbox

.SlowStart:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_SLOW_START, [hl]
	ld a, 5
	push af
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerSlowStart
	pop af
	ld [wEnemySlowStartCount], a
	jr .FinishSlowStart

.PlayerSlowStart:
	pop af
	ld [wPlayerSlowStartCount], a
.FinishSlowStart:
	farcall CalcPlayerStats
	call MoveDelayAbility
	ld hl, SlowStartText
	jp StdBattleTextbox

.Download:
	farcall BattleCommand_SpecialAttackUp
	ld hl, DownloadText
	call StdBattleTextbox
.NoFirstAbility:
	ret

INCLUDE "data/abilities/no_intimidate_abilities.asm"

EnemyNeutralGas:
	farcall BattleCommand_SwitchTurn
	call MoveDelayAbility
	ld hl, NeutralGasText
	call StdBattleTextbox
	farcall BattleCommand_SwitchTurn
	ret

PlayerNeutralGas:
	call MoveDelayAbility
	ld hl, NeutralGasText
	jp StdBattleTextbox

MoveDelayAbility:
; movedelay
; Wait 40 frames.
	ld c, 40
	jp DelayFrames

RattledAbility:
	farcall BattleCommand_SwitchTurn
	farcall BattleCommand_SpeedUp
	farcall BattleCommand_SwitchTurn
	ld a, [wAttackMissed]
	and a
	ret nz
	call MoveDelayAbility
	ld hl, RattledText
	jp StdBattleTextbox

JustifiedAbility:
	farcall BattleCommand_SwitchTurn
	farcall BattleCommand_AttackUp
	farcall BattleCommand_SwitchTurn
	ld a, [wAttackMissed]
	and a
	ret nz
	call MoveDelayAbility
	ld hl, JustifiedText
	jp StdBattleTextbox

DefiantAbility:
	farcall BattleCommand_SwitchTurn
	farcall BattleCommand_AttackUp2
	farcall BattleCommand_SwitchTurn
	ld a, [wAttackMissed]
	and a
	ret nz
	call MoveDelayAbility
	ld hl, DefiantText
	jp StdBattleTextbox

CheckContactAbilities:
	call CheckNeutralGas
	ret z
	call GetTargetAbility
	cp CURSED_BODY
	jr z, .cursedbody
	cp RATTLED
	jr z, .rattled
	cp JUSTIFIED
	jp z, .justified
.AfterCursedBody
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVar
	cp PHYSICAL
	ret c
	call GetUserAbility
	cp POISON_TOUCH
	jr z, .PoisonTouch
	cp STENCH
	jr z, .Stench
.ReconveneContact:
	call GetTargetAbility
	ld de, 3
	ld hl, .ContactAbilities
	call IsInArray
	jp nc, .NoContactAilities
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.PoisonTouch:
	call GetTargetAbility
	cp SHIELD_DUST
	jr z, .ReconveneContact
	call BattleRandom
	cp 30 percent + 1
	ret nc
	farcall BattleCommand_PoisonTarget
	jr .ReconveneContact

.Stench:
	call GetTargetAbility
	cp SHIELD_DUST
	jr z, .ReconveneContact
	call BattleRandom
	cp 10 percent + 1
	ret nc
	farcall BattleCommand_FlinchTarget
	jr .ReconveneContact

.cursedbody:
	call BattleRandom
	cp 30 percent + 1
	ret nc
	farcall BattleCommand_SwitchTurn
	farcall CursedBodyAbility
	farcall BattleCommand_SwitchTurn
	jr .AfterCursedBody

.rattled:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp BUG
	jr z, .ActivateRattle
	cp DARK
	jr z, .ActivateRattle
	cp GHOST
	jp nz, .AfterCursedBody
.ActivateRattle
	call RattledAbility
	jp .AfterCursedBody

.justified:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp DARK
	jp nz, .AfterCursedBody
	call JustifiedAbility
	jp .AfterCursedBody

.ContactAbilities:
	dbw STATIC,       .Static
	dbw POISON_POINT, .PoisonPoint
	dbw FLAME_BODY,   .FlameBody
	dbw ROUGH_SKIN,   .RoughSkin
	dbw CUTE_CHARM,   .CuteCharm
	dbw EFFECT_SPORE, .EffectSpore
	dbw PERISH_BODY,  .PerishBody
	dbw AFTERMATH,    .Aftermath
	dbw WEAK_ARMOR,   .WeakArmor
	dbw PICKPOCKET,   .Pickpocket
	db -1

.Static
	call BattleRandom
	cp 30 percent + 1
	ret nc
	farcall BattleCommand_SwitchTurn
	farcall BattleCommand_ParalyzeTarget
	farcall BattleCommand_SwitchTurn
	ret

.PoisonPoint:
	call BattleRandom
	cp 30 percent + 1
	ret nc
	farcall BattleCommand_SwitchTurn
	farcall BattleCommand_PoisonTarget
	farcall BattleCommand_SwitchTurn
	ret

.FlameBody:
	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .GotPlayerType
	ld hl, wEnemyMonType1
.GotPlayerType
	ld a, [hli]
	cp FIRE
	ret z
	ld a, [hl]
	cp FIRE
	ret z
	call BattleRandom
	cp 30 percent + 1
	ret nc
	farcall BattleCommand_SwitchTurn
	farcall BattleCommand_BurnTarget
	farcall BattleCommand_SwitchTurn
	ret

.EffectSpore:
	call GetUserAbility
	cp OVERCOAT
	ret z
	farcall BattleCommand_SwitchTurn
	call BattleRandom
	cp 30 percent + 1
	ret nc
	call BattleRandom
	cp 33 percent + 1
	jr c, .EffectSporePoison
	call BattleRandom
	cp 50 percent + 1
	jr c, .EffectSporeSleep
	farcall BattleCommand_ParalyzeTarget
	jr .FinishEffectSpore

.EffectSporePoison:
	farcall BattleCommand_PoisonTarget
	jr .FinishEffectSpore

.EffectSporeSleep:
	farcall BattleCommand_SleepHit
.FinishEffectSpore:
	farcall BattleCommand_SwitchTurn
	ret

.RoughSkin:
	farcall GetEighthMaxHP
	farcall SubtractHPFromUser
	ld hl, RoughSkinText
	jp StdBattleTextbox

.PerishBody:
	ld hl, wPlayerSubStatus1
	ld de, wEnemySubStatus1
	bit SUBSTATUS_PERISH, [hl]
	jr z, .ok

	ld a, [de]
	bit SUBSTATUS_PERISH, a
	jp nz, .NoContactAilities

.ok:
	bit SUBSTATUS_PERISH, [hl]
	jr nz, .enemy

	set SUBSTATUS_PERISH, [hl]
	ld a, 4
	ld [wPlayerPerishCount], a

.enemy
	ld a, [de]
	bit SUBSTATUS_PERISH, a
	jr nz, .done

	set SUBSTATUS_PERISH, a
	ld [de], a
	ld a, 4
	ld [wEnemyPerishCount], a

.done
	ld de, ANIM_PERISH_BODY
	farcall FarPlayBattleAnimation
	ld hl, StartPerishText
	jp StdBattleTextbox

.Aftermath:
	call GetUserAbility
	cp DAMP
	ret z
	farcall BattleCommand_SwitchTurn
	farcall HasUserFainted
	ret nz
	farcall BattleCommand_SwitchTurn
	farcall GetQuarterMaxHP
	farcall SubtractHPFromUser
	ld hl, AftermathText
	jp StdBattleTextbox

.CuteCharm:
	call BattleRandom
	cp 30 percent + 1
	ret nc
	call GetUserAbility
	cp OBLIVIOUS
	ret z
	farcall BattleCommand_SwitchTurn
	farcall CheckOppositeGender
	jp c, .NoContactAilities
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOVE, [hl]
	jp nz, .NoContactAilities
	set SUBSTATUS_IN_LOVE, [hl]
	farcall BattleCommand_SwitchTurn
	ld de, ANIM_IN_LOVE
	farcall FarPlayBattleAnimation
	ld hl, CuteCharmText
	jp StdBattleTextbox

.WeakArmor:
	ldh a, [hBattleTurn]
	and a
	jr z, .HasEnemyFainted
	farcall HasPlayerFainted
	ret z
.ContinueWeakArmor
	farcall BattleCommand_DefenseDown
	ld a, [wAttackMissed]
	and a
	jr nz, .TrySpeedUp
	ld hl, WeakArmorDefenseText
	call StdBattleTextbox
.TrySpeedUp
	farcall BattleCommand_SwitchTurn
	farcall BattleCommand_SpeedUp2
	farcall BattleCommand_SwitchTurn
	ld a, [wAttackMissed]
	and a
	ret nz
	ld hl, WeakArmorSpeedText
	jp StdBattleTextbox

.HasEnemyFainted:
	farcall HasEnemyFainted
	ret z
	jr .ContinueWeakArmor

.Pickpocket:
	call GetUserAbility
	cp STICKY_HOLD
	ret z
	farcall BattleCommand_SwitchTurn
	farcall BattleCommand_Thief
	farcall BattleCommand_SwitchTurn
.NoContactAilities:
	ret
