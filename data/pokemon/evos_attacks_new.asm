SECTION "Evolution and Attacks 3", ROMX

EvosAttacksPointers3::
	dw LaironEvosAttacks
	dw AggronEvosAttacks
	dw MedititeEvosAttacks
	dw MedichamEvosAttacks
	dw ElectrikeEvosAttacks
	dw ManectricEvosAttacks
	dw BudewEvoseAttacks
	dw RoseliaEvosAttacks
	dw RoseradeEvosAttacks
	dw CarvanhaEvosAttacks
	dw SharpedoEvosAttacks
	dw NumelEvosAttacks
	dw CameruptEvosAttacks
	dw TrapinchEvosAttacks
	dw VibravaEvosAttacks
	dw FlygonEvosAttacks
	dw CacneaEvosAttacks
	dw CacturneEvosAttacks
	dw SwabluEvosAttacks
	dw AltariaEvosAttacks
	dw FeebasEvosAttacks
	dw MiloticEvosAttacks
	dw DuskullEvosAttacks
	dw DusclopsEvosAttacks
	dw DusknoirEvosAttacks
	dw AbsolEvosAttacks
	dw SnoruntEvosAttacks
	dw GlalieEvosAttacks
	dw FroslassEvosAttacks
	dw BagonEvosAttacks
	dw ShelgonEvosAttacks
	dw SalamenceEvosAttacks
	dw BeldumEvosAttacks
	dw MetangEvosAttacks
	dw MetagrossEvosAttacks
	dw BronzorEvosAttacks
	dw BronzongEvosAttacks
	dw SpiritombEvosAttacks
	dw GibleEvosAttacks
	dw GabiteEvosAttacks
	dw GarchompEvosAttacks
	dw RioluEvosAttacks
	dw LucarioEvosAttacks
	dw SkorupiEvosAttacks
	dw DrapionEvosAttacks
	dw CroagunkEvosAttacks
	dw ToxicroakEvosAttacks
	dw RegirockEvosAttacks
	dw RegiceEvosAttacks
	dw RegisteelEvosAttacks
	dw RegielekiEvosAttacks
	dw RegidragoEvosAttacks
	dw RegigigasEvosAttacks
	dw NownEvosAttack
	dw MissingnoEvosAttacks
	dw TaurosPFireEvosAttacks
	dw TaurosPWaterEvosAttacks

LaironEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, AGGRON
	db 0 ; no more evolutions
	dbw 1, HARDEN
	dbw 1, TACKLE
	dbw 4, MUD_SLAP
	dbw 7, HEADBUTT
	dbw 10, METAL_CLAW
	dbw 13, ROCK_TOMB
	dbw 16, PROTECT
	dbw 19, ROAR
	dbw 22, IRON_HEAD
	dbw 25, ROCK_SLIDE
	dbw 28, TAKE_DOWN
	dbw 31, METAL_SOUND
	dbw 35, IRON_TAIL
	dbw 39, IRON_DEFENSE
	dbw 43, DOUBLE_EDGE
	dbw 47, ROCK_POLISH
	dbw 51, STEEL_SLICE
	dbw 55, STONE_EDGE
	db 0 ; no more level-up moves

AggronEvosAttacks:
	db 0 ; no more evolutions
if DEF(_FAITHFUL)
	dbw LEARN_EVO_MOVE, STONE_EDGE
	dbw 1, STONE_EDGE
elif DEF(_NOPSS)
	dbw LEARN_EVO_MOVE, STONE_EDGE
	dbw 1, STONE_EDGE
else
	dbw LEARN_EVO_MOVE, DRAGON_RUSH
	dbw 1, DRAGON_RUSH
endc
	dbw 1, HARDEN
	dbw 1, TACKLE
	dbw 4, MUD_SLAP
	dbw 7, HEADBUTT
	dbw 10, METAL_CLAW
	dbw 13, ROCK_TOMB
	dbw 16, PROTECT
	dbw 19, ROAR
	dbw 22, IRON_HEAD
	dbw 25, ROCK_SLIDE
	dbw 28, TAKE_DOWN
	dbw 31, METAL_SOUND
	dbw 35, IRON_TAIL
	dbw 39, IRON_DEFENSE
	dbw 45, DOUBLE_EDGE
