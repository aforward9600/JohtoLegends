SetPlayerAbility::

	ld a, [wCurBattleMon]
	ld hl, wPartyMon1CaughtTime
	call GetPartyLocation
	ld a, [hl]
	ld [wBattleMonForm], a

	ld a, [wGBPrinterBrightness]
	cp OPT_PRINT_LIGHTEST
	jr nz, .NoAbility

	ld a, [wCurBattleMon]
	ld hl, wPartyMon1CaughtAbility
	call GetPartyLocation
	ld a, [wBattleMonSpecies]
	ld c, a
	call GetAbility
.FinishPlayerAbility:
	ld [wPlayerAbility], a
	ret

.NoAbility:
	ld a, NO_ABILITY
	jr .FinishPlayerAbility

SetEnemyAbility::

	ld a, [wBattleType]
	cp BATTLETYPE_SHINY
	jr z, .HiddenAbility

	ld a, [wBattleMode]
	dec a
	jr z, .WildAbilities

	ld a, [wOtherTrainerType]
	bit TRAINERTYPE_ABILITY_F, a
	jr z, .Ability1
	ld a, [wCurPartyMon]
	ld hl, wOTPartyMon1CaughtAbility
	call GetPartyLocation
	ld a, [hl]
	jr .FinishEnemyAbility

.Ability1
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
	ld a, [wGBPrinterBrightness]
	cp OPT_PRINT_LIGHTEST
	jr nz, .NoAbility
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
	call BattleCommand_SwitchTurnAbilities
	call EnemyAbilityFirst
	call BattleCommand_SwitchTurnAbilities
	jp PlayerAbilityFirst

.player_goes_first
	call PlayerAbilityFirst
	call BattleCommand_SwitchTurnAbilities
	call EnemyAbilityFirst
	jp BattleCommand_SwitchTurnAbilities

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
	dbw IMPOSTER,         .Imposter
	db -1

.Intimidate:
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_MIST, a
	jr nz, .IntimidateBlocked
;	call GetTargetAbility
;	cp CONTRARY
;	jr z, .IntimidateContrary
	ld hl, NoIntimidateAbilities
	ld de, 1
	call IsInArray
	jr c, .IntimidateBlocked
	call AnimateUserAbility
	farcall BattleCommand_AttackDown
	farcall BattleCommand_StatDownMessage
	call GetTargetAbility
	cp RATTLED
	jp z, RattledAbility
	cp DEFIANT
	jp z, DefiantAbility
	cp COMPETITIVE
	ret nz
	jp CompetitiveAbility

.IntimidateBlocked:
	call AnimateOppAbility
	ld hl, AttackNotLoweredText
	jp StdBattleTextbox

.IntimidateContrary:
	call BattleCommand_SwitchTurnAbilities
	ld b, ATTACK
	farcall RaiseStat
	ld a, [wFailedMessage]
	and a
	jp nz, BattleCommand_SwitchTurnAbilities
	ld de, ANIM_ENEMY_STAT_DOWN
	farcall Call_PlayBattleAnim
	call BattleCommand_SwitchTurnAbilities
	ld hl, IntimidateContraryText
	jp StdBattleTextbox

.Trace:
	call GetTargetAbility
	cp TRACE
	ret z
	cp NEUTRAL_GAS
	ret z
	call AnimateUserAbility
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
	call AnimateUserAbility
	ld hl, BattleText_MoldBreaker
	jp StdBattleTextbox

.Pressure:
	call AnimateUserAbility
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
	call AnimateUserAbility
	ld hl, ScreenCleanText
	jp StdBattleTextbox

.Frisk:
	farcall GetOpponentItem
	ld a, [hl]
	and a
	ret z
	call AnimateUserAbility
	farcall GetOpponentItem
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	call MoveDelayAbility
	ld hl, FriskText
	jp StdBattleTextbox

.Unnerve:
	call AnimateUserAbility
	ld hl, UnnerveText
	jp StdBattleTextbox

.CloudNine:
	call AnimateUserAbility
	ld hl, CloudNineText
	jp StdBattleTextbox

.Drought:
	call AnimateUserAbility
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	ld de, ANIM_IN_SUN
	farcall FarPlayBattleAnimation
	ld hl, SunGotBrightText
	jp StdBattleTextbox

.SnowWarning:
	call AnimateUserAbility
	ld a, WEATHER_HAIL
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	ld de, ANIM_IN_HAIL
	farcall FarPlayBattleAnimation
	ld hl, HailStartsText
	jp StdBattleTextbox

.Drizzle:
	call AnimateUserAbility
	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	ld de, ANIM_IN_RAIN
	farcall FarPlayBattleAnimation
	ld hl, DownpourText
	jp StdBattleTextbox

