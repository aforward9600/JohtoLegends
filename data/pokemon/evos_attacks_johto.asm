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
	dw FarigirafEvosAttacks
	dw PinecoEvosAttacks
	dw ForretressEvosAttacks
	dw DunsparceEvosAttacks
	dw DudunsparsEvosAttacks
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
	dw UrsalunaEvosAttacks
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
	dw WyrdeerEvosAttacks
	dw SmeargleEvosAttacks
	dw MiltankEvosAttacks
	dw KotoraEvosAttacks
	dw RaitoraEvosAttacks
	dw GorotoraEvosAttacks
	dw BudewEvoseAttacks
	dw RoseliaEvosAttacks
	dw RoseradeEvosAttacks
	dw ElectrikeEvosAttacks
	dw ManectricEvosAttacks
	dw CroagunkEvosAttacks
	dw ToxicroakEvosAttacks
	dw SwabluEvosAttacks
	dw AltariaEvosAttacks
	dw DuskullEvosAttacks
	dw DusclopsEvosAttacks
	dw DusknoirEvosAttacks
	dw LotadEvosAttacks
	dw LombreEvosAttacks
	dw LudicoloEvosAttacks
	dw SnoruntEvosAttacks
	dw GlalieEvosAttacks
	dw FroslassEvosAttacks
	dw BronzorEvosAttacks
	dw BronzongEvosAttacks
	dw CacneaEvosAttacks
	dw CacturneEvosAttacks
	dw RaltsEvosAttacks
	dw KirliaEvosAttacks
	dw GardevoirEvosAttacks
	dw GalladeEvosAttacks
	dw AronEvosAttacks
	dw LaironEvosAttacks
	dw AggronEvosAttacks

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
	dbw 29, WORK_UP
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
	dbw 5, TACKLE
	dbw 15, FLAIL
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, BITE
	dbw 1, BITE
	dbw 1, THRASH
	dbw 21, LEER
	dbw 24, DRAGON_RAGE
	dbw 27, ICE_FANG
	dbw 30, AQUA_TAIL
	dbw 33, SCARY_FACE
	dbw 36, TWISTER
	dbw 39, CRUNCH
	dbw 42, WAVE_CRASH
	dbw 45, DRAGON_DANCE
	dbw 48, BOUNCE
	dbw 51, RAIN_DANCE
	dbw 54, GIGA_IMPACT
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
	dbbw EVOLVE_ITEM, SUN_STONE, ESPEON
	dbbw EVOLVE_ITEM, MOON_STONE, UMBREON
	dbbw EVOLVE_ITEM, LEAF_STONE, LEAFEON
	dbbw EVOLVE_ITEM, ICE_STONE, GLACEON
	dbbw EVOLVE_ITEM, SHINY_STONE, SYLVEON
	dbbw EVOLVE_HAPPINESS, TR_MORNDAY, ESPEON
	dbbw EVOLVE_HAPPINESS, TR_EVENITE, UMBREON
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 1, GROWL
	dbw 5, SAND_ATTACK
	dbw 13, QUICK_ATTACK
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
	dbw LEARN_EVO_MOVE, WATER_GUN
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
	dbw 37, MUDDY_WATER
	dbw 41, DOUBLE_EDGE
	dbw 45, HYDRO_PUMP
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, THUNDERSHOCK
	dbw 1, THUNDERSHOCK
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, SAND_ATTACK
	dbw 9, GROWL
	dbw 13, QUICK_ATTACK
	dbw 17, DOUBLE_KICK
	dbw 20, THUNDER_FANG
	dbw 25, SIGNAL_BEAM
	dbw 29, AGILITY
	dbw 33, THUNDER_WAVE
	dbw 37, DISCHARGE
	dbw 41, DOUBLE_EDGE
	dbw 45, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, EMBER
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
	dbw 37, LAVA_PLUME
	dbw 41, DOUBLE_EDGE
	dbw 45, FLARE_BLITZ
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, CONFUSION
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
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, PURSUIT
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
	db 0 ; no more level-up moves

LeafeonEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, RAZOR_LEAF
	dbw 1, RAZOR_LEAF
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, SAND_ATTACK
	dbw 9, GROWL
	dbw 13, QUICK_ATTACK
	dbw 17, GRASSWHISTLE
	dbw 20, GIGA_DRAIN
	dbw 25, LEAF_BLADE
	dbw 29, SWORDS_DANCE
	dbw 33, SYNTHESIS
	dbw 37, SUNNY_DAY
	dbw 41, DOUBLE_EDGE
	dbw 45, SOLAR_BLADE
	db 0 ; no more level-up moves

GlaceonEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, ICY_WIND
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
	db 0 ; no more level-up moves

SylveonEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, FAIRY_WIND
	dbw 1, FAIRY_WIND
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 5, SAND_ATTACK
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
	dbw 1, TACKLE
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
	dbw 46, JURASSICBEAM
	dbw 50, SHELL_SMASH
	dbw 55, HYDRO_PUMP
	db 0 ; no more level-up moves

OmastarEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SPIKE_CANNON
	dbw 1, SPIKE_CANNON
	dbw 1, TACKLE
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
	dbw 56, JURASSICBEAM
	dbw 67, SHELL_SMASH
	dbw 75, HYDRO_PUMP
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
	dbw 50, WAVE_CRASH
	db 0 ; no more level-up moves

KabutopsEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SLASH
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
	dbw 63, WAVE_CRASH
	dbw 72, NIGHT_SLASH
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
	dbw 49, DUALWINGBEAT
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
	dbw 43, DUALWINGBEAT
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
	dbw 36, FLAMETHROWER
	dbw 43, SAFEGUARD
	dbw 50, AIR_SLASH
	dbw 57, SUNNY_DAY
	dbw 64, HEAT_WAVE
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
	dbbw EVOLVE_LEVEL, 40, DRAGONITE
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, DRAGONBREATH
	dbw 1, DRAGONBREATH
	dbw 1, WRAP
	dbw 1, LEER
	dbw 5, THUNDER_WAVE
	dbw 11, TWISTER
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
	dbw LEARN_EVO_MOVE, HURRICANE
	dbw 1, HURRICANE
	dbw 1, WRAP
	dbw 1, LEER
	dbw 5, THUNDER_WAVE
	dbw 11, TWISTER
	dbw 15, DRACO_FANG
	dbw 21, SLAM
	dbw 27, AGILITY
	dbw 33, DRAGON_TAIL
	dbw 39, AQUA_TAIL
	dbw 45, DUALWINGBEAT
	dbw 50, DRAGON_RUSH
	dbw 56, SAFEGUARD
	dbw 61, DRAGON_DANCE
	dbw 67, OUTRAGE
	dbw 75, HYPER_BEAM
	dbw 81, GIGA_IMPACT
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
	dbw 100, PSYCHIC_M
	dbw 100, MOONBLAST
	dbw 100, AURA_SPHERE
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
	dbw LEARN_EVO_MOVE, PETAL_DANCE
	dbw 1, PETAL_DANCE
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
	dbw 70, FRENZY_PLANT
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
	dbw 37, LAVA_PLUME
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
	dbw 42, LAVA_PLUME
	dbw 46, FLAMETHROWER
	dbw 53, INFERNO
	dbw 57, ROLLOUT
	dbw 64, DOUBLE_EDGE
	dbw 68, FIRE_BLAST
	dbw 75, EARTHQUAKE
	db 0 ; no more level-up moves

TyphlosionEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, EARTH_POWER
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
	dbw 43, LAVA_PLUME
	dbw 48, FLAMETHROWER
	dbw 56, INFERNO
	dbw 61, ROLLOUT
if DEF(_FAITHFUL)
	dbw 69, DOUBLE_EDGE
elif DEF(_NOPSS)
	dbw 69, DOUBLE_EDGE
else
	dbw 69, EARTHQUAKE
endc
	dbw 74, FIRE_BLAST
	dbw 82, BLAST_BURN
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
if DEF(_FAITHFUL)
	dbw 27, CRUNCH
elif DEF(_NOPSS)
	dbw 27, CRUNCH
else
	dbw 27, WATERFALL
endc
	dbw 29, HEADBUTT
if DEF(_FAITHFUL)
	dbw 34, SLASH
elif DEF(_NOPSS)
	dbw 34, SLASH
else
	dbw 34, CRUNCH
endc
	dbw 36, SCREECH
	dbw 41, THRASH
	dbw 43, AQUA_TAIL
	dbw 48, SUPERPOWER
	dbw 50, WAVE_CRASH
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
if DEF(_FAITHFUL)
	dbw 30, CRUNCH
elif DEF(_NOPSS)
	dbw 30, CRUNCH
else
	dbw 30, WATERFALL
endc
	dbw 33, HEADBUTT
if DEF(_FAITHFUL)
	dbw 39, SLASH
elif DEF(_NOPSS)
	dbw 39, SLASH
else
	dbw 39, CRUNCH
endc
	dbw 42, SCREECH
	dbw 48, THRASH
	dbw 51, AQUA_TAIL
	dbw 57, SUPERPOWER
	dbw 60, WAVE_CRASH
	db 0 ; no more level-up moves

FeraligatrEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, NIGHT_SLASH
	dbw 1, NIGHT_SLASH
	dbw 1, SCRATCH
	dbw 1, LEER
	dbw 6, WATER_GUN
	dbw 8, RAGE
	dbw 13, BITE
	dbw 15, SCARY_FACE
	dbw 21, ICE_FANG
	dbw 24, FLAIL
