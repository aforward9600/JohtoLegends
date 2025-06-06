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

CheckBoostingAbilities:
	call CheckNeutralGas
	ret z
	call GetUserAbility
	cp MOLD_BREAKER
	jr z, .AfterMarvelScale
	call GetTargetAbility
	cp MARVEL_SCALE
	jp z, .MarvelScale
	cp THICK_FAT
	jp z, .ThickFat
	cp DRY_SKIN
	jp z, .DrySkin
	cp HEAT_PROOF
	jp z, .HeatProof
.AfterMarvelScale
	call GetUserAbility
	ld de, 3
	ld hl, .BoostingAbilities
	call IsInArray
	jp nc, .NoBoostingAbilities
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.BoostingAbilities:
	dbw GUTS,            .Guts
	dbw SHARPNESS,       .Sharpness
	dbw OVERGROW,        .Overgrow
	dbw BLAZE,           .Blaze
	dbw TORRENT,         .Torrent
	dbw RECKLESS,        .Reckless
	dbw SAND_FORCE,      .SandForce
	dbw IRON_FIST,       .IronFist
	dbw SWARM,           .Swarm
	dbw TECHNICIAN,      .Technician
	dbw RIVALRY,         .Rivalry
	dbw HUSTLE,          .Hustle
	dbw PIXILATE,        .Pixilate
	dbw HUGE_POWER,      .HugePower
	dbw REFRIGERATE,     .Refrigerate
	dbw ANALYTIC,        .Analytic
	dbw TRANSISTOR,      .Transistor
	dbw DRAGONS_MAW,     .DragonsMaw
	dbw TOUGH_CLAWS,     .ToughClaws
	dbw STRONG_JAW,      .StrongJaw
	db -1

.Guts:
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and 1 << PSN | 1 << BRN | 1 << PAR
	ret z
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp SPECIAL
	ret nc
	jp FiftyPercentBoost

.ToughClaws:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp SPECIAL
	ret nc
	jp ThirtyPercentBoost

.StrongJaw:
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerStrongJaw
	ld a, [wCurEnemyMove]
	jr .FinishStrongJaw

.PlayerStrongJaw
	ld a, [wCurPlayerMove]
.FinishStrongJaw
	ld hl, StrongJawMoves
	call CheckMoveInListAbilities
	ret nc
	jp FiftyPercentBoost

.MarvelScale:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	cp 0
	ret z
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp SPECIAL
	ret nc
	call FiftyPercentNerf
	jp .AfterMarvelScale

.ThickFat:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp FIRE
	jr z, .ThickFatNerf
	cp ICE
	jr z, .ThickFatNerf
	jp .AfterMarvelScale

.ThickFatNerf:
	call FiftyPercentNerf
	jp .AfterMarvelScale

.DrySkin:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp FIRE
	jp nz, .AfterMarvelScale
	call TwentyFivePercentBoost
	jp .AfterMarvelScale

.HeatProof:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp FIRE
	jp nz, .AfterMarvelScale
	call FiftyPercentNerf
	jp .AfterMarvelScale

.IronFist:
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerIronFist
	ld a, [wCurEnemyMove]
	jr .FinishIronFist

.PlayerIronFist
	ld a, [wCurPlayerMove]
.FinishIronFist
	ld hl, PunchingMoves
	call CheckMoveInListAbilities
	ret nc
	jp TwentyPercentBoost

.SandForce:
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	ret nz
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp ROCK
	jr z, .SandForceBoost
	cp GROUND
	jr z, .SandForceBoost
	cp STEEL
	ret nz
.SandForceBoost:
	jp ThirtyPercentBoost

.Hustle:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp SPECIAL
	ret nc
	jp FiftyPercentBoost

.Reckless:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_RECOIL_HIT
	ret nz
	jp TwentyPercentBoost

.Sharpness:
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerSharpness
	ld a, [wCurEnemyMove]
	jr .FinishSharpness

.PlayerSharpness
	ld a, [wCurPlayerMove]
.FinishSharpness
	ld hl, SharpnessMoves
	call CheckMoveInListAbilities
	ret nc
	jp FiftyPercentBoost

.Overgrow:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp GRASS
	jr z, .PinchHPCheck
	ret

.Blaze:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp FIRE
	jr z, .PinchHPCheck
	ret
.Torrent:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp WATER
	jr z, .PinchHPCheck
	ret

.Swarm:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp BUG
	jr z, .PinchHPCheck
	ret

.PinchHPCheck:
	call GetThirdMaxHP
	call CheckUserHasEnoughHP
	ret c
	jp FiftyPercentBoost

.HugePower:
	jp HundredPercentBoost

.Pixilate:
	ld b, FAIRY
	jr .FinishTypeChange
.Refrigerate:
	ld b, ICE
	jr .FinishTypeChange
.FinishTypeChange:
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	cp 0
	ret z
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	and TYPE_MASK
	and a
	ret nz
	ld [hl], b
	jp TwentyPercentBoost

.Technician:
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	cp 60
	jr z, .TechnicianBoost
	jr c, .TechnicianBoost
	ret