.Sandstream:
	call AnimateUserAbility
	ld a, WEATHER_SANDSTORM
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	ld de, ANIM_IN_SANDSTORM
	farcall FarPlayBattleAnimation
	ld hl, SandstormBrewedText
	jp StdBattleTextbox

.SlowStart:
	call AnimateUserAbility
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
	farcall CalcEnemyStats
	call MoveDelayAbility
	ld hl, SlowStartText
	jp StdBattleTextbox

.Imposter:
	call AnimateUserAbility
	ld de, ANIM_IMPOSTER
	farcall FarPlayBattleAnimation
	farcall BattleCommand_Transform
	jr .NoFirstAbility

.Download:
	call AnimateUserAbility
	farcall BattleCommand_SpecialAttackUp
	farcall BattleCommand_StatUpMessage
.NoFirstAbility:
	ret

INCLUDE "data/abilities/no_intimidate_abilities.asm"

EnemyNeutralGas:
	call BattleCommand_SwitchTurnAbilities
	call PlayerNeutralGas
	jp BattleCommand_SwitchTurnAbilities

PlayerNeutralGas:
	call AnimateUserAbility
	call MoveDelayAbility
	ld hl, NeutralGasText
	jp StdBattleTextbox

MoveDelayAbility:
; movedelay
; Wait 40 frames.
	ld c, 40
	jp DelayFrames

RattledAbility:
	call AnimateOppAbility
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_SpeedUp
	farcall BattleCommand_StatUpMessage
	jp BattleCommand_SwitchTurnAbilities

JustifiedAbility:
	call AnimateOppAbility
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_AttackUp
	farcall BattleCommand_StatUpMessage
	jp BattleCommand_SwitchTurnAbilities

DefiantAbility:
	call AnimateOppAbility
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_AttackUp2
	farcall BattleCommand_StatUpMessage
	jp BattleCommand_SwitchTurnAbilities

CompetitiveAbility:
	call AnimateOppAbility
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_SpecialAttackUp2
	farcall BattleCommand_StatUpMessage
	jp BattleCommand_SwitchTurnAbilities

CheckContactAbilities:
	call CheckNeutralGas
	ret z
	call GetTargetAbility
	cp CURSED_BODY
	jr z, .cursedbody
	cp RATTLED
	jp z, .rattled
	cp JUSTIFIED
	jp z, .justified
.AfterCursedBody
	call GetUserCurrentMove
	push af
	ld hl, NoContactMoves
	call CheckMoveInListAbilities
	jp c, .NoContactMoves
	pop af
	ld hl, SpecialContactMoves
	call CheckMoveInListAbilities
	jr c, .SpecialContactMoves
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp SPECIAL
	ret nc
	cp STATUS
	ret nc
.SpecialContactMoves
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
	call AnimateUserAbility
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
	call AnimateOppAbility
	call BattleCommand_SwitchTurnAbilities
	farcall CursedBodyAbility
	call BattleCommand_SwitchTurnAbilities
	jp .AfterCursedBody

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

.NoContactMoves:
	pop af
	ret

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
	dbw TANGLING_HAIR, .TanglingHair
	db -1

.TanglingHair:
;	ld a, BATTLE_VARS_SUBSTATUS4_OPP
;	call GetBattleVar
;	bit SUBSTATUS_MIST, a
;	ret nz
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_SpeedDown
	call AnimateUserAbility
	farcall BattleCommand_StatDownMessage
	jp BattleCommand_SwitchTurnAbilities
;	ld hl, TanglingHairText
;	jp StdBattleTextbox

.TanglingHairContrary:
;	ld b, SPEED
;	farcall RaiseStat
;	ld a, [wFailedMessage]
;	and a
;	ret nz
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_SpeedUp
	farcall BattleCommand_StatUpMessage
	call BattleCommand_SwitchTurnAbilities
	ld hl, TanglingHairContraryText
	jp StdBattleTextbox

.Static
	call BattleRandom
	cp 30 percent + 1
	ret nc
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_ParalyzeTarget
	jp BattleCommand_SwitchTurnAbilities

.PoisonPoint:
	ld hl, wBattleMonType1
	ldh a, [hBattleTurn]
	and a
	jr z, .GotPlayerTypePoison
	ld hl, wEnemyMonType1
.GotPlayerTypePoison
	ld a, [hli]
	cp POISON
	ret z
	cp STEEL
	ret z
	ld a, [hl]
	cp POISON
	ret z
	cp STEEL
	ret z
	call BattleRandom
	cp 30 percent + 1
	ret nc
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_PoisonTarget
	jp BattleCommand_SwitchTurnAbilities

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
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_BurnTarget
	jp BattleCommand_SwitchTurnAbilities

