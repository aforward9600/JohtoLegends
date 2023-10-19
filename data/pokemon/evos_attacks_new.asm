SECTION "Evolution and Attacks 3", ROMX

EvosAttacksPointers3::
	dw RaikouEvosAttacks
	dw EnteiEvosAttacks
	dw SuicuneEvosAttacks
	dw LarvitarEvosAttacks
	dw PupitarEvosAttacks
	dw TyranitarEvosAttacks
	dw GibleEvosAttacks
	dw GabiteEvosAttacks
	dw GarchompEvosAttacks
	dw BagonEvosAttacks
	dw ShelgonEvosAttacks
	dw SalamenceEvosAttacks
	dw LugiaEvosAttacks
	dw HoOhEvosAttacks
	dw CelebiEvosAttacks
	dw NownEvosAttack
	dw MissingnoEvosAttacks

RaikouEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 8, THUNDERSHOCK
	dbw 15, ROAR
	dbw 22, QUICK_ATTACK
	dbw 29, SPARK
	dbw 36, REFLECT
	dbw 43, CRUNCH
	dbw 50, THUNDER_FANG
	dbw 57, DISCHARGE
	dbw 64, EXTRASENSORY
	dbw 71, RAIN_DANCE
	dbw 78, CALM_MIND
	dbw 85, THUNDER
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 8, EMBER
	dbw 15, ROAR
	dbw 22, FLAME_WHEEL
	dbw 29, STOMP
	dbw 36, FLAMETHROWER
	dbw 43, SWAGGER
	dbw 50, FIRE_FANG
	dbw 57, LAVA_PLUME
	dbw 64, ZEN_HEADBUTT
	dbw 71, FLARE_BLITZ
	dbw 78, BULK_UP
	dbw 85, SACRED_FIRE
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, LEER
	dbw 8, BUBBLEBEAM
	dbw 15, RAIN_DANCE
	dbw 22, GUST
	dbw 29, AURORA_BEAM
	dbw 36, MIST
	dbw 43, MIRROR_COAT
	dbw 50, ICE_FANG
	dbw 57, AGILITY
	dbw 64, EXTRASENSORY
	dbw 71, HYDRO_PUMP
	dbw 78, CALM_MIND
	dbw 85, BLIZZARD
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, PUPITAR
	db 0 ; no more evolutions
	dbw 1, STONE_BASH
	dbw 1, LEER
	dbw 6, SANDSTORM
	dbw 8, ROCK_THROW
	dbw 10, SCREECH
	dbw 14, BITE
	dbw 19, ROCK_SLIDE
	dbw 23, SCARY_FACE
	dbw 28, THRASH
	dbw 32, DARK_PULSE
	dbw 37, PAYBACK
	dbw 41, CRUNCH
	dbw 46, EARTHQUAKE
	dbw 50, STONE_EDGE
	dbw 55, HYPER_BEAM
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, TYRANITAR
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, BULLDOZE
	dbw 1, BULLDOZE
	dbw 1, ROCK_THROW
	dbw 1, LEER
	dbw 5, SANDSTORM
	dbw 10, SCREECH
	dbw 14, BITE
	dbw 19, ROCK_SLIDE
	dbw 25, SCARY_FACE
	dbw 30, THRASH
	dbw 34, DARK_PULSE
	dbw 41, PAYBACK
	dbw 47, CRUNCH
	dbw 54, EARTHQUAKE
	dbw 60, STONE_EDGE
	dbw 67, HYPER_BEAM
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, CLOSE_COMBAT
	dbw 1, CLOSE_COMBAT
	dbw 1, ROCK_THROW
	dbw 1, LEER
	dbw 5, SANDSTORM
	dbw 10, SCREECH
	dbw 14, BITE
	dbw 19, ROCK_SLIDE
	dbw 23, SCARY_FACE
	dbw 30, THRASH
	dbw 34, DARK_PULSE
	dbw 43, PAYBACK
	dbw 50, CRUNCH
	dbw 57, EARTHQUAKE
	dbw 63, STONE_EDGE
	dbw 73, CATASTROPHE
	dbw 82, GIGA_IMPACT
	db 0 ; no more level-up moves

GibleEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, GABITE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 3, SAND_ATTACK
	dbw 7, DRAGON_RAGE
	dbw 13, SANDSTORM
	dbw 15, TAKE_DOWN
	dbw 19, SAND_TOMB
	dbw 25, SLASH
	dbw 27, DRAGON_CLAW
	dbw 31, DIG
	dbw 37, DRAGON_RUSH
	db 0 ; no more level-up moves

GabiteEvosAttacks:
	dbbw EVOLVE_LEVEL, 48, GARCHOMP
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, DUAL_CHOP
	dbw 1, DUAL_CHOP
	dbw 1, TACKLE
	dbw 3, SAND_ATTACK
	dbw 7, DRAGON_RAGE
	dbw 13, SANDSTORM
	dbw 15, TAKE_DOWN
	dbw 19, SAND_TOMB
	dbw 28, SLASH
	dbw 33, DRAGON_CLAW
	dbw 40, DIG
	dbw 49, DRAGON_RUSH
	db 0 ; no more level-up moves

GarchompEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, CRUNCH
	dbw 1, CRUNCH
	dbw 1, TACKLE
	dbw 3, SAND_ATTACK
	dbw 7, DRAGON_RAGE
	dbw 13, SANDSTORM
	dbw 15, TAKE_DOWN
	dbw 19, SAND_TOMB
	dbw 28, SLASH
	dbw 33, DRAGON_CLAW
	dbw 40, DIG
	dbw 55, DRAGON_RUSH
	db 0 ; no more level-up moves

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
	dbw 54, DUALWINGBEAT
	dbw 63, DOUBLE_EDGE
	dbw 69, OUTRAGE
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WHIRLWIND
	dbw 9, GUST
	dbw 15, HURRICANE
	dbw 23, EXTRASENSORY
	dbw 29, RAIN_DANCE
	dbw 37, HYDRO_PUMP
	dbw 43, AEROBLAST
	dbw 50, PSYCHIC_M
	dbw 57, ANCIENTPOWER
	dbw 65, SAFEGUARD
	dbw 71, RECOVER
	dbw 79, FUTURE_SIGHT
	dbw 85, DOUBLE_EDGE
	dbw 93, CALM_MIND
	dbw 99, SKY_ATTACK
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WHIRLWIND
	dbw 9, GUST
	dbw 15, BRAVE_BIRD
	dbw 23, EXTRASENSORY
	dbw 29, SUNNY_DAY
	dbw 37, FIRE_BLAST
	dbw 43, SACRED_FIRE
	dbw 50, DUALWINGBEAT
	dbw 57, ANCIENTPOWER
	dbw 65, SAFEGUARD
	dbw 71, RECOVER
	dbw 79, FUTURE_SIGHT
	dbw 85, DOUBLE_EDGE
	dbw 93, CALM_MIND
	dbw 99, SKY_ATTACK
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

NownEvosAttack:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, HIDDEN_POWER
	dbw 1, LEER
	dbw 1, LIGHT_SCREEN
	dbw 1, REFLECT
	dbw 35, DAZZLINGLEAM
	dbw 40, MIRROR_COAT
	dbw 45, EXTRASENSORY
	dbw 50, RECOVER
	dbw 55, PSYCHIC_M
	dbw 60, AURA_SPHERE
	dbw 65, HYPNOSIS
	dbw 70, DREAM_EATER
	dbw 75, COSMIC_POWER
	dbw 80, HYPER_BEAM
	db 0 ; no more level-up moves

MissingnoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HYDRO_PUMP
	dbw 1, HURRICANE
	dbw 1, BRAVE_BIRD
	dbw 1, GIGA_IMPACT
	db 0 ; no more level-up moves