.TechnicianBoost:
	jp FiftyPercentBoost

.Rivalry:
	farcall CheckOppositeGender
	ret c
	jr z, TwentyFivePercentBoost
	jp TwentyFivePercentNerf

.Analytic:
	farcall CheckOpponentWentFirst
	jr nz, ThirtyPercentBoost
	ret

.Transistor:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp ELECTRIC
	jr z, ThirtyPercentBoost
	ret

.DragonsMaw:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp DRAGON
	jr z, FiftyPercentBoost
.NoBoostingAbilities:
	ret

TwentyFivePercentBoost:
	ld a, 25
	jr FinishBoost
HundredPercentBoost:
	ld a, 100
	jr FinishBoost
ThirtyPercentBoost:
	ld a, 30
	jr FinishBoost
TwentyPercentBoost:
	ld a, 20
	jr FinishBoost
FiftyPercentBoost:
	ld a, 50
FinishBoost:
	add 100
	ldh [hMultiplier], a
	call Multiply

	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ret

TwentyFivePercentNerf:
	ld a, 75
	ldh [hMultiplier], a
	call Multiply

	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ret

FiftyPercentNerf:
	ld a, 50
	ldh [hMultiplier], a
	call Multiply

	ld a, 100
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ret

EffectiveDefensiveAbilities:
	call GetUserAbility
	cp TINTED_LENS
	jr z, .TintedLens
.ReturnToDefensiveAbilities:
	call GetTargetAbility
	cp SOLID_ROCK
	jr z, .SolidRock
	cp FILTER
	jr z, .SolidRock
	ret

.TintedLens:
	ld a, [wTypeModifier]
	and $7f
	cp 5
	jr nz, .ReturnToDefensiveAbilities
	jp HundredPercentBoost

.SolidRock:
	ld a, [wTypeModifier]
	and $7f
	cp 20
	ret nz
	jp TwentyFivePercentNerf

SharpnessMoves:
	dw CROSS_POISON
	dw CUT
	dw RAZOR_LEAF
	dw SLASH
	dw LEAF_BLADE
	dw STEEL_SLICE
	dw -1

StrongJawMoves:
	dw BITE
	dw CRUNCH
	dw FIRE_FANG
	dw HYPER_FANG
	dw ICE_FANG
	dw POISON_FANG
	dw THUNDER_FANG
	dw -1

INCLUDE "data/moves/punching_moves.asm"

CheckMoveInListAbilities:
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

HustleCheck:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp SPECIAL
	ret nc
	cp STATUS
	ret nc
	ret

ApplySpeedAbilities::
	call CheckNeutralGas
	ret z
	ldh a, [hBattleTurn]
	and a
	jr z, .EnemySpeedAbilities
	ld a, [wPlayerAbility]
	jr .ConveneSpeedAbility
.EnemySpeedAbilities
	ld a, [wEnemyAbility]
.ConveneSpeedAbility
	ld de, 3
	ld hl, .SpeedAbilities
	call IsInArray
	jp nc, .NoSpeedAbility
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.SpeedAbilities:
	dbw QUICK_FEET,   .QuickFeet
	dbw SWIFT_SWIM,   .SwiftSwim
	dbw CHLOROPHYLL,  .Chlorophyll
	dbw SAND_RUSH,    .SandRush
	dbw UNBURDEN,     .Unburden
	db -1

.SwiftSwim:
	call CheckCloudNine
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	ret nz
	jp DoubleUserSpeed

.Chlorophyll:
	call CheckCloudNine
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret nz
	jp DoubleUserSpeed

.SandRush:
	call CheckCloudNine
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	ret nz
	jp DoubleUserSpeed

.Unburden:
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_UNBURDEN, [hl]
	ret z
	jp DoubleUserSpeed

.QuickFeet:
	ldh a, [hBattleTurn]
	and a
	jr z, .enemy
	ld a, [wBattleMonStatus]
	and 1 << PSN | 1 << BRN | 1 << PAR
	ret z
	jr FiftyPercentSpeedBoost

.enemy:
	ld a, [wEnemyMonStatus]
	and 1 << PSN | 1 << BRN | 1 << PAR
	ret z
	jr FiftyPercentSpeedBoost

.NoSpeedAbility:
	ret

FiftyPercentSpeedBoost:
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

.enemy
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

DoubleUserSpeed:
	ldh a, [hBattleTurn]
	and a
	jr z, .EnemySpeed
; load wBattleMonSpeed into hMultiplicand
	ld hl, wBattleMonSpeed
	xor a
	ldh [hMultiplicand + 0], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
; Multiply by 200
	ld a, 100
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

.EnemySpeed:
; load wEnemyMonSpeed into hMultiplicand
	ld hl, wEnemyMonSpeed
	xor a
	ldh [hMultiplicand + 0], a
	ld a, [hli]
	ldh [hMultiplicand + 1], a
	ld a, [hl]
	ldh [hMultiplicand + 2], a
; Multiply by 200
	ld a, 100
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