.EffectSpore:
	call GetUserAbility
	cp OVERCOAT
	ret z
	call BattleCommand_SwitchTurnAbilities
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
	jp BattleCommand_SwitchTurnAbilities

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
	call BattleCommand_SwitchTurnAbilities
	farcall HasUserFainted
	ret nz
	call BattleCommand_SwitchTurnAbilities
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
	call BattleCommand_SwitchTurnAbilities
	farcall CheckOppositeGender
	jp c, .NoContactAilities
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_IN_LOVE, [hl]
	jp nz, .NoContactAilities
	set SUBSTATUS_IN_LOVE, [hl]
	call BattleCommand_SwitchTurnAbilities
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
	ld b, DEFENSE
	farcall LowerStatPop
	ld a, [wFailedMessage]
	and a
	jr nz, .TrySpeedUp
	call BattleCommand_SwitchTurnAbilities
	ld de, ANIM_PLAYER_STAT_DOWN
	farcall Call_PlayBattleAnim
	call BattleCommand_SwitchTurnAbilities
	ld hl, WeakArmorDefenseText
	call StdBattleTextbox
.TrySpeedUp
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_SpeedUp2
	farcall BattleCommand_StatUpMessage
	call BattleCommand_SwitchTurnAbilities
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
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_Thief
	call BattleCommand_SwitchTurnAbilities
.NoContactAilities:
	ret

NoContactMoves:
	dw BARRAGE
	dw BONE_CLUB
	dw BONE_RUSH
	dw BONEMERANG
	dw BULLDOZE
	dw BULLET_SEED
	dw EARTHQUAKE
	dw EGG_BOMB
	dw EXPLOSION
	dw FISSURE
	dw ICE_SHARD
	dw ICICLE_CRASH
	dw ICICLE_SPEAR
	dw MAGNITUDE
	dw PAY_DAY
	dw PETAL_BLIZZ
	dw PIN_MISSILE
	dw POISON_STING
	dw PRESENT
	dw PSYCHO_CUT
	dw RAZOR_LEAF
	dw ROCK_BLAST
	dw ROCK_SLIDE
	dw ROCK_THROW
	dw ROCK_TOMB
	dw ROCK_WRECKER
	dw SACRED_FIRE
	dw SAND_TOMB
	dw SEED_BOMB
	dw SELFDESTRUCT
	dw SHADOW_BONE
	dw SKY_ATTACK
	dw SPIKE_CANNON
	dw STONE_EDGE
	dw TWINEEDLE
	dw -1

SpecialContactMoves:
	dw GRASS_KNOT
	dw DRAININGKISS
	dw PETAL_DANCE
	dw -1

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
	cp MULTISCALE
	jp z, .Multiscale
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
	dbw MEGA_LAUNCHER,   .MegaLauncher
	dbw SOLAR_POWER,     .SolarPower
	dbw GALVANIZE,       .Galvanize
	dbw STEELY_SPIRIT,   .SteelySpirit
	dbw BERSERK,         .Berserk
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
	ld hl, StrongJawMoves
	jr .NextMoveBoost

.MegaLauncher:
	ld hl, MegaLauncherMoves
	jr .NextMoveBoost

.Sharpness:
	ld hl, SharpnessMoves
.NextMoveBoost
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerMoveBoost
	ld a, [wCurEnemyMove]
	jr .FinishMoveBoost

.PlayerMoveBoost
	ld a, [wCurPlayerMove]
.FinishMoveBoost
	call CheckMoveInListAbilities
	ret nc
	jp FiftyPercentBoost

.MarvelScale:
	ld a, BATTLE_VARS_STATUS_OPP
	call GetBattleVar
	or a
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

.Multiscale:
	farcall CheckOpponentFullHP
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
	call CheckCloudNine
	ret z
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

.Berserk:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp SPECIAL
	ret c
	farcall GetHalfMaxHP
	call CheckUserHasEnoughHPAbilities
	ret c
	jp FiftyPercentBoost

.Reckless:
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_RECOIL_HIT
	jp z, TwentyPercentBoost
	cp EFFECT_FLARE_BLITZ
	jp z, TwentyPercentBoost
	cp EFFECT_JUMP_KICK
	jp z, TwentyPercentBoost
	cp EFFECT_VOLT_TACKLE
	jp z, TwentyPercentBoost
	jp .NoBoostingAbilities

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
	farcall GetThirdMaxHP
	call CheckUserHasEnoughHPAbilities
	ret c
	jp FiftyPercentBoost