if DEF(_FAITHFUL)
	dbw 32, CRUNCH
elif DEF(_NOPSS)
	dbw 32, CRUNCH
else
	dbw 32, WATERFALL
endc
	dbw 37, HEADBUTT
if DEF(_FAITHFUL)
	dbw 45, SLASH
elif DEF(_NOPSS)
	dbw 45, SLASH
else
	dbw 45, CRUNCH
endc
	dbw 50, SCREECH
	dbw 58, THRASH
	dbw 63, AQUA_TAIL
	dbw 71, SUPERPOWER
	dbw 76, WAVE_CRASH
	dbw 80, HYDRO_CANNON
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
	dbw 31, SUCKER_PUNCH
	dbw 36, AMNESIA
	dbw 39, BATON_PASS
	dbw 42, DOUBLE_EDGE
	dbw 47, HYPER_VOICE
	db 0 ; no more level-up moves

FurretEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, AGILITY
	dbw 1, AGILITY
	dbw 1, COIL
	dbw 1, SCRATCH
	dbw 1, FORESIGHT
	dbw 4, DEFENSE_CURL
	dbw 7, QUICK_ATTACK
	dbw 13, FURY_SWIPES
	dbw 17, LEER
	dbw 21, DIZZY_PUNCH
	dbw 28, SLAM
	dbw 32, REST
	dbw 36, SUCKER_PUNCH
	dbw 42, AMNESIA
	dbw 46, BATON_PASS
	dbw 50, DOUBLE_EDGE
	dbw 56, HYPER_VOICE
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, FORESIGHT
	dbw 4, HYPNOSIS
	dbw 7, PECK
	dbw 10, CONFUSION
	dbw 13, ECHOED_VOICE
	dbw 16, ZEN_HEADBUTT
	dbw 19, LIGHT_SCREEN
if DEF(_FAITHFUL)
	dbw 22, EXTRASENSORY
elif DEF(_NOPSS)
	dbw 22, EXTRASENSORY
else
	dbw 22, NIGHT_SHADE
endc
	dbw 25, TAKE_DOWN
	dbw 28, REFLECT
	dbw 31, AIR_SLASH
	dbw 34, HYPER_VOICE
	dbw 37, ROOST
if DEF(_FAITHFUL)
	dbw 40, MOONBLAST
elif DEF(_NOPSS)
	dbw 40, MOONBLAST
else
	dbw 40, SHADOW_BALL
endc
	dbw 43, PSYCH_UP
	dbw 46, DREAM_EATER
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, HEX
	dbw 1, HEX
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 1, FORESIGHT
	dbw 4, HYPNOSIS
	dbw 7, PECK
	dbw 10, CONFUSION
	dbw 13, ECHOED_VOICE
	dbw 16, ZEN_HEADBUTT
	dbw 19, LIGHT_SCREEN
if DEF(_FAITHFUL)
	dbw 23, EXTRASENSORY
elif DEF(_NOPSS)
	dbw 23, EXTRASENSORY
else
	dbw 23, NIGHT_SHADE
endc
	dbw 27, TAKE_DOWN
	dbw 31, REFLECT
	dbw 35, AIR_SLASH
	dbw 39, HYPER_VOICE
	dbw 43, ROOST
if DEF(_FAITHFUL)
	dbw 47, MOONBLAST
elif DEF(_NOPSS)
	dbw 47, MOONBLAST
else
	dbw 47, SHADOW_BALL
endc
	dbw 51, PSYCH_UP
	dbw 55, DREAM_EATER
	dbw 60, HURRICANE
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
	dbw LEARN_EVO_MOVE, QUIVER_DANCE
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
if DEF(_FAITHFUL)
	dbw 42, AIR_SLASH
elif DEF(_NOPSS)
	dbw 42, AIR_SLASH
else
	dbw 42, AURA_SPHERE
endc
	dbw 47, DOUBLE_EDGE
if DEF(_FAITHFUL)
	dbw 50, HURRICANE
elif DEF(_NOPSS)
	dbw 50, HURRICANE
else
	dbw 50, CLOSE_COMBAT
endc
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
	dbw 19, SHADOW_SNEAK
	dbw 22, FURY_SWIPES
	dbw 26, SUCKER_PUNCH
	dbw 29, SPIDER_WEB
	dbw 33, AGILITY
	dbw 36, X_SCISSOR
	dbw 40, ZEN_HEADBUTT
if DEF(_FAITHFUL)
	dbw 43, POISON_JAB
elif DEF(_NOPSS)
	dbw 43, POISON_JAB
else
	dbw 43, CRUNCH
endc
	dbw 47, CROSS_POISON
	dbw 23, LEECH_LIFE
	dbw 54, GUNK_SHOT
	db 0 ; no more level-up moves

AriadosEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SWORDS_DANCE
	dbw 1, SWORDS_DANCE
	dbw 1, CONSTRICT
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	dbw 5, ABSORB
	dbw 8, PAYBACK
	dbw 12, SCARY_FACE
	dbw 15, NIGHT_SHADE
	dbw 19, SHADOW_SNEAK
	dbw 23, FURY_SWIPES
	dbw 28, SUCKER_PUNCH
	dbw 32, SPIDER_WEB
	dbw 37, AGILITY
	dbw 41, X_SCISSOR
	dbw 46, ZEN_HEADBUTT
if DEF(_FAITHFUL)
	dbw 50, POISON_JAB
elif DEF(_NOPSS)
	dbw 50, POISON_JAB
else
	dbw 50, CRUNCH
endc
	dbw 55, CROSS_POISON
	dbw 58, LEECH_LIFE
	dbw 63, GUNK_SHOT
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
	dbw 42, AQUA_RING
	dbw 45, HYDRO_PUMP
	dbw 47, AMNESIA
	dbw 50, THUNDER
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, WATER_PULSE
	dbw 1, WATER_PULSE
	dbw 1, BUBBLE
	dbw 1, SUPERSONIC
	dbw 6, THUNDER_WAVE
	dbw 12, WATER_GUN
	dbw 17, CONFUSE_RAY
	dbw 20, BUBBLEBEAM
	dbw 23, CHARGE_BEAM
	dbw 29, SIGNAL_BEAM
	dbw 33, FLAIL
	dbw 37, DISCHARGE
	dbw 43, TAKE_DOWN
	dbw 47, AQUA_RING
	dbw 51, HYDRO_PUMP
	dbw 54, AMNESIA
	dbw 58, THUNDER
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
	dbw LEARN_EVO_MOVE, FAIRY_WIND
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
	db 0 ; no more level-up moves

TogekissEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, AIR_SLASH
	dbw 1, AIR_SLASH
	dbw 1, EXTREMESPEED
	dbw 1, SKY_ATTACK
	dbw 45, EXTREMESPEED
	dbw 55, AURA_SPHERE
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
	dbw 20, OMINOUS_WIND
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
	dbw LEARN_EVO_MOVE, AIR_SLASH
	dbw 1, AIR_SLASH
	dbw 1, PECK
	dbw 1, LEER
	dbw 6, NIGHT_SHADE
	dbw 9, TELEPORT
	dbw 12, CONFUSION
	dbw 17, AIR_CUTTER
	dbw 20, OMINOUS_WIND
	dbw 23, CONFUSE_RAY
	dbw 29, ROOST
	dbw 35, PSYCHIC_M
	dbw 39, AMNESIA
	dbw 43, BATON_PASS
	dbw 49, FUTURE_SIGHT
	dbw 53, DARK_PULSE
	dbw 57, NASTY_PLOT
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
	dbw LEARN_EVO_MOVE, DRAGONBREATH
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
	dbw 28, AQUA_RING
	dbw 31, RAIN_DANCE
	dbw 37, DOUBLE_EDGE
	dbw 40, SUPERPOWER
	dbw 47, WAVE_CRASH
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, PIXIE_PUNCH
	dbw 1, PIXIE_PUNCH
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
	dbw 31, AQUA_RING
	dbw 35, RAIN_DANCE
	dbw 42, DOUBLE_EDGE
	dbw 46, SUPERPOWER
	dbw 55, WAVE_CRASH
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
	dbw 40, SUCKER_PUNCH
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
	dbw 40, SUCKER_PUNCH
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
	dbw 28, ACROBATICS
	dbw 31, SUNNY_DAY
	dbw 34, COTTON_SPORE
	dbw 37, U_TURN
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
	dbw 32, ACROBATICS
	dbw 36, SUNNY_DAY
	dbw 40, COTTON_SPORE
	dbw 44, U_TURN
	dbw 48, AIR_SLASH
	dbw 52, GIGA_DRAIN
	dbw 56, HURRICANE
	dbw 60, BATON_PASS
	db 0 ; no more level-up moves

JumpluffEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, MAGICAL_LEAF
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
	dbw 34, ACROBATICS
	dbw 39, SUNNY_DAY
	dbw 44, COTTON_SPORE
	dbw 49, U_TURN
	dbw 54, AIR_SLASH
	dbw 59, GIGA_DRAIN
	dbw 64, HURRICANE
	dbw 69, BATON_PASS
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
	dbw LEARN_EVO_MOVE, DOUBLE_HIT_M
	dbw 1, DOUBLE_HIT_M
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
	db 0 ; no more level-up moves

