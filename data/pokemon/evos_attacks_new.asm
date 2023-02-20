SECTION "Evolution and Attacks 3", ROMX

EvosAttacksPointers3::
	dw BagonEvosAttacks
	dw ShelgonEvosAttacks
	dw SalamenceEvosAttacks
	dw LugiaEvosAttacks
	dw HoOhEvosAttacks
	dw CelebiEvosAttacks
	dw MissingnoEvosAttacks
	dw SwabluEvosAttacks
	dw AltariaEvosAttacks
	dw KotoraEvosAttacks
	dw RaitoraEvosAttacks
	dw GorotoraEvosAttacks
	dw LotadEvosAttacks
	dw LombreEvosAttacks
	dw LudicoloEvosAttacks
	dw FarigirafEvosAttacks
	dw WyrdeerEvosAttacks
	dw UrsalunaEvosAttacks
	dw DudunsparsEvosAttacks
	dw AnnihilapeEvosAttacks

BagonEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, SHELGON
	db 0 ; no more evolutions
	dbw 1, RAGE
	dbw 4, EMBER
	dbw 7, LEER
	dbw 10, BITE
	dbw 13, DRACO_FANG
	dbw 17, HEADBUTT
	dbw 21, FOCUS_ENERGY
	dbw 25, CRUNCH
	dbw 29, DRAGON_CLAW
	dbw 34, ZEN_HEADBUTT
	dbw 39, SCARY_FACE
	dbw 44, FLAMETHROWER
	dbw 49, DOUBLE_EDGE
	db 0 ; no more level-up moves

ShelgonEvosAttacks:
	dbbw EVOLVE_LEVEL, 50, SALAMENCE
	db 0 ; no more evolutions
	dbw 1, RAGE
	dbw 4, EMBER
	dbw 7, LEER
	dbw 10, BITE
	dbw 13, DRACO_FANG
	dbw 17, HEADBUTT
	dbw 21, FOCUS_ENERGY
	dbw 25, CRUNCH
	dbw 32, DRAGON_CLAW
	dbw 35, ZEN_HEADBUTT
	dbw 42, SCARY_FACE
	dbw 49, FLAMETHROWER
	dbw 56, DOUBLE_EDGE
	db 0 ; no more level-up moves

SalamenceEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, FLY
	dbw 1, FLY
	dbw 1, RAGE
	dbw 4, EMBER
	dbw 7, LEER
	dbw 10, BITE
	dbw 13, DRACO_FANG
	dbw 17, HEADBUTT
	dbw 21, FOCUS_ENERGY
	dbw 25, CRUNCH
	dbw 32, DRAGON_CLAW
	dbw 35, ZEN_HEADBUTT
	dbw 42, SCARY_FACE
	dbw 49, FLAMETHROWER
	dbw 63, DOUBLE_EDGE
	dbw 69, OUTRAGE
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WHIRLWIND
	dbw 9, GUST
	dbw 15, DRAGON_RUSH
	dbw 23, EXTRASENSORY
	dbw 29, RAIN_DANCE
	dbw 37, HYDRO_PUMP
	dbw 43, DRAGON_PULSE
	dbw 50, AEROBLAST
	dbw 57, ANCIENTPOWER
	dbw 65, SAFEGUARD
	dbw 71, RECOVER
	dbw 79, FUTURE_SIGHT
	dbw 85, ROOST
	dbw 93, CALM_MIND
	dbw 99, HURRICANE
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, ANCIENTPOWER
	dbw 18, SAFEGUARD
	dbw 27, CALM_MIND
	dbw 36, EXTRASENSORY
	dbw 45, RECOVER
	dbw 54, SACRED_FIRE
	dbw 63, SUNNY_DAY
	dbw 72, INFERNO
	dbw 81, FUTURE_SIGHT
	dbw 90, SKY_ATTACK
	dbw 99, HURRICANE
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEECH_SEED
	dbw 1, CONFUSION
	dbw 1, RECOVER
	dbw 1, HEAL_BELL
	dbw 10, SAFEGUARD
	dbw 19, MAGICAL_LEAF
	dbw 28, ANCIENTPOWER
	dbw 37, BATON_PASS
	dbw 46, MOONBLAST
	dbw 55, ENERGY_BALL
	dbw 64, FUTURE_SIGHT
	dbw 73, SUNNY_DAY
	dbw 82, SOLARBEAM
	dbw 91, PERISH_SONG
	db 0 ; no more level-up moves

MissingnoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HYDRO_PUMP
	dbw 1, HURRICANE
	dbw 1, BRAVE_BIRD
	dbw 1, GIGA_IMPACT
	db 0 ; no more level-up moves

SwabluEvosAttacks:
	dbbw EVOLVE_LEVEL, 35, ALTARIA
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 3, ASTONISH
	dbw 5, SING
	dbw 7, FURY_ATTACK
	dbw 9, SAFEGUARD
	dbw 11, DISARM_VOICE
	dbw 14, MIST
	dbw 17, ROUND_M
	dbw 20, WING_ATTACK
	dbw 23, TAKE_DOWN
	dbw 26, HEAL_BELL
	dbw 30, MIRROR_MOVE
	dbw 34, AIR_SLASH
	dbw 38, DRAGON_PULSE
	dbw 42, PERISH_SONG
	dbw 46, MOONBLAST
	db 0 ; no more level-up moves

AltariaEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, DRAGONBREATH
	dbw 1, DRAGONBREATH
	dbw 1, PECK
	dbw 1, GROWL
	dbw 3, ASTONISH
	dbw 5, SING
	dbw 7, FURY_ATTACK
	dbw 9, SAFEGUARD
	dbw 11, DISARM_VOICE
	dbw 14, MIST
	dbw 17, ROUND_M
	dbw 20, WING_ATTACK
	dbw 23, TAKE_DOWN
	dbw 26, HEAL_BELL
	dbw 30, MIRROR_MOVE
	dbw 34, AIR_SLASH
	dbw 40, DRAGON_PULSE
	dbw 46, PERISH_SONG
	dbw 52, MOONBLAST
	dbw 59, SKY_ATTACK
	db 0 ; no more level-up moves

KotoraEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, RAITORA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, THUNDERSHOCK
	dbw 7, THUNDER_WAVE
	dbw 10, QUICK_ATTACK
	dbw 13, SCARY_FACE
	dbw 18, BITE
	dbw 21, SPARK
	dbw 26, SNARL
	dbw 29, AGILITY
	dbw 34, DISCHARGE
	dbw 37, SLACK_OFF
	dbw 42, THUNDERBOLT
	dbw 45, PLAY_ROUGH
	dbw 50, THUNDER
	dbw 53, MEAN_LOOK
	dbw 58, VOLT_TACKLE
	db 0 ; no more level-up moves

RaitoraEvosAttacks:
	dbbw EVOLVE_LEVEL, 45, GOROTORA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, THUNDERSHOCK
	dbw 7, THUNDER_WAVE
	dbw 10, QUICK_ATTACK
	dbw 13, SCARY_FACE
	dbw 18, BITE
	dbw 21, SPARK
	dbw 26, SNARL
	dbw 29, AGILITY
	dbw 36, DISCHARGE
	dbw 39, SLACK_OFF
	dbw 44, THUNDERBOLT
	dbw 47, PLAY_ROUGH
	dbw 52, THUNDER
	dbw 55, MEAN_LOOK
	dbw 60, VOLT_TACKLE
	db 0 ; no more level-up moves

GorotoraEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, CRUNCH
	dbw 1, CRUNCH
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, THUNDERSHOCK
	dbw 7, THUNDER_WAVE
	dbw 10, QUICK_ATTACK
	dbw 13, SCARY_FACE
	dbw 18, BITE
	dbw 21, SPARK
	dbw 26, SNARL
	dbw 29, AGILITY
	dbw 36, DISCHARGE
	dbw 39, SLACK_OFF
	dbw 44, THUNDERBOLT
	dbw 48, NIGHT_SLASH
	dbw 50, PLAY_ROUGH
	dbw 55, THUNDER
	dbw 58, MEAN_LOOK
	dbw 63, VOLT_TACKLE
	db 0 ; no more level-up moves

LotadEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, LOMBRE
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 3, GROWL
	dbw 6, ABSORB
	dbw 9, BUBBLE
	dbw 12, GRASSWHISTLE
	dbw 15, MIST
	dbw 18, MEGA_DRAIN
	dbw 21, BUBBLEBEAM
	dbw 24, QUIVER_DANCE
	dbw 27, RAIN_DANCE
	dbw 30, GIGA_DRAIN
	dbw 33, ZEN_HEADBUTT
	dbw 36, ENERGY_BALL
	db 0 ; no more level-up moves