.HugePower:
	jp HundredPercentBoost

.Galvanize:
	ld b, ELECTRIC
	jr .FinishTypeChange
.Pixilate:
	ld b, FAIRY
	jr .FinishTypeChange
.Refrigerate:
	ld b, ICE
	jr .FinishTypeChange
.FinishTypeChange:
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVar
	or a
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
	call CheckOpponentWentFirstAbilities
	jr nz, ThirtyPercentBoost
	ret

.Transistor:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp ELECTRIC
	jr z, ThirtyPercentBoost
	ret

.SteelySpirit:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp STEEL
	jr z, FiftyPercentBoost
	ret

.SolarPower:
	call CheckCloudNine
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret nz
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp PHYSICAL
	ret nc
	jp FiftyPercentBoost

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
	call CheckNeutralGas
	ret z
	call GetUserAbility
	cp TINTED_LENS
	jr z, .TintedLens
.ReturnToDefensiveAbilities:
	call GetUserAbility
	cp MOLD_BREAKER
	ret z
	call GetTargetAbility
	cp SOLID_ROCK
	jr z, .SolidRock
	cp FILTER
	jr z, .SolidRock
	cp FUR_COAT
	jr z, .FurCoat
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

.FurCoat:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	cp SPECIAL
	ret nc
	jp FiftyPercentNerf

SharpnessMoves:
	dw CROSS_POISON
	dw CUT
	dw RAZOR_LEAF
	dw SLASH
	dw LEAF_BLADE
	dw STEEL_SLICE
	dw X_SCISSOR
	dw SOLAR_BLADE
	dw -1

MegaLauncherMoves:
	dw AURA_SPHERE
	dw DARK_PULSE
	dw DRAGON_PULSE
	dw WATER_PULSE
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
	dbw SLUSH_RUSH,   .SlushRush
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

.SlushRush:
	call CheckCloudNine
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
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

BattleCommand_SwitchTurnAbilities:
; switchturn

	ldh a, [hBattleTurn]
	xor 1
	ldh [hBattleTurn], a
	ret

CheckDefensiveAbilities:
	call CheckUserNeutralGasMoldBreaker
	ret z
	call GetTargetAbility
	ld de, 3
	ld hl, .DefensiveAbilities
	call IsInArray
	jp nc, .NoDefensiveAbilities
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.DefensiveAbilities:
	dbw FLASH_FIRE,      .FlashFire
	dbw WATER_ABSORB,    .WaterAbsorb
	dbw LEVITATE,        .Levitate
	dbw VOLT_ABSORB,     .VoltAbsorb
	dbw DRY_SKIN,        .DrySkin
	dbw SOUNDPROOF,      .Soundproof
	dbw MOTOR_DRIVE,     .MotorDrive
	dbw LIGHTNINGROD,    .Lightningrod
	dbw SAP_SIPPER,      .SapSipper
	dbw BULLETPROOF,     .Bulletproof
	db -1

.FlashFire:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp FIRE
	ret nz
	farcall BattleCommand_SwitchTurn
	farcall BattleCommand_AttackUp
	farcall BattleCommand_SwitchTurn
	ld a, [wAttackMissed]
	and a
	ret nz
	call AnimateOppAbility
	ld hl, FlashFireText
	call StdBattleTextbox
	jp EndMoveEffectAbilities

.Levitate:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp GROUND
	ret nz
	call AnimateOppAbility
	ld hl, LevitateText
	call StdBattleTextbox
	jp EndMoveEffectAbilities

.SapSipper:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp GRASS
	ret nz
	call AnimateOppAbility
	farcall BattleCommand_SwitchTurn
	farcall BattleCommand_AttackUp
	farcall BattleCommand_SwitchTurn
	ld a, [wAttackMissed]
	and a
	ret nz
	call MoveDelayAbility
	ld hl, SapSipperText
	call StdBattleTextbox
	jp EndMoveEffectAbilities

.Lightningrod:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp ELECTRIC
	ret nz
	call AnimateOppAbility
	farcall BattleCommand_SwitchTurn
	farcall BattleCommand_SpecialAttackUp
	farcall BattleCommand_SwitchTurn
	ld a, [wAttackMissed]
	and a
	ret nz
	call MoveDelayAbility
	ld hl, LightningRodText
	call StdBattleTextbox
	jp EndMoveEffectAbilities

.MotorDrive:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp ELECTRIC
	ret nz
	call AnimateOppAbility
	farcall BattleCommand_SwitchTurn
	farcall BattleCommand_SpeedUp
	farcall BattleCommand_SwitchTurn
	ld a, [wAttackMissed]
	and a
	ret nz
	call MoveDelayAbility
	ld hl, MotorDriveText
	call StdBattleTextbox
	jp EndMoveEffectAbilities