if DEF(_FAITHFUL)
	dbw 51, ROCK_POLISH
elif DEF(_NOPSS)
	dbw 51, ROCK_POLISH
else
	dbw 51, DRAGON_DANCE
endc
	dbw 57, STEEL_SLICE
if DEF(_FAITHFUL)
	dbw 63, ROCK_WRECKER
elif DEF(_NOPSS)
	dbw 63, ROCK_WRECKER
else
	dbw 63, OUTRAGE
endc
	db 0 ; no more level-up moves

MedititeEvosAttacks:
	dbbw EVOLVE_LEVEL, 37, MEDICHAM
	db 0 ; no more evolutions
	dbw 1, ROCK_SMASH
	dbw 4, MEDITATE
	dbw 7, CONFUSION
	dbw 9, DETECT
	dbw 12, ENDURE
	dbw 15, HEADBUTT
	dbw 17, FORCE_PALM
	dbw 20, HIDDEN_POWER
	dbw 23, CALM_MIND
	dbw 25, MIND_READER
	dbw 28, HI_JUMP_KICK
	dbw 31, PSYCH_UP
	dbw 33, ZEN_HEADBUTT
	dbw 36, COUNTER
	dbw 39, REVERSAL
	dbw 41, RECOVER
	dbw 44, CLOSE_COMBAT
	db 0 ; no more level-up moves

MedichamEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ROCK_SMASH
	dbw 4, MEDITATE
	dbw 7, CONFUSION
	dbw 9, DETECT
	dbw 12, ENDURE
	dbw 15, HEADBUTT
	dbw 17, FORCE_PALM
	dbw 20, HIDDEN_POWER
	dbw 23, CALM_MIND
	dbw 25, MIND_READER
	dbw 28, HI_JUMP_KICK
	dbw 31, PSYCH_UP
	dbw 33, ZEN_HEADBUTT
	dbw 36, COUNTER
	dbw 42, REVERSAL
	dbw 47, RECOVER
	dbw 53, CLOSE_COMBAT
	db 0 ; no more level-up moves

ElectrikeEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, MANECTRIC
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, THUNDER_WAVE
	dbw 4, LEER
	dbw 7, HOWL
	dbw 10, QUICK_ATTACK
	dbw 13, SPARK
	dbw 16, ODOR_SLEUTH
	dbw 19, DISCHARGE
	dbw 24, SNARL
	dbw 29, THUNDERBOLT
	dbw 34, ROAR
	dbw 39, WILD_CHARGE
	dbw 44, RAIN_DANCE
	dbw 49, THUNDER
	db 0 ; no more level-up moves

ManectricEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, THUNDER_WAVE
	dbw 4, LEER
	dbw 7, HOWL
	dbw 10, QUICK_ATTACK
	dbw 13, SPARK
	dbw 16, ODOR_SLEUTH
	dbw 19, DISCHARGE
	dbw 24, SNARL
	dbw 30, THUNDERBOLT
	dbw 36, ROAR
	dbw 42, WILD_CHARGE
	dbw 48, RAIN_DANCE
	dbw 54, CRUNCH
	dbw 60, THUNDER
	db 0 ; no more level-up moves

BudewEvoseAttacks:
	dbbw EVOLVE_HAPPINESS, TR_MORNDAY, ROSELIA
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 4, GROWTH
	dbw 7, ACID
	dbw 10, STUN_SPORE
	dbw 13, MEGA_DRAIN
	dbw 16, SLEEP_POWDER
	db 0 ; no more level-up moves

RoseliaEvosAttacks:
	dbbw EVOLVE_ITEM, SHINY_STONE, ROSERADE
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 4, GROWTH
	dbw 7, POISON_STING
	dbw 10, STUN_SPORE
	dbw 13, MEGA_DRAIN
	dbw 16, LEECH_SEED
	dbw 19, MAGICAL_LEAF
	dbw 22, GRASSWHISTLE
	dbw 25, GIGA_DRAIN
	dbw 28, SPIKES
	dbw 31, SWEET_SCENT
	dbw 34, SLUDGE_BOMB
	dbw 37, PETAL_BLIZZ
	dbw 40, TOXIC
	dbw 43, HEAL_BELL
	dbw 46, SYNTHESIS
	dbw 50, SOLARBEAM
	db 0 ; no more level-up moves

RoseradeEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, PETAL_DANCE
	dbw 1, PETAL_DANCE
	dbw 1, MEGA_DRAIN
	dbw 1, MAGICAL_LEAF
	dbw 1, SLUDGE_BOMB
	db 0 ; no more level-up moves

CarvanhaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, SHARPEDO
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 4, BITE
	dbw 4, RAGE
	dbw 8, FOCUS_ENERGY
	dbw 11, AQUA_JET
	dbw 15, PAYBACK
	dbw 18, SCREECH
	dbw 22, SWAGGER
	dbw 25, ICE_FANG
	dbw 29, SCARY_FACE
	dbw 32, POISON_FANG
	dbw 36, CRUNCH
	dbw 39, AGILITY
	dbw 43, TAKE_DOWN
	dbw 47, WAVE_CRASH
	db 0 ; no more level-up moves

SharpedoEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SLASH
	dbw 1, SLASH
	dbw 1, NIGHT_SLASH
	dbw 1, LEER
	dbw 4, BITE
	dbw 4, RAGE
	dbw 8, FOCUS_ENERGY
	dbw 11, AQUA_JET
	dbw 15, PAYBACK
	dbw 18, SCREECH
	dbw 22, SWAGGER
	dbw 25, ICE_FANG
	dbw 29, SCARY_FACE
	dbw 34, POISON_FANG
	dbw 40, CRUNCH
	dbw 45, AGILITY
	dbw 51, SKULL_BASH
	dbw 56, NIGHT_SLASH
	dbw 62, WAVE_CRASH
	db 0 ; no more level-up moves

NumelEvosAttacks:
	dbbw EVOLVE_LEVEL, 33, CAMERUPT
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, EMBER
	dbw 8, FOCUS_ENERGY
	dbw 12, MAGNITUDE
	dbw 15, FLAME_BURST
	dbw 19, AMNESIA
	dbw 22, LAVA_PLUME
	dbw 26, EARTH_POWER
	dbw 29, CURSE
	dbw 31, TAKE_DOWN
	dbw 36, SLACK_OFF
	dbw 40, EARTHQUAKE
	dbw 43, FLAMETHROWER
	dbw 47, DOUBLE_EDGE
	db 0 ; no more level-up moves

CameruptEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, ROCK_SLIDE
	dbw 1, ROCK_SLIDE
	dbw 1, GROWL
	dbw 1, TACKLE
	dbw 5, EMBER
	dbw 8, FOCUS_ENERGY
	dbw 12, MAGNITUDE
	dbw 15, FLAME_BURST
	dbw 19, AMNESIA
	dbw 22, LAVA_PLUME
	dbw 26, EARTH_POWER
	dbw 29, CURSE
	dbw 31, TAKE_DOWN
	dbw 39, SLACK_OFF
	dbw 46, EARTHQUAKE
	dbw 52, FLARE_BLITZ
	dbw 59, FISSURE
	db 0 ; no more level-up moves

TrapinchEvosAttacks:
	dbbw EVOLVE_LEVEL, 35, VIBRAVA
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 1, BITE
	dbw 1, FAINT_ATTACK
	dbw 5, MUD_SLAP
	dbw 8, BULLDOZE
	dbw 12, SAND_TOMB
	dbw 15, ROCK_TOMB
	dbw 19, DIG
	dbw 22, CRUNCH
	dbw 26, EARTH_POWER
	dbw 29, HEADBUTT
	dbw 33, EARTHQUAKE
	dbw 36, SANDSTORM
	dbw 40, SUPERPOWER
	dbw 43, HYPER_BEAM
	dbw 47, FISSURE
	db 0 ; no more level-up moves