SunkernEvosAttacks:
	dbbw EVOLVE_ITEM, SUN_STONE, SUNFLORA
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, GROWTH
	dbw 7, GRASSWHISTLE
	dbw 10, MEGA_DRAIN
	dbw 13, LEECH_SEED
	dbw 16, RAZOR_LEAF
	dbw 19, PROTECT
	dbw 22, GIGA_DRAIN
if DEF(_FAITHFUL)
	dbw 25, BULLET_SEED
elif DEF(_NOPSS)
	dbw 25, BULLET_SEED
else
	dbw 25, AGILITY
endc
	dbw 28, SYNTHESIS
if DEF(_FAITHFUL)
	dbw 31, DAZZLINGLEAM
elif DEF(_NOPSS)
	dbw 31, DAZZLINGLEAM
else
	dbw 31, EARTH_POWER
endc
	dbw 34, SOLARBEAM
	dbw 37, DOUBLE_EDGE
	dbw 40, SUNNY_DAY
	dbw 43, SEED_BOMB
	db 0 ; no more level-up moves

SunfloraEvosAttacks:
	db 0 ; no more evolutions
if DEF(_FAITHFUL)
	dbw LEARN_EVO_MOVE, MAGICAL_LEAF
	dbw 1, MAGICAL_LEAF
elif DEF(_NOPSS)
	dbw LEARN_EVO_MOVE, MAGICAL_LEAF
	dbw 1, MAGICAL_LEAF
else
	dbw LEARN_EVO_MOVE, FLAME_BURST
	dbw 1, FLAME_BURST
endc
	dbw 1, ABSORB
	dbw 1, GROWTH
	dbw 7, SING
	dbw 10, EMBER
	dbw 13, LEECH_SEED
	dbw 16, RAZOR_LEAF
	dbw 19, PROTECT
	dbw 22, GIGA_DRAIN
if DEF(_FAITHFUL)
	dbw 25, BULLET_SEED
elif DEF(_NOPSS)
	dbw 25, BULLET_SEED
else
	dbw 25, AGILITY
endc
	dbw 28, PETAL_DANCE
if DEF(_FAITHFUL)
	dbw 31, DAZZLINGLEAM
elif DEF(_NOPSS)
	dbw 31, DAZZLINGLEAM
else
	dbw 31, FLAMETHROWER
endc
	dbw 34, SOLARBEAM
	dbw 37, DOUBLE_EDGE
	dbw 40, SUNNY_DAY
if DEF(_FAITHFUL)
	dbw 43, SOLAR_BLADE
elif DEF(_NOPSS)
	dbw 43, SOLAR_BLADE
else
	dbw 43, FIRE_BLAST
endc
	dbw 50, PETAL_BLIZZ
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	dbbw EVOLVE_LEVEL, 33, YANMEGA
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, FORESIGHT
	dbw 6, QUICK_ATTACK
	dbw 11, DOUBLE_TEAM
if DEF(_FAITHFUL)
	dbw 14, SONICBOOM
elif DEF(_NOPSS)
	dbw 14, SONICBOOM
else
	dbw 14, SIGNAL_BEAM
endc
	dbw 17, DETECT
	dbw 22, SUPERSONIC
	dbw 27, HYPER_VOICE
if DEF(_FAITHFUL)
	dbw 30, PURSUIT
elif DEF(_NOPSS)
	dbw 30, PURSUIT
else
	dbw 30, BUG_BUZZ
endc
	dbw 33, ANCIENTPOWER
	dbw 38, HYPNOSIS
if DEF(_FAITHFUL)
	dbw 43, WING_ATTACK
elif DEF(_NOPSS)
	dbw 43, WING_ATTACK
else
	dbw 43, AIR_CUTTER
endc
	dbw 46, SCREECH
	dbw 49, U_TURN
	dbw 54, AIR_SLASH
if DEF(_FAITHFUL)
	dbw 57, BUG_BUZZ
elif DEF(_NOPSS)
	dbw 57, BUG_BUZZ
else
	dbw 57, SIGNAL_WAVE
endc
	db 0 ; no more level-up moves

YanmegaEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, ANCIENTPOWER
	dbw 1, ANCIENTPOWER
	dbw 1, TACKLE
	dbw 1, FORESIGHT
	dbw 6, QUICK_ATTACK
	dbw 11, DOUBLE_TEAM
if DEF(_FAITHFUL)
	dbw 14, SONICBOOM
elif DEF(_NOPSS)
	dbw 14, SONICBOOM
else
	dbw 14, SIGNAL_BEAM
endc
	dbw 17, DETECT
	dbw 22, SUPERSONIC
	dbw 27, HYPER_VOICE
if DEF(_FAITHFUL)
	dbw 30, PURSUIT
elif DEF(_NOPSS)
	dbw 30, PURSUIT
else
	dbw 30, BUG_BUZZ
endc
	dbw 38, HYPNOSIS