.Soundproof:
	call GetUserCurrentMove
	ld hl, SoundMoves
	call CheckMoveInListAbilities
	ret nc
	call PreventAbilityText
	jp EndMoveEffectAbilities

.Bulletproof:
	call GetUserCurrentMove
	ld hl, BulletproofMoves
	call CheckMoveInListAbilities
	ret nc
	call PreventAbilityText
	jp EndMoveEffectAbilities

.DrySkin:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp WATER
	ret nz
	call CheckFullHPDefenseAbilities
	jp EndMoveEffectAbilities

.WaterAbsorb:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp WATER
	ret nz
	call CheckFullHPDefenseAbilities
	jp EndMoveEffectAbilities

.VoltAbsorb:
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
	and TYPE_MASK
	cp ELECTRIC
	ret nz
	call CheckFullHPDefenseAbilities
	farcall EndMoveEffect
.NoDefensiveAbilities
	ret

EndMoveEffectAbilities:
	farcall EndMoveEffect
	ret

GetUserCurrentMove:
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerCurrentMove
	ld a, [wCurEnemyMove]
	ret

.PlayerCurrentMove
	ld a, [wCurPlayerMove]
	ret

CheckFullHPDefenseAbilities:
	call AnimateOppAbility
	ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP
.got_hp
; Don't restore if we're already at max HP
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	cp b
	jr nz, .restore
	ld a, [hl]
	cp c
	jr z, .NoRestore

.restore
	farcall GetQuarterMaxHP
	farcall RestoreHP
.NoRestore
	call MoveDelayAbility
	call GetTargetAbility
	call Ability_LoadAbilityName
	ld a, b
	and a
	ld hl, WaterAbsorbText
	jp StdBattleTextbox

HandleEndMoveAbility:
	ld de, wBattleMonSpeed
	ld hl, wEnemyMonSpeed
	ld c, 2
	call CompareBytes
	jr z, .speed_tie
	jr nc, .player_goes_first
.enemy_goes_first
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn
	jr .do_it

.speed_tie
	call BattleRandom
	cp 50 percent + 1
	jr c, .player_goes_first
	jr .enemy_goes_first

.player_goes_first
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn

.do_it
	call CheckNeutralGas
	ret z
	call GetUserAbility
	ld de, 3
	ld hl, .EndTurnAbilities
	call IsInArray
	jp nc, .NoEndTurnAbilities
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.EndTurnAbilities:
	dbw RAIN_DISH,       .RainDish
	dbw DRY_SKIN,        .DrySkin
	dbw SPEED_BOOST,     .SpeedBoost
	dbw SHED_SKIN,       .ShedSkin
	dbw HYDRATION,       .Hydration
	dbw SOLAR_POWER,     .SolarPower
	dbw ICE_BODY,        .IceBody
	dbw MOODY,           .Moody
	db -1

.RainDish:
	call CheckCloudNine
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	ret nz
	jp CheckFullHPAbilities

.Hydration:
	call CheckCloudNine
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	ret nz
	call CheckStatusAbilities
	ret z
	call BattleRandom
	cp 30 percent + 1
	ret nc
	call AnimateUserAbility
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	xor a
	ld [hl], a
	ld hl, HydrationText
	jp StdBattleTextbox

.DrySkin:
	call CheckCloudNine
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jr z, .DrySkinRain
	cp WEATHER_SUN
	ret nz
	call AnimateUserAbility
	farcall GetEighthMaxHP
	farcall SubtractHPFromUser
	ld hl, DrySkinHurtText
	jp StdBattleTextbox

.DrySkinRain:
	jp CheckFullHPAbilities

.IceBody:
	call CheckCloudNine
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	ret nz
	jp CheckFullHPAbilities

.SpeedBoost:
	farcall BattleCommand_SpeedUp
	ld a, [wFailedMessage]
	and a
	ret nz
	call AnimateUserAbility
	farcall BattleCommand_StatUpMessage
	ret

.Moody:
	call BattleRandom
	cp 20 percent
	jr c, .Next1
	farcall BattleCommand_AttackUp2
	jr .MoodyStatUpText

.Next1
	call BattleRandom
	cp 25 percent
	jr c, .Next2
	farcall BattleCommand_DefenseUp2
	jr .MoodyStatUpText

.Next2
	call BattleRandom
	cp 33 percent
	jr c, .Next3
	farcall BattleCommand_SpeedUp2
	jr .MoodyStatUpText

