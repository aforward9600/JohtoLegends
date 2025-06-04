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
	jr z, .HiddenAbility

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
	jr DoEntranceAbilities

PlayerAbilityFirst:
	ld a, [wPlayerAbility]
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
	dbw INTIMIDATE,       .EnemyIntimidate
	dbw TRACE,            .EnemyTrace
	dbw MOLD_BREAKER,     .EnemyMoldBreaker
	dbw PRESSURE,         .EnemyPressure
	dbw SCREEN_CLEAN,     .EnemyScreenClean
	dbw FRISK,            .EnemyFrisk
	dbw UNNERVE,          .EnemyUnnerve
	dbw CLOUD_NINE,       .EnemyCloudNine
	dbw DROUGHT,          .EnemyDrought
	dbw SNOW_WARNING,     .EnemySnowWarning
	dbw DRIZZLE,          .EnemyDrizzle
	dbw SANDSTREAM,       .EnemySandstream
	dbw DOWNLOAD,         .EnemyDownload
	db -1

.EnemyIntimidate:
	jp EnemyIntimidate

.EnemyTrace:
	jp EnemyTrace

.EnemyMoldBreaker:
	jp MoldBreakerAbilityText

.EnemyPressure:
	jp PressureAbility

.EnemyScreenClean:
	jp ScreenClean

.EnemyFrisk:
	jp FriskAbility

.EnemyUnnerve:
	jp UnnerveAbility

.EnemyCloudNine:
	jp CloudNineAbility

.EnemyDrought:
	jp DroughtScript

.EnemySnowWarning:
	jp SnowWarningScript

.EnemyDrizzle:
	jp DrizzleScript

.EnemySandstream:
	jp SandstreamScript

.EnemyDownload:
	call DownloadAbility
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

EnemyIntimidate:
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

DownloadAbility:
	farcall BattleCommand_SpecialAttackUp
	ld hl, DownloadText
	jp StdBattleTextbox

EnemyTrace:
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

DrizzleScript:
	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	ld a, 5
	ld [wWeatherCount], a
	ld de, ANIM_IN_RAIN
	farcall FarPlayBattleAnimation
	ld hl, DownpourText
	jp StdBattleTextbox

DroughtScript:
	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	ld de, ANIM_IN_SUN
	farcall FarPlayBattleAnimation
	ld hl, SunGotBrightText
	jp StdBattleTextbox

SnowWarningScript:
	ld a, WEATHER_HAIL
	ld [wBattleWeather], a
	ld de, ANIM_IN_HAIL
	farcall FarPlayBattleAnimation
	ld hl, HailStartsText
	jp StdBattleTextbox

SandstreamScript:
	ld a, WEATHER_SANDSTORM
	ld [wBattleWeather], a
	ld de, ANIM_IN_SANDSTORM
	farcall FarPlayBattleAnimation
	ld hl, SandstormBrewedText
	jp StdBattleTextbox

MoldBreakerAbilityText:
	call MoveDelayAbility
	ld hl, BattleText_MoldBreaker
	jp StdBattleTextbox

PressureAbility:
	call MoveDelayAbility
	ld hl, PressureText
	jp StdBattleTextbox

ScreenClean:
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

UnnerveAbility:
	call MoveDelayAbility
	ld hl, UnnerveText
	jp StdBattleTextbox

FriskAbility:
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

CloudNineAbility:
	call MoveDelayAbility
	ld hl, CloudNineText
	jp StdBattleTextbox

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

DefiantUserAbility:
	farcall BattleCommand_AttackUp2
	ld a, [wAttackMissed]
	and a
	ret nz
	call MoveDelayAbility
	ld hl, DefiantUserText
	jp StdBattleTextbox