VibravaEvosAttacks:
	dbbw EVOLVE_LEVEL, 45, FLYGON
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, DRAGONBREATH
	dbw 1, DRAGONBREATH
	dbw 1, SAND_ATTACK
	dbw 1, BITE
	dbw 1, FAINT_ATTACK
	dbw 5, MUD_SLAP
	dbw 8, BULLDOZE
	dbw 12, SAND_TOMB
	dbw 15, ROCK_TOMB
	dbw 19, DIG
	dbw 22, CRUNCH
	dbw 26, EARTH_POWER
	dbw 29, HEADBUTT
	dbw 33, EARTHQUAKE
	dbw 36, SANDSTORM
	dbw 40, ROUND_M
	dbw 43, HYPER_BEAM
	dbw 47, HYPER_VOICE
	db 0 ; no more level-up moves

FlygonEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, DRAGON_CLAW
	dbw 1, DRAGON_CLAW
	dbw 1, SAND_ATTACK
	dbw 1, BITE
	dbw 1, FAINT_ATTACK
	dbw 5, MUD_SLAP
	dbw 8, BULLDOZE
	dbw 12, SAND_TOMB
	dbw 15, ROCK_TOMB
	dbw 19, DIG
	dbw 22, CRUNCH
	dbw 26, EARTH_POWER
	dbw 29, HEADBUTT
	dbw 33, EARTHQUAKE
	dbw 36, SANDSTORM
	dbw 40, ROUND_M
	dbw 43, HYPER_BEAM
	dbw 47, DRAGON_RUSH
	db 0 ; no more level-up moves

FeebasEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, MILOTIC
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 15, TACKLE
	dbw 30, FLAIL
	db 0 ; no more level-up moves

MiloticEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, WATER_PULSE
	dbw 1, WATER_PULSE
	dbw 1, WATER_GUN
	dbw 1, WRAP
	dbw 7, HEAL_BELL
	dbw 11, DISARM_VOICE
	dbw 14, TWISTER
	dbw 17, AQUA_RING
	dbw 21, FLATTER
	dbw 24, DRAGON_TAIL
	dbw 27, RECOVER
	dbw 31, AQUA_TAIL
	dbw 34, ATTRACT
	dbw 37, SAFEGUARD
	dbw 41, COIL
	dbw 44, HYDRO_PUMP
	dbw 47, RAIN_DANCE
	db 0 ; no more level-up moves

AbsolEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 4, LEER
	dbw 7, QUICK_ATTACK
	dbw 10, PURSUIT
	dbw 13, HOWL
	dbw 16, BITE
	dbw 19, DOUBLE_TEAM
	dbw 22, SLASH
	dbw 25, SWORDS_DANCE
	dbw 29, NIGHT_SLASH
	dbw 33, DETECT
	dbw 37, PSYCHO_CUT
	dbw 41, NASTY_PLOT
	dbw 45, SUCKER_PUNCH
	dbw 49, RAZOR_WIND
	dbw 53, FUTURE_SIGHT
	dbw 57, PERISH_SONG
	db 0 ; no more level-up moves

SpiritombEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CURSE
	dbw 1, PURSUIT
	dbw 1, CONFUSE_RAY
	dbw 1, SPITE
	dbw 1, SHADOW_SNEAK
	dbw 7, FAINT_ATTACK
	dbw 13, HYPNOSIS
	dbw 19, DREAM_EATER
	dbw 25, OMINOUS_WIND
	dbw 31, SUCKER_PUNCH
	dbw 37, NASTY_PLOT
	dbw 43, DESTINY_BOND
	dbw 49, DARK_PULSE
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

RioluEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_MORNDAY, LUCARIO
	db 0 ; no more evolutions
	dbw 1, FORESIGHT
	dbw 1, QUICK_ATTACK
	dbw 1, ENDURE
	dbw 6, COUNTER
	dbw 11, FAKE_OUT
	dbw 15, KARATE_CHOP
	dbw 19, MIMIC
	dbw 24, SCREECH
	dbw 29, REVERSAL
	dbw 47, NASTY_PLOT
	dbw 50, DESTINY_BOND
	db 0 ; no more level-up moves

LucarioEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, AURA_SPHERE
	dbw 1, AURA_SPHERE
	dbw 1, FORESIGHT
	dbw 1, QUICK_ATTACK
	dbw 1, ENDURE
	dbw 6, COUNTER
	dbw 11, FAKE_OUT
	dbw 15, POWERUPPUNCH
	dbw 19, SWORDS_DANCE
	dbw 24, METAL_SOUND
	dbw 29, BONE_RUSH
	dbw 33, DETECT
	dbw 37, MIRROR_COAT
	dbw 42, WORK_UP
	dbw 47, CALM_MIND
	dbw 51, MORNING_SUN
	dbw 55, CLOSE_COMBAT
	dbw 60, DRAGON_PULSE
	dbw 65, EXTREMESPEED
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

BeldumEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, METANG
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 10, CONFUSION
	dbw 15, METAL_CLAW
	db 0 ; no more level-up moves

MetangEvosAttacks:
	dbbw EVOLVE_LEVEL, 45, METAGROSS
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, BULLET_PUNCH
	dbw 1, BULLET_PUNCH
	dbw 1, TACKLE
	dbw 10, CONFUSION
	dbw 15, METAL_CLAW
	dbw 26, PURSUIT
	dbw 29, FORESIGHT
	dbw 32, ZEN_HEADBUTT
	dbw 35, SCARY_FACE
	dbw 38, PSYCHIC_M
	dbw 41, AGILITY
	dbw 44, METEOR_MASH
	dbw 47, IRON_DEFENSE
	dbw 50, HYPER_BEAM
	db 0 ; no more level-up moves

MetagrossEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, HAMMER_ARM
	dbw 1, HAMMER_ARM
	dbw 1, BULLET_PUNCH
	dbw 1, TACKLE
	dbw 10, CONFUSION
	dbw 15, METAL_CLAW
	dbw 26, PURSUIT
	dbw 29, FORESIGHT
	dbw 32, ZEN_HEADBUTT
	dbw 35, SCARY_FACE
	dbw 38, PSYCHIC_M
	dbw 41, AGILITY
	dbw 44, METEOR_MASH
	dbw 52, IRON_DEFENSE
	dbw 60, HYPER_BEAM
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

RegirockEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EXPLOSION
	dbw 1, STOMP
	dbw 7, ROCK_THROW
	dbw 13, CHARGE_BEAM
	dbw 19, BULLDOZE
	dbw 25, CURSE
	dbw 31, ANCIENTPOWER
	dbw 37, IRON_DEFENSE
	dbw 43, STONE_EDGE
	dbw 49, HAMMER_ARM
	dbw 55, LOCK_ON
	dbw 55, ZAP_CANNON
	dbw 61, SUPERPOWER
	dbw 67, HYPER_BEAM
	db 0 ; no more level-up moves

RegiceEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EXPLOSION
	dbw 1, STOMP
	dbw 7, ICY_WIND
	dbw 13, CHARGE_BEAM
	dbw 19, BULLDOZE
	dbw 25, CURSE
	dbw 31, ANCIENTPOWER
	dbw 37, AMNESIA
	dbw 43, ICE_BEAM
	dbw 49, HAMMER_ARM
	dbw 55, LOCK_ON
	dbw 55, ZAP_CANNON
	dbw 61, SUPERPOWER
	dbw 67, HYPER_BEAM
	db 0 ; no more level-up moves

RegisteelEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EXPLOSION
	dbw 1, STOMP
	dbw 7, METAL_CLAW
	dbw 13, CHARGE_BEAM
	dbw 19, BULLDOZE
	dbw 25, CURSE
	dbw 31, ANCIENTPOWER
	dbw 37, IRON_DEFENSE
	dbw 37, AMNESIA
	dbw 43, IRON_HEAD
	dbw 49, HAMMER_ARM
	dbw 55, LOCK_ON
	dbw 55, ZAP_CANNON
	dbw 61, SUPERPOWER
	dbw 67, HYPER_BEAM
	db 0 ; no more level-up moves

RegielekiEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EXPLOSION
	dbw 1, RAPID_SPIN
	dbw 7, THUNDERSHOCK
	dbw 13, CHARGE_BEAM
	dbw 19, BULLDOZE
	dbw 25, CURSE
	dbw 31, ANCIENTPOWER
	dbw 37, AGILITY
	dbw 43, THUNDERBOLT
	dbw 49, EXTREMESPEED
	dbw 55, LOCK_ON
	dbw 55, ZAP_CANNON
	dbw 61, AURA_SPHERE
	dbw 67, HYPER_BEAM
	db 0 ; no more level-up moves

RegidragoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EXPLOSION
	dbw 1, VICEGRIP
	dbw 7, TWISTER
	dbw 13, CHARGE_BEAM
	dbw 19, BULLDOZE
	dbw 25, CURSE
	dbw 31, ANCIENTPOWER
	dbw 37, DRAGON_DANCE
	dbw 43, DRAGON_CLAW
	dbw 49, HAMMER_ARM
	dbw 55, LOCK_ON
	dbw 55, ZAP_CANNON
	dbw 61, OUTRAGE
	dbw 67, HYPER_BEAM
	db 0 ; no more level-up moves

RegigigasEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, DIZZY_PUNCH
	dbw 1, KNOCK_OFF
	dbw 1, CONFUSE_RAY
	dbw 1, FORESIGHT
	dbw 25, REVENGE
	dbw 40, PROTECT
	dbw 50, ZEN_HEADBUTT
	dbw 65, PAYBACK
	dbw 75, BODY_SLAM
	dbw 90, SUPERPOWER
	dbw 100, GIGA_IMPACT
	db 0 ; no more level-up moves

TaurosPFireEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 3, TAIL_WHIP
	dbw 5, RAGE
	dbw 8, HEADBUTT
	dbw 11, SCARY_FACE
	dbw 15, DOUBLE_KICK
	dbw 19, REST
	dbw 24, FLAME_CHARGE
	dbw 29, WORK_UP
	dbw 35, ZEN_HEADBUTT
	dbw 41, RAGING_BULL
	dbw 48, SWAGGER
	dbw 50, THRASH
	dbw 55, FLARE_BLITZ
	dbw 63, CLOSE_COMBAT
	db 0 ; no more level-up moves

TaurosPWaterEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 3, TAIL_WHIP
	dbw 5, RAGE
	dbw 8, HEADBUTT
	dbw 11, SCARY_FACE
	dbw 15, DOUBLE_KICK
	dbw 19, REST
	dbw 24, AQUA_JET
	dbw 29, WORK_UP
	dbw 35, ZEN_HEADBUTT
	dbw 41, RAGING_BULL
	dbw 48, SWAGGER
	dbw 50, THRASH
	dbw 55, WAVE_CRASH
	dbw 63, CLOSE_COMBAT
	db 0 ; no more level-up moves

CacneaEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, CACTURNE
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, LEER
	dbw 4, ABSORB
	dbw 7, GROWTH
	dbw 10, LEECH_SEED
	dbw 13, SAND_ATTACK
	dbw 16, NEEDLE_ARM
	dbw 19, FAINT_ATTACK
	dbw 22, SYNTHESIS
	dbw 26, PAYBACK
	dbw 30, SPIKES
	dbw 34, SUCKER_PUNCH
	dbw 38, PIN_MISSILE
	dbw 42, ENERGY_BALL
	dbw 46, COTTON_SPORE
	dbw 50, SANDSTORM
	dbw 54, DARK_PULSE
	db 0 ; no more level-up moves

CacturneEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, REVENGE
	dbw 1, REVENGE
	dbw 1, POISON_STING
	dbw 1, LEER
	dbw 4, ABSORB
	dbw 7, GROWTH
	dbw 10, LEECH_SEED
	dbw 13, SAND_ATTACK
	dbw 16, NEEDLE_ARM
	dbw 19, FAINT_ATTACK
	dbw 22, SYNTHESIS
	dbw 26, PAYBACK
	dbw 30, SPIKES
	dbw 35, SUCKER_PUNCH
	dbw 38, PIN_MISSILE
	dbw 44, ENERGY_BALL
	dbw 49, COTTON_SPORE
	dbw 54, SANDSTORM
	dbw 59, DARK_PULSE
	db 0 ; no more level-up moves

