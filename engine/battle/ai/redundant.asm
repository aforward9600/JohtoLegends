AI_Redundant:
; Check if move effect c will fail because it's already been used.
; Return z if the move is a good choice.
; Return nz if the move is a bad choice.
	ld a, c
	ld de, 3
	ld hl, .Moves
	call IsInArray
	jp nc, .NotRedundant
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Moves:
	dbw EFFECT_DREAM_EATER,  .DreamEater
	dbw EFFECT_HEAL,         .Heal
	dbw EFFECT_LIGHT_SCREEN, .LightScreen
	dbw EFFECT_MIST,         .Mist
	dbw EFFECT_FOCUS_ENERGY, .FocusEnergy
	dbw EFFECT_CONFUSE,      .Confuse
	dbw EFFECT_TRANSFORM,    .Transform
	dbw EFFECT_REFLECT,      .Reflect
	dbw EFFECT_SUBSTITUTE,   .Substitute
	dbw EFFECT_LEECH_SEED,   .LeechSeed
	dbw EFFECT_DISABLE,      .Disable
	dbw EFFECT_ENCORE,       .Encore
	dbw EFFECT_SNORE,        .Snore
	dbw EFFECT_SLEEP_TALK,   .SleepTalk
	dbw EFFECT_MEAN_LOOK,    .MeanLook
	dbw EFFECT_SPIKES,       .Spikes
	dbw EFFECT_FORESIGHT,    .Foresight
	dbw EFFECT_PERISH_SONG,  .PerishSong
	dbw EFFECT_SANDSTORM,    .Sandstorm
	dbw EFFECT_ATTRACT,      .Attract
	dbw EFFECT_SAFEGUARD,    .Safeguard
	dbw EFFECT_RAIN_DANCE,   .RainDance
	dbw EFFECT_SUNNY_DAY,    .SunnyDay
	dbw EFFECT_TELEPORT,     .Teleport
	dbw EFFECT_MORNING_SUN,  .MorningSun
	dbw EFFECT_SYNTHESIS,    .Synthesis
	dbw EFFECT_MOONLIGHT,    .Moonlight
	dbw EFFECT_SWAGGER,      .Swagger
	dbw EFFECT_FUTURE_SIGHT, .FutureSight
	dbw EFFECT_HAIL,         .Hail
	dbw EFFECT_AQUA_RING,    .AquaRing
	dbw EFFECT_ROOST,        .Roost
	dbw EFFECT_FAKE_OUT,     .FakeOut
	dbw EFFECT_LEECH_HIT,    .LeechHit
	dbw EFFECT_SLEEP,        .Sleep
	dbw EFFECT_POISON,       .Poison
	dbw EFFECT_PARALYZE,     .Paralyze
	db -1

.LightScreen:
	ld a, [wEnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	ret

.Mist:
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_MIST, a
	ret

.FocusEnergy:
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_FOCUS_ENERGY, a
	ret

.Confuse:
	; not "redundant" per se,
	; but don't use when player is substituted
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	ret nz
	ld a, [wPlayerScreens]
	bit SCREENS_SAFEGUARD, a
	ret

.Transform:
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	ret

.Reflect:
	ld a, [wEnemyScreens]
	bit SCREENS_REFLECT, a
	ret

.Substitute:
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ret

.LeechSeed:
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	ret

.Disable:
	ld a, [wPlayerDisableCount]
	and a
	ret

.Encore:
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_ENCORED, a
	ret

.Snore:
.SleepTalk:
	ld a, [wEnemyMonStatus]
	and SLP
	jp z, .Redundant
	jp .NotRedundant

.MeanLook:
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	ret

.Spikes:
	ld a, [wPlayerScreens]
	bit SCREENS_SPIKES, a
	ret

.Foresight:
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_IDENTIFIED, a
	ret

.PerishSong:
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_PERISH, a
	ret

.Sandstorm:
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr z, .Redundant
	jr .NotRedundant

.Attract:
	; not "redundant" per se,
	; but don't use when player is substituted
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	farcall CheckOppositeGender
	jr c, .Redundant
	ld a, [wPlayerSubStatus1]
	bit SUBSTATUS_IN_LOVE, a
	ret

.Safeguard:
	ld a, [wEnemyScreens]
	bit SCREENS_SAFEGUARD, a
	ret

.RainDance:
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jr z, .Redundant
	jr .NotRedundant

.SunnyDay:
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr z, .Redundant
	jr .NotRedundant

.DreamEater:
	ld a, [wBattleMonStatus]
	and SLP
	jr z, .Redundant
	jr .NotRedundant

.Swagger:
	; not "redundant" per se,
	; but don't use when player is substituted
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
	ld a, [wPlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	ret

.FutureSight:
	ld a, [wEnemyFutureSightCount]
	and a
	ret

.Hail:
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	jr z, .Redundant
	jr .NotRedundant

.AquaRing:
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_AQUA_RING, a
	ret

.Sleep:
.Poison:
.Paralyze:
.LeechHit:
	; not "redundant" per se,
	; but don't use when player is substituted
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ret

.Heal:
.MorningSun:
.Synthesis:
.Moonlight:
.Roost:
	farcall AICheckEnemyMaxHP
	jr nc, .NotRedundant

.FakeOut:
	ld a, [wPlayerTurnsTaken]
	and a
	ret

.Teleport:
.Redundant:
	ld a, 1
	and a
	ret

.NotRedundant:
	xor a
	ret
