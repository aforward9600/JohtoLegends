SECTION "Evolutions and Attacks 2", ROMX

EvosAttacksPointers2::
	dw TaurosEvosAttacks
	dw MagikarpEvosAttacks
	dw GyaradosEvosAttacks
	dw LaprasEvosAttacks
	dw DittoEvosAttacks
	dw EeveeEvosAttacks
	dw VaporeonEvosAttacks
	dw JolteonEvosAttacks
	dw FlareonEvosAttacks
	dw EspeonEvosAttacks
	dw UmbreonEvosAttacks
	dw LeafeonEvosAttacks
	dw GlaceonEvosAttacks
	dw SylveonEvosAttacks
	dw PorygonEvosAttacks
	dw Porygon2EvosAttacks
	dw PorygonZEvosAttacks
	dw OmanyteEvosAttacks
	dw OmastarEvosAttacks
	dw KabutoEvosAttacks
	dw KabutopsEvosAttacks
	dw AerodactylEvosAttacks
	dw MunchlaxEvosAttacks
	dw SnorlaxEvosAttacks
	dw ArticunoEvosAttacks
	dw ZapdosEvosAttacks
	dw MoltresEvosAttacks
	dw DratiniEvosAttacks
	dw DragonairEvosAttacks
	dw DragoniteEvosAttacks
	dw MewtwoEvosAttacks
	dw MewEvosAttacks
	dw ChikoritaEvosAttacks
	dw BayleefEvosAttacks
	dw MeganiumEvosAttacks
	dw CyndaquilEvosAttacks
	dw QuilavaEvosAttacks
	dw TyphlosionEvosAttacks
	dw TotodileEvosAttacks
	dw CroconawEvosAttacks
	dw FeraligatrEvosAttacks
	dw SentretEvosAttacks
	dw FurretEvosAttacks
	dw HoothootEvosAttacks
	dw NoctowlEvosAttacks
	dw LedybaEvosAttacks
	dw LedianEvosAttacks
	dw SpinarakEvosAttacks
	dw AriadosEvosAttacks
	dw ChinchouEvosAttacks
	dw LanturnEvosAttacks
	dw TogepiEvosAttacks
	dw TogeticEvosAttacks
	dw TogekissEvosAttacks
	dw NatuEvosAttacks
	dw XatuEvosAttacks
	dw MareepEvosAttacks
	dw FlaaffyEvosAttacks
	dw AmpharosEvosAttacks
	dw AzurillEvosAttacks
	dw MarillEvosAttacks
	dw AzumarillEvosAttacks
	dw BonslyEvosAttacks
	dw SudowoodoEvosAttacks
	dw HoppipEvosAttacks
	dw SkiploomEvosAttacks
	dw JumpluffEvosAttacks
	dw AipomEvosAttacks
	dw AmbipomEvosAttacks
	dw SunkernEvosAttacks
	dw SunfloraEvosAttacks
	dw YanmaEvosAttacks
	dw YanmegaEvosAttacks
	dw WooperEvosAttacks
	dw QuagsireEvosAttacks
	dw MurkrowEvosAttacks
	dw HonchkrowEvosAttacks
	dw MisdreavusEvosAttacks
	dw MismagiusEvosAttacks
	dw UnownEvosAttacks
	dw WynautEvosAttacks
	dw WobbuffetEvosAttacks
	dw GirafarigEvosAttacks
	dw PinecoEvosAttacks
	dw ForretressEvosAttacks
	dw DunsparceEvosAttacks
	dw GligarEvosAttacks
	dw GliscorEvosAttacks
	dw SnubbullEvosAttacks
	dw GranbullEvosAttacks
	dw QwilfishEvosAttacks
	dw ShuckleEvosAttacks
	dw HeracrossEvosAttacks
	dw SneaselEvosAttacks
	dw WeavileEvosAttacks
	dw TeddiursaEvosAttacks
	dw UrsaringEvosAttacks
	dw SlugmaEvosAttacks
	dw MagcargoEvosAttacks
	dw SwinubEvosAttacks
	dw PiloswineEvosAttacks
	dw MamoswineEvosAttacks
	dw CorsolaEvosAttacks
	dw CursolaEvosAttacks
	dw RemoraidEvosAttacks
	dw OctilleryEvosAttacks
	dw DelibirdEvosAttacks
	dw MantykeEvosAttacks
	dw MantineEvosAttacks
	dw SkarminiEvosAttacks
	dw SkarmoryEvosAttacks
	dw HoundourEvosAttacks
	dw HoundoomEvosAttacks
	dw PhanpyEvosAttacks
	dw DonphanEvosAttacks
	dw StantlerEvosAttacks
	dw SmeargleEvosAttacks
	dw MiltankEvosAttacks
	dw RaikouEvosAttacks
	dw EnteiEvosAttacks
	dw SuicuneEvosAttacks
	dw LarvitarEvosAttacks
	dw PupitarEvosAttacks
	dw TyranitarEvosAttacks
	dw BagonEvosAttacks
	dw ShelgonEvosAttacks
	dw SalamenceEvosAttacks
	dw LugiaEvosAttacks
	dw HoOhEvosAttacks
	dw CelebiEvosAttacks
	dw MissingnoEvosAttacks

TaurosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 3, TAIL_WHIP
	dbw 5, RAGE
	dbw 8, HORN_ATTACK
	dbw 11, SCARY_FACE
	dbw 15, PURSUIT
	dbw 19, REST
	dbw 24, PAYBACK
	dbw 29, BULK_UP
	dbw 35, ZEN_HEADBUTT
	dbw 41, TAKE_DOWN
	dbw 48, SWAGGER
	dbw 50, THRASH
	dbw 63, GIGA_IMPACT
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 15, TACKLE
	dbw 25, FLAIL
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, THRASH
	dbw 21, LEER
	dbw 24, DRAGON_RAGE
	dbw 27, ICE_FANG
	dbw 30, AQUA_TAIL
	dbw 33, SCARY_FACE
	dbw 36, TWISTER
	dbw 39, CRUNCH
	dbw 42, HYDRO_PUMP
	dbw 45, DRAGON_DANCE
	dbw 48, BOUNCE
	dbw 51, RAIN_DANCE
	dbw 54, GIGA_IMPACT
	dbw LEARN_EVO_MOVE, BITE
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, GROWL
	dbw 1, SING
	dbw 4, MIST
	dbw 7, CONFUSE_RAY
	dbw 10, ICE_SHARD
	dbw 14, WATER_PULSE
	dbw 18, BODY_SLAM
	dbw 22, RAIN_DANCE
	dbw 27, PERISH_SONG
	dbw 32, ICE_BEAM
	dbw 37, SURF
	dbw 43, SAFEGUARD
	dbw 47, HYDRO_PUMP
	dbw 50, BLIZZARD
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	dbbw EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	dbbw EVOLVE_ITEM, WATER_STONE, VAPOREON
	dbbw EVOLVE_ITEM, FIRE_STONE, FLAREON
	dbbw EVOLVE_HAPPINESS, TR_MORNDAY, ESPEON
	dbbw EVOLVE_ITEM, SUN_STONE, ESPEON
	dbbw EVOLVE_ITEM, MOON_STONE, UMBREON
	dbbw EVOLVE_HAPPINESS, TR_NITE, UMBREON
	dbbw EVOLVE_ITEM, LEAF_STONE, LEAFEON
	dbbw EVOLVE_ITEM, ICE_STONE, GLACEON
	dbbw EVOLVE_ITEM, SHINY_STONE, SYLVEON
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, SAND_ATTACK
	dbw 9, GROWL
	dbw 13, QUICK_ATTACK
	dbw 14, BITE
	dbw 17, BITE
	dbw 17, SWIFT
	dbw 20, HEAL_BELL
	dbw 25, TAKE_DOWN
	dbw 29, CHARM
	dbw 33, BATON_PASS
	dbw 37, DOUBLE_EDGE
	dbw 41, MIRROR_MOVE
	dbw 45, GROWTH
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, SAND_ATTACK
	dbw 9, GROWL
	dbw 13, QUICK_ATTACK
	dbw 17, WATER_PULSE
	dbw 20, AURORA_BEAM
	dbw 25, WATER_PULSE
	dbw 29, ACID_ARMOR
	dbw 33, HAZE
	dbw 37, SURF
	dbw 41, DOUBLE_EDGE
	dbw 45, HYDRO_PUMP
	dbw LEARN_EVO_MOVE, WATER_GUN
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, SAND_ATTACK
	dbw 9, GROWL
	dbw 13, QUICK_ATTACK
	dbw 17, DOUBLE_KICK
	dbw 20, THUNDER_FANG
	dbw 25, PIN_MISSILE
	dbw 29, AGILITY
	dbw 33, THUNDER_WAVE
	dbw 37, DISCHARGE
	dbw 41, DOUBLE_EDGE
	dbw 45, THUNDER
	dbw LEARN_EVO_MOVE, THUNDERSHOCK
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, SAND_ATTACK
	dbw 9, GROWL
	dbw 13, QUICK_ATTACK
	dbw 17, BITE
	dbw 20, FIRE_FANG
	dbw 25, FLAME_CHARGE
	dbw 29, SCARY_FACE
	dbw 33, SMOG
	dbw 37, FLAMETHROWER
	dbw 41, DOUBLE_EDGE
	dbw 45, FLARE_BLITZ
	dbw LEARN_EVO_MOVE, EMBER
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, SAND_ATTACK
	dbw 9, GROWL
	dbw 13, QUICK_ATTACK
	dbw 17, SWIFT
	dbw 20, PSYBEAM
	dbw 25, FUTURE_SIGHT
	dbw 29, PSYCH_UP
	dbw 33, MORNING_SUN
	dbw 37, PSYCHIC_M
	dbw 41, DOUBLE_EDGE
	dbw 45, NASTY_PLOT
	dbw LEARN_EVO_MOVE, CONFUSION
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PURSUIT
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, SAND_ATTACK
	dbw 9, GROWL
	dbw 13, QUICK_ATTACK
	dbw 17, CONFUSE_RAY
	dbw 20, FAINT_ATTACK
	dbw 25, PAYBACK
	dbw 29, SCREECH
	dbw 33, MOONLIGHT
	dbw 37, MEAN_LOOK
	dbw 41, DOUBLE_EDGE
	dbw 45, AMNESIA
	dbw LEARN_EVO_MOVE, PURSUIT
	db 0 ; no more level-up moves

LeafeonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, RAZOR_LEAF
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, SAND_ATTACK
	dbw 9, GROWL
	dbw 13, QUICK_ATTACK
	dbw 17, SING
	dbw 20, GIGA_DRAIN
	dbw 25, LEAF_BLADE
	dbw 29, SWORDS_DANCE
	dbw 33, SYNTHESIS
	dbw 37, SUNNY_DAY
	dbw 41, DOUBLE_EDGE
	dbw 45, SOLAR_BLADE
	dbw LEARN_EVO_MOVE, RAZOR_LEAF
	db 0 ; no more level-up moves

GlaceonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ICY_WIND
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, SAND_ATTACK
	dbw 9, GROWL
	dbw 13, QUICK_ATTACK
	dbw 17, BITE
	dbw 20, ICE_FANG
	dbw 25, ICE_SHARD
	dbw 29, BARRIER
	dbw 33, MIRROR_COAT
	dbw 37, HAIL
	dbw 41, DOUBLE_EDGE
	dbw 45, BLIZZARD
	dbw LEARN_EVO_MOVE, ICY_WIND
	db 0 ; no more level-up moves

SylveonEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, FAIRY_WIND
	dbw 1, DISARM_VOICE
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, SANDSTORM
	dbw 9, GROWL
	dbw 13, QUICK_ATTACK
	dbw 17, SWIFT
	dbw 20, DRAININGKISS
	dbw 25, RECOVER
	dbw 29, DAZZLINGLEAM
	dbw 33, LIGHT_SCREEN
	dbw 37, MOONBLAST
	dbw 41, DOUBLE_EDGE
	dbw 45, PSYCH_UP
	dbw LEARN_EVO_MOVE, FAIRY_WIND
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	dbbw EVOLVE_ITEM, UP_GRADE, PORYGON2
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, CONVERSION
	dbw 1, SHARPEN
	dbw 7, PSYBEAM
	dbw 12, AGILITY
	dbw 18, RECOVER
	dbw 23, BARRIER
	dbw 29, SIGNAL_BEAM
	dbw 34, FLASH_CANNON
	dbw 40, DISCHARGE
	dbw 45, LOCK_ON
	dbw 50, TRI_ATTACK
	dbw 56, MIRROR_COAT
	dbw 62, ZAP_CANNON
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
	dbbw EVOLVE_ITEM, DUBIOUSDISK, PORYGON_Z
	db 0 ; no more evolutions
	dbw 1, NASTY_PLOT
	dbw 1, TACKLE
	dbw 1, CONVERSION
	dbw 1, SHARPEN
	dbw 7, PSYBEAM
	dbw 12, AGILITY
	dbw 18, RECOVER
	dbw 23, BARRIER
	dbw 29, SIGNAL_BEAM
	dbw 34, FLASH_CANNON
	dbw 40, DISCHARGE
	dbw 45, LOCK_ON
	dbw 50, TRI_ATTACK
	dbw 56, MIRROR_COAT
	dbw 62, ZAP_CANNON
	dbw 67, HYPER_BEAM
	dbw 70, NASTY_PLOT
	db 0 ; no more level-up moves

PorygonZEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, NASTY_PLOT
	dbw 1, TACKLE
	dbw 1, CONVERSION
	dbw 1, SHARPEN
	dbw 7, PSYBEAM
	dbw 12, AGILITY
	dbw 18, RECOVER
	dbw 23, BARRIER
	dbw 29, SIGNAL_BEAM
	dbw 34, FLASH_CANNON
	dbw 40, DISCHARGE
	dbw 45, LOCK_ON
	dbw 50, TRI_ATTACK
	dbw 56, MIRROR_COAT
	dbw 62, ZAP_CANNON
	dbw 67, HYPER_BEAM
	dbw 70, NASTY_PLOT
	db 0 ; no more level-up moves

OmanyteEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, OMASTAR
	db 0 ; no more evolutions
	dbw 1, CONSTRICT
	dbw 1, WITHDRAW
	dbw 7, BITE
	dbw 10, WATER_GUN
	dbw 16, ROLLOUT
	dbw 19, LEER
	dbw 25, MUD_SHOT
	dbw 28, WATER_PULSE
	dbw 34, PROTECT
	dbw 37, ANCIENTPOWER
	dbw 43, GROWTH
	dbw 46, ROCK_BLAST
	dbw 50, SHELL_SMASH
	dbw 55, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SPIKE_CANNON
	dbw 1, CONSTRICT
	dbw 1, WITHDRAW
	dbw 7, BITE
	dbw 10, WATER_GUN
	dbw 16, ROLLOUT
	dbw 19, LEER
	dbw 25, MUD_SHOT
	dbw 28, WATER_PULSE
	dbw 37, PROTECT
	dbw 43, ANCIENTPOWER
	dbw 48, GROWTH
	dbw 56, ROCK_BLAST
	dbw 67, SHELL_SMASH
	dbw 75, HYDRO_PUMP
	dbw LEARN_EVO_MOVE, SPIKE_CANNON
	db 0 ; no more level-up moves

KabutoEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, KABUTOPS
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, HARDEN
	dbw 6, ABSORB
	dbw 11, LEER
	dbw 16, MUD_SHOT
	dbw 21, SAND_ATTACK
	dbw 26, ENDURE
	dbw 31, AQUA_JET
	dbw 36, MEGA_DRAIN
	dbw 41, METAL_SOUND
	dbw 46, ANCIENTPOWER
	dbw 50, WATERFALL
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SLASH
	dbw 1, SCRATCH
	dbw 1, HARDEN
	dbw 6, ABSORB
	dbw 11, LEER
	dbw 16, MUD_SHOT
	dbw 21, SAND_ATTACK
	dbw 26, ENDURE
	dbw 31, AQUA_JET
	dbw 39, MEGA_DRAIN
	dbw 45, METAL_SOUND
	dbw 54, ANCIENTPOWER
	dbw 63, WATERFALL
	dbw 72, NIGHT_SLASH
	dbw LEARN_EVO_MOVE, SLASH
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WING_ATTACK
	dbw 1, SUPERSONIC
	dbw 1, BITE
	dbw 1, SCARY_FACE
	dbw 9, ROAR
	dbw 17, AGILITY
	dbw 25, ANCIENTPOWER
	dbw 33, CRUNCH
	dbw 41, TAKE_DOWN
	dbw 49, FLY
	dbw 57, IRON_HEAD
	dbw 65, ROCK_SLIDE
	dbw 73, GIGA_IMPACT
	dbw 81, ROCK_WRECKER
	db 0 ; no more level-up moves

MunchlaxEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, SNORLAX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, ODOR_SLEUTH
	dbw 1, METRONOME
	dbw 1, LICK
	dbw 4, DEFENSE_CURL
	dbw 9, AMNESIA
	dbw 12, LICK
	dbw 17, HEADBUTT
	dbw 20, SCREECH
	dbw 25, BODY_SLAM
	dbw 28, REST
	dbw 33, SNORE
	dbw 36, ROLLOUT
	dbw 41, CURSE
	dbw 44, BELLY_DRUM
	dbw 49, CRUNCH
	dbw 50, GYRO_BALL
	dbw 57, HIHORSEPOWER
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, DEFENSE_CURL
	dbw 9, AMNESIA
	dbw 12, LICK
	dbw 17, HEADBUTT
	dbw 25, BODY_SLAM
	dbw 28, SNORE
	dbw 28, REST
	dbw 33, SLEEP_TALK
	dbw 35, GIGA_IMPACT
	dbw 36, ROLLOUT
	dbw 41, CURSE
	dbw 44, BELLY_DRUM
	dbw 49, CRUNCH
	dbw 50, GYRO_BALL
	dbw 57, HIHORSEPOWER
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GUST
	dbw 1, POWDER_SNOW
	dbw 8, MIST
	dbw 15, ICE_SHARD
	dbw 22, MIND_READER
	dbw 29, ANCIENTPOWER
	dbw 36, AGILITY
	dbw 43, ICY_WIND
	dbw 50, REFLECT
	dbw 57, HAIL
	dbw 64, SAFEGUARD
	dbw 71, ICE_BEAM
	dbw 78, BLIZZARD
	dbw 85, ROOST
	dbw 92, HURRICANE
	dbw 99, SHEER_COLD
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, THUNDERSHOCK
	dbw 8, THUNDER_WAVE
	dbw 15, DETECT
	dbw 22, AERIAL_ACE
	dbw 29, ANCIENTPOWER
	dbw 36, AGILITY
	dbw 43, CHARGE_BEAM
	dbw 50, DISCHARGE
	dbw 57, RAIN_DANCE
	dbw 64, LIGHT_SCREEN
	dbw 71, DRILL_PECK
	dbw 78, THUNDER
	dbw 85, ROOST
	dbw 92, HURRICANE
	dbw 99, ZAP_CANNON
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, WING_ATTACK
	dbw 1, EMBER
	dbw 8, FIRE_SPIN
	dbw 15, AGILITY
	dbw 22, ENDURE
	dbw 29, ANCIENTPOWER
	dbw 36, FLAME_BURST
	dbw 43, SAFEGUARD
	dbw 50, AIR_SLASH
	dbw 57, SUNNY_DAY
	dbw 64, FLAMETHROWER
	dbw 71, SOLARBEAM
	dbw 78, SKY_ATTACK
	dbw 85, ROOST
	dbw 92, HURRICANE
	dbw 99, FIRE_BLAST
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, DRAGONAIR
	db 0 ; no more evolutions
	dbw 1, DRAGON_RAGE
	dbw 1, LEER
	dbw 6, THUNDER_WAVE
	dbw 9, WRAP
	dbw 11, TWISTER
	dbw 15, DRACO_FANG
	dbw 21, SLAM
	dbw 25, AGILITY
	dbw 31, DRAGON_TAIL
	dbw 35, AQUA_TAIL
	dbw 41, DRAGON_RUSH
	dbw 45, SAFEGUARD
	dbw 51, DRAGON_DANCE
	dbw 55, OUTRAGE
	dbw 61, HYPER_BEAM
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	dbbw EVOLVE_LEVEL, 55, DRAGONITE
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 5, THUNDER_WAVE
	dbw 11, DRAGON_RAGE
	dbw 15, DRACO_FANG
	dbw 23, SLAM
	dbw 27, AGILITY
	dbw 33, DRAGON_TAIL
	dbw 39, AQUA_TAIL
	dbw 47, DRAGON_RUSH
	dbw 53, SAFEGUARD
	dbw 61, DRAGON_DANCE
	dbw 67, OUTRAGE
	dbw 75, HYPER_BEAM
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HURRICANE
	dbw 1, WRAP
	dbw 1, LEER
	dbw 5, THUNDER_WAVE
	dbw 11, DRAGON_RAGE
	dbw 15, DRACO_FANG
	dbw 21, SLAM
	dbw 27, AGILITY
	dbw 33, DRAGON_TAIL
	dbw 39, AQUA_TAIL
	dbw 47, DRAGON_RUSH
	dbw 53, SAFEGUARD
	dbw 61, DRAGON_DANCE
	dbw 67, OUTRAGE
	dbw 75, HYPER_BEAM
	dbw 81, GIGA_IMPACT
	dbw LEARN_EVO_MOVE, HURRICANE
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONFUSION
	dbw 1, DISABLE
	dbw 8, SWIFT
	dbw 15, FUTURE_SIGHT
	dbw 22, PSYCH_UP
	dbw 29, ZEN_HEADBUTT
	dbw 36, PSYCHO_CUT
	dbw 43, NASTY_PLOT
	dbw 50, RECOVER
	dbw 57, PSYCHIC_M
	dbw 64, BARRIER
	dbw 70, AURA_SPHERE
	dbw 79, AMNESIA
	dbw 86, MIST
	dbw 93, SAFEGUARD
	dbw 100, HYPER_BEAM
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, TRANSFORM
	dbw 10, MEGA_PUNCH
	dbw 20, METRONOME
	dbw 30, PSYCHIC_M
	dbw 40, BARRIER
	dbw 50, ANCIENTPOWER
	dbw 60, AMNESIA
	dbw 70, MIST
	dbw 80, BATON_PASS
	dbw 90, NASTY_PLOT
	dbw 100, AURA_SPHERE
	db 0 ; no more level-up moves

ChikoritaEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, BAYLEEF
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 6, RAZOR_LEAF
	dbw 9, POISONPOWDER
	dbw 12, SYNTHESIS
	dbw 17, REFLECT
	dbw 20, SYNTHESIS
	dbw 23, DRAININGKISS
	dbw 28, SWEET_SCENT
	dbw 31, LIGHT_SCREEN
	dbw 34, BODY_SLAM
	dbw 39, SAFEGUARD
	dbw 42, HEAL_BELL
	dbw 45, SOLARBEAM
	db 0 ; no more level-up moves

BayleefEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, MEGANIUM
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 6, RAZOR_LEAF
	dbw 9, POISONPOWDER
	dbw 12, SYNTHESIS
	dbw 18, REFLECT
	dbw 22, SYNTHESIS
	dbw 26, DRAININGKISS
	dbw 32, SWEET_SCENT
	dbw 36, LIGHT_SCREEN
	dbw 40, BODY_SLAM
	dbw 46, SAFEGUARD
	dbw 50, HEAL_BELL
	dbw 54, SOLARBEAM
	db 0 ; no more level-up moves

MeganiumEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 6, RAZOR_LEAF
	dbw 9, POISONPOWDER
	dbw 12, SYNTHESIS
	dbw 18, REFLECT
	dbw 22, SYNTHESIS
	dbw 26, DRAININGKISS
	dbw 34, SWEET_SCENT
	dbw 40, LIGHT_SCREEN
	dbw 46, BODY_SLAM
	dbw 54, SAFEGUARD
	dbw 60, HEAL_BELL
	dbw 66, SOLARBEAM
	dbw 70, PETAL_BLIZZ
	dbw LEARN_EVO_MOVE, PETAL_DANCE
	db 0 ; no more level-up moves

CyndaquilEvosAttacks:
	dbbw EVOLVE_LEVEL, 14, QUILAVA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, SMOKESCREEN
	dbw 10, EMBER
	dbw 13, QUICK_ATTACK
	dbw 19, FLAME_WHEEL
	dbw 22, DEFENSE_CURL
	dbw 28, SWIFT
	dbw 31, FLAME_CHARGE
	dbw 37, FLAME_BURST
	dbw 40, FLAMETHROWER
	dbw 46, INFERNO
	dbw 49, ROLLOUT
	dbw 55, DOUBLE_EDGE
	dbw 58, FIRE_BLAST
	dbw 64, EARTHQUAKE
	db 0 ; no more level-up moves

QuilavaEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, TYPHLOSION
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, SMOKESCREEN
	dbw 10, EMBER
	dbw 13, QUICK_ATTACK
	dbw 20, FLAME_WHEEL
	dbw 24, DEFENSE_CURL
	dbw 31, SWIFT
	dbw 35, FLAME_CHARGE
	dbw 42, FLAME_BURST
	dbw 46, FLAMETHROWER
	dbw 53, INFERNO
	dbw 57, ROLLOUT
	dbw 64, DOUBLE_EDGE
	dbw 68, FIRE_BLAST
	dbw 75, EARTHQUAKE
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EARTH_POWER
	dbw 1, TACKLE
	dbw 1, LEER
	dbw 6, SMOKESCREEN
	dbw 10, EMBER
	dbw 13, QUICK_ATTACK
	dbw 20, FLAME_WHEEL
	dbw 24, DEFENSE_CURL
	dbw 31, SWIFT
	dbw 35, FLAME_CHARGE
	dbw 43, FLAME_BURST
	dbw 48, FLAMETHROWER
	dbw 56, INFERNO
	dbw 61, ROLLOUT
	dbw 69, DOUBLE_EDGE
	dbw 74, FIRE_BLAST
	dbw 82, EARTHQUAKE
	dbw LEARN_EVO_MOVE, EARTH_POWER
	db 0 ; no more level-up moves

TotodileEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, CROCONAW
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 6, WATER_GUN
	dbw 8, RAGE
	dbw 13, BITE
	dbw 15, SCARY_FACE
	dbw 20, ICE_FANG
	dbw 22, FLAIL
	dbw 27, CRUNCH
	dbw 29, HEADBUTT
	dbw 34, SLASH
	dbw 36, SCREECH
	dbw 41, THRASH
	dbw 43, AQUA_TAIL
	dbw 48, SUPERPOWER
	dbw 50, HYDRO_PUMP
	db 0 ; no more level-up moves

CroconawEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, FERALIGATR
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 6, WATER_GUN
	dbw 8, RAGE
	dbw 13, BITE
	dbw 15, SCARY_FACE
	dbw 21, ICE_FANG
	dbw 24, FLAIL
	dbw 30, CRUNCH
	dbw 33, HEADBUTT
	dbw 39, SLASH
	dbw 42, SCREECH
	dbw 48, THRASH
	dbw 51, AQUA_TAIL
	dbw 57, SUPERPOWER
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, NIGHT_SLASH
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 6, WATER_GUN
	dbw 8, RAGE
	dbw 13, BITE
	dbw 15, SCARY_FACE
	dbw 21, ICE_FANG
	dbw 24, FLAIL
	dbw 32, CRUNCH
	dbw 37, HEADBUTT
	dbw 45, SLASH
	dbw 50, SCREECH
	dbw 58, THRASH
	dbw 63, AQUA_TAIL
	dbw 71, SUPERPOWER
	dbw 76, HYDRO_PUMP
	dbw LEARN_EVO_MOVE, NIGHT_SLASH
	db 0 ; no more level-up moves

SentretEvosAttacks:
	dbbw EVOLVE_LEVEL, 15, FURRET
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, FORESIGHT
	dbw 4, DEFENSE_CURL
	dbw 7, QUICK_ATTACK
	dbw 13, FURY_SWIPES
	dbw 16, LEER
	dbw 19, DIZZY_PUNCH
	dbw 25, SLAM
	dbw 28, REST
	dbw 31, FAINT_ATTACK
	dbw 36, AMNESIA
	dbw 39, BATON_PASS
	dbw 42, DOUBLE_EDGE
	dbw 47, HYPER_VOICE
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, AGILITY
	dbw 1, SCRATCH
	dbw 1, FORESIGHT
	dbw 4, DEFENSE_CURL
	dbw 7, QUICK_ATTACK
	dbw 13, FURY_SWIPES
	dbw 17, LEER
	dbw 21, DIZZY_PUNCH
	dbw 28, SLAM
	dbw 32, REST
	dbw 36, FAINT_ATTACK
	dbw 42, AMNESIA
	dbw 46, BATON_PASS
	dbw 50, DOUBLE_EDGE
	dbw 56, HYPER_VOICE
	dbw LEARN_EVO_MOVE, AGILITY
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 3, PECK
	dbw 6, FORESIGHT
	dbw 9, CONFUSION
	dbw 12, REFLECT
	dbw 15, LIGHT_SCREEN
	dbw 18, AIR_SLASH
	dbw 21, EXTRASENSORY
	dbw 24, TAKE_DOWN
	dbw 27, HYPER_VOICE
	dbw 30, ROOST
	dbw 33, MOONBLAST
	dbw 36, HYPNOSIS
	dbw 39, DREAM_EATER
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PSYBEAM
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 3, PECK
	dbw 6, FORESIGHT
	dbw 9, CONFUSION
	dbw 12, REFLECT
	dbw 15, LIGHT_SCREEN
	dbw 18, AIR_SLASH
	dbw 23, EXTRASENSORY
	dbw 28, TAKE_DOWN
	dbw 33, HYPER_VOICE
	dbw 38, ROOST
	dbw 43, MOONBLAST
	dbw 48, HYPNOSIS
	dbw 53, DREAM_EATER
	dbw 56, HURRICANE
	dbw LEARN_EVO_MOVE, PSYBEAM
	db 0 ; no more level-up moves

LedybaEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, LEDIAN
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, SUPERSONIC
	dbw 8, SWIFT
	dbw 12, LIGHT_SCREEN
	dbw 12, REFLECT
	dbw 12, SAFEGUARD
	dbw 15, MACH_PUNCH
	dbw 19, SILVER_WIND
	dbw 22, COMET_PUNCH
	dbw 26, BATON_PASS
	dbw 29, AGILITY
	dbw 33, BUG_BUZZ
	dbw 36, AIR_SLASH
	dbw 40, DOUBLE_EDGE
	db 0 ; no more level-up moves

LedianEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, QUIVER_DANCE
	dbw 1, TACKLE
	dbw 5, SUPERSONIC
	dbw 8, SWIFT
	dbw 12, LIGHT_SCREEN
	dbw 12, REFLECT
	dbw 12, SAFEGUARD
	dbw 15, MACH_PUNCH
	dbw 20, SILVER_WIND
	dbw 24, COMET_PUNCH
	dbw 29, BATON_PASS
	dbw 33, AGILITY
	dbw 38, BUG_BUZZ
	dbw 42, AURA_SPHERE
	dbw 47, DOUBLE_EDGE
	dbw 50, CLOSE_COMBAT
	dbw LEARN_EVO_MOVE, QUIVER_DANCE
	db 0 ; no more level-up moves

SpinarakEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ARIADOS
	db 0 ; no more evolutions
	dbw 1, CONSTRICT
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	dbw 5, ABSORB
	dbw 8, PAYBACK
	dbw 12, SCARY_FACE
	dbw 15, NIGHT_SHADE
	dbw 19, PURSUIT
	dbw 22, FURY_SWIPES
	dbw 26, FAINT_ATTACK
	dbw 29, SPIDER_WEB
	dbw 33, AGILITY
	dbw 36, X_SCISSOR
	dbw 40, ZEN_HEADBUTT
	dbw 43, CRUNCH
	dbw 47, CROSS_POISON
	dbw 23, LEECH_LIFE
	dbw 54, GUNK_SHOT
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	dbw 1, CONSTRICT
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	dbw 5, ABSORB
	dbw 8, PAYBACK
	dbw 12, SCARY_FACE
	dbw 15, NIGHT_SHADE
	dbw 19, PURSUIT
	dbw 23, FURY_SWIPES
	dbw 28, FAINT_ATTACK
	dbw 32, SPIDER_WEB
	dbw 37, AGILITY
	dbw 41, X_SCISSOR
	dbw 46, ZEN_HEADBUTT
	dbw 50, CRUNCH
	dbw 55, CROSS_POISON
	dbw 58, LEECH_LIFE
	dbw 63, GUNK_SHOT
	dbw LEARN_EVO_MOVE, SWORDS_DANCE
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	dbbw EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 1, SUPERSONIC
	dbw 6, THUNDER_WAVE
	dbw 12, WATER_GUN
	dbw 17, CONFUSE_RAY
	dbw 20, BUBBLEBEAM
	dbw 23, CHARGE_BEAM
	dbw 28, SIGNAL_BEAM
	dbw 31, FLAIL
	dbw 34, DISCHARGE
	dbw 39, TAKE_DOWN
	dbw 42, RAIN_DANCE
	dbw 45, HYDRO_PUMP
	dbw 47, AMNESIA
	dbw 50, THUNDER
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SURF
	dbw 1, BUBBLE
	dbw 1, SUPERSONIC
	dbw 6, THUNDER_WAVE
	dbw 12, WATER_GUN
	dbw 17, CONFUSE_RAY
	dbw 20, BUBBLEBEAM
	dbw 23, CHARGE_BEAM
	dbw 28, SIGNAL_BEAM
	dbw 30, DISCHARGE
	dbw 36, RAIN_DANCE
	dbw 42, FLAIL
	dbw 48, TAKE_DOWN
	dbw 54, HYDRO_PUMP
	dbw 57, AMNESIA
	dbw 60, THUNDER
	dbw LEARN_EVO_MOVE, SURF
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, TOGETIC
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, CHARM
	dbw 5, METRONOME
	dbw 9, SWEET_KISS
	dbw 13, SING
	dbw 17, ENCORE
	dbw 21, GROWTH
	dbw 25, TRI_ATTACK
	dbw 29, HEAL_BELL
	dbw 33, ANCIENTPOWER
	dbw 37, SAFEGUARD
	dbw 41, BATON_PASS
	dbw 45, DOUBLE_EDGE
	dbw 49, AGILITY
	dbw 53, MOONLIGHT
	db 0 ; no more level-up moves

TogeticEvosAttacks:
	dbbw EVOLVE_ITEM, SHINY_STONE, TOGEKISS
	db 0 ; no more evolutions
	dbw 1, FAIRY_WIND
	dbw 1, GROWL
	dbw 1, CHARM
	dbw 5, METRONOME
	dbw 9, SWEET_KISS
	dbw 13, SING
	dbw 14, FAIRY_WIND
	dbw 17, ENCORE
	dbw 21, GROWTH
	dbw 25, TRI_ATTACK
	dbw 29, HEAL_BELL
	dbw 33, ANCIENTPOWER
	dbw 37, SAFEGUARD
	dbw 41, BATON_PASS
	dbw 45, DOUBLE_EDGE
	dbw 49, AGILITY
	dbw 53, MOONLIGHT
	dbw LEARN_EVO_MOVE, FAIRY_WIND
	db 0 ; no more level-up moves

TogekissEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EXTREMESPEED
	dbw 1, AIR_SLASH
	dbw 1, SKY_ATTACK
	dbw 45, EXTREMESPEED
	dbw 55, AURA_SPHERE
	dbw LEARN_EVO_MOVE, AIR_SLASH
	db 0 ; no more level-up moves

NatuEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, XATU
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, LEER
	dbw 6, NIGHT_SHADE
	dbw 9, TELEPORT
	dbw 12, CONFUSION
	dbw 17, AIR_CUTTER
	dbw 20, SILVER_WIND
	dbw 23, CONFUSE_RAY
	dbw 28, ROOST
	dbw 33, PSYCHIC_M
	dbw 36, AMNESIA
	dbw 39, BATON_PASS
	dbw 44, FUTURE_SIGHT
	dbw 47, DARK_PULSE
	dbw 50, NASTY_PLOT
	db 0 ; no more level-up moves

XatuEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, AIR_SLASH
	dbw 1, PECK
	dbw 1, LEER
	dbw 6, NIGHT_SHADE
	dbw 9, TELEPORT
	dbw 12, CONFUSION
	dbw 17, AIR_CUTTER
	dbw 20, SILVER_WIND
	dbw 23, CONFUSE_RAY
	dbw 29, ROOST
	dbw 35, PSYCHIC_M
	dbw 39, AMNESIA
	dbw 43, BATON_PASS
	dbw 49, FUTURE_SIGHT
	dbw 53, DARK_PULSE
	dbw 57, NASTY_PLOT
	dbw LEARN_EVO_MOVE, AIR_SLASH
	db 0 ; no more level-up moves

MareepEvosAttacks:
	dbbw EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, THUNDER_WAVE
	dbw 8, THUNDERSHOCK
	dbw 11, COTTON_SPORE
	dbw 15, THUNDER_FANG
	dbw 18, TAKE_DOWN
	dbw 22, CHARGE_BEAM
	dbw 25, CONFUSE_RAY
	dbw 29, POWER_GEM
	dbw 32, DISCHARGE
	dbw 36, BODY_SLAM
	dbw 39, SIGNAL_BEAM
	dbw 43, LIGHT_SCREEN
	dbw 46, THUNDER
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, THUNDER_WAVE
	dbw 8, THUNDERSHOCK
	dbw 11, COTTON_SPORE
	dbw 16, THUNDER_FANG
	dbw 20, TAKE_DOWN
	dbw 25, CHARGE_BEAM
	dbw 29, CONFUSE_RAY
	dbw 34, POWER_GEM
	dbw 38, DISCHARGE
	dbw 43, BODY_SLAM
	dbw 47, SIGNAL_BEAM
	dbw 52, LIGHT_SCREEN
	dbw 56, THUNDER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, DRAGONBREATH
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, THUNDER_WAVE
	dbw 8, THUNDERSHOCK
	dbw 11, COTTON_SPORE
	dbw 16, THUNDER_FANG
	dbw 20, TAKE_DOWN
	dbw 25, CHARGE_BEAM
	dbw 29, CONFUSE_RAY
	dbw 35, POWER_GEM
	dbw 40, DISCHARGE
	dbw 46, BODY_SLAM
	dbw 51, SIGNAL_BEAM
	dbw 57, LIGHT_SCREEN
	dbw 62, THUNDER
	dbw 65, DRAGON_PULSE
	dbw LEARN_EVO_MOVE, DRAGONBREATH
	db 0 ; no more level-up moves

AzurillEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, MARILL
	db 0 ; no more evolutions
	dbw 1, SPLASH
	dbw 1, WATER_GUN
	dbw 2, TAIL_WHIP
	dbw 5, DOUBLESLAP
	dbw 7, BUBBLE
	dbw 10, CHARM
	dbw 13, BUBBLEBEAM
	dbw 16, SWEET_KISS
	dbw 20, SLAM
	dbw 23, BOUNCE
	db 0 ; no more level-up moves

MarillEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, WATER_GUN
	dbw 2, TAIL_WHIP
	dbw 5, ENCORE
	dbw 7, AQUA_JET
	dbw 10, DEFENSE_CURL
	dbw 10, ROLLOUT
	dbw 13, BUBBLEBEAM
	dbw 16, GROWTH
	dbw 20, AQUA_TAIL
	dbw 23, PLAY_ROUGH
	dbw 28, MOONLIGHT
	dbw 31, RAIN_DANCE
	dbw 37, DOUBLE_EDGE
	dbw 40, SUPERPOWER
	dbw 47, HYDRO_PUMP
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, WATER_GUN
	dbw 2, TAIL_WHIP
	dbw 5, ENCORE
	dbw 7, AQUA_JET
	dbw 10, DEFENSE_CURL
	dbw 10, ROLLOUT
	dbw 13, BUBBLEBEAM
	dbw 16, GROWTH
	dbw 21, AQUA_TAIL
	dbw 25, PLAY_ROUGH
	dbw 31, MOONLIGHT
	dbw 35, RAIN_DANCE
	dbw 42, DOUBLE_EDGE
	dbw 46, SUPERPOWER
	dbw 55, HYDRO_PUMP
	dbw LEARN_EVO_MOVE, PIXIE_PUNCH
	db 0 ; no more level-up moves

BonslyEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, SUDOWOODO
	db 0 ; no more evolutions
	dbw 1, FLAIL
	dbw 8, LOW_KICK
	dbw 12, ROCK_THROW
	dbw 15, MIMIC
	dbw 19, FAINT_ATTACK
	dbw 22, HARDEN
	dbw 26, ROCK_TOMB
	dbw 29, MEAN_LOOK
	dbw 33, ROCK_SLIDE
	dbw 36, COUNTER
	dbw 40, EARTHQUAKE
	dbw 43, DOUBLE_EDGE
	db 0 ; no more level-up moves

SudowoodoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, MIMIC
	dbw 5, FLAIL
	dbw 8, LOW_KICK
	dbw 12, ROCK_THROW
	dbw 15, MIMIC
	dbw 19, FAINT_ATTACK
	dbw 22, HARDEN
	dbw 26, ROCK_TOMB
	dbw 29, MEAN_LOOK
	dbw 33, ROCK_SLIDE
	dbw 36, COUNTER
	dbw 40, EARTHQUAKE
	dbw 43, DOUBLE_EDGE
	dbw 47, STONE_EDGE
	dbw 50, WOOD_HAMMER
	dbw 54, HAMMER_ARM
	dbw 58, ROCK_WRECKER
	db 0 ; no more level-up moves

HoppipEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, SKIPLOOM
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, SPLASH
	dbw 1, SYNTHESIS
	dbw 1, TAIL_WHIP
	dbw 1, TACKLE
	dbw 4, SYNTHESIS
	dbw 6, TAIL_WHIP
	dbw 8, GUST
	dbw 10, FAIRY_WIND
	dbw 12, POISONPOWDER
	dbw 14, STUN_SPORE
	dbw 16, SLEEP_POWDER
	dbw 19, BULLET_SEED
	dbw 22, LEECH_SEED
	dbw 25, MEGA_DRAIN
	dbw 28, AERIAL_ACE
	dbw 31, SUNNY_DAY
	dbw 34, COTTON_SPORE
	dbw 37, QUIVER_DANCE
	dbw 40, AIR_SLASH
	dbw 43, GIGA_DRAIN
	dbw 46, HURRICANE
	dbw 49, BATON_PASS
	db 0 ; no more level-up moves

SkiploomEvosAttacks:
	dbbw EVOLVE_LEVEL, 27, JUMPLUFF
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, SPLASH
	dbw 1, SYNTHESIS
	dbw 1, TAIL_WHIP
	dbw 1, TACKLE
	dbw 4, SYNTHESIS
	dbw 6, TAIL_WHIP
	dbw 8, GUST
	dbw 10, FAIRY_WIND
	dbw 12, POISONPOWDER
	dbw 14, STUN_SPORE
	dbw 16, SLEEP_POWDER
	dbw 20, BULLET_SEED
	dbw 24, LEECH_SEED
	dbw 28, MEGA_DRAIN
	dbw 32, AERIAL_ACE
	dbw 36, SUNNY_DAY
	dbw 40, COTTON_SPORE
	dbw 44, QUIVER_DANCE
	dbw 48, AIR_SLASH
	dbw 52, GIGA_DRAIN
	dbw 56, HURRICANE
	dbw 60, BATON_PASS
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, MAGICAL_LEAF
	dbw 1, ABSORB
	dbw 1, SPLASH
	dbw 1, SYNTHESIS
	dbw 1, TAIL_WHIP
	dbw 1, TACKLE
	dbw 4, SYNTHESIS
	dbw 6, TAIL_WHIP
	dbw 8, GUST
	dbw 10, FAIRY_WIND
	dbw 12, POISONPOWDER
	dbw 14, STUN_SPORE
	dbw 16, SLEEP_POWDER
	dbw 20, BULLET_SEED
	dbw 24, LEECH_SEED
	dbw 29, MEGA_DRAIN
	dbw 34, AERIAL_ACE
	dbw 39, SUNNY_DAY
	dbw 44, COTTON_SPORE
	dbw 49, QUIVER_DANCE
	dbw 54, AIR_SLASH
	dbw 59, GIGA_DRAIN
	dbw 64, HURRICANE
	dbw 69, BATON_PASS
	dbw LEARN_EVO_MOVE, MAGICAL_LEAF
	db 0 ; no more level-up moves

AipomEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, AMBIPOM
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, TAIL_WHIP
	dbw 4, SAND_ATTACK
	dbw 8, ASTONISH
	dbw 11, BATON_PASS
	dbw 15, GROWL
	dbw 18, FURY_SWIPES
	dbw 22, SWIFT
	dbw 25, SCREECH
	dbw 29, AGILITY
	dbw 32, DOUBLE_HIT_M
	dbw 36, FAINT_ATTACK
	dbw 39, SWORDS_DANCE
	dbw 43, DOUBLE_EDGE
	db 0 ; no more level-up moves

AmbipomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, DUAL_CHOP
	dbw 1, SCRATCH
	dbw 1, TAIL_WHIP
	dbw 4, SAND_ATTACK
	dbw 8, ASTONISH
	dbw 11, BATON_PASS
	dbw 15, GROWL
	dbw 22, SWIFT
	dbw 25, SCREECH
	dbw 29, AGILITY
	dbw 36, FAINT_ATTACK
	dbw 39, SWORDS_DANCE
	dbw 43, DOUBLE_EDGE
	dbw LEARN_EVO_MOVE, DOUBLE_HIT_M
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	dbbw EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, GROWTH
	dbw 7, SING
	dbw 10, MEGA_DRAIN
	dbw 13, LEECH_SEED
	dbw 16, RAZOR_LEAF
	dbw 19, PROTECT
	dbw 22, GIGA_DRAIN
	dbw 25, AGILITY
	dbw 28, SYNTHESIS
	dbw 31, EARTH_POWER
	dbw 34, SOLARBEAM
	dbw 40, SUNNY_DAY
	dbw 43, SEED_BOMB
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, GROWTH
	dbw 7, SING
	dbw 10, EMBER
	dbw 13, LEECH_SEED
	dbw 16, RAZOR_LEAF
	dbw 19, PROTECT
	dbw 22, GIGA_DRAIN
	dbw 25, AGILITY
	dbw 28, PETAL_DANCE
	dbw 31, FLAMETHROWER
	dbw 34, SOLARBEAM
	dbw 40, SUNNY_DAY
	dbw 43, FIRE_BLAST
	dbw 50, PETAL_BLIZZ
	dbw LEARN_EVO_MOVE, FLAME_BURST
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	dbbw EVOLVE_LEVEL, 33, YANMEGA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, FORESIGHT
	dbw 6, QUICK_ATTACK
	dbw 11, DOUBLE_TEAM
	dbw 14, SONICBOOM
	dbw 17, DETECT
	dbw 22, SUPERSONIC
	dbw 27, HYPER_VOICE
	dbw 30, PURSUIT
	dbw 33, ANCIENTPOWER
	dbw 38, HYPNOSIS
	dbw 43, AIR_CUTTER
	dbw 46, SCREECH
	dbw 49, SIGNAL_BEAM
	dbw 54, AIR_SLASH
	dbw 57, BUG_BUZZ
	db 0 ; no more level-up moves

YanmegaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, FORESIGHT
	dbw 6, QUICK_ATTACK
	dbw 11, DOUBLE_TEAM
	dbw 14, SONICBOOM
	dbw 17, DETECT
	dbw 22, SUPERSONIC
	dbw 27, HYPER_VOICE
	dbw 30, PURSUIT
	dbw 38, HYPNOSIS
	dbw 43, POWER_GEM
	dbw 46, NASTY_PLOT
	dbw 49, SIGNAL_BEAM
	dbw 54, AIR_SLASH
	dbw 57, BUG_BUZZ
	dbw LEARN_EVO_MOVE, ANCIENTPOWER
	db 0 ; no more level-up moves

WooperEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, QUAGSIRE
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, TAIL_WHIP
	dbw 9, MUD_SHOT
	dbw 12, AQUA_JET
	dbw 15, SLAM
	dbw 19, MUD_BOMB
	dbw 23, AMNESIA
	dbw 29, SCREECH
	dbw 33, EARTHQUAKE
	dbw 37, RAIN_DANCE
	dbw 43, MIST
	dbw 43, HAZE
	dbw 47, AQUA_TAIL
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BULLDOZE
	dbw 1, AQUA_JET
	dbw 1, TAIL_WHIP
	dbw 9, MUD_SHOT
	dbw 15, SLAM
	dbw 19, MUD_BOMB
	dbw 24, AMNESIA
	dbw 31, SCREECH
	dbw 36, EARTHQUAKE
	dbw 41, RAIN_DANCE
	dbw 48, MIST
	dbw 48, HAZE
	dbw 53, AQUA_TAIL
	dbw LEARN_EVO_MOVE, BULLDOZE
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	dbbw EVOLVE_ITEM, DUSK_STONE, HONCHKROW
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 1, PECK
	dbw 5, PURSUIT
	dbw 11, HAZE
	dbw 15, WING_ATTACK
	dbw 21, NIGHT_SHADE
	dbw 25, PAYBACK
	dbw 31, AGILITY
	dbw 35, FAINT_ATTACK
	dbw 41, MEAN_LOOK
	dbw 45, AIR_SLASH
	dbw 50, ROOST
	dbw 55, NIGHT_SLASH
	dbw 61, SWAGGER
	dbw 65, BRAVE_BIRD
	db 0 ; no more level-up moves

HonchkrowEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, AERIAL_ACE
	dbw 1, PECK
	dbw 11, PURSUIT
	dbw 16, HAZE
	dbw 25, SWAGGER
	dbw 35, NASTY_PLOT
	dbw 45, DRILL_PECK
	dbw 55, NIGHT_SLASH
	dbw 65, ROOST
	dbw 75, DARK_PULSE
	dbw LEARN_EVO_MOVE, AERIAL_ACE
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
	dbbw EVOLVE_ITEM, DUSK_STONE, MISMAGIUS
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, PSYWAVE
	dbw 5, SPITE
	dbw 10, ASTONISH
	dbw 14, CONFUSE_RAY
	dbw 19, MEAN_LOOK
	dbw 23, HEX
	dbw 28, PSYBEAM
	dbw 32, PAIN_SPLIT
	dbw 37, PAYBACK
	dbw 41, SHADOW_BALL
	dbw 46, PERISH_SONG
	dbw 50, NASTY_PLOT
	dbw 55, POWER_GEM
	db 0 ; no more level-up moves

MismagiusEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, MAGICAL_LEAF
	dbw 1, FLAMETHROWER
	dbw 1, POWER_GEM
	dbw 1, GROWL
	dbw 1, THIEF
	dbw 1, NIGHT_SHADE
	dbw 1, DISARM_VOICE
	dbw 1, CURSE
	dbw 1, SHADOW_BALL
	dbw LEARN_EVO_MOVE, MAGICAL_LEAF
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HIDDEN_POWER
	db 0 ; no more level-up moves

WynautEvosAttacks:
	dbbw EVOLVE_LEVEL, 15, WOBBUFFET
	db 0 ; no more evolutions
	dbw 1, CHARM
	dbw 1, SPLASH
	dbw 1, ENCORE
	dbw 1, AMNESIA
	dbw 15, COUNTER
	dbw 15, DESTINY_BOND
	dbw 15, MIRROR_COAT
	dbw 15, SAFEGUARD
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, COUNTER
	dbw 1, MIRROR_COAT
	dbw 1, SAFEGUARD
	dbw 1, DESTINY_BOND
	db 0 ; no more level-up moves

GirafarigEvosAttacks:
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

PinecoEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, FORRETRESS
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, PROTECT
	dbw 6, SELFDESTRUCT
	dbw 9, PIN_MISSILE
	dbw 12, TAKE_DOWN
	dbw 17, RAPID_SPIN
	dbw 20, REVERSAL
	dbw 23, SUBSTITUTE
	dbw 28, SPIKES
	dbw 31, PAYBACK
	dbw 34, EXPLOSION
	dbw 39, IRON_DEFENSE
	dbw 42, GYRO_BALL
	dbw 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

ForretressEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, MIRROR_SHOT
	dbw 1, TACKLE
	dbw 1, PROTECT
	dbw 6, SELFDESTRUCT
	dbw 9, PIN_MISSILE
	dbw 12, TAKE_DOWN
	dbw 17, RAPID_SPIN
	dbw 20, REVERSAL
	dbw 23, SUBSTITUTE
	dbw 28, SPIKES
	dbw 32, PAYBACK
	dbw 36, EXPLOSION
	dbw 42, IRON_DEFENSE
	dbw 46, GYRO_BALL
	dbw 50, DOUBLE_EDGE
	dbw 56, LOCK_ON
	dbw 60, ZAP_CANNON
	dbw 64, STEEL_SLICE
	dbw LEARN_EVO_MOVE, MIRROR_SHOT
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
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
	dbw 31, DRAGON_DANCE
	dbw 33, DIG
	dbw 36, GLARE
	dbw 38, DOUBLE_EDGE
	dbw 41, EARTHQUAKE
	dbw 43, PLAY_ROUGH
	dbw 46, DRAGON_RUSH
	dbw 48, ENDURE
	dbw 51, MOONBLAST
	dbw 54, GIGA_IMPACT
	db 0 ; no more level-up moves

GligarEvosAttacks:
	dbbw EVOLVE_ITEM, RAZOR_FANG, GLISCOR
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 4, SAND_ATTACK
	dbw 7, HARDEN
	dbw 10, FAINT_ATTACK
	dbw 13, QUICK_ATTACK
	dbw 16, FURY_CUTTER
	dbw 19, BULLDOZE
	dbw 22, AERIAL_ACE
	dbw 27, SLASH
	dbw 30, NIGHT_SLASH
	dbw 35, SCREECH
	dbw 40, X_SCISSOR
	dbw 45, BRICK_BREAK
	dbw 50, SWORDS_DANCE
	dbw 55, GUILLOTINE
	dbw 60, EARTHQUAKE
	db 0 ; no more level-up moves

GliscorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 4, SAND_ATTACK
	dbw 7, HARDEN
	dbw 10, FAINT_ATTACK
	dbw 13, QUICK_ATTACK
	dbw 16, FURY_CUTTER
	dbw 19, BULLDOZE
	dbw 22, AERIAL_ACE
	dbw 27, SLASH
	dbw 30, NIGHT_SLASH
	dbw 35, SCREECH
	dbw 40, X_SCISSOR
	dbw 45, BRICK_BREAK
	dbw 50, SWORDS_DANCE
	dbw 55, GUILLOTINE
	dbw 60, EARTHQUAKE
	db 0 ; no more level-up moves

SnubbullEvosAttacks:
	dbbw EVOLVE_LEVEL, 23, GRANBULL
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCARY_FACE
	dbw 1, TAIL_WHIP
	dbw 1, CHARM
	dbw 7, BITE
	dbw 13, LICK
	dbw 19, HEADBUTT
	dbw 25, ROAR
	dbw 31, RAGE
	dbw 47, PLAY_ROUGH
	dbw 43, PAYBACK
	dbw 49, CRUNCH
	db 0 ; no more level-up moves

GranbullEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PIXIE_PUNCH
	dbw 1, ICE_FANG
	dbw 1, FIRE_FANG
	dbw 1, THUNDER_FANG
	dbw 1, TACKLE
	dbw 1, SCARY_FACE
	dbw 1, TAIL_WHIP
	dbw 1, CHARM
	dbw 7, BITE
	dbw 13, LICK
	dbw 19, HEADBUTT
	dbw 27, ROAR
	dbw 35, RAGE
	dbw 43, PLAY_ROUGH
	dbw 51, PAYBACK
	dbw 59, CRUNCH
	dbw 67, OUTRAGE
	dbw LEARN_EVO_MOVE, PIXIE_PUNCH
	db 0 ; no more level-up moves

QwilfishEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SPIKES
	dbw 1, TACKLE
	dbw 1, POISON_STING
	dbw 1, WATER_GUN
	dbw 9, HARDEN
	dbw 9, MINIMIZE
	dbw 13, AQUA_JET
	dbw 17, ROLLOUT
	dbw 21, TOXIC
	dbw 25, DEFENSE_CURL
	dbw 29, REVENGE
	dbw 33, BUBBLEBEAM
	dbw 37, PIN_MISSILE
	dbw 41, TAKE_DOWN
	dbw 45, AQUA_TAIL
	dbw 49, POISON_JAB
	dbw 53, DESTINY_BOND
	dbw 57, GUNK_SHOT
	dbw 60, LEECH_LIFE
	db 0 ; no more level-up moves

ShuckleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONSTRICT
	dbw 1, WITHDRAW
	dbw 1, ROLLOUT
	dbw 5, ENCORE
	dbw 9, WRAP
	dbw 16, SAFEGUARD
	dbw 20, REST
	dbw 23, ROCK_THROW
	dbw 27, SPIKES
	dbw 31, AMNESIA
	dbw 34, SHELL_SMASH
	dbw 38, ROCK_SLIDE
	dbw 42, IRON_DEFENSE
	dbw 45, X_SCISSOR
	dbw 49, STONE_EDGE
	dbw 53, ROCK_POLISH
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, HORN_ATTACK
	dbw 7, ENDURE
	dbw 10, AERIAL_ACE
	dbw 16, HEADBUTT
	dbw 19, BRICK_BREAK
	dbw 25, FURY_ATTACK
	dbw 28, COUNTER
	dbw 31, PIN_MISSILE
	dbw 34, TAKE_DOWN
	dbw 37, MEGAHORN
	dbw 43, CLOSE_COMBAT
	dbw 46, REVERSAL
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	dbbw EVOLVE_ITEM, RAZOR_CLAW, WEAVILE
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 8, QUICK_ATTACK
	dbw 10, FAINT_ATTACK
	dbw 14, ICE_SHARD
	dbw 16, FURY_SWIPES
	dbw 20, AGILITY
	dbw 22, METAL_CLAW
	dbw 25, HONE_CLAWS
	dbw 28, THIEF
	dbw 32, SCREECH
	dbw 35, SLASH
	dbw 40, PAYBACK
	dbw 44, NIGHT_SLASH
	dbw 47, ICICLE_CRASH
	db 0 ; no more level-up moves

WeavileEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 8, QUICK_ATTACK
	dbw 10, FAINT_ATTACK
	dbw 14, ICE_SHARD
	dbw 16, FURY_SWIPES
	dbw 20, AGILITY
	dbw 22, METAL_CLAW
	dbw 25, HONE_CLAWS
	dbw 28, THIEF
	dbw 32, SCREECH
	dbw 35, NIGHT_SLASH
	dbw 40, PAYBACK
	dbw 44, ICICLE_CRASH
	dbw 47, DARK_PULSE
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 1, GROWL
	dbw 1, LICK
	dbw 8, FURY_SWIPES
	dbw 15, FAINT_ATTACK
	dbw 22, SWEET_SCENT
	dbw 25, PLAY_ROUGH
	dbw 29, SLASH
	dbw 36, CHARM
	dbw 43, REST
	dbw 43, SNORE
	dbw 50, THRASH
	dbw 57, CRUNCH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SHADOW_CLAW
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 1, GROWL
	dbw 1, LICK
	dbw 8, FURY_SWIPES
	dbw 15, FAINT_ATTACK
	dbw 22, SWEET_SCENT
	dbw 25, PLAY_ROUGH
	dbw 29, SLASH
	dbw 38, CHARM
	dbw 47, REST
	dbw 47, SNORE
	dbw 58, THRASH
	dbw 63, CRUNCH
	dbw 67, HAMMER_ARM
	dbw LEARN_EVO_MOVE, SHADOW_CLAW
	db 0 ; no more level-up moves

SlugmaEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, MAGCARGO
	db 0 ; no more evolutions
	dbw 1, SMOG
	dbw 6, EMBER
	dbw 8, ROCK_THROW
	dbw 13, HARDEN
	dbw 15, FIRE_SPIN
	dbw 20, HAZE
	dbw 22, ANCIENTPOWER
	dbw 27, FLAME_BURST
	dbw 29, STEEL_SLICE
	dbw 34, FLAMETHROWER
	dbw 36, AMNESIA
	dbw 41, BODY_SLAM
	dbw 43, RECOVER
	dbw 48, INFERNO
	dbw 50, EARTH_POWER
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SHELL_SMASH
	dbw 1, SMOG
	dbw 6, EMBER
	dbw 8, ROCK_THROW
	dbw 13, HARDEN
	dbw 15, FIRE_SPIN
	dbw 20, HAZE
	dbw 22, ANCIENTPOWER
	dbw 27, FLAME_BURST
	dbw 30, STEEL_SLICE
	dbw 33, FLASH_CANNON
	dbw 36, FLAMETHROWER
	dbw 39, AMNESIA
	dbw 43, BODY_SLAM
	dbw 47, RECOVER
	dbw 54, INFERNO
	dbw 58, EARTH_POWER
	dbw LEARN_EVO_MOVE, SHELL_SMASH
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	dbbw EVOLVE_LEVEL, 33, PILOSWINE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, ODOR_SLEUTH
	dbw 5, ICE_SHARD
	dbw 8, POWDER_SNOW
	dbw 11, MUD_SLAP
	dbw 14, ENDURE
	dbw 18, BULLDOZE
	dbw 21, HAIL
	dbw 24, ICE_FANG
	dbw 28, TAKE_DOWN
	dbw 35, MIST
	dbw 40, FLAIL
	dbw 44, BLIZZARD
	dbw 48, AMNESIA
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
	dbbw EVOLVE_ITEM, ICE_STONE, MAMOSWINE
	db 0 ; no more evolutions
	dbw 1, ICE_FANG
	dbw 1, TACKLE
	dbw 1, MUD_SLAP
	dbw 8, POWDER_SNOW
	dbw 11, MUD_SLAP
	dbw 14, ENDURE
	dbw 18, MUD_BOMB
	dbw 21, HAIL
	dbw 24, ICE_FANG
	dbw 28, TAKE_DOWN
	dbw 37, MIST
	dbw 41, THRASH
	dbw 46, EARTHQUAKE
	dbw 52, BLIZZARD
	dbw 58, AMNESIA
	dbw 63, ICICLE_CRASH
	dbw LEARN_EVO_MOVE, FURY_ATTACK
	db 0 ; no more level-up moves

MamoswineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, ICE_FANG
	dbw 1, TACKLE
	dbw 8, POWDER_SNOW
	dbw 11, MUD_SLAP
	dbw 14, ENDURE
	dbw 18, MUD_BOMB
	dbw 21, HAIL
	dbw 24, ICE_FANG
	dbw 28, TAKE_DOWN
	dbw 33, DOUBLE_HIT_M
	dbw 37, MIST
	dbw 41, THRASH
	dbw 46, EARTHQUAKE
	dbw 52, BLIZZARD
	dbw 58, SCARY_FACE
	dbw 63, ICICLE_CRASH
	dbw LEARN_EVO_MOVE, ANCIENTPOWER
	db 0 ; no more level-up moves

CorsolaEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, CURSOLA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 5, ASTONISH
	dbw 10, DISABLE
	dbw 15, SPITE
	dbw 20, ANCIENTPOWER
	dbw 25, HEX
	dbw 30, CURSE
	dbw 35, STRENGTH_SAP
	dbw 40, POWER_GEM
	dbw 45, NIGHT_SHADE
	dbw 50, WILL_O_WISP
	dbw 55, MIRROR_COAT
	db 0 ; no more level-up moves

CursolaEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PERISH_SONG
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 5, ASTONISH
	dbw 10, DISABLE
	dbw 15, SPITE
	dbw 20, ANCIENTPOWER
	dbw 25, HEX
	dbw 30, CURSE
	dbw 35, STRENGTH_SAP
	dbw 40, POWER_GEM
	dbw 45, NIGHT_SHADE
	dbw 50, WILL_O_WISP
	dbw 55, MIRROR_COAT
	dbw LEARN_EVO_MOVE, PERISH_SONG
	db 0 ; no more level-up moves

RemoraidEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, OCTILLERY
	db 0 ; no more evolutions
	dbw 1, AQUA_JET
	dbw 6, LOCK_ON
	dbw 10, PSYBEAM
	dbw 14, AURORA_BEAM
	dbw 18, BUBBLEBEAM
	dbw 22, FOCUS_ENERGY
	dbw 26, WATER_PULSE
	dbw 30, SIGNAL_BEAM
	dbw 34, ICE_BEAM
	dbw 38, BULLET_SEED
	dbw 42, HYDRO_PUMP
	dbw 46, HYPER_BEAM
	dbw 50, RECOVER
	db 0 ; no more level-up moves

OctilleryEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, OCTAZOOKA
	dbw 1, AQUA_JET
	dbw 6, LOCK_ON
	dbw 10, PSYBEAM
	dbw 14, AURORA_BEAM
	dbw 18, BUBBLEBEAM
	dbw 22, FOCUS_ENERGY
	dbw 26, WATER_PULSE
	dbw 30, BULLET_SEED
	dbw 36, ICE_BEAM
	dbw 42, HYDRO_PUMP
	dbw 48, FLASH_CANNON
	dbw 54, GUNK_SHOT
	dbw 58, HYPER_BEAM
	dbw LEARN_EVO_MOVE, OCTAZOOKA
	db 0 ; no more level-up moves

DelibirdEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PRESENT
	dbw 25, DRILL_PECK
	db 0 ; no more level-up moves

MantykeEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, MANTINE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, BUBBLE
	dbw 3, SUPERSONIC
	dbw 7, BUBBLEBEAM
	dbw 11, CONFUSE_RAY
	dbw 14, WING_ATTACK
	dbw 16, HEADBUTT
	dbw 19, WATER_PULSE
	dbw 23, PROTECT
	dbw 27, TAKE_DOWN
	dbw 32, AGILITY
	dbw 36, AIR_SLASH
	dbw 39, ROOST
	dbw 46, BOUNCE
	dbw 49, HYDRO_PUMP
	db 0 ; no more level-up moves

MantineEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, BUBBLE
	dbw 3, SUPERSONIC
	dbw 7, BUBBLEBEAM
	dbw 11, CONFUSE_RAY
	dbw 14, WING_ATTACK
	dbw 16, HEADBUTT
	dbw 19, WATER_PULSE
	dbw 23, PROTECT
	dbw 27, TAKE_DOWN
	dbw 32, AGILITY
	dbw 36, AIR_SLASH
	dbw 39, ROOST
	dbw 46, BOUNCE
	dbw 49, HYDRO_PUMP
	dbw 52, RAIN_DANCE
	dbw 55, HURRICANE
	db 0 ; no more level-up moves

SkarminiEvosAttacks:
	dbbw EVOLVE_LEVEL, 27, SKARMORY
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, PECK
	dbw 6, SAND_ATTACK
	dbw 9, METAL_CLAW
	dbw 12, AERIAL_ACE
	dbw 17, FURY_ATTACK
	dbw 20, ROOST
	dbw 23, SWIFT
	dbw 27, STEEL_WING
	dbw 28, SPIKES
	dbw 30, AGILITY
	dbw 33, WING_ATTACK
	dbw 36, SLASH
	dbw 39, SCREECH
	dbw 42, DRILL_PECK
	dbw 45, SWORDS_DANCE
	dbw 48, NIGHT_SLASH
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, STEEL_WING
	dbw 1, LEER
	dbw 1, PECK
	dbw 6, SAND_ATTACK
	dbw 9, METAL_CLAW
	dbw 12, AERIAL_ACE
	dbw 17, FURY_ATTACK
	dbw 20, ROOST
	dbw 23, SWIFT
	dbw 27, STEEL_WING
	dbw 28, SPIKES
	dbw 31, AGILITY
	dbw 34, WING_ATTACK
	dbw 39, SLASH
	dbw 42, SCREECH
	dbw 45, DRILL_PECK
	dbw 50, SWORDS_DANCE
	dbw 53, NIGHT_SLASH
	dbw 57, STEEL_SLICE
	dbw LEARN_EVO_MOVE, STEEL_WING
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, EMBER
	dbw 4, HOWL
	dbw 8, SMOG
	dbw 13, ROAR
	dbw 16, BITE
	dbw 20, ODOR_SLEUTH
	dbw 25, SNARL
	dbw 28, FIRE_FANG
	dbw 32, FAINT_ATTACK
	dbw 37, WILL_O_WISP
	dbw 40, CRUNCH
	dbw 44, FLAMETHROWER
	dbw 49, DARK_PULSE
	dbw 52, NASTY_PLOT
	dbw 56, INFERNO
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, FLAME_BURST
	dbw 1, LEER
	dbw 1, EMBER
	dbw 4, HOWL
	dbw 8, SMOG
	dbw 13, ROAR
	dbw 16, BITE
	dbw 20, ODOR_SLEUTH
	dbw 26, SNARL
	dbw 30, FIRE_FANG
	dbw 35, FAINT_ATTACK
	dbw 41, WILL_O_WISP
	dbw 45, CRUNCH
	dbw 50, FLAMETHROWER
	dbw 56, DARK_PULSE
	dbw 60, NASTY_PLOT
	dbw 65, INFERNO
	dbw LEARN_EVO_MOVE, FLAME_BURST
	db 0 ; no more level-up moves

PhanpyEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, DONPHAN
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, DEFENSE_CURL
	dbw 6, FLAIL
	dbw 10, ROLLOUT
	dbw 15, MAGNITUDE
	dbw 19, ENDURE
	dbw 24, BODY_SLAM
	dbw 28, TAKE_DOWN
	dbw 33, CHARM
	dbw 37, PLAY_ROUGH
	dbw 42, DOUBLE_EDGE
	db 0 ; no more level-up moves

DonphanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, BULLDOZE
	dbw 1, HORN_ATTACK
	dbw 1, GROWL
	dbw 1, DEFENSE_CURL
	dbw 10, ROLLOUT
	dbw 15, PAYBACK
	dbw 19, HORN_ATTACK
	dbw 30, RAPID_SPIN
	dbw 37, SCARY_FACE
	dbw 43, EARTHQUAKE
	dbw 50, GIGA_IMPACT
	dbw LEARN_EVO_MOVE, HIHORSEPOWER
	db 0 ; no more level-up moves

StantlerEvosAttacks:
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
	dbw 49,PROTECT
	dbw 50, DREAM_EATER
	dbw 55, GIGA_IMPACT
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, SKETCH
	dbw 11, SKETCH
	dbw 21, SKETCH
	dbw 31, SKETCH
	dbw 41, SKETCH
	dbw 51, SKETCH
	dbw 61, SKETCH
	dbw 71, SKETCH
	dbw 81, SKETCH
	dbw 91, SKETCH
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 3, GROWL
	dbw 5, DEFENSE_CURL
	dbw 8, STOMP
	dbw 11, MILK_DRINK
	dbw 15, BULK_UP
	dbw 19, ROLLOUT
	dbw 24, BODY_SLAM
	dbw 29, ZEN_HEADBUTT
	dbw 35, ATTRACT
	dbw 41, GYRO_BALL
	dbw 48, HEAL_BELL
	dbw 50, GIGA_IMPACT
	db 0 ; no more level-up moves

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
	dbw 57, FLAME_CHARGE
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
	dbw 1, TACKLE
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
	dbbw EVOLVE_LEVEL, 55, TYRANITAR
	db 0 ; no more evolutions
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
	dbw 1, ROCK_THROW
	dbw 1, LEER
	dbw 5, SANDSTORM
	dbw 10, SCREECH
	dbw 14, BITE
	dbw 19, ROCK_SLIDE
	dbw 23, SCARY_FACE
	dbw 30, THRASH
	dbw 34, DARK_PULSE
	dbw 41, PAYBACK
	dbw 47, CRUNCH
	dbw 54, EARTHQUAKE
	dbw 63, STONE_EDGE
	dbw 73, HYPER_BEAM
	dbw 82, GIGA_IMPACT
	dbw LEARN_EVO_MOVE, CLOSE_COMBAT
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
	dbw LEARN_EVO_MOVE, FLY
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