.Next3
	call BattleRandom
	cp 50 percent
	jr c, .MoodySpDefUp
	farcall BattleCommand_SpecialAttackUp2
	jr .MoodyStatUpText
.MoodySpDefUp
	farcall BattleCommand_SpecialDefenseUp2
.MoodyStatUpText
	ld a, [wAttackMissed]
	and a
	jr nz, .MoodyDown
	call AnimateUserAbility
;	ld hl, MoodyText
;	call StdBattleTextbox
	farcall BattleCommand_StatUpMessage
	ld a, 1
	ld [wStatChangeHappened], a
.MoodyDown
	call BattleRandom
	cp 20 percent
	jr c, .Next4
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_AttackDown
	jr .MoodyStatDownText

.Next4
	call BattleRandom
	cp 25 percent
	jr c, .Next5
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_DefenseDown
	jr .MoodyStatDownText

.Next5
	call BattleRandom
	cp 33 percent
	jr c, .Next6
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_SpeedDown
	jr .MoodyStatDownText

.Next6
	call BattleRandom
	cp 50 percent
	jr c, .MoodySpDefDown
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_SpecialAttackDown
	jr .MoodyStatDownText
.MoodySpDefDown
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_SpecialDefenseDown
.MoodyStatDownText
	ld a, [wStatChangeHappened]
	and a
	jr nz, .SkipAnimation
	call AnimateUserAbility
.SkipAnimation
	xor a
	ld [wStatChangeHappened], a
	ld a, [wAttackMissed]
	and a
	jp nz, BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_StatDownMessage
	jp BattleCommand_SwitchTurnAbilities

.SolarPower:
	call CheckCloudNine
	ret z
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	ret nz
	call AnimateUserAbility
	farcall GetEighthMaxHP
	farcall SubtractHPFromUser
	ld hl, SolarPowerText
	jp StdBattleTextbox

.ShedSkin:
	call CheckStatusAbilities
	ret z
	call BattleRandom
	cp 30 percent + 1
	ret nc
	call AnimateUserAbility
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	xor a
	ld [hl], a
	ld hl, ShedSkinText
	call StdBattleTextbox
.NoEndTurnAbilities:
	ret

CheckStatusAbilities:
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	and a
	ret

CheckFullHPAbilities:
	ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wEnemyMonHP

.got_hp
; Don't restore if we're already at max HP
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	cp b
	jr nz, .restore
	ld a, [hl]
	cp c
	ret z

.restore
	call AnimateUserAbility
	farcall GetEighthMaxHP
	farcall SwitchTurnCore
	farcall RestoreHP
	farcall SwitchTurnCore
	call MoveDelayAbility
	call GetUserAbility
	call Ability_LoadAbilityName
	ld a, b
	and a
	ld hl, WaterAbsorbText
	jp StdBattleTextbox

BulletproofMoves:
	dw ACID_SPRAY
	dw AURA_SPHERE
	dw BARRAGE
	dw BULLET_SEED
	dw EGG_BOMB
	dw ENERGY_BALL
	dw FOCUS_BLAST
	dw GYRO_BALL
	dw MUD_BOMB
	dw OCTAZOOKA
	dw ROCK_BLAST
	dw ROCK_WRECKER
	dw SEED_BOMB
	dw SHADOW_BALL
	dw SLUDGE_BOMB
	dw ZAP_CANNON
	dw -1

PreventStatDrop::
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_ATTACK_DOWN_HIT
	jr c, PreventAbilityText
	cp EFFECT_EVASION_DOWN_HIT + 1
	ret c
	cp EFFECT_ALL_DOWN_HIT
	jr c, PreventAbilityText
	cp EFFECT_SP_DEF_DOWN_2_HIT + 1
	ret c

PreventAbilityText::
	call AnimateOppAbility
	call GetTargetAbility
	call Ability_LoadAbilityName
	ld a, b
	and a
	ld hl, SoundproofText
	jp StdBattleTextbox

EnemySwitchAbilities:
	call CheckNeutralGas
	ret z
	ld a, [wEnemyAbility]
	cp REGENERATOR
	jr z, .EnemyRegeneratorAbility
	cp NATURAL_CURE
	ret nz
	ld a, 0
	ld [wEnemyMonStatus], a
	jp UpdateEnemyMonInParty

.EnemyRegeneratorAbility
	ld hl, wEnemyMonMaxHP
	call GetThirdMaxHPAbilities
	call BattleCommand_SwitchTurnAbilities
	ld hl, wEnemyMonMaxHP
	call RestoreHPAbilities
	call BattleCommand_SwitchTurnAbilities
	jp UpdateEnemyMonInParty