LombreEvosAttacks:
	dbbw EVOLVE_ITEM, WATER_STONE, LUDICOLO
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 3, GROWL
	dbw 6, ABSORB
	dbw 9, BUBBLE
	dbw 12, FURY_SWIPES
	dbw 16, FAKE_OUT
	dbw 20, AQUA_RING
	dbw 24, BUBBLEBEAM
	dbw 28, QUIVER_DANCE
	dbw 32, ROUND_M
	dbw 36, KNOCK_OFF
	dbw 40, ZEN_HEADBUTT
	dbw 44, HYDRO_PUMP
	db 0 ; no more level-up moves

LudicoloEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, GROWL
	dbw 1, MEGA_DRAIN
	dbw 1, AQUA_RING
	db 0 ; no more level-up moves

FarigirafEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, CONFUSION
	dbw 1, ASTONISH
	dbw 5, ODOR_SLEUTH
	dbw 10, PAYBACK
	dbw 14, STOMP
	dbw 19, PSYBEAM
	dbw 23, AGILITY
	dbw 28, DOUBLE_HIT_M
	dbw 32, ZEN_HEADBUTT
	dbw 37, CRUNCH
	dbw 41, BATON_PASS
	dbw 46, NASTY_PLOT
	dbw 50, PSYCHIC_M
	db 0 ; no more level-up moves

WyrdeerEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 3, LEER
	dbw 7, ASTONISH
	dbw 10, HYPNOSIS
	dbw 13, STOMP
	dbw 16, SAND_ATTACK
	dbw 21, TAKE_DOWN
	dbw 23, CONFUSE_RAY
	dbw 27, CALM_MIND
	dbw 33, RECOVER
	dbw 38, ZEN_HEADBUTT
	dbw 43, JUMP_KICK
	dbw 49, PROTECT
	dbw 50, DREAM_EATER
	dbw 55, GIGA_IMPACT
	dbw 62, MEGAHORN
	db 0 ; no more level-up moves

UrsalunaEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, HEADLONGRUSH
	dbw 1, HEADLONGRUSH
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 1, GROWL
	dbw 1, LICK
	dbw 8, FURY_SWIPES
	dbw 13, FAINT_ATTACK
	dbw 17, SWEET_SCENT
	dbw 22, SLASH
	dbw 25, PLAY_NICE
	dbw 29, PLAY_ROUGH
	dbw 35, SCARY_FACE
	dbw 41, REST
	dbw 41, SNORE
	dbw 48, CRUNCH
	dbw 56, THRASH
	dbw 64, HAMMER_ARM
	db 0 ; no more level-up moves

DudunsparsEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, RAGE
	dbw 1, DEFENSE_CURL
	dbw 3, ROLLOUT
	dbw 6, LICK
	dbw 8, DISARM_VOICE
	dbw 11, SCREECH
	dbw 13, MUD_SLAP
	dbw 16, SING
	dbw 18, ANCIENTPOWER
	dbw 21, BODY_SLAM
	dbw 23, DRILL_RUN
	dbw 26, ROOST
	dbw 28, DRAININGKISS
	dbw 31, COIL
	dbw 33, DIG
	dbw 39, GLARE
	dbw 43, DOUBLE_EDGE
	dbw 46, EARTHQUAKE
	dbw 48, PLAY_ROUGH
	dbw 51, DRAGON_RUSH
	dbw 53, ENDURE
	dbw 55, MOONBLAST
	dbw 58, GIGA_IMPACT
	db 0 ;  no more level-up moves

AnnihilapeEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SHADOW_PUNCH
	dbw 1, SHADOW_PUNCH
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 1, LOW_KICK
	dbw 1, FOCUS_ENERGY
	dbw 5, FURY_SWIPES
	dbw 8, KARATE_CHOP
	dbw 12, PURSUIT
	dbw 15, SEISMIC_TOSS
	dbw 19, SWAGGER
	dbw 22, CROSS_CHOP
	dbw 26, PAYBACK
	dbw 30, LOW_SWEEP
	dbw 35, THRASH
	dbw 39, CLOSE_COMBAT
	dbw 44, SCREECH
	dbw 48, HIHORSEPOWER
	dbw 53, OUTRAGE
	dbw 57, SUPERPOWER
	db 0 ; no more level-up moves