if DEF(_FAITHFUL)
	dbw 43, SLASH
elif DEF(_NOPSS)
	dbw 43, SLASH
else
	dbw 43, POWER_GEM
endc
if DEF(_FAITHFUL)
	dbw 46, SCREECH
elif DEF(_NOPSS)
	dbw 46, SCREECH
else
	dbw 46, NASTY_PLOT
endc
	dbw 49, U_TURN
if DEF(_FAITHFUL)
	dbw 54, AIR_SLASH
elif DEF(_NOPSS)
	dbw 54, AIR_SLASH
else
	dbw 54, JURASSICBEAM
endc
if DEF(_FAITHFUL)
	dbw 57, BUG_BUZZ
elif DEF(_NOPSS)
	dbw 57, BUG_BUZZ
else
	dbw 57, SIGNAL_WAVE
endc
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
	dbw 47, MUDDY_WATER
	dbw 51, AQUA_TAIL
	dbw 56, WAVE_CRASH
	db 0 ; no more level-up moves

QuagsireEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, BULLDOZE
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
	dbw 53, MUDDY_WATER
	dbw 57, AQUA_TAIL
	dbw 62, WAVE_CRASH
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
	dbw 55, SUCKER_PUNCH
	dbw 61, SWAGGER
	dbw 65, BRAVE_BIRD
	db 0 ; no more level-up moves

HonchkrowEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, AERIAL_ACE
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
	dbw LEARN_EVO_MOVE, MAGICAL_LEAF
	dbw 1, MAGICAL_LEAF
	dbw 1, FLAMETHROWER
	dbw 1, POWER_GEM
	dbw 1, GROWL
	dbw 1, THIEF
	dbw 1, NIGHT_SHADE
	dbw 1, DISARM_VOICE
	dbw 1, CURSE
	dbw 1, SHADOW_BALL
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
	dbbw EVOLVE_LEVEL, 32, FARIGIRAF
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

FarigirafEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, TWIN_BEAM
	dbw 1, TWIN_BEAM
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
	dbw LEARN_EVO_MOVE, MIRROR_SHOT
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
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	dbbw EVOLVE_LEVEL, 33, DUDUNSPARS
	db 0 ; no more evolutions
	dbw 1, RAGE
	dbw 1, DEFENSE_CURL
	dbw 3, ROLLOUT
	dbw 6, LICK
if DEF(_FAITHFUL)
	dbw 8, PURSUIT
elif DEF(_NOPSS)
	dbw 8, PURSUIT
else
	dbw 8, DISARM_VOICE
endc
	dbw 11, SCREECH
	dbw 13, MUD_SLAP
	dbw 16, SING
	dbw 18, ANCIENTPOWER
	dbw 21, BODY_SLAM
	dbw 23, DRILL_RUN
	dbw 26, ROOST
if DEF(_FAITHFUL)
	dbw 28, TAKE_DOWN
elif DEF(_NOPSS)
	dbw 28, TAKE_DOWN
else
	dbw 28, DRAININGKISS
endc
	dbw 31, COIL
	dbw 33, DIG
	dbw 36, GLARE
	dbw 38, DOUBLE_EDGE
	dbw 41, EARTHQUAKE
if DEF(_FAITHFUL)
	dbw 43, AIR_SLASH
elif DEF(_NOPSS)
	dbw 43, AIR_SLASH
else
	dbw 43, PLAY_ROUGH
endc
	dbw 46, DRAGON_RUSH
	dbw 48, ENDURE
if DEF(_FAITHFUL)
	dbw 51, DUALWINGBEAT
elif DEF(_NOPSS)
	dbw 51, DUALWINGBEAT
else
	dbw 51, MOONBLAST
endc
	dbw 54, GIGA_IMPACT
	db 0 ; no more level-up moves

DudunsparsEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, RAGE
	dbw 1, DEFENSE_CURL
	dbw 3, ROLLOUT
	dbw 6, LICK
if DEF(_FAITHFUL)
	dbw 8, PURSUIT
elif DEF(_NOPSS)
	dbw 8, PURSUIT
else
	dbw 8, DISARM_VOICE
endc
	dbw 11, SCREECH
	dbw 13, MUD_SLAP
	dbw 16, SING
	dbw 18, ANCIENTPOWER
	dbw 21, BODY_SLAM
	dbw 23, DRILL_RUN
	dbw 26, ROOST
if DEF(_FAITHFUL)
	dbw 28, TAKE_DOWN
elif DEF(_NOPSS)
	dbw 28, TAKE_DOWN
else
	dbw 28, DRAININGKISS
endc
	dbw 31, COIL
	dbw 33, DIG
	dbw 39, GLARE
	dbw 43, DOUBLE_EDGE
	dbw 46, EARTHQUAKE