PlayerSwitchAbilities:
	call CheckNeutralGas
	ret z
	ld a, [wPlayerAbility]
	cp REGENERATOR
	jr z, .PlayerRegeneratorAbility
	cp NATURAL_CURE
	ret nz
	ld a, 0
	ld [wBattleMonStatus], a
	call UpdateBattleMonInParty
	jp UpdateUserInParty

.PlayerRegeneratorAbility
	ld hl, wBattleMonMaxHP
	call GetThirdMaxHPAbilities
	call BattleCommand_SwitchTurnAbilities
	ld hl, wBattleMonMaxHP
	call RestoreHPAbilities
	call BattleCommand_SwitchTurnAbilities
	jp UpdateBattleMonInParty

GetMaxHPAbilities:
.ok
	ld a, [hli]
	ld [wBuffer2], a
	ld b, a

	ld a, [hl]
	ld [wBuffer1], a
	ld c, a
	ret

GetThirdMaxHPAbilities:
; Assumes HP<768
	call GetMaxHPAbilities
	xor a
	inc b
.loop
	dec b
	inc a
	dec bc
	dec bc
	dec bc
	inc b
	jr nz, .loop
	dec a
	ld c, a
	ret nz
	inc c ; At least 1
	ret

RestoreHPAbilities:
	ld a, [hli]
	ld [wBuffer2], a
	ld a, [hld]
	ld [wBuffer1], a
	dec hl
	ld a, [hl]
	ld [wBuffer3], a
	add c
	ld [hld], a
	ld [wBuffer5], a
	ld a, [hl]
	ld [wBuffer4], a
	adc b
	ld [hli], a
	ld [wBuffer6], a

	ld a, [wBuffer1]
	ld c, a
	ld a, [hld]
	sub c
	ld a, [wBuffer2]
	ld b, a
	ld a, [hl]
	sbc b
	jr c, .asm_3cd2d
	ld a, b
	ld [hli], a
	ld [wBuffer6], a
	ld a, c
	ld [hl], a
	ld [wBuffer5], a
.asm_3cd2d
	ret

SynchronizeCheck:
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	and a
	ret nz
	call CheckNeutralGas
	ret z
	call GetTargetAbility
	cp SYNCHRONIZE
	ret nz
	ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
	cp EFFECT_POISON_MULTI_HIT
	jp z, .SynchronizePoison
	cp EFFECT_POISON_HIT
	jp z, .SynchronizePoison
	cp EFFECT_POISON
	jp z, .SynchronizePoison
	cp EFFECT_TOXIC
	jp z, .SynchronizePoison
	cp EFFECT_BURN
	jp z, .SynchronizeBurn
	cp EFFECT_BURN_HIT
	jp z, .SynchronizeBurn
	cp EFFECT_FLAME_WHEEL
	jp z, .SynchronizeBurn
	cp EFFECT_FLARE_BLITZ
	jp z, .SynchronizeBurn
	cp EFFECT_PARALYZE_HIT
	jp z, .SynchronizePar
	cp EFFECT_PARALYZE
	ret nz

.SynchronizePar
	call GetUserAbility
	cp LIMBER
	ret z
	ld hl, SynchronizeText
	call StdBattleTextbox
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_ParalyzeTarget
	jp BattleCommand_SwitchTurnAbilities

.SynchronizeBurn
	call GetUserAbility
	cp WATER_VEIL
	ret z
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
	ld hl, SynchronizeText
	call StdBattleTextbox
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_BurnTarget
	jp BattleCommand_SwitchTurnAbilities

.SynchronizePoison
	call GetUserAbility
	cp IMMUNITY
	ret z
	ld hl, SynchronizeText
	call StdBattleTextbox
	call BattleCommand_SwitchTurnAbilities
	farcall BattleCommand_PoisonTarget
	jp BattleCommand_SwitchTurnAbilities

TransformCopyAbility::
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerAbility
	ld a, [wPlayerAbility]
	ld [wEnemyAbility], a
	ret

.PlayerAbility
	ld a, [wEnemyAbility]
	ld [wPlayerAbility], a
	ret

CheckUserHasEnoughHPAbilities:
	ld hl, wBattleMonHP + 1
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wEnemyMonHP + 1
.ok
	ld a, c
	sub [hl]
	dec hl
	ld a, b
	sbc [hl]
	ret

CheckOpponentWentFirstAbilities:
; Returns a=0, z if user went first
; Returns a=1, nz if opponent went first
	push bc
	ld a, [wEnemyGoesFirst] ; 0 if player went first
	ld b, a
	ldh a, [hBattleTurn] ; 0 if it's the player's turn
	xor b ; 1 if opponent went first
	pop bc
	ret