SnoruntEvosAttacks:
	dbbw EVOLVE_ITEM_FEMALE, DAWN_STONE, FROSLASS
	dbbw EVOLVE_LEVEL, 32, GLALIE
	db 0 ; no more evolutions
	dbw 1, POWDER_SNOW
	dbw 1, LEER
	dbw 5, DOUBLE_TEAM
	dbw 10, ICE_SHARD
	dbw 14, ICY_WIND
	dbw 19, BITE
	dbw 23, ICE_FANG
	dbw 28, HEADBUTT
	dbw 32, PROTECT
	dbw 37, ICE_BEAM
	dbw 41, CRUNCH
	dbw 46, BLIZZARD
	dbw 50, HAIL
	db 0 ; no more level-up moves

GlalieEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, AVALANCHE
	dbw 1, AVALANCHE
	dbw 1, POWDER_SNOW
	dbw 1, LEER
	dbw 5, DOUBLE_TEAM
	dbw 10, ICE_SHARD
	dbw 14, ICY_WIND
	dbw 19, BITE
	dbw 23, ICE_FANG
	dbw 28, HEADBUTT
	dbw 33, PROTECT
	dbw 38, ICE_BEAM
	dbw 41, CRUNCH
	dbw 48, BLIZZARD
	dbw 54, HAIL
	dbw 61, SHEER_COLD
	db 0 ; no more level-up moves

FroslassEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, OMINOUS_WIND
	dbw 1, OMINOUS_WIND
	dbw 1, POWDER_SNOW
	dbw 1, LEER
	dbw 5, DOUBLE_TEAM
	dbw 10, ICE_SHARD
	dbw 14, ICY_WIND
	dbw 19, ASTONISH
	dbw 23, DRAININGKISS
	dbw 28, WILL_O_WISP
	dbw 32, CONFUSE_RAY
	dbw 37, ICE_BEAM
	dbw 41, ATTRACT
	dbw 42, SHADOW_BALL
	dbw 48, BLIZZARD
	dbw 54, HAIL
	dbw 61, SHEER_COLD
	db 0 ; no more level-up moves

DuskullEvosAttacks:
	dbbw EVOLVE_LEVEL, 37, DUSCLOPS
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, NIGHT_SHADE
	dbw 6, DISABLE
	dbw 9, ASTONISH
	dbw 14, FORESIGHT
	dbw 17, SHADOW_SNEAK
	dbw 22, PURSUIT
	dbw 25, WILL_O_WISP
	dbw 30, CONFUSE_RAY
	dbw 33, CURSE
	dbw 38, HEX
	dbw 41, SHADOW_BALL
	dbw 46, MEAN_LOOK
	dbw 49, PHANTOMFORCE
	dbw 54, FUTURE_SIGHT
	db 0 ; no more level-up moves

DusclopsEvosAttacks:
	dbbw EVOLVE_ITEM, DUSK_STONE, DUSKNOIR
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SHADOW_PUNCH
	dbw 1, SHADOW_PUNCH
	dbw 1, LEER
	dbw 1, NIGHT_SHADE
	dbw 6, DISABLE
	dbw 9, ASTONISH
	dbw 14, FORESIGHT
	dbw 17, SHADOW_SNEAK
	dbw 22, PURSUIT
	dbw 25, WILL_O_WISP
	dbw 30, CONFUSE_RAY
	dbw 33, CURSE
	dbw 40, HEX
	dbw 45, SHADOW_BALL
	dbw 52, MEAN_LOOK
	dbw 57, PHANTOMFORCE
	dbw 64, FUTURE_SIGHT
	db 0 ; no more level-up moves

DusknoirEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SHADOW_PUNCH
	dbw 1, LEER
	dbw 1, NIGHT_SHADE
	dbw 6, DISABLE
	dbw 9, ASTONISH
	dbw 14, FORESIGHT
	dbw 17, SHADOW_SNEAK
	dbw 22, PURSUIT
	dbw 25, WILL_O_WISP
	dbw 30, CONFUSE_RAY
	dbw 33, CURSE
	dbw 40, HEX
	dbw 45, SHADOW_BALL
	dbw 52, MEAN_LOOK
	dbw 57, PHANTOMFORCE
	dbw 64, FUTURE_SIGHT
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

CroagunkEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, TOXICROAK
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 3, MUD_SLAP
	dbw 8, POISON_STING
	dbw 10, KARATE_CHOP
	dbw 15, PURSUIT
	dbw 17, FAINT_ATTACK
	dbw 22, REVENGE
	dbw 24, SWAGGER
	dbw 29, LOW_SWEEP
	dbw 31, SUCKER_PUNCH
	dbw 36, VENOSHOCK
	dbw 38, NASTY_PLOT
	dbw 43, POISON_JAB
	dbw 45, SLUDGE_BOMB
	dbw 47, BELCH
	dbw 50, FLATTER
	dbw 54, CLOSE_COMBAT
	db 0 ; no more level-up moves

ToxicroakEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 3, MUD_SLAP
	dbw 8, POISON_STING
	dbw 10, KARATE_CHOP
	dbw 15, PURSUIT
	dbw 17, FAINT_ATTACK
	dbw 22, REVENGE
	dbw 24, SWAGGER
	dbw 31, LOW_SWEEP
	dbw 36, SUCKER_PUNCH
	dbw 38, VENOSHOCK
	dbw 41, NASTY_PLOT
	dbw 49, POISON_JAB
	dbw 54, SLUDGE_BOMB
	dbw 58, BELCH
	dbw 62, FLATTER
	dbw 65, CLOSE_COMBAT
	db 0 ; no more level-up moves

BronzorEvosAttacks:
	dbbw EVOLVE_LEVEL, 33, BRONZONG
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, CONFUSION
	dbw 5, HYPNOSIS
	dbw 9, MEAN_LOOK
	dbw 11, CONFUSE_RAY
	dbw 15, PSYWAVE
	dbw 19, IRON_DEFENSE
	dbw 21, FAINT_ATTACK
	dbw 25, SAFEGUARD
	dbw 29, FUTURE_SIGHT
	dbw 31, METAL_SOUND
	dbw 35, GYRO_BALL
	dbw 39, EXTRASENSORY
	dbw 41, PAYBACK
	dbw 45, CALM_MIND
	dbw 49, FLASH_CANNON
	db 0 ; no more level-up moves

BronzongEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, ZEN_HEADBUTT
	dbw 1, ZEN_HEADBUTT
	dbw 1, TACKLE
	dbw 1, CONFUSION
	dbw 5, HYPNOSIS
	dbw 9, MEAN_LOOK
	dbw 11, CONFUSE_RAY
	dbw 15, PSYWAVE
	dbw 19, IRON_DEFENSE
	dbw 21, FAINT_ATTACK
	dbw 25, SAFEGUARD
	dbw 29, FUTURE_SIGHT
	dbw 31, METAL_SOUND
	dbw 36, GYRO_BALL
	dbw 42, EXTRASENSORY
	dbw 46, PAYBACK
	dbw 52, CALM_MIND
	dbw 58, FLASH_CANNON
	db 0 ; no more level-up moves

SkorupiEvosAttacks:
	dbbw EVOLVE_LEVEL, 40, DRAPION
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, POISON_STING
	dbw 1, LEER
	dbw 5, KNOCK_OFF
	dbw 9, PIN_MISSILE
	dbw 13, WORK_UP
	dbw 16, PURSUIT
	dbw 20, SIGNAL_BEAM
	dbw 23, POISON_FANG
	dbw 27, VENOSHOCK
	dbw 30, HONE_CLAWS
	dbw 34, TOXIC
	dbw 38, NIGHT_SLASH
	dbw 41, SCARY_FACE
	dbw 45, CRUNCH
	dbw 47, LEECH_LIFE
	dbw 49, CROSS_POISON
	db 0 ; no more level-up moves

DrapionEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, POISON_STING
	dbw 1, LEER
	dbw 5, KNOCK_OFF
	dbw 9, PIN_MISSILE
	dbw 13, WORK_UP
	dbw 16, PURSUIT
	dbw 20, SIGNAL_BEAM
	dbw 23, POISON_FANG
	dbw 27, VENOSHOCK
	dbw 30, HONE_CLAWS
	dbw 34, TOXIC
	dbw 38, NIGHT_SLASH
	dbw 43, SCARY_FACE
	dbw 49, CRUNCH
	dbw 53, LEECH_LIFE
	dbw 57, CROSS_POISON
	db 0 ; no more level-up moves