if DEF(_FAITHFUL)
	dbw 48, AIR_SLASH
elif DEF(_NOPSS)
	dbw 48, AIR_SLASH
else
	dbw 48, PLAY_ROUGH
endc
	dbw 51, DRAGON_RUSH
	dbw 53, ENDURE
if DEF(_FAITHFUL)
	dbw 55, DUALWINGBEAT
elif DEF(_NOPSS)
	dbw 55, DUALWINGBEAT
else
	dbw 55, MOONBLAST
endc
	dbw 58, GIGA_IMPACT
	db 0 ;  no more level-up moves

GligarEvosAttacks:
	dbbw EVOLVE_ITEM, RAZOR_FANG, GLISCOR
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 4, SAND_ATTACK
	dbw 7, HARDEN
	dbw 10, KNOCK_OFF
	dbw 13, QUICK_ATTACK
	dbw 16, FURY_CUTTER
	dbw 19, BULLDOZE
	dbw 22, ACROBATICS
	dbw 27, SLASH
	dbw 30, U_TURN
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
	dbw 10, KNOCK_OFF
	dbw 13, QUICK_ATTACK
	dbw 16, FURY_CUTTER
	dbw 19, BULLDOZE
	dbw 22, ACROBATICS
	dbw 27, SLASH
	dbw 30, U_TURN
	dbw 35, SCREECH
	dbw 40, PINCIRFLURRY
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
	dbw LEARN_EVO_MOVE, PIXIE_PUNCH
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
	dbw 57, WAVE_CRASH
	dbw 60, GUNK_SHOT
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
	dbw 1, NIGHT_SLASH
	dbw 1, FURY_CUTTER
	dbw 1, TACKLE
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
	dbw 13, FAINT_ATTACK
	dbw 17, SWEET_SCENT
	dbw 22, SLASH
	dbw 25, PLAY_NICE
	dbw 29, PLAY_ROUGH
	dbw 33, CHARM
	dbw 37, REST
	dbw 37, SNORE
	dbw 39, CRUNCH
	dbw 41, THRASH
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
	dbbw EVOLVE_LEVEL, 49, URSALUNA
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SHADOW_CLAW
	dbw 1, SHADOW_CLAW
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
if DEF(_FAITHFUL)
	dbw 29, ROCK_SLIDE
elif DEF(_NOPSS)
	dbw 29, ROCK_SLIDE
else
	dbw 29, STEEL_SLICE
endc
	dbw 34, LAVA_PLUME
	dbw 36, AMNESIA
	dbw 41, BODY_SLAM
	dbw 43, RECOVER
	dbw 48, FLAMETHROWER
	dbw 50, EARTH_POWER
	db 0 ; no more level-up moves

MagcargoEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SHELL_SMASH
	dbw 1, SHELL_SMASH
	dbw 1, SMOG
	dbw 6, EMBER
	dbw 8, ROCK_THROW
	dbw 13, HARDEN
	dbw 15, FIRE_SPIN
	dbw 20, HAZE
	dbw 22, ANCIENTPOWER
	dbw 27, FLAME_BURST
if DEF(_FAITHFUL)
	dbw 30, ROCK_SLIDE
elif DEF(_NOPSS)
	dbw 30, ROCK_SLIDE
else
	dbw 30, STEEL_SLICE
endc
if DEF(_FAITHFUL)
	dbw 33, POWER_GEM
elif DEF(_NOPSS)
	dbw 33, POWER_GEM
else
	dbw 33, FLASH_CANNON
endc
	dbw 36, LAVA_PLUME
	dbw 39, AMNESIA
	dbw 43, BODY_SLAM
	dbw 47, RECOVER
	dbw 54, FLAMETHROWER
	dbw 58, EARTH_POWER
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
	dbw LEARN_EVO_MOVE, FURY_ATTACK
	dbw 1, FURY_ATTACK
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
	db 0 ; no more level-up moves

MamoswineEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, ANCIENTPOWER
	dbw 1, ANCIENTPOWER
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
	dbw LEARN_EVO_MOVE, PERISH_SONG
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
	dbw LEARN_EVO_MOVE, OCTAZOOKA
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
	dbw 39, AQUA_RING
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
	dbw 39, AQUA_RING
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
	dbw 33, DUALWINGBEAT
	dbw 36, SLASH
	dbw 39, SCREECH
	dbw 42, DRILL_PECK
	dbw 45, SWORDS_DANCE
	dbw 48, NIGHT_SLASH
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, STEEL_WING
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
	dbw 34, DUALWINGBEAT
	dbw 39, SLASH
	dbw 42, SCREECH
	dbw 45, DRILL_PECK
	dbw 50, SWORDS_DANCE
	dbw 53, NIGHT_SLASH
	dbw 57, STEEL_SLICE
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
	dbw 61, CATASTROPHE
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, FLAME_BURST
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
	dbw 69, CATASTROPHE
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
	dbw LEARN_EVO_MOVE, HIHORSEPOWER
	dbw 1, HIHORSEPOWER
	dbw 1, BULLDOZE
	dbw 1, HORN_ATTACK
	dbw 1, GROWL
	dbw 1, DEFENSE_CURL
	dbw 10, ROLLOUT
	dbw 15, PAYBACK
	dbw 19, KNOCK_OFF
	dbw 24, SLAM
	dbw 30, RAPID_SPIN
	dbw 37, SCARY_FACE
	dbw 43, EARTHQUAKE
	dbw 50, GIGA_IMPACT
	db 0 ; no more level-up moves

StantlerEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, WYRDEER
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
	db 0 ; no more level-up moves

WyrdeerEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, PSYSHIELD
	dbw 1, PSYSHIELD
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
	dbw 69, CATASTROPHE
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
	dbw 49, PAYBACK
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
	dbw 57, PAYBACK
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
	dbw 57, PAYBACK
	dbw 64, FUTURE_SIGHT
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

RaltsEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, KIRLIA
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 4, CONFUSION
	dbw 6, DOUBLE_TEAM
	dbw 9, TELEPORT
	dbw 11, DISARM_VOICE
	dbw 14, SAFEGUARD
	dbw 17, MAGICAL_LEAF
	dbw 19, MOONLIGHT
	dbw 22, DRAININGKISS
	dbw 24, CALM_MIND
	dbw 27, PSYCHIC_M
	dbw 29, LIGHT_SCREEN
	dbw 32, FUTURE_SIGHT
	dbw 34, CHARM
	dbw 37, HYPNOSIS
	dbw 39, DREAM_EATER
	dbw 42, DAZZLINGLEAM
	db 0 ; no more level-up moves

KirliaEvosAttacks:
	dbbw EVOLVE_ITEM_MALE, DAWN_STONE, GALLADE
	dbbw EVOLVE_LEVEL, 30, GARDEVOIR
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 4, CONFUSION
	dbw 6, DOUBLE_TEAM
	dbw 9, TELEPORT
	dbw 11, DISARM_VOICE
	dbw 14, SAFEGUARD
	dbw 17, MAGICAL_LEAF
	dbw 19, MOONLIGHT
	dbw 23, DRAININGKISS
	dbw 26, CALM_MIND
	dbw 30, PSYCHIC_M
	dbw 33, LIGHT_SCREEN
	dbw 37, FUTURE_SIGHT
	dbw 40, CHARM
	dbw 44, HYPNOSIS
	dbw 47, DREAM_EATER
	dbw 51, DAZZLINGLEAM
	db 0 ; no more level-up moves

GardevoirEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 4, CONFUSION
	dbw 6, DOUBLE_TEAM
	dbw 9, TELEPORT
	dbw 11, DISARM_VOICE
	dbw 14, SAFEGUARD
	dbw 17, MAGICAL_LEAF
	dbw 19, MOONLIGHT
	dbw 23, DRAININGKISS
	dbw 26, CALM_MIND
	dbw 31, PSYCHIC_M
	dbw 35, LIGHT_SCREEN
	dbw 40, FUTURE_SIGHT
	dbw 44, CHARM
	dbw 49, HYPNOSIS
	dbw 53, DREAM_EATER
	dbw 58, DAZZLINGLEAM
	dbw 62, MOONBLAST
	db 0 ; no more level-up moves

GalladeEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SLASH
	dbw 1, SLASH
	dbw 1, GROWL
	dbw 4, CONFUSION
	dbw 6, DOUBLE_TEAM
	dbw 9, TELEPORT
	dbw 11, KARATE_CHOP
	dbw 14, FURY_CUTTER
	dbw 17, AERIAL_ACE
	dbw 19, MOONLIGHT
	dbw 23, LEAF_BLADE
	dbw 26, SWORDS_DANCE
	dbw 31, PSYCHO_CUT
	dbw 35, REFLECT
	dbw 40, FAINT_ATTACK
	dbw 44, FALSE_SWIPE
	dbw 49, PROTECT
	dbw 53, CLOSE_COMBAT
	dbw 58, ZEN_HEADBUTT
	db 0 ; no more level-up moves

AronEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, LAIRON
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
	dbw 34, IRON_TAIL
	dbw 37, IRON_DEFENSE
	dbw 40, DOUBLE_EDGE
	dbw 43, ROCK_POLISH
	dbw 46, STEEL_SLICE
	dbw 49, STONE_EDGE
	db 0 ; no more level-up moves

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
	dbw 51, ROCK_POLISH
	dbw 57, STEEL_SLICE
	dbw 63, STONE_EDGE
	db 0 ; no more level-up moves