EnemyAlchemyPower:
	ld a, [wEnemyAbility]
	cp ALCHEMY_POWER
	ret nz
	ld a, [wPlayerAbility]
	cp NEUTRAL_GAS
	ret z
	cp TRACE
	ret z
	cp IMPOSTER
	ret z
	call MoveDelayAbility
	ld a, [wPlayerAbility]
	ld [wEnemyAbility], a
	call Ability_LoadAbilityName
	ld a, b
	and a
	ld hl, EnemyTraceText
	jp StdBattleTextbox

UserAlchemyPower:
	ld a, [wPlayerAbility]
	cp ALCHEMY_POWER
	ret nz
	ld a, [wEnemyAbility]
	cp NEUTRAL_GAS
	ret z
	cp TRACE
	ret z
	cp IMPOSTER
	ret z
	call MoveDelayAbility
	ld a, [wEnemyAbility]
	ld [wPlayerAbility], a
	call Ability_LoadAbilityName
	ld a, b
	and a
	ld hl, PlayerTraceText
	jp StdBattleTextbox

UsePinchBerry:
	call CheckNeutralGas
	jr z, .SkipGluttony
	call GetTargetAbility
	cp UNNERVE
	ret z
	call GetUserAbility
	cp GLUTTONY
	jr nz, .SkipGluttony
	farcall GetHalfMaxHP
	jr .FinishGluttony
.SkipGluttony
	farcall GetQuarterMaxHP
.FinishGluttony
	call CheckUserHasEnoughHPAbilities
	ret c
	call GetUserAbility
	cp CONTRARY
	jp z, ContraryPinchBerries
	callfar GetUserItem
	ld a, b
	cp HELD_ATTACK_UP
	jr z, .LiechiBerry
	cp HELD_DEFENSE_UP
	jr z, .GanlonBerry
	cp HELD_SPEED_UP
	jr z, .SalacBerry
	cp HELD_SP_ATTACK_UP
	jr z, .PetayaBerry
	cp HELD_SP_DEFENSE_UP
	ret nz
	call PinchBerryAnimation
	farcall BattleCommand_SpecialDefenseUp
	jp PinchBerryStatUp
.SalacBerry
	call PinchBerryAnimation
	farcall BattleCommand_SpeedUp
	jp PinchBerryStatUp
.LiechiBerry
	call PinchBerryAnimation
	farcall BattleCommand_AttackUp
	jp PinchBerryStatUp
.GanlonBerry
	call PinchBerryAnimation
	farcall BattleCommand_DefenseUp
	jp PinchBerryStatUp
.PetayaBerry
	call PinchBerryAnimation
	farcall BattleCommand_SpecialAttackUp
PinchBerryStatUp:
	ld a, [wAttackMissed]
	and a
	ret nz
	farcall BattleCommand_StatUpMessage
UnburdenScript:
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

ContraryPinchBerries:
	callfar GetUserItem
	ld a, b
	cp HELD_ATTACK_UP
	jr z, .LiechiBerry
	cp HELD_DEFENSE_UP
	jr z, .GanlonBerry
	cp HELD_SPEED_UP
	jr z, .SalacBerry
	cp HELD_SP_ATTACK_UP
	jr z, .PetayaBerry
	cp HELD_SP_DEFENSE_UP
	ret nz
	call PinchBerryAnimation
	farcall BattleCommand_SpecialDefenseDown
	jp PinchBerryStatDown
.SalacBerry
	call PinchBerryAnimation
	farcall BattleCommand_SpeedDown
	jp PinchBerryStatDown
.LiechiBerry
	call PinchBerryAnimation
	farcall BattleCommand_AttackDown
	jp PinchBerryStatDown
.GanlonBerry
	call PinchBerryAnimation
	farcall BattleCommand_DefenseDown
	jp PinchBerryStatDown
.PetayaBerry
	call PinchBerryAnimation
	farcall BattleCommand_SpecialAttackDown
PinchBerryStatDown:
	ld a, [wAttackMissed]
	and a
	ret nz
	farcall BattleCommand_StatDownMessage
	jr UnburdenScript

PinchBerryAnimation:
	callfar GetUserItem
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	callfar BattleCommand_SwitchTurn
	callfar ItemRecoveryAnim
	callfar ConsumeHeldItem
	callfar BattleCommand_SwitchTurn
	ld hl, PinchBerryText
	jp StdBattleTextbox

Ability_LoadAbilitySlideIn:
;	ldh a, [hBattleTurn]
;	and a
;	jr z, .PlayerAbility
	jp AnimateUserAbility
