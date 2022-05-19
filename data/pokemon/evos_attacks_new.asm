SECTION "Evolution and Attacks 3", ROMX

EvosAttacksPointers3::
	dw BagonEvosAttacks
	dw ShelgonEvosAttacks
	dw SalamenceEvosAttacks
	dw LugiaEvosAttacks
	dw HoOhEvosAttacks
	dw CelebiEvosAttacks
	dw MissingnoEvosAttacks

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
