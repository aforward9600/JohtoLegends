SECTION "Evolutions and Attacks 1", ROMX

EvosAttacksPointers1::
	dw BulbasaurEvosAttacks
	dw IvysaurEvosAttacks
	dw VenusaurEvosAttacks
	dw CharmanderEvosAttacks
	dw CharmeleonEvosAttacks
	dw CharizardEvosAttacks
	dw SquirtleEvosAttacks
	dw WartortleEvosAttacks
	dw BlastoiseEvosAttacks
	dw CaterpieEvosAttacks
	dw MetapodEvosAttacks
	dw ButterfreeEvosAttacks
	dw WeedleEvosAttacks
	dw KakunaEvosAttacks
	dw BeedrillEvosAttacks
	dw PidgeyEvosAttacks
	dw PidgeottoEvosAttacks
	dw PidgeotEvosAttacks
	dw RattataEvosAttacks
	dw RaticateEvosAttacks
	dw SpearowEvosAttacks
	dw FearowEvosAttacks
	dw EkansEvosAttacks
	dw ArbokEvosAttacks
	dw PichuEvosAttacks
	dw PikachuEvosAttacks
	dw RaichuEvosAttacks
	dw SandshrewEvosAttacks
	dw SandslashEvosAttacks
	dw NidoranFEvosAttacks
	dw NidorinaEvosAttacks
	dw NidoqueenEvosAttacks
	dw NidoranMEvosAttacks
	dw NidorinoEvosAttacks
	dw NidokingEvosAttacks
	dw CleffaEvosAttacks
	dw ClefairyEvosAttacks
	dw ClefableEvosAttacks
	dw VulpixEvosAttacks
	dw NinetalesEvosAttacks
	dw IgglybuffEvosAttacks
	dw JigglypuffEvosAttacks
	dw WigglytuffEvosAttacks
	dw ZubatEvosAttacks
	dw GolbatEvosAttacks
	dw CrobatEvosAttacks
	dw OddishEvosAttacks
	dw GloomEvosAttacks
	dw VileplumeEvosAttacks
	dw BellossomEvosAttacks
	dw ParasEvosAttacks
	dw ParasectEvosAttacks
	dw VenonatEvosAttacks
	dw VenomothEvosAttacks
	dw DiglettEvosAttacks
	dw DugtrioEvosAttacks
	dw MeowthEvosAttacks
	dw PersianEvosAttacks
	dw PsyduckEvosAttacks
	dw GolduckEvosAttacks
	dw MankeyEvosAttacks
	dw PrimeapeEvosAttacks
	dw AnnihilapeEvosAttacks
	dw GrowlitheEvosAttacks
	dw ArcanineEvosAttacks
	dw PoliwagEvosAttacks
	dw PoliwhirlEvosAttacks
	dw PoliwrathEvosAttacks
	dw PolitoedEvosAttacks
	dw AbraEvosAttacks
	dw KadabraEvosAttacks
	dw AlakazamEvosAttacks
	dw MachopEvosAttacks
	dw MachokeEvosAttacks
	dw MachampEvosAttacks
	dw BellsproutEvosAttacks
	dw WeepinbellEvosAttacks
	dw VictreebelEvosAttacks
	dw TentacoolEvosAttacks
	dw TentacruelEvosAttacks
	dw GeodudeEvosAttacks
	dw GravelerEvosAttacks
	dw GolemEvosAttacks
	dw PonytaEvosAttacks
	dw RapidashEvosAttacks
	dw SlowpokeEvosAttacks
	dw SlowbroEvosAttacks
	dw SlowkingEvosAttacks
	dw MagnemiteEvosAttacks
	dw MagnetonEvosAttacks
	dw MagnezoneEvosAttacks
	dw FarfetchDEvosAttacks
	dw DoduoEvosAttacks
	dw DodrioEvosAttacks
	dw SeelEvosAttacks
	dw DewgongEvosAttacks
	dw GrimerEvosAttacks
	dw MukEvosAttacks
	dw ShellderEvosAttacks
	dw CloysterEvosAttacks
	dw GastlyEvosAttacks
	dw HaunterEvosAttacks
	dw GengarEvosAttacks
	dw OnixEvosAttacks
	dw SteelixEvosAttacks
	dw DrowzeeEvosAttacks
	dw HypnoEvosAttacks
	dw KrabbyEvosAttacks
	dw KinglerEvosAttacks
	dw VoltorbEvosAttacks
	dw ElectrodeEvosAttacks
	dw ExeggcuteEvosAttacks
	dw ExeggutorEvosAttacks
	dw CuboneEvosAttacks
	dw MarowakEvosAttacks
	dw TyrogueEvosAttacks
	dw HitmonleeEvosAttacks
	dw HitmonchanEvosAttacks
	dw HitmontopEvosAttacks
	dw LickitungEvosAttacks
	dw LickilickyEvosAttacks
	dw KoffingEvosAttacks
	dw WeezingEvosAttacks
	dw RhyhornEvosAttacks
	dw RhydonEvosAttacks
	dw RhyperiorEvosAttacks
	dw HappinyEvosAttacks
	dw ChanseyEvosAttacks
	dw BlisseyEvosAttacks
	dw TangelaEvosAttacks
	dw TangrowthEvosAttacks
	dw KangaskhanEvosAttacks
	dw HorseaEvosAttacks
	dw SeadraEvosAttacks
	dw KingdraEvosAttacks
	dw GoldeenEvosAttacks
	dw SeakingEvosAttacks
	dw StaryuEvosAttacks
	dw StarmieEvosAttacks
	dw MimeJrEvosAttacks
	dw MrMimeEvosAttacks
	dw ScytherEvosAttacks
	dw ScizorEvosAttacks
	dw SmoochumEvosAttacks
	dw JynxEvosAttacks
	dw ElekidEvosAttacks
	dw ElectabuzzEvosAttacks
	dw ElectivireEvosAttacks
	dw MagbyEvosAttacks
	dw MagmarEvosAttacks
	dw MagmortarEvosAttacks
	dw PinsirEvosAttacks

BulbasaurEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 3, GROWL
	dbw 7, LEECH_SEED
	dbw 9, VINE_WHIP
	dbw 13, POISONPOWDER
	dbw 13, SLEEP_POWDER
	dbw 15, TAKE_DOWN
	dbw 19, RAZOR_LEAF
	dbw 21, SWEET_SCENT
	dbw 25, GROWTH
	dbw 27, DOUBLE_EDGE
	dbw 31, SEED_BOMB
	dbw 33, SYNTHESIS
	dbw 37, SOLARBEAM
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 3, GROWL
	dbw 7, LEECH_SEED
	dbw 9, VINE_WHIP
	dbw 13, POISONPOWDER
	dbw 13, SLEEP_POWDER
	dbw 15, TAKE_DOWN
	dbw 20, RAZOR_LEAF
	dbw 23, SWEET_SCENT
	dbw 28, GROWTH
	dbw 31, DOUBLE_EDGE
	dbw 36, SEED_BOMB
	dbw 39, SYNTHESIS
	dbw 44, SOLARBEAM
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, PETAL_DANCE
	dbw 1, PETAL_DANCE
	dbw 1, TACKLE
	dbw 3, GROWL
	dbw 7, LEECH_SEED
	dbw 9, VINE_WHIP
	dbw 13, POISONPOWDER
	dbw 13, SLEEP_POWDER
	dbw 15, TAKE_DOWN
	dbw 20, RAZOR_LEAF
	dbw 23, SWEET_SCENT
	dbw 28, GROWTH
	dbw 31, DOUBLE_EDGE
	dbw 39, SEED_BOMB
	dbw 45, SYNTHESIS
	dbw 50, PETAL_BLIZZ
	dbw 53, SOLARBEAM
	dbw 60, FRENZY_PLANT
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 10, SMOKESCREEN
	dbw 16, DRAGONBREATH
	dbw 19, SCARY_FACE
	dbw 25, FIRE_FANG
	dbw 28, FLAME_BURST
	dbw 34, SLASH
	dbw 37, FLAMETHROWER
	dbw 43, FIRE_SPIN
	dbw 46, INFERNO
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 10, SMOKESCREEN
	dbw 17, DRAGONBREATH
	dbw 21, SCARY_FACE
	dbw 28, FIRE_FANG
	dbw 32, FLAME_BURST
	dbw 39, SLASH
	dbw 43, FLAMETHROWER
	dbw 50, FIRE_SPIN
	dbw 54, INFERNO
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, AIR_SLASH
	dbw 1, AIR_SLASH
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 7, EMBER
	dbw 10, SMOKESCREEN
	dbw 17, DRAGONBREATH
	dbw 21, SCARY_FACE
	dbw 28, FIRE_FANG
	dbw 32, FLAME_BURST
	dbw 41, SLASH
	dbw 47, FLAMETHROWER
	dbw 56, DRAGON_PULSE
	dbw 62, INFERNO
	dbw 71, HEAT_WAVE
	dbw 77, BLAST_BURN
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 7, WATER_GUN
	dbw 10, WITHDRAW
	dbw 13, BUBBLE
	dbw 16, BITE
	dbw 19, RAPID_SPIN
	dbw 22, PROTECT
	dbw 25, WATER_PULSE
	dbw 28, AQUA_TAIL
	dbw 31, SKULL_BASH
	dbw 34, IRON_DEFENSE
	dbw 37, RAIN_DANCE
	dbw 40, HYDRO_PUMP
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 7, WATER_GUN
	dbw 10, WITHDRAW
	dbw 13, BUBBLE
	dbw 17, BITE
	dbw 21, RAPID_SPIN
	dbw 25, PROTECT
	dbw 29, WATER_PULSE
	dbw 33, AQUA_TAIL
	dbw 37, SKULL_BASH
	dbw 41, IRON_DEFENSE
	dbw 45, RAIN_DANCE
	dbw 49, HYDRO_PUMP
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, FLASH_CANNON
	dbw 1, FLASH_CANNON
	dbw 1, AURA_SPHERE
	dbw 1, TACKLE
	dbw 4, TAIL_WHIP
	dbw 7, WATER_GUN
	dbw 10, WITHDRAW
	dbw 13, BUBBLE
	dbw 17, BITE
	dbw 21, RAPID_SPIN
	dbw 25, PROTECT
	dbw 29, WATER_PULSE
	dbw 33, AQUA_TAIL
	dbw 40, SKULL_BASH
	dbw 47, IRON_DEFENSE
	dbw 54, RAIN_DANCE
	dbw 60, HYDRO_PUMP
	dbw 65, HYDRO_CANNON
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	dbbw EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, STRING_SHOT
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	dbbw EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, HARDEN
	dbw 1, HARDEN
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, GUST
	dbw 1, GUST
	dbw 1, CONFUSION
	dbw 11, CONFUSION
	dbw 13, POISONPOWDER
	dbw 13, STUN_SPORE
	dbw 13, SLEEP_POWDER
	dbw 17, PSYBEAM
	dbw 19, SILVER_WIND
	dbw 23, SUPERSONIC
	dbw 25, SAFEGUARD
	dbw 29, WHIRLWIND
	dbw 31, BUG_BUZZ
	dbw 35, QUIVER_DANCE
	dbw 37, AIR_SLASH
	dbw 41, BATON_PASS
	dbw 43, HURRICANE
	dbw 47, SIGNAL_WAVE
	db 0 ; no more level-up moves

WeedleEvosAttacks:
	dbbw EVOLVE_LEVEL, 7, KAKUNA
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 1, STRING_SHOT
	db 0 ; no more level-up moves

KakunaEvosAttacks:
	dbbw EVOLVE_LEVEL, 10, BEEDRILL
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, HARDEN
	dbw 1, HARDEN
	db 0 ; no more level-up moves

BeedrillEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, TWINEEDLE
	dbw 1, TWINEEDLE
	dbw 1, FURY_ATTACK
	dbw 11, FURY_ATTACK
	dbw 14, RAGE
	dbw 17, PURSUIT
	dbw 20, FOCUS_ENERGY
	dbw 23, VENOSHOCK
	dbw 26, PAYBACK
	dbw 29, TOXIC
	dbw 32, PIN_MISSILE
	dbw 35, POISON_JAB
	dbw 38, AGILITY
	dbw 41, LEECH_LIFE
	dbw 44, GUNK_SHOT
	db 0 ; no more level-up moves

PidgeyEvosAttacks:
	dbbw EVOLVE_LEVEL, 18, PIDGEOTTO
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, SAND_ATTACK
	dbw 9, GUST
	dbw 13, QUICK_ATTACK
	dbw 17, WHIRLWIND
	dbw 21, TWISTER
	dbw 25, FEATHERDANCE
	dbw 29, AGILITY
	dbw 33, AIR_CUTTER
	dbw 37, ROOST
	dbw 41, HYPER_VOICE
	dbw 45, MIRROR_MOVE
	dbw 49, AIR_SLASH
	dbw 53, HURRICANE
	db 0 ; no more level-up moves

PidgeottoEvosAttacks:
	dbbw EVOLVE_LEVEL, 36, PIDGEOT
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 5, SAND_ATTACK
	dbw 9, GUST
	dbw 13, QUICK_ATTACK
	dbw 17, WHIRLWIND
	dbw 22, TWISTER
	dbw 27, FEATHERDANCE
	dbw 32, AGILITY
	dbw 37, AIR_CUTTER
	dbw 42, ROOST
	dbw 47, HYPER_VOICE
	dbw 52, MIRROR_MOVE
	dbw 57, AIR_SLASH
	dbw 62, HURRICANE
	db 0 ; no more level-up moves

PidgeotEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, RAZOR_WIND
	dbw 1, RAZOR_WIND
	dbw 1, TACKLE
	dbw 5, SAND_ATTACK
	dbw 9, GUST
	dbw 13, QUICK_ATTACK
	dbw 17, WHIRLWIND
	dbw 22, TWISTER
	dbw 27, FEATHERDANCE
	dbw 32, AGILITY
	dbw 38, AIR_CUTTER
	dbw 44, ROOST
	dbw 50, HYPER_VOICE
	dbw 56, MIRROR_MOVE
	dbw 62, AIR_SLASH
	dbw 68, HURRICANE
	db 0 ; no more level-up moves

RattataEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 4, QUICK_ATTACK
	dbw 7, FOCUS_ENERGY
	dbw 10, BITE
	dbw 13, PURSUIT
	dbw 16, HYPER_FANG
	dbw 19, PAYBACK
	dbw 22, CRUNCH
	dbw 25, SUCKER_PUNCH
	dbw 28, SUPER_FANG
	dbw 31, SLASH
	dbw 34, DOUBLE_EDGE
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SCARY_FACE
	dbw 1, SCARY_FACE
	dbw 1, TACKLE
	dbw 1, TAIL_WHIP
	dbw 4, QUICK_ATTACK
	dbw 7, FOCUS_ENERGY
	dbw 10, BITE
	dbw 13, PURSUIT
	dbw 16, HYPER_FANG
	dbw 19, PAYBACK
	dbw 24, CRUNCH
	dbw 29, SUCKER_PUNCH
	dbw 34, SUPER_FANG
	dbw 39, SLASH
	dbw 44, DOUBLE_EDGE
	db 0 ; no more level-up moves

SpearowEvosAttacks:
	dbbw EVOLVE_LEVEL, 20, FEAROW
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 4, LEER
	dbw 8, PURSUIT
	dbw 11, FURY_ATTACK
	dbw 15, AERIAL_ACE
	dbw 18, MIRROR_MOVE
	dbw 22, PAYBACK
	dbw 25, AGILITY
	dbw 29, FOCUS_ENERGY
	dbw 32, ROOST
	dbw 36, DRILL_PECK
	db 0 ; no more level-up moves

FearowEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, DRILL_RUN
	dbw 1, DRILL_RUN
	dbw 1, PECK
	dbw 1, GROWL
	dbw 4, LEER
	dbw 8, PURSUIT
	dbw 11, FURY_ATTACK
	dbw 15, AERIAL_ACE
	dbw 18, MIRROR_MOVE
	dbw 23, PAYBACK
	dbw 27, AGILITY
	dbw 32, FOCUS_ENERGY
	dbw 36, ROOST
	dbw 41, DRILL_PECK
	dbw 45, BRAVE_BIRD
	db 0 ; no more level-up moves

EkansEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	dbw 1, WRAP
	dbw 1, LEER
	dbw 4, POISON_STING
	dbw 9, BITE
	dbw 12, GLARE
	dbw 17, SCREECH
	dbw 20, ACID
	dbw 25, POISON_FANG
	dbw 28, ACID_SPRAY
	dbw 33, MUD_BOMB
	dbw 36, PAYBACK
	dbw 38, BELCH
	dbw 41, HAZE
	dbw 44, COIL
	dbw 49, GUNK_SHOT
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, CRUNCH
	dbw 1, CRUNCH
	dbw 1, WRAP
	dbw 1, LEER
	dbw 4, POISON_STING
	dbw 9, BITE
	dbw 12, GLARE
	dbw 17, SCREECH
	dbw 20, ACID
	dbw 27, POISON_FANG
	dbw 32, ACID_SPRAY
	dbw 39, MUD_BOMB
	dbw 44, PAYBACK
	dbw 48, BELCH
	dbw 51, HAZE
	dbw 56, COIL
	dbw 63, GUNK_SHOT
	db 0 ; no more level-up moves

PichuEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, PIKACHU
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, CHARM
	dbw 5, TAIL_WHIP
	dbw 10, SWEET_KISS
	dbw 13, NASTY_PLOT
	dbw 18, THUNDER_WAVE
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	dbbw EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	dbw 1, THUNDERSHOCK
	dbw 1, TAIL_WHIP
	dbw 5, GROWL
	dbw 7, CHARM
	dbw 10, QUICK_ATTACK
	dbw 13, SPARK
	dbw 18, THUNDER_WAVE
	dbw 21, SWEET_KISS
	dbw 23, DOUBLE_TEAM
	dbw 26, NUZZLE
	dbw 29, DISCHARGE
	dbw 34, THUNDERBOLT
	dbw 37, SLAM
	dbw 42, WILD_CHARGE
	dbw 45, AGILITY
	dbw 50, THUNDER
	dbw 53, LIGHT_SCREEN
	dbw 58, VOLT_TACKLE
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, THUNDERPUNCH
	dbw 1, THUNDERPUNCH
	dbw 1, THUNDERSHOCK
	dbw 1, TAIL_WHIP
	dbw 1, QUICK_ATTACK
	dbw 1, THUNDERBOLT
	db 0 ; no more level-up moves

SandshrewEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, SANDSLASH
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, DEFENSE_CURL
	dbw 3, SAND_ATTACK
	dbw 5, POISON_STING
	dbw 7, ROLLOUT
	dbw 9, RAPID_SPIN
	dbw 11, FURY_CUTTER
	dbw 14, MAGNITUDE
	dbw 17, SWIFT
	dbw 20, FURY_SWIPES
	dbw 23, SAND_TOMB
	dbw 26, SLASH
	dbw 30, DIG
	dbw 34, METAL_CLAW
	dbw 38, SWORDS_DANCE
	dbw 42, SANDSTORM
	dbw 46, EARTHQUAKE
	db 0 ; no more level-up moves

SandslashEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, CRUSH_CLAW
	dbw 1, CRUSH_CLAW
	dbw 1, SCRATCH
	dbw 1, DEFENSE_CURL
	dbw 3, SAND_ATTACK
	dbw 5, POISON_STING
	dbw 7, ROLLOUT
	dbw 9, RAPID_SPIN
	dbw 11, FURY_CUTTER
	dbw 14, MAGNITUDE
	dbw 17, SWIFT
	dbw 20, FURY_SWIPES
	dbw 24, SAND_TOMB
	dbw 28, SLASH
	dbw 33, DIG
	dbw 38, METAL_CLAW
	dbw 43, SWORDS_DANCE
	dbw 48, SANDSTORM
	dbw 53, EARTHQUAKE
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, SCRATCH
	dbw 7, TAIL_WHIP
	dbw 9, DOUBLE_KICK
	dbw 13, POISON_STING
	dbw 19, FURY_SWIPES
	dbw 21, BITE
	dbw 25, DOUBLE_TEAM
	dbw 31, TOXIC
	dbw 33, FLATTER
	dbw 37, CRUNCH
	dbw 43, VENOSHOCK
	dbw 45, POISON_FANG
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	dbbw EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 1, SCRATCH
	dbw 7, TAIL_WHIP
	dbw 9, DOUBLE_KICK
	dbw 13, POISON_STING
	dbw 20, FURY_SWIPES
	dbw 23, BITE
	dbw 28, DOUBLE_TEAM
	dbw 35, TOXIC
	dbw 38, FLATTER
	dbw 43, CRUNCH
	dbw 50, VENOSHOCK
	dbw 58, POISON_FANG
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SUPERPOWER
	dbw 1, SUPERPOWER
	dbw 1, TACKLE
	dbw 1, SCRATCH
	dbw 1, DOUBLE_KICK
	dbw 1, TAIL_WHIP
	dbw 23, STOMP
	dbw 35, BODY_SLAM
	dbw 43, EARTH_POWER
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, PECK
	dbw 7, FOCUS_ENERGY
	dbw 9, DOUBLE_KICK
	dbw 13, POISON_STING
	dbw 19, FURY_ATTACK
	dbw 21, HORN_ATTACK
	dbw 25, DOUBLE_TEAM
	dbw 31, TOXIC
	dbw 33, FLATTER
	dbw 37, POISON_JAB
	dbw 43, VENOSHOCK
	dbw 45, HORN_DRILL
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	dbbw EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, PECK
	dbw 7, FOCUS_ENERGY
	dbw 9, DOUBLE_KICK
	dbw 13, POISON_STING
	dbw 20, FURY_ATTACK
	dbw 23, HORN_ATTACK
	dbw 28, DOUBLE_TEAM
	dbw 35, TOXIC
	dbw 38, FLATTER
	dbw 43, POISON_JAB
	dbw 50, VENOSHOCK
	dbw 58, HORN_DRILL
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, MEGAHORN
	dbw 1, MEGAHORN
	dbw 1, TACKLE
	dbw 1, HORN_ATTACK
	dbw 1, DOUBLE_KICK
	dbw 1, POISON_STING
	dbw 23, STOMP
	dbw 35, THRASH
	dbw 43, EARTH_POWER
	db 0 ; no more level-up moves

CleffaEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, CLEFAIRY
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, CHARM
	dbw 4, ENCORE
	dbw 7, SING
	dbw 10, SWEET_KISS
	dbw 13, MIMIC
	dbw 16, MAGICAL_LEAF
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	dbbw EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, GROWL
	dbw 7, SING
	dbw 10, DOUBLESLAP
	dbw 13, DISARM_VOICE
	dbw 16, DEFENSE_CURL
	dbw 19, AMNESIA
	dbw 22, METRONOME
	dbw 25, ENCORE
	dbw 28, BODY_SLAM
	dbw 31, MOONLIGHT
	dbw 34, COSMIC_POWER
	dbw 37, MOONBLAST
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, DRAININGKISS
	dbw 1, DRAININGKISS
	dbw 1, SING
	dbw 1, DOUBLESLAP
	dbw 1, METRONOME
	dbw 1, MOONLIGHT
	dbw 1, SOFTBOILED
	dbw 1, MOONBLAST
	dbw 1, COSMIC_POWER
	dbw 1, BODY_SLAM
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	dbbw EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 4, TAIL_WHIP
	dbw 7, ROAR
	dbw 9, GROWL
	dbw 10, QUICK_ATTACK
	dbw 12, CONFUSE_RAY
	dbw 15, FIRE_SPIN
	dbw 18, PAYBACK
	dbw 20, WILL_O_WISP
	dbw 23, FAINT_ATTACK
	dbw 26, NIGHT_SHADE
	dbw 28, FLAME_BURST
	dbw 31, EXTRASENSORY
	dbw 34, SAFEGUARD
	dbw 36, FLAMETHROWER
	dbw 39, SPITE
	dbw 42, FIRE_BLAST
	dbw 44, NASTY_PLOT
	dbw 47, DESTINY_BOND
	dbw 50, INFERNO
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, HEX
	dbw 1, HEX
	dbw 1, EMBER
	dbw 1, QUICK_ATTACK
	dbw 1, CONFUSE_RAY
	dbw 1, SAFEGUARD
	dbw 1, FIRE_SPIN
	dbw 1, NASTY_PLOT
	dbw 1, FLAMETHROWER
	db 0 ; no more level-up moves

IgglybuffEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, JIGGLYPUFF
	db 0 ; no more evolutions
	dbw 1, SING
	dbw 1, CHARM
	dbw 3, DEFENSE_CURL
	dbw 5, POUND
	dbw 9, SWEET_KISS
	dbw 11, MIMIC
	db 0 ; no more level-up moves

JigglypuffEvosAttacks:
	dbbw EVOLVE_ITEM, MOON_STONE, WIGGLYTUFF
	db 0 ; no more evolutions
	dbw 1, SING
	dbw 1, DEFENSE_CURL
	dbw 1, POUND
	dbw 5, ECHOED_VOICE
	dbw 9, PLAY_NICE
	dbw 14, DISABLE
	dbw 17, DOUBLESLAP
	dbw 20, ROLLOUT
	dbw 22, ROUND_M
	dbw 25, MOONLIGHT
	dbw 27, BRICK_BREAK
	dbw 30, REST
	dbw 32, BODY_SLAM
	dbw 35, PLAY_ROUGH
	dbw 38, MIMIC
	dbw 41, HYPER_VOICE
	dbw 45, DOUBLE_EDGE
	db 0 ; no more level-up moves

WigglytuffEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, PIXIE_PUNCH
	dbw 1, PIXIE_PUNCH
	dbw 1, SING
	dbw 1, DISABLE
	dbw 1, DEFENSE_CURL
	dbw 1, DOUBLESLAP
	dbw 1, ECHOED_VOICE
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	dbw 1, ASTONISH
	dbw 5, SUPERSONIC
	dbw 7, ABSORB
	dbw 11, BITE
	dbw 13, WING_ATTACK
	dbw 17, CONFUSE_RAY
	dbw 19, AIR_CUTTER
	dbw 23, SWIFT
	dbw 25, POISON_FANG
	dbw 29, MEAN_LOOK
	dbw 31, LEECH_LIFE
	dbw 35, HAZE
	dbw 37, VENOSHOCK
	dbw 41, DUALWINGBEAT
	dbw 43, GUNK_SHOT
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SCREECH
	dbw 1, SCREECH
	dbw 1, ABSORB
	dbw 5, SUPERSONIC
	dbw 7, ASTONISH
	dbw 11, BITE
	dbw 13, WING_ATTACK
	dbw 17, CONFUSE_RAY
	dbw 19, AIR_CUTTER
	dbw 24, SWIFT
	dbw 27, POISON_FANG
	dbw 32, MEAN_LOOK
	dbw 35, LEECH_LIFE
	dbw 40, HAZE
	dbw 43, VENOSHOCK
	dbw 48, DUALWINGBEAT
	dbw 51, GUNK_SHOT
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, CROSS_POISON
	dbw 1, CROSS_POISON
	dbw 1, ABSORB
	dbw 5, SUPERSONIC
	dbw 7, ASTONISH
	dbw 11, BITE
	dbw 13, WING_ATTACK
	dbw 17, CONFUSE_RAY
	dbw 19, AIR_CUTTER
	dbw 24, SWIFT
	dbw 27, POISON_FANG
	dbw 32, MEAN_LOOK
	dbw 35, LEECH_LIFE
	dbw 40, HAZE
	dbw 43, VENOSHOCK
	dbw 48, DUALWINGBEAT
	dbw 51, GUNK_SHOT
	dbw 56, BRAVE_BIRD
	db 0 ; no more level-up moves

OddishEvosAttacks:
	dbbw EVOLVE_LEVEL, 21, GLOOM
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, GROWTH
	dbw 5, SWEET_SCENT
	dbw 9, ACID
	dbw 13, POISONPOWDER
	dbw 14, STUN_SPORE
	dbw 15, SLEEP_POWDER
	dbw 19, BULLET_SEED
	dbw 23, MEGA_DRAIN
	dbw 27, VENOSHOCK
	dbw 31, MOONLIGHT
	dbw 35, GIGA_DRAIN
	dbw 39, TOXIC
	dbw 43, LEECH_SEED
	dbw 47, MOONBLAST
	dbw 51, PETAL_DANCE
	db 0 ; no more level-up moves

GloomEvosAttacks:
	dbbw EVOLVE_ITEM, LEAF_STONE, VILEPLUME
	dbbw EVOLVE_ITEM, SUN_STONE, BELLOSSOM
	db 0 ; no more evolutions
	dbw 1, ABSORB
	dbw 1, GROWTH
	dbw 5, SWEET_SCENT
	dbw 9, ACID
	dbw 13, POISONPOWDER
	dbw 14, STUN_SPORE
	dbw 15, SLEEP_POWDER
	dbw 19, BULLET_SEED
	dbw 24, MEGA_DRAIN
	dbw 29, VENOSHOCK
	dbw 34, MOONLIGHT
	dbw 39, GIGA_DRAIN
	dbw 44, TOXIC
	dbw 49, LEECH_SEED
	dbw 54, MOONBLAST
	dbw 59, PETAL_DANCE
	db 0 ; no more level-up moves

VileplumeEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, PETAL_BLIZZ
	dbw 1, PETAL_BLIZZ
	dbw 1, ABSORB
	dbw 1, SWEET_SCENT
	dbw 1, STUN_SPORE
	dbw 59, PETAL_DANCE
	dbw 69, SOLARBEAM
	db 0 ; no more level-up moves

BellossomEvosAttacks:
	db 0 ; no more evolutions
if DEF(_FAITHFUL)
	dbw LEARN_EVO_MOVE, MAGICAL_LEAF
elif DEF(_NOPSS)
	dbw LEARN_EVO_MOVE, MAGICAL_LEAF
else
	dbw LEARN_EVO_MOVE, MOONBLAST
endc
if DEF(_FAITHFUL)
	dbw 1, MAGICAL_LEAF
elif DEF(_NOPSS)
	dbw 1, MAGICAL_LEAF
else
	dbw 1, MOONBLAST
endc
	dbw 1, ABSORB
	dbw 1, SWEET_SCENT
	dbw 1, STUN_SPORE
	dbw 1, PETAL_DANCE
	dbw 39, QUIVER_DANCE
	dbw 59, PETAL_DANCE
	dbw 69, SOLARBEAM
	db 0 ; no more level-up moves

ParasEvosAttacks:
	dbbw EVOLVE_LEVEL, 24, PARASECT
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 6, STUN_SPORE
	dbw 6, POISONPOWDER
	dbw 11, ABSORB
	dbw 17, FURY_CUTTER
	dbw 22, SPORE
	dbw 27, SLASH
	dbw 33, GROWTH
	dbw 38, GIGA_DRAIN
	dbw 43, HEAL_BELL
	dbw 49, LEECH_LIFE
	dbw 54, X_SCISSOR
	dbw 60, SOLAR_BLADE
	db 0 ; no more level-up moves

ParasectEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SWORDS_DANCE
	dbw 1, SWORDS_DANCE
	dbw 1, SCRATCH
	dbw 6, STUN_SPORE
	dbw 6, POISONPOWDER
	dbw 11, ABSORB
	dbw 17, FURY_CUTTER
	dbw 22, SPORE
	dbw 29, SLASH
	dbw 37, GROWTH
	dbw 44, GIGA_DRAIN
	dbw 51, HEAL_BELL
	dbw 59, LEECH_LIFE
	dbw 66, X_SCISSOR
	dbw 71, SOLAR_BLADE
	db 0 ; no more level-up moves

VenonatEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, VENOMOTH
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, DISABLE
	dbw 1, FORESIGHT
	dbw 5, SUPERSONIC
	dbw 11, CONFUSION
	dbw 13, POISONPOWDER
	dbw 17, PSYBEAM
	dbw 23, STUN_SPORE
	dbw 25, SIGNAL_BEAM
	dbw 29, SLEEP_POWDER
	dbw 35, LEECH_LIFE
	dbw 37, ZEN_HEADBUTT
	dbw 41, POISON_FANG
	dbw 47, PSYCHIC_M
	db 0 ; no more level-up moves

VenomothEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SILVER_WIND
	dbw 1, SILVER_WIND
	dbw 1, TACKLE
	dbw 1, DISABLE
	dbw 1, FORESIGHT
	dbw 5, SUPERSONIC
	dbw 11, CONFUSION
	dbw 13, POISONPOWDER
	dbw 17, PSYBEAM
	dbw 23, STUN_SPORE
	dbw 25, SIGNAL_BEAM
	dbw 29, SLEEP_POWDER
	dbw 37, LEECH_LIFE
	dbw 41, ZEN_HEADBUTT
if DEF(_FAITHFUL)
	dbw 47, POISON_FANG
elif DEF(_NOPSS)
	dbw 47, POISON_FANG
else
	dbw 47, BUG_BUZZ
endc
	dbw 55, PSYCHIC_M
if DEF(_FAITHFUL)
	dbw 59, BUG_BUZZ
elif DEF(_NOPSS)
	dbw 59, BUG_BUZZ
else
	dbw 59, SIGNAL_WAVE
endc
	dbw 63, QUIVER_DANCE
	db 0 ; no more level-up moves

DiglettEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, DUGTRIO
	db 0 ; no more evolutions
	dbw 1, SAND_ATTACK
	dbw 1, SCRATCH
	dbw 4, GROWL
	dbw 7, ASTONISH
	dbw 10, MUD_SLAP
	dbw 14, MAGNITUDE
	dbw 18, BULLDOZE
	dbw 22, SUCKER_PUNCH
	dbw 25, MUD_BOMB
	dbw 28, EARTH_POWER
	dbw 31, DIG
	dbw 35, SLASH
	dbw 39, EARTHQUAKE
	dbw 43, FISSURE
	db 0 ; no more level-up moves

DugtrioEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SAND_TOMB
	dbw 1, SAND_TOMB
	dbw 1, SAND_ATTACK
	dbw 1, SCRATCH
	dbw 4, GROWL
	dbw 7, ASTONISH
	dbw 10, MUD_SLAP
	dbw 14, MAGNITUDE
	dbw 18, BULLDOZE
	dbw 22, SUCKER_PUNCH
	dbw 25, MUD_BOMB
	dbw 30, EARTH_POWER
	dbw 35, DIG
	dbw 41, SLASH
	dbw 47, EARTHQUAKE
	dbw 53, FISSURE
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 6, BITE
	dbw 9, FAKE_OUT
	dbw 14, FURY_SWIPES
	dbw 17, SCREECH
	dbw 22, FAINT_ATTACK
	dbw 25, HONE_CLAWS
	dbw 30, PAY_DAY
	dbw 33, SLASH
	dbw 38, NASTY_PLOT
	dbw 41, PAYBACK
	dbw 46, FOCUS_ENERGY
	dbw 49, NIGHT_SLASH
	dbw 50, PLAY_ROUGH
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SWIFT
	dbw 1, SWIFT
	dbw 1, SCRATCH
	dbw 1, GROWL
	dbw 6, BITE
	dbw 9, FAKE_OUT
	dbw 14, FURY_SWIPES
	dbw 17, SCREECH
	dbw 22, FAINT_ATTACK
	dbw 25, HONE_CLAWS
	dbw 32, POWER_GEM
	dbw 37, SLASH
	dbw 44, NASTY_PLOT
	dbw 49, PAYBACK
	dbw 56, FOCUS_ENERGY
	dbw 61, NIGHT_SLASH
	dbw 65, PLAY_ROUGH
	db 0 ; no more level-up moves

PsyduckEvosAttacks:
	dbbw EVOLVE_LEVEL, 33, GOLDUCK
	db 0 ; no more evolutions
	dbw 1, SCRATCH
	dbw 4, TAIL_WHIP
	dbw 7, BUBBLE
	dbw 10, CONFUSION
	dbw 13, FURY_SWIPES
	dbw 16, WATER_PULSE
	dbw 19, DISABLE
	dbw 22, SCREECH
	dbw 25, ZEN_HEADBUTT
	dbw 28, AQUA_TAIL
	dbw 31, RAIN_DANCE
	dbw 34, PSYCH_UP
	dbw 37, AMNESIA
	dbw 40, HYDRO_PUMP
	dbw 43, NASTY_PLOT
	db 0 ; no more level-up moves

GolduckEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, FUTURE_SIGHT
	dbw 1, FUTURE_SIGHT
	dbw 1, SCRATCH
	dbw 4, TAIL_WHIP
	dbw 7, BUBBLE
	dbw 10, CONFUSION
	dbw 13, FURY_SWIPES
	dbw 16, WATER_PULSE
	dbw 19, DISABLE
	dbw 22, SCREECH
	dbw 25, ZEN_HEADBUTT
	dbw 28, AQUA_TAIL
	dbw 31, RAIN_DANCE
	dbw 36, PSYCH_UP
	dbw 41, AMNESIA
	dbw 46, HYDRO_PUMP
	dbw 51, NASTY_PLOT
	db 0 ; no more level-up moves

MankeyEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, PRIMEAPE
	db 0 ; no more evolutions
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
	dbw 29, LOW_SWEEP
	dbw 33, THRASH
	dbw 36, CLOSE_COMBAT
	dbw 40, SCREECH
	dbw 43, HIHORSEPOWER
	dbw 47, OUTRAGE
	dbw 50, SUPERPOWER
	db 0 ; no more level-up moves

PrimeapeEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, ANNIHILAPE
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, RAGE
	dbw 1, RAGE
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

GrowlitheEvosAttacks:
	dbbw EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	dbw 1, BITE
	dbw 1, ROAR
	dbw 6, EMBER
	dbw 8, LEER
	dbw 10, ODOR_SLEUTH
	dbw 12, HOWL
	dbw 17, FLAME_WHEEL
	dbw 19, REVERSAL
	dbw 21, FIRE_FANG
	dbw 23, TAKE_DOWN
	dbw 28, FLAME_CHARGE
	dbw 30, AGILITY
	dbw 32, STOMP
	dbw 34, FLAMETHROWER
	dbw 39, CRUNCH
	dbw 41, HEAT_WAVE
	dbw 43, OUTRAGE
	dbw 45, PLAY_ROUGH
	dbw 48, FLARE_BLITZ
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, EXTREMESPEED
	dbw 1, EXTREMESPEED
	dbw 1, THUNDER_FANG
	dbw 1, ROAR
	dbw 1, LEER
	dbw 1, TAKE_DOWN
	dbw 1, FLAME_WHEEL
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, HYPNOSIS
	dbw 11, BUBBLE
	dbw 15, DOUBLESLAP
	dbw 18, RAIN_DANCE
	dbw 21, BODY_SLAM
	dbw 25, BUBBLEBEAM
	dbw 28, MUD_SHOT
	dbw 31, BELLY_DRUM
	dbw 35, BRICK_BREAK
	dbw 38, HYDRO_PUMP
	dbw 41, MUD_BOMB
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	dbbw EVOLVE_ITEM, WATER_STONE, POLIWRATH
	dbbw EVOLVE_ITEM, ROYAL_ROCK, POLITOED
	db 0 ; no more evolutions
	dbw 1, WATER_GUN
	dbw 1, HYPNOSIS
	dbw 11, BUBBLE
	dbw 15, DOUBLESLAP
	dbw 18, RAIN_DANCE
	dbw 21, BODY_SLAM
	dbw 27, BUBBLEBEAM
	dbw 32, MUD_SHOT
	dbw 37, BELLY_DRUM
	dbw 43, BRICK_BREAK
	dbw 48, HYDRO_PUMP
	dbw 53, MUD_BOMB
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SUBMISSION
	dbw 1, SUBMISSION
	dbw 1, WATER_GUN
	dbw 1, HYPNOSIS
	dbw 1, DOUBLESLAP
	dbw 1, CLOSE_COMBAT
	dbw 32, DYNAMICPUNCH
	dbw 37, CIRCLE_THROW
	dbw 43, MIND_READER
	dbw 48, WAVE_CRASH
	dbw 53, CLOSE_COMBAT
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SURF
	dbw 1, SURF
	dbw 1, WATER_GUN
	dbw 1, HYPNOSIS
	dbw 1, DOUBLESLAP
	dbw 1, PERISH_SONG
	dbw 27, SWAGGER
	dbw 37, BOUNCE
	dbw 48, HYPER_VOICE
	db 0 ; no more level-up moves

AbraEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	dbw 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	dbbw EVOLVE_ITEM, LINK_CABLE, ALAKAZAM
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, KINESIS
	dbw 1, KINESIS
	dbw 1, TELEPORT
	dbw 1, CONFUSION
	dbw 16, CONFUSION
	dbw 18, DISABLE
	dbw 21, PSYBEAM
	dbw 23, HYPNOSIS
	dbw 26, REFLECT
	dbw 28, PSYCHO_CUT
	dbw 31, RECOVER
	dbw 33, BARRIER
	dbw 36, EXTRASENSORY
	dbw 38, PSYCHIC_M
	dbw 41, DREAM_EATER
	dbw 43, FUTURE_SIGHT
	dbw 46, NASTY_PLOT
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, CALM_MIND
	dbw 1, CALM_MIND
	dbw 1, KINESIS
	dbw 1, TELEPORT
	dbw 1, CONFUSION
	dbw 16, KINESIS
	dbw 16, CONFUSION
	dbw 18, DISABLE
	dbw 21, PSYBEAM
	dbw 23, HYPNOSIS
	dbw 26, REFLECT
	dbw 28, PSYCHO_CUT
	dbw 31, RECOVER
	dbw 33, BARRIER
	dbw 36, EXTRASENSORY
	dbw 38, PSYCHIC_M
	dbw 41, DREAM_EATER
	dbw 43, FUTURE_SIGHT
	dbw 46, NASTY_PLOT
	db 0 ; no more level-up moves

MachopEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 3, FOCUS_ENERGY
	dbw 7, KARATE_CHOP
	dbw 9, FORESIGHT
	dbw 13, LOW_SWEEP
	dbw 15, SEISMIC_TOSS
	dbw 19, REVENGE
	dbw 21, KNOCK_OFF
	dbw 25, VITAL_THROW
	dbw 27, BRICK_BREAK
	dbw 31, DUAL_CHOP
	dbw 33, SUBMISSION
	dbw 37, BULK_UP
	dbw 39, CROSS_CHOP
	dbw 43, SCARY_FACE
	dbw 45, DYNAMICPUNCH
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	dbbw EVOLVE_ITEM, LINK_CABLE, MACHAMP
	db 0 ; no more evolutions
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 3, FOCUS_ENERGY
	dbw 7, KARATE_CHOP
	dbw 9, FORESIGHT
	dbw 13, LOW_SWEEP
	dbw 15, SEISMIC_TOSS
	dbw 19, REVENGE
	dbw 21, KNOCK_OFF
	dbw 25, VITAL_THROW
	dbw 27, BRICK_BREAK
	dbw 33, DUAL_CHOP
	dbw 37, SUBMISSION
	dbw 43, BULK_UP
	dbw 47, CROSS_CHOP
	dbw 53, SCARY_FACE
	dbw 57, DYNAMICPUNCH
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, STRENGTH
	dbw 1, STRENGTH
	dbw 1, LOW_KICK
	dbw 1, LEER
	dbw 3, FOCUS_ENERGY
	dbw 7, KARATE_CHOP
	dbw 9, FORESIGHT
	dbw 13, LOW_SWEEP
	dbw 15, SEISMIC_TOSS
	dbw 19, REVENGE
	dbw 21, KNOCK_OFF
	dbw 25, VITAL_THROW
	dbw 27, BRICK_BREAK
	dbw 33, DUAL_CHOP
	dbw 37, SUBMISSION
	dbw 43, BULK_UP
	dbw 47, CROSS_CHOP
	dbw 53, SCARY_FACE
	dbw 57, DYNAMICPUNCH
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	dbbw EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 7, GROWTH
	dbw 11, WRAP
	dbw 13, SLEEP_POWDER
	dbw 15, POISONPOWDER
	dbw 17, STUN_SPORE
	dbw 23, ACID
	dbw 27, KNOCK_OFF
	dbw 29, SWEET_SCENT
	dbw 35, SWORDS_DANCE
	dbw 39, RAZOR_LEAF
	dbw 41, POISON_JAB
	dbw 47, SLASH
	dbw 45, SOLAR_BLADE
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	dbbw EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	dbw 1, VINE_WHIP
	dbw 7, GROWTH
	dbw 11, WRAP
	dbw 13, SLEEP_POWDER
	dbw 15, POISONPOWDER
	dbw 17, STUN_SPORE
	dbw 24, ACID
	dbw 29, KNOCK_OFF
	dbw 32, SWEET_SCENT
	dbw 39, SWORDS_DANCE
	dbw 44, RAZOR_LEAF
	dbw 47, POISON_JAB
	dbw 54, SLASH
	dbw 58, SOLAR_BLADE
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, POWER_WHIP
	dbw 1, POWER_WHIP
	dbw 1, VINE_WHIP
	dbw 1, SLEEP_POWDER
	dbw 1, SWEET_SCENT
	dbw 1, RAZOR_LEAF
	dbw 32, SLUDGE_BOMB
	dbw 44, LEAF_BLADE
	dbw 59, SOLAR_BLADE
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	dbw 1, POISON_STING
	dbw 4, SUPERSONIC
	dbw 7, CONSTRICT
	dbw 10, BUBBLE
	dbw 13, ACID
	dbw 16, WATER_PULSE
	dbw 19, WRAP
	dbw 22, ACID_SPRAY
	dbw 25, BUBBLEBEAM
	dbw 28, BARRIER
	dbw 31, POISON_JAB
	dbw 34, TOXIC
	dbw 37, SCREECH
	dbw 40, HEX
	dbw 43, SLUDGE_WAVE
	dbw 46, HYDRO_PUMP
	dbw 49, BELCH
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, VENOSHOCK
	dbw 1, VENOSHOCK
	dbw 1, POISON_STING
	dbw 4, SUPERSONIC
	dbw 7, CONSTRICT
	dbw 10, BUBBLE
	dbw 13, ACID
	dbw 16, WATER_PULSE
	dbw 19, WRAP
	dbw 22, ACID_SPRAY
	dbw 25, BUBBLEBEAM
	dbw 28, BARRIER
	dbw 32, POISON_JAB
	dbw 36, TOXIC
	dbw 40, SCREECH
	dbw 44, HEX
	dbw 48, SLUDGE_WAVE
	dbw 52, HYDRO_PUMP
	dbw 56, BELCH
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, DEFENSE_CURL
	dbw 4, MUD_SLAP
	dbw 6, ROCK_POLISH
	dbw 10, ROLLOUT
	dbw 12, MAGNITUDE
	dbw 16, ROCK_THROW
	dbw 18, ROCK_TOMB
	dbw 22, BULLDOZE
	dbw 24, SELFDESTRUCT
	dbw 28, SPIKES
	dbw 30, ROCK_BLAST
	dbw 34, EARTHQUAKE
	dbw 36, EXPLOSION
	dbw 40, DOUBLE_EDGE
	dbw 42, STONE_EDGE
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	dbbw EVOLVE_ITEM, LINK_CABLE, GOLEM
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, DEFENSE_CURL
	dbw 4, MUD_SLAP
	dbw 6, ROCK_POLISH
	dbw 10, ROLLOUT
	dbw 12, MAGNITUDE
	dbw 16, ROCK_THROW
	dbw 18, ROCK_TOMB
	dbw 22, BULLDOZE
	dbw 24, SELFDESTRUCT
	dbw 30, SPIKES
	dbw 34, ROCK_BLAST
	dbw 40, EARTHQUAKE
	dbw 44, EXPLOSION
	dbw 50, DOUBLE_EDGE
	dbw 54, STONE_EDGE
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, GYRO_BALL
	dbw 1, GYRO_BALL
	dbw 1, TACKLE
	dbw 1, DEFENSE_CURL
	dbw 4, MUD_SLAP
	dbw 6, ROCK_POLISH
	dbw 10, ROLLOUT
	dbw 12, MAGNITUDE
	dbw 16, ROCK_THROW
	dbw 18, ROCK_TOMB
	dbw 22, BULLDOZE
	dbw 24, SELFDESTRUCT
	dbw 30, SPIKES
	dbw 34, ROCK_BLAST
	dbw 40, EARTHQUAKE
	dbw 44, EXPLOSION
	dbw 50, DOUBLE_EDGE
	dbw 54, STONE_EDGE
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, RAPIDASH
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, TAIL_WHIP
	dbw 9, EMBER
	dbw 13, FLAME_WHEEL
	dbw 17, STOMP
	dbw 21, FLAME_CHARGE
	dbw 25, FIRE_SPIN
	dbw 29, TAKE_DOWN
	dbw 33, INFERNO
	dbw 37, AGILITY
	dbw 41, FIRE_BLAST
	dbw 45, BOUNCE
	dbw 49, FLARE_BLITZ
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SMART_STRIKE
	dbw 1, SMART_STRIKE
	dbw 1, TACKLE
	dbw 1, GROWL
	dbw 4, TAIL_WHIP
	dbw 9, EMBER
	dbw 13, FLAME_WHEEL
	dbw 17, STOMP
	dbw 21, FLAME_CHARGE
	dbw 25, FIRE_SPIN
	dbw 29, TAKE_DOWN
	dbw 33, INFERNO
	dbw 37, AGILITY
	dbw 41, FIRE_BLAST
	dbw 45, BOUNCE
	dbw 49, FLARE_BLITZ
	dbw 53, MEGAHORN
	dbw 57, SOLAR_BLADE
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	dbbw EVOLVE_ITEM, ROYAL_ROCK, SLOWKING
	dbbw EVOLVE_LEVEL, 37, SLOWBRO
	db 0 ; no more evolutions
	dbw 1, CURSE
	dbw 1, TACKLE
	dbw 5, GROWL
	dbw 9, WATER_GUN
	dbw 14, CONFUSION
	dbw 19, DISABLE
	dbw 23, HEADBUTT
	dbw 28, WATER_PULSE
	dbw 32, ZEN_HEADBUTT
	dbw 36, SLACK_OFF
	dbw 41, AMNESIA
	dbw 45, PSYCHIC_M
	dbw 49, RAIN_DANCE
	dbw 54, PSYCH_UP
	dbw 58, HAZE
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, WITHDRAW
	dbw 1, WITHDRAW
	dbw 1, CURSE
	dbw 1, TACKLE
	dbw 5, GROWL
	dbw 9, WATER_GUN
	dbw 14, CONFUSION
	dbw 19, DISABLE
	dbw 23, HEADBUTT
	dbw 28, WATER_PULSE
	dbw 32, ZEN_HEADBUTT
	dbw 36, SLACK_OFF
	dbw 43, AMNESIA
	dbw 49, PSYCHIC_M
	dbw 55, RAIN_DANCE
	dbw 62, PSYCH_UP
	dbw 68, HAZE
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, HIDDEN_POWER
	dbw 1, HIDDEN_POWER
	dbw 1, CURSE
	dbw 1, TACKLE
	dbw 5, GROWL
	dbw 9, WATER_GUN
	dbw 14, CONFUSION
	dbw 19, DISABLE
	dbw 23, HEADBUTT
	dbw 28, WATER_PULSE
	dbw 32, ZEN_HEADBUTT
	dbw 36, NASTY_PLOT
	dbw 41, SWAGGER
	dbw 45, PSYCHIC_M
	dbw 49, RAIN_DANCE
	dbw 54, PSYCH_UP
	dbw 58, HAZE
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	dbw 1, SUPERSONIC
	dbw 1, TACKLE
	dbw 5, THUNDERSHOCK
	dbw 7, MIRROR_SHOT
	dbw 11, THUNDER_WAVE
	dbw 13, LIGHT_SCREEN
	dbw 17, SONICBOOM
	dbw 19, SPARK
	dbw 23, STEEL_SLICE
	dbw 25, METAL_SOUND
	dbw 29, DISCHARGE
	dbw 31, FLASH_CANNON
	dbw 35, SCREECH
	dbw 37, THUNDERBOLT
	dbw 41, LOCK_ON
	dbw 43, RAIN_DANCE
	dbw 47, GYRO_BALL
	dbw 49, ZAP_CANNON
	dbw 51, THUNDER
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
	dbbw EVOLVE_ITEM, THUNDERSTONE, MAGNEZONE
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, TRI_ATTACK
	dbw 1, TRI_ATTACK
	dbw 1, SUPERSONIC
	dbw 1, TACKLE
	dbw 5, THUNDERSHOCK
	dbw 7, MIRROR_SHOT
	dbw 11, THUNDER_WAVE
	dbw 13, LIGHT_SCREEN
	dbw 17, SONICBOOM
	dbw 19, SPARK
	dbw 23, STEEL_SLICE
	dbw 25, METAL_SOUND
	dbw 29, DISCHARGE
	dbw 33, FLASH_CANNON
	dbw 39, SCREECH
	dbw 43, THUNDERBOLT
	dbw 49, LOCK_ON
	dbw 53, RAIN_DANCE
	dbw 59, GYRO_BALL
	dbw 63, ZAP_CANNON
	dbw 67, THUNDER
	db 0 ; no more level-up moves

MagnezoneEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, TRI_ATTACK
	dbw 1, SUPERSONIC
	dbw 1, TACKLE
	dbw 5, THUNDERSHOCK
	dbw 7, MIRROR_SHOT
	dbw 11, THUNDER_WAVE
	dbw 13, LIGHT_SCREEN
	dbw 17, SONICBOOM
	dbw 19, SPARK
	dbw 23, STEEL_SLICE
	dbw 25, METAL_SOUND
	dbw 29, DISCHARGE
	dbw 30, TRI_ATTACK
	dbw 33, FLASH_CANNON
	dbw 39, SCREECH
	dbw 43, THUNDERBOLT
	dbw 49, LOCK_ON
	dbw 53, RAIN_DANCE
	dbw 59, GYRO_BALL
	dbw 63, ZAP_CANNON
	dbw 67, THUNDER
	db 0 ; no more level-up moves

FarfetchDEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, POISON_JAB
	dbw 1, SAND_ATTACK
	dbw 1, LEER
	dbw 7, FURY_ATTACK
	dbw 9, WING_ATTACK
	dbw 13, KNOCK_OFF
	dbw 19, SLASH
	dbw 21, AIR_CUTTER
	dbw 25, SWORDS_DANCE
	dbw 31, AGILITY
	dbw 33, NIGHT_SLASH
	dbw 37, ACROBATICS
	dbw 43, ROOST
	dbw 45, FALSE_SWIPE
	dbw 49, DUALWINGBEAT
	dbw 55, LEAF_BLADE
	dbw 60, BRAVE_BIRD
	db 0 ; no more level-up moves

DoduoEvosAttacks:
	dbbw EVOLVE_LEVEL, 31, DODRIO
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, GROWL
	dbw 5, QUICK_ATTACK
	dbw 8, RAGE
	dbw 13, FURY_ATTACK
	dbw 15, PURSUIT
	dbw 19, AERIAL_ACE
	dbw 22, DOUBLE_HIT_M
	dbw 26, AGILITY
	dbw 29, ROUND_M
	dbw 33, ROOST
	dbw 36, SWORDS_DANCE
	dbw 40, JUMP_KICK
	dbw 43, DRILL_PECK
	dbw 47, THRASH
	dbw 50, BRAVE_BIRD
	db 0 ; no more level-up moves

DodrioEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, TRI_ATTACK
	dbw 1, TRI_ATTACK
	dbw 1, PECK
	dbw 1, GROWL
	dbw 5, QUICK_ATTACK
	dbw 8, RAGE
	dbw 13, FURY_ATTACK
	dbw 15, PURSUIT
	dbw 19, AERIAL_ACE
	dbw 22, DOUBLE_HIT_M
	dbw 26, AGILITY
	dbw 29, ROUND_M
	dbw 34, ROOST
	dbw 38, SWORDS_DANCE
	dbw 43, JUMP_KICK
	dbw 47, DRILL_PECK
	dbw 52, THRASH
	dbw 56, BRAVE_BIRD
	db 0 ; no more level-up moves

SeelEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, DEWGONG
	db 0 ; no more evolutions
	dbw 1, HEADBUTT
	dbw 3, GROWL
	dbw 7, AQUA_JET
	dbw 11, ICY_WIND
	dbw 12, ENCORE
	dbw 17, ICE_SHARD
	dbw 21, REST
	dbw 23, AQUA_RING
	dbw 27, AURORA_BEAM
	dbw 31, BUBBLEBEAM
	dbw 33, WATER_PULSE
	dbw 37, TAKE_DOWN
	dbw 41, WATERFALL
	dbw 43, AQUA_TAIL
	dbw 47, ICE_BEAM
	dbw 51, SAFEGUARD
	dbw 53, HAIL
	db 0 ; no more level-up moves

DewgongEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SHEER_COLD
	dbw 1, SHEER_COLD
	dbw 1, AVALANCHE
	dbw 1, HEADBUTT
	dbw 3, GROWL
	dbw 7, SIGNAL_BEAM
	dbw 11, ICY_WIND
	dbw 12, ENCORE
	dbw 17, ICE_SHARD
	dbw 21, REST
	dbw 23, AQUA_RING
	dbw 27, AURORA_BEAM
	dbw 31, BUBBLEBEAM
	dbw 33, WATER_PULSE
	dbw 39, TAKE_DOWN
	dbw 45, WATERFALL
	dbw 49, AQUA_TAIL
	dbw 55, ICE_BEAM
	dbw 61, SAFEGUARD
	dbw 65, HAIL
	dbw 69, MEGAHORN
	db 0 ; no more level-up moves

GrimerEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, MUK
	db 0 ; no more evolutions
	dbw 1, POISON_GAS
	dbw 1, POUND
	dbw 4, HARDEN
	dbw 7, MUD_SLAP
	dbw 12, DISABLE
	dbw 15, SLUDGE
	dbw 18, MUD_BOMB
	dbw 21, MINIMIZE
	dbw 26, KNOCK_OFF
	dbw 29, SLUDGE_BOMB
	dbw 32, SLUDGE_WAVE
	dbw 37, SCREECH
	dbw 40, BELCH
	dbw 43, ACID_ARMOR
	dbw 46, GUNK_SHOT
	dbw 48, TOXIC
	db 0 ; no more level-up moves

MukEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, POISON_JAB
	dbw 1, POISON_JAB
	dbw 1, POISON_GAS
	dbw 1, POUND
	dbw 4, HARDEN
	dbw 7, MUD_SLAP
	dbw 12, DISABLE
	dbw 15, SLUDGE
	dbw 18, MUD_BOMB
	dbw 21, MINIMIZE
	dbw 26, KNOCK_OFF
	dbw 29, SLUDGE_BOMB
	dbw 32, SLUDGE_WAVE
	dbw 37, SCREECH
	dbw 40, BELCH
	dbw 46, ACID_ARMOR
	dbw 52, GUNK_SHOT
	dbw 57, TOXIC
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	dbbw EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, WITHDRAW
	dbw 1, WATER_GUN
	dbw 8, SUPERSONIC
	dbw 13, ICICLE_SPEAR
	dbw 16, PROTECT
	dbw 20, LEER
	dbw 25, CLAMP
	dbw 28, ICE_SHARD
	dbw 32, WATERFALL
	dbw 37, AURORA_BEAM
	dbw 40, WHIRLPOOL
	dbw 44, WATER_PULSE
	dbw 49, IRON_DEFENSE
	dbw 52, ICE_BEAM
	dbw 56, SHELL_SMASH
	dbw 61, WAVE_CRASH
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SPIKES
	dbw 1, SPIKES
	dbw 1, WITHDRAW
	dbw 1, SUPERSONIC
	dbw 1, AURORA_BEAM
	dbw 1, PROTECT
	dbw 13, SPIKE_CANNON
	dbw 28, ICICLE_CRASH
	dbw 61, EXPLOSION
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	dbbw EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 5, SPITE
	dbw 8, MEAN_LOOK
	dbw 12, CURSE
	dbw 15, NIGHT_SHADE
	dbw 19, CONFUSE_RAY
	dbw 22, SUCKER_PUNCH
	dbw 26, PAYBACK
	dbw 29, SHADOW_BALL
	dbw 33, DREAM_EATER
	dbw 36, DARK_PULSE
	dbw 40, DESTINY_BOND
	dbw 43, HEX
	dbw 47, SLUDGE_BOMB
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	dbbw EVOLVE_ITEM, LINK_CABLE, GENGAR
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SHADOW_PUNCH
	dbw 1, SHADOW_PUNCH
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 5, SPITE
	dbw 8, MEAN_LOOK
	dbw 12, CURSE
	dbw 15, NIGHT_SHADE
	dbw 19, CONFUSE_RAY
	dbw 22, SUCKER_PUNCH
	dbw 28, PAYBACK
	dbw 33, SHADOW_BALL
	dbw 39, DREAM_EATER
	dbw 44, DARK_PULSE
	dbw 50, DESTINY_BOND
	dbw 55, HEX
	dbw 61, SLUDGE_BOMB
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SLUDGE_WAVE
	dbw 1, SLUDGE_WAVE
	dbw 1, HYPNOSIS
	dbw 1, LICK
	dbw 5, SPITE
	dbw 8, MEAN_LOOK
	dbw 12, CURSE
	dbw 15, NIGHT_SHADE
	dbw 19, CONFUSE_RAY
	dbw 22, SUCKER_PUNCH
	dbw 25, SHADOW_PUNCH
	dbw 28, PAYBACK
	dbw 33, SHADOW_BALL
	dbw 39, DREAM_EATER
	dbw 44, DARK_PULSE
	dbw 50, DESTINY_BOND
	dbw 55, HEX
	dbw 61, SLUDGE_BOMB
	db 0 ; no more level-up moves

OnixEvosAttacks:
	dbbw EVOLVE_ITEM, METAL_COAT, STEELIX
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, SCREECH
	dbw 1, HARDEN
	dbw 4, CURSE
	dbw 7, ROCK_THROW
	dbw 13, RAGE
	dbw 16, SPIKES
	dbw 19, ROCK_POLISH
	dbw 20, GYRO_BALL
	dbw 22, ROCK_TOMB
	dbw 25, DRAGONBREATH
	dbw 28, SLAM
	dbw 31, SCREECH
	dbw 34, ROCK_SLIDE
	dbw 37, SAND_TOMB
	dbw 40, IRON_TAIL
	dbw 46, STONE_EDGE
	dbw 49, DOUBLE_EDGE
	dbw 52, SANDSTORM
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, STEEL_SLICE
	dbw 1, STEEL_SLICE
	dbw 1, TACKLE
	dbw 1, SCREECH
	dbw 1, HARDEN
	dbw 4, CURSE
	dbw 7, ROCK_THROW
	dbw 13, RAGE
	dbw 16, SPIKES
	dbw 19, ROCK_POLISH
	dbw 20, GYRO_BALL
	dbw 22, ROCK_TOMB
	dbw 25, DRAGONBREATH
	dbw 28, SLAM
	dbw 31, SCREECH
	dbw 34, ROCK_SLIDE
	dbw 37, SAND_TOMB
	dbw 40, IRON_TAIL
	dbw 46, STONE_EDGE
	dbw 49, DOUBLE_EDGE
	dbw 52, SANDSTORM
	db 0 ; no more level-up moves

DrowzeeEvosAttacks:
	dbbw EVOLVE_LEVEL, 26, HYPNO
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, HYPNOSIS
	dbw 5, DISABLE
	dbw 9, CONFUSION
	dbw 13, HEADBUTT
	dbw 17, POISON_GAS
	dbw 21, MEDITATE
	dbw 25, PSYBEAM
	dbw 29, BRICK_BREAK
	dbw 33, PSYCH_UP
	dbw 37, CALM_MIND
	dbw 41, DREAM_EATER
	dbw 45, SWAGGER
	dbw 49, PSYCHIC_M
	dbw 53, NASTY_PLOT
	dbw 57, EXTRASENSORY
	dbw 61, FUTURE_SIGHT
	db 0 ; no more level-up moves

HypnoEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, ZEN_HEADBUTT
	dbw 1, ZEN_HEADBUTT
	dbw 1, POUND
	dbw 1, HYPNOSIS
	dbw 5, DISABLE
	dbw 9, CONFUSION
	dbw 13, HEADBUTT
	dbw 17, POISON_GAS
	dbw 21, MEDITATE
	dbw 25, PSYBEAM
	dbw 29, BRICK_BREAK
	dbw 33, PSYCH_UP
	dbw 37, CALM_MIND
	dbw 41, DREAM_EATER
	dbw 45, SWAGGER
	dbw 49, PSYCHIC_M
	dbw 53, NASTY_PLOT
	dbw 57, EXTRASENSORY
	dbw 61, FUTURE_SIGHT
	db 0 ; no more level-up moves

KrabbyEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, KINGLER
	db 0 ; no more evolutions
	dbw 1, AQUA_JET
	dbw 1, LEER
	dbw 5, VICEGRIP
	dbw 9, LEER
	dbw 11, HARDEN
	dbw 15, BUBBLEBEAM
	dbw 19, MUD_SHOT
	dbw 21, METAL_CLAW
	dbw 25, STOMP
	dbw 29, PROTECT
	dbw 31, GUILLOTINE
	dbw 35, SLAM
	dbw 39, WATERFALL
	dbw 41, CRABHAMMER
	dbw 45, FLAIL
	dbw 51, WAVE_CRASH
	db 0 ; no more level-up moves

KinglerEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, BULLDOZE
	dbw 1, BULLDOZE
	dbw 1, AQUA_JET
	dbw 1, LEER
	dbw 5, VICEGRIP
	dbw 9, LEER
	dbw 11, HARDEN
	dbw 15, BUBBLEBEAM
	dbw 19, MUD_SHOT
	dbw 21, METAL_CLAW
	dbw 25, STOMP
	dbw 32, PROTECT
	dbw 37, GUILLOTINE
	dbw 44, SLAM
	dbw 51, WATERFALL
	dbw 56, CRABHAMMER
	dbw 63, FLAIL
	dbw 69, WAVE_CRASH
	db 0 ; no more level-up moves

VoltorbEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTRODE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, THUNDERSHOCK
	dbw 4, SONICBOOM
	dbw 11, ROLLOUT
	dbw 13, SCREECH
	dbw 16, CHARGE_BEAM
	dbw 20, SWIFT
	dbw 22, WILD_CHARGE
	dbw 26, SELFDESTRUCT
	dbw 29, LIGHT_SCREEN
	dbw 34, SUCKER_PUNCH
	dbw 37, EXPLOSION
	dbw 41, GYRO_BALL
	dbw 46, MIRROR_COAT
	dbw 48, THUNDER
	dbw 52, VOLT_TACKLE
	db 0 ; no more level-up moves

ElectrodeEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, THUNDERBOLT
	dbw 1, THUNDERBOLT
	dbw 1, TACKLE
	dbw 1, THUNDERSHOCK
	dbw 4, SONICBOOM
	dbw 11, ROLLOUT
	dbw 13, SCREECH
	dbw 16, CHARGE_BEAM
	dbw 20, SWIFT
	dbw 22, WILD_CHARGE
	dbw 26, SELFDESTRUCT
	dbw 29, LIGHT_SCREEN
	dbw 36, SUCKER_PUNCH
	dbw 41, EXPLOSION
	dbw 47, GYRO_BALL
	dbw 54, MIRROR_COAT
	dbw 58, THUNDER
	dbw 62, VOLT_TACKLE
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	dbbw EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	dbw 1, BARRAGE
	dbw 1, HYPNOSIS
	dbw 1, ROUND_M
	dbw 1, ABSORB
	dbw 7, REFLECT
	dbw 11, LEECH_SEED
	dbw 17, CONFUSION
	dbw 19, STUN_SPORE
	dbw 21, POISONPOWDER
	dbw 23, SLEEP_POWDER
	dbw 27, BULLET_SEED
	dbw 33, GIGA_DRAIN
	dbw 37, SYNTHESIS
	dbw 43, SOLARBEAM
	dbw 47, EXTRASENSORY
	dbw 50, PSYCHIC_M
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, STOMP
	dbw 1, STOMP
	dbw 1, BARRAGE
	dbw 1, HYPNOSIS
	dbw 1, CONFUSION
	dbw 1, EXTRASENSORY
	dbw 17, PSYBEAM
	dbw 27, EGG_BOMB
	dbw 37, WOOD_HAMMER
	dbw 47, SOLARBEAM
	dbw 57, PSYCHIC_M
	db 0 ; no more level-up moves

CuboneEvosAttacks:
	dbbw EVOLVE_LEVEL, 28, MAROWAK
	db 0 ; no more evolutions
	dbw 1, GROWL
	dbw 3, TAIL_WHIP
	dbw 7, BONE_CLUB
	dbw 11, HEADBUTT
	dbw 13, LEER
	dbw 17, FOCUS_ENERGY
	dbw 21, BONEMERANG
	dbw 23, RAGE
	dbw 27, FALSE_SWIPE
	dbw 31, THRASH
	dbw 33, FAINT_ATTACK
	dbw 37, HIHORSEPOWER
	dbw 41, BRICK_BREAK
	dbw 43, DOUBLE_EDGE
	dbw 47, EARTHQUAKE
	dbw 51, BONE_RUSH
	db 0 ; no more level-up moves

MarowakEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, SWORDS_DANCE
	dbw 1, SWORDS_DANCE
	dbw 1, GROWL
	dbw 3, TAIL_WHIP
	dbw 7, BONE_CLUB
	dbw 11, HEADBUTT
	dbw 13, LEER
	dbw 17, FOCUS_ENERGY
	dbw 21, BONEMERANG
	dbw 23, RAGE
	dbw 27, FALSE_SWIPE
	dbw 33, THRASH
	dbw 37, FAINT_ATTACK
	dbw 43, HIHORSEPOWER
	dbw 49, BRICK_BREAK
	dbw 53, DOUBLE_EDGE
	dbw 59, EARTHQUAKE
	dbw 65, BONE_RUSH
	db 0 ; no more level-up moves

TyrogueEvosAttacks:
	dbbbw EVOLVE_STAT, 20, ATK_LT_DEF, HITMONCHAN
	dbbbw EVOLVE_STAT, 20, ATK_GT_DEF, HITMONLEE
	dbbbw EVOLVE_STAT, 20, ATK_EQ_DEF, HITMONTOP
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, FORESIGHT
	dbw 1, FOCUS_ENERGY
	dbw 1, FAKE_OUT
	db 0 ; no more level-up moves

HitmonleeEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, DOUBLE_KICK
	dbw 1, DOUBLE_KICK
	dbw 5, MEDITATE
	dbw 9, ROLLING_KICK
	dbw 13, JUMP_KICK
	dbw 17, BRICK_BREAK
	dbw 21, FOCUS_ENERGY
	dbw 25, AERIAL_ACE
	dbw 29, HI_JUMP_KICK
	dbw 33, MIND_READER
	dbw 37, FORESIGHT
	dbw 41, DETECT
	dbw 45, BLAZE_KICK
	dbw 49, ENDURE
	dbw 53, MEGA_KICK
	dbw 57, CLOSE_COMBAT
	dbw 61, REVERSAL
	db 0 ; no more level-up moves

HitmonchanEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, MACH_PUNCH
	dbw 1, MACH_PUNCH
	dbw 1, COMET_PUNCH
	dbw 6, AGILITY
	dbw 11, PURSUIT
	dbw 21, AERIAL_ACE
	dbw 26, BULLET_PUNCH
	dbw 31, REVENGE
	dbw 36, THUNDERPUNCH
	dbw 36, ICE_PUNCH
	dbw 36, FIRE_PUNCH
	dbw 41, BRICK_BREAK
	dbw 46, MEGA_PUNCH
	dbw 50, DETECT
	dbw 56, DYNAMICPUNCH
	dbw 61, COUNTER
	dbw 66, CLOSE_COMBAT
	db 0 ; no more level-up moves

HitmontopEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, ROLLING_KICK
	dbw 1, ROLLING_KICK
	dbw 1, TACKLE
	dbw 6, FOCUS_ENERGY
	dbw 10, PURSUIT
	dbw 15, QUICK_ATTACK
	dbw 21, RAPID_SPIN
	dbw 24, DIG
	dbw 28, COUNTER
	dbw 33, TRIPLE_KICK
	dbw 37, AGILITY
	dbw 42, GYRO_BALL
	dbw 46, BULK_UP
	dbw 50, DETECT
	dbw 55, CLOSE_COMBAT
	dbw 60, ROCK_SLIDE
	db 0 ; no more level-up moves

LickitungEvosAttacks:
	dbbw EVOLVE_LEVEL, 33, LICKILICKY
	db 0 ; no more evolutions
	dbw 1, LICK
	dbw 5, SUPERSONIC
	dbw 9, DEFENSE_CURL
	dbw 13, KNOCK_OFF
	dbw 17, WRAP
	dbw 21, STOMP
	dbw 25, DISABLE
	dbw 29, SLAM
	dbw 37, BODY_SLAM
	dbw 41, BELLY_DRUM
	dbw 45, HEAL_BELL
	dbw 49, SCREECH
	dbw 53, POWER_WHIP
	dbw 57, DOUBLE_EDGE
	db 0 ; no more level-up moves

LickilickyEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, ROLLOUT
	dbw 1, ROLLOUT
	dbw 1, LICK
	dbw 5, SUPERSONIC
	dbw 9, DEFENSE_CURL
	dbw 13, KNOCK_OFF
	dbw 17, WRAP
	dbw 21, STOMP
	dbw 25, DISABLE
	dbw 29, SLAM
	dbw 33, ROLLOUT
	dbw 37, BODY_SLAM
	dbw 41, BELLY_DRUM
	dbw 45, HEAL_BELL
	dbw 49, SCREECH
	dbw 53, POWER_WHIP
	dbw 57, DOUBLE_EDGE
	dbw 61, GYRO_BALL
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	dbbw EVOLVE_LEVEL, 35, WEEZING
	db 0 ; no more evolutions
	dbw 1, POISON_GAS
	dbw 1, TACKLE
	dbw 4, SMOG
	dbw 7, SMOKESCREEN
	dbw 12, PAYBACK
	dbw 15, MUD_BOMB
	dbw 18, SLUDGE
	dbw 23, SELFDESTRUCT
	dbw 26, HAZE
	dbw 29, GYRO_BALL
	dbw 34, SLUDGE_BOMB
	dbw 37, EXPLOSION
	dbw 40, DESTINY_BOND
	dbw 42, SLUDGE_WAVE
	dbw 45, BELCH
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, DOUBLE_HIT_M
	dbw 1, DOUBLE_HIT_M
	dbw 1, TOXIC
	dbw 1, POISON_GAS
	dbw 1, TACKLE
	dbw 4, SMOG
	dbw 7, SMOKESCREEN
	dbw 12, PAYBACK
	dbw 15, MUD_BOMB
	dbw 18, SLUDGE
	dbw 23, SELFDESTRUCT
	dbw 26, HAZE
	dbw 29, GYRO_BALL
	dbw 34, SLUDGE_BOMB
	dbw 40, EXPLOSION
	dbw 46, DESTINY_BOND
	dbw 51, SLUDGE_WAVE
	dbw 57, BELCH
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	dbbw EVOLVE_LEVEL, 42, RHYDON
	db 0 ; no more evolutions
	dbw 1, HORN_ATTACK
	dbw 1, TAIL_WHIP
	dbw 5, FURY_ATTACK
	dbw 9, SCARY_FACE
	dbw 13, ROCK_TOMB
	dbw 17, STOMP
	dbw 21, BULLDOZE
	dbw 25, BODY_SLAM
	dbw 29, ROCK_BLAST
	dbw 33, DRILL_RUN
	dbw 37, TAKE_DOWN
	dbw 41, STONE_EDGE
	dbw 45, EARTHQUAKE
	dbw 49, MEGAHORN
	dbw 53, HORN_DRILL
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	dbbw EVOLVE_ITEM, PROTECTOR, RHYPERIOR
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, HAMMER_ARM
	dbw 1, HAMMER_ARM
	dbw 1, HORN_ATTACK
	dbw 1, TAIL_WHIP
	dbw 5, FURY_ATTACK
	dbw 9, SCARY_FACE
	dbw 13, ROCK_TOMB
	dbw 17, STOMP
	dbw 21, BULLDOZE
	dbw 25, BODY_SLAM
	dbw 29, ROCK_BLAST
	dbw 33, DRILL_RUN
	dbw 37, TAKE_DOWN
	dbw 41, STONE_EDGE
	dbw 48, EARTHQUAKE
	dbw 55, MEGAHORN
	dbw 62, HORN_DRILL
	db 0 ; no more level-up moves

RhyperiorEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, HORN_ATTACK
	dbw 1, TAIL_WHIP
	dbw 5, FURY_ATTACK
	dbw 9, SCARY_FACE
	dbw 13, ROCK_TOMB
	dbw 17, STOMP
	dbw 21, BULLDOZE
	dbw 25, BODY_SLAM
	dbw 29, ROCK_BLAST
	dbw 33, DRILL_RUN
	dbw 37, TAKE_DOWN
	dbw 41, STONE_EDGE
	dbw 42, HAMMER_ARM
	dbw 48, EARTHQUAKE
	dbw 55, MEGAHORN
	dbw 62, HORN_DRILL
	dbw 69, ROCK_WRECKER
	db 0 ; no more level-up moves

HappinyEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, CHANSEY
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 1, MINIMIZE
	dbw 1, MIMIC
	dbw 4, DEFENSE_CURL
	dbw 8, SWEET_KISS
	dbw 12, DISARM_VOICE
	dbw 16, SAFEGUARD
	dbw 20, CHARM
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	dbbw EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	dbw 1, DEFENSE_CURL
	dbw 1, POUND
	dbw 5, GROWL
	dbw 5, TAIL_WHIP
	dbw 7, ECHOED_VOICE
	dbw 9, HEAL_BELL
	dbw 12, DOUBLESLAP
	dbw 16, SOFTBOILED
	dbw 20, METRONOME
	dbw 23, MINIMIZE
	dbw 27, TAKE_DOWN
	dbw 31, SING
	dbw 34, CHARM
	dbw 38, HYPER_VOICE
	dbw 42, EGG_BOMB
	dbw 46, LIGHT_SCREEN
	dbw 50, AMNESIA
	dbw 54, DOUBLE_EDGE
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, DEFENSE_CURL
	dbw 1, DEFENSE_CURL
	dbw 1, POUND
	dbw 5, GROWL
	dbw 5, TAIL_WHIP
	dbw 7, ECHOED_VOICE
	dbw 9, HEAL_BELL
	dbw 12, DOUBLESLAP
	dbw 16, SOFTBOILED
	dbw 20, METRONOME
	dbw 23, MINIMIZE
	dbw 27, TAKE_DOWN
	dbw 31, SING
	dbw 34, CHARM
	dbw 39, HYPER_VOICE
	dbw 44, EGG_BOMB
	dbw 50, LIGHT_SCREEN
	dbw 57, AMNESIA
	dbw 65, DOUBLE_EDGE
	db 0 ; no more level-up moves

TangelaEvosAttacks:
	dbbw EVOLVE_LEVEL, 38, TANGROWTH
	db 0 ; no more evolutions
	dbw 1, CONSTRICT
	dbw 4, SLEEP_POWDER
	dbw 7, VINE_WHIP
	dbw 10, ABSORB
	dbw 14, POISONPOWDER
	dbw 17, BIND
	dbw 20, GROWTH
	dbw 23, MEGA_DRAIN
	dbw 27, KNOCK_OFF
	dbw 30, STUN_SPORE
	dbw 33, SYNTHESIS
	dbw 36, GIGA_DRAIN
	dbw 38, ANCIENTPOWER
	dbw 41, SLAM
	dbw 44, SWAGGER
	dbw 46, SWORDS_DANCE
	dbw 48, AMNESIA
	dbw 50, POWER_WHIP
	db 0 ; no more level-up moves

TangrowthEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CONSTRICT
	dbw 4, SLEEP_POWDER
	dbw 7, VINE_WHIP
	dbw 10, ABSORB
	dbw 14, POISONPOWDER
	dbw 17, BIND
	dbw 20, GROWTH
	dbw 23, MEGA_DRAIN
	dbw 27, KNOCK_OFF
	dbw 30, STUN_SPORE
	dbw 33, SYNTHESIS
	dbw 36, GIGA_DRAIN
	dbw 40, POWER_GEM
	dbw 43, SLAM
	dbw 46, ROCK_SLIDE
	dbw 49, SWORDS_DANCE
	dbw 50, AMNESIA
	dbw 53, POWER_WHIP
	dbw 56, STONE_EDGE
	db 0 ; no more level-up moves

KangaskhanEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, COMET_PUNCH
	dbw 1, LEER
	dbw 7, FAKE_OUT
	dbw 10, TAIL_WHIP
	dbw 13, BITE
	dbw 19, DOUBLE_HIT_M
	dbw 22, RAGE
	dbw 25, MEGA_PUNCH
	dbw 31, HEADBUTT
	dbw 34, DIZZY_PUNCH
	dbw 37, CRUNCH
	dbw 43, ENDURE
	dbw 46, OUTRAGE
	dbw 49, SUCKER_PUNCH
	dbw 50, REVERSAL
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	dbbw EVOLVE_LEVEL, 32, SEADRA
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 5, SMOKESCREEN
	dbw 9, LEER
	dbw 13, WATER_GUN
	dbw 17, TWISTER
	dbw 21, BUBBLEBEAM
	dbw 26, FOCUS_ENERGY
	dbw 31, WATER_PULSE
	dbw 36, AGILITY
	dbw 41, DRAGON_PULSE
	dbw 46, DRAGON_DANCE
	dbw 52, HYDRO_PUMP
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	dbbw EVOLVE_ITEM, DRAGON_SCALE, KINGDRA
	db 0 ; no more evolutions
	dbw 1, BUBBLE
	dbw 5, SMOKESCREEN
	dbw 9, LEER
	dbw 13, WATER_GUN
	dbw 17, TWISTER
	dbw 21, BUBBLEBEAM
	dbw 26, FOCUS_ENERGY
	dbw 31, WATER_PULSE
	dbw 38, AGILITY
	dbw 45, DRAGON_PULSE
	dbw 52, DRAGON_DANCE
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, OUTRAGE
	dbw 1, OUTRAGE
	dbw 1, BUBBLE
	dbw 5, SMOKESCREEN
	dbw 9, LEER
	dbw 13, WATER_GUN
	dbw 17, TWISTER
	dbw 21, BUBBLEBEAM
	dbw 26, FOCUS_ENERGY
	dbw 31, WATER_PULSE
	dbw 38, AGILITY
	dbw 45, DRAGON_PULSE
	dbw 52, DRAGON_DANCE
	dbw 60, HYDRO_PUMP
	db 0 ; no more level-up moves

GoldeenEvosAttacks:
	dbbw EVOLVE_LEVEL, 22, SEAKING
	db 0 ; no more evolutions
	dbw 1, PECK
	dbw 1, TAIL_WHIP
	dbw 5, SUPERSONIC
	dbw 8, HORN_ATTACK
	dbw 13, FLAIL
	dbw 16, AQUA_JET
	dbw 21, AQUA_RING
	dbw 24, FURY_ATTACK
	dbw 29, AGILITY
	dbw 32, WATERFALL
	dbw 37, HORN_DRILL
	dbw 40, AQUA_TAIL
	dbw 45, MEGAHORN
	dbw 51, WAVE_CRASH
	db 0 ; no more level-up moves

SeakingEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, POISON_JAB
	dbw 1, POISON_JAB
	dbw 1, PECK
	dbw 1, TAIL_WHIP
	dbw 5, SUPERSONIC
	dbw 8, HORN_ATTACK
	dbw 13, FLAIL
	dbw 16, AQUA_JET
	dbw 21, AQUA_RING
	dbw 26, FURY_ATTACK
	dbw 31, AGILITY
	dbw 35, WATERFALL
	dbw 40, HORN_DRILL
	dbw 46, AQUA_TAIL
	dbw 54, MEGAHORN
	dbw 59, WAVE_CRASH
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	dbbw EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 4, WATER_GUN
	dbw 8, CONFUSE_RAY
	dbw 12, RAPID_SPIN
	dbw 16, MINIMIZE
	dbw 20, SWIFT
	dbw 24, PSYBEAM
	dbw 28, BUBBLEBEAM
	dbw 32, LIGHT_SCREEN
	dbw 36, POWER_GEM
	dbw 40, EXTRASENSORY
	dbw 44, SURF
	dbw 48, RECOVER
	dbw 52, COSMIC_POWER
	dbw 56, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, PSYCHIC_M
	dbw 1, PSYCHIC_M
	dbw 1, TACKLE
	dbw 1, HARDEN
	dbw 1, WATER_GUN
	dbw 1, CONFUSE_RAY
	dbw 1, RAPID_SPIN
	dbw 1, MINIMIZE
	dbw 1, SWIFT
	dbw 1, PSYBEAM
	dbw 1, BUBBLEBEAM
	dbw 1, LIGHT_SCREEN
	dbw 1, POWER_GEM
	dbw 1, SURF
	dbw 1, RECOVER
	dbw 1, COSMIC_POWER
	dbw 1, HYDRO_PUMP
	db 0 ; no more level-up moves

MimeJrEvosAttacks:
	dbbw EVOLVE_LEVEL, 16, MR__MIME
	db 0 ; no more evolutions
	dbw 1, BARRIER
	dbw 1, CONFUSION
	dbw 1, MAGICAL_LEAF
	dbw 8, MEDITATE
	dbw 11, DOUBLESLAP
	dbw 15, MIMIC
	dbw 18, ENCORE
	dbw 22, LIGHT_SCREEN
	dbw 22, REFLECT
	dbw 25, PSYBEAM
	dbw 29, SUBSTITUTE
	dbw 32, DRAININGKISS
	dbw 36, DAZZLINGLEAM
	dbw 39, PSYCHIC_M
	dbw 43, CALM_MIND
	dbw 46, BATON_PASS
	dbw 50, SAFEGUARD
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, CONFUSION
	dbw 1, CONFUSION
	dbw 1, BARRIER
	dbw 1, MAGICAL_LEAF
	dbw 8, MEDITATE
	dbw 11, DOUBLESLAP
	dbw 15, MIMIC
	dbw 15, PSYWAVE
	dbw 18, ENCORE
	dbw 22, LIGHT_SCREEN
	dbw 22, REFLECT
	dbw 25, PSYBEAM
	dbw 29, SUBSTITUTE
	dbw 32, DRAININGKISS
	dbw 36, DAZZLINGLEAM
	dbw 39, PSYCHIC_M
	dbw 43, CALM_MIND
	dbw 46, BATON_PASS
	dbw 50, SAFEGUARD
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	dbbw EVOLVE_ITEM, METAL_COAT, SCIZOR
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 5, FOCUS_ENERGY
	dbw 9, PURSUIT
	dbw 13, FALSE_SWIPE
	dbw 17, AGILITY
	dbw 21, WING_ATTACK
	dbw 25, FURY_CUTTER
	dbw 29, SLASH
	dbw 33, RAZOR_WIND
	dbw 37, DOUBLE_TEAM
	dbw 41, X_SCISSOR
	dbw 45, NIGHT_SLASH
	dbw 49, DOUBLE_HIT_M
	dbw 50, DUALWINGBEAT
	dbw 57, SWORDS_DANCE
	dbw 60, BOUNCE
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, METAL_CLAW
	dbw 1, METAL_CLAW
	dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 5, FOCUS_ENERGY
	dbw 9, PURSUIT
	dbw 13, FALSE_SWIPE
	dbw 17, AGILITY
	dbw 21, METAL_CLAW
	dbw 25, FURY_CUTTER
	dbw 29, SLASH
	dbw 33, RAZOR_WIND
	dbw 37, IRON_DEFENSE
	dbw 41, X_SCISSOR
	dbw 45, NIGHT_SLASH
	dbw 49, DOUBLE_HIT_M
	dbw 50, IRON_HEAD
	dbw 57, SWORDS_DANCE
	dbw 61, DOUBLE_TEAM
	db 0 ; no more level-up moves

SmoochumEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, JYNX
	db 0 ; no more evolutions
	dbw 1, POUND
	dbw 5, LICK
	dbw 8, SWEET_KISS
	dbw 11, POWDER_SNOW
	dbw 15, CONFUSION
	dbw 18, SING
	dbw 21, PSYBEAM
	dbw 25, MEAN_LOOK
	dbw 28, NASTY_PLOT
	dbw 31, PROTECT
	dbw 35, AURORA_BEAM
	dbw 38, PSYCHIC_M
	dbw 45, PERISH_SONG
	dbw 48, BLIZZARD
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, LOVELY_KISS
	dbw 1, LOVELY_KISS
	dbw 1, POUND
	dbw 5, LICK
	dbw 8, LOVELY_KISS
	dbw 11, POWDER_SNOW
	dbw 15, DOUBLESLAP
	dbw 18, ICE_PUNCH
	dbw 21, PSYBEAM
	dbw 25, MEAN_LOOK
	dbw 28, NASTY_PLOT
	dbw 33, BRICK_BREAK
	dbw 39, AVALANCHE
	dbw 44, BODY_SLAM
	dbw 49, PSYCHIC_M
	dbw 55, PERISH_SONG
	dbw 60, BLIZZARD
	db 0 ; no more level-up moves

ElekidEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, ELECTABUZZ
	db 0 ; no more evolutions
	dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 5, THUNDERSHOCK
	dbw 8, LOW_KICK
	dbw 12, SWIFT
	dbw 15, CHARGE_BEAM
	dbw 19, THUNDER_WAVE
	dbw 22, THUNDER_FANG
	dbw 26, LIGHT_SCREEN
	dbw 29, THUNDERPUNCH
	dbw 33, DISCHARGE
	dbw 36, SCREECH
	dbw 40, THUNDERBOLT
	dbw 43, THUNDER
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	dbbw EVOLVE_ITEM, ELECTIRIZER, ELECTIVIRE
	db 0 ; no more evolutions
	dbw LEARN_EVO_MOVE, CROSS_CHOP
	dbw 1, CROSS_CHOP
	dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 1, THUNDERSHOCK
	dbw 8, LOW_KICK
	dbw 12, SWIFT
	dbw 15, SPARK
	dbw 19, THUNDER_WAVE
	dbw 22, CHARGE_BEAM
	dbw 26, LIGHT_SCREEN
	dbw 29, THUNDERPUNCH
	dbw 36, DISCHARGE
	dbw 42, SCREECH
	dbw 49, THUNDERBOLT
	dbw 55, THUNDER
	db 0 ; no more level-up moves

ElectivireEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, CROSS_CHOP
	dbw 1, QUICK_ATTACK
	dbw 1, LEER
	dbw 1, THUNDERSHOCK
	dbw 8, LOW_KICK
	dbw 12, SWIFT
	dbw 15, SPARK
	dbw 19, THUNDER_WAVE
	dbw 22, CHARGE_BEAM
	dbw 26, LIGHT_SCREEN
	dbw 29, THUNDERPUNCH
	dbw 30, CROSS_CHOP
	dbw 36, DISCHARGE
	dbw 42, SCREECH
	dbw 49, THUNDERBOLT
	dbw 55, VOLT_TACKLE
	dbw 62, GIGA_IMPACT
	dbw 65, CLOSE_COMBAT
	db 0 ; no more level-up moves

MagbyEvosAttacks:
	dbbw EVOLVE_LEVEL, 30, MAGMAR
	db 0 ; no more evolutions
	dbw 1, LEER
	dbw 1, SMOG
	dbw 5, EMBER
	dbw 8, SMOKESCREEN
	dbw 12, FAINT_ATTACK
	dbw 15, FIRE_SPIN
	dbw 19, SLUDGE
	dbw 22, FLAME_BURST
	dbw 26, CONFUSE_RAY
	dbw 29, FIRE_PUNCH
	dbw 33, LAVA_PLUME
	dbw 36, SUNNY_DAY
	dbw 40, FLAMETHROWER
	dbw 43, FIRE_BLAST
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	dbbw EVOLVE_ITEM, MAGMARIZER, MAGMORTAR
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	dbw 1, SMOG
	dbw 5, EMBER
	dbw 8, SMOKESCREEN
	dbw 12, FAINT_ATTACK
	dbw 15, FIRE_SPIN
	dbw 19, SLUDGE
	dbw 22, FLAME_BURST
	dbw 26, CONFUSE_RAY
	dbw 29, FIRE_PUNCH
	dbw 36, LAVA_PLUME
	dbw 42, SUNNY_DAY
	dbw 49, FLAMETHROWER
	dbw 55, FIRE_BLAST
	db 0 ; no more level-up moves

MagmortarEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, EMBER
	dbw 1, LEER
	dbw 1, SMOG
	dbw 5, EMBER
	dbw 8, SMOKESCREEN
	dbw 12, FAINT_ATTACK
	dbw 15, FIRE_SPIN
	dbw 19, SLUDGE
	dbw 22, FLAME_BURST
	dbw 26, CONFUSE_RAY
	dbw 29, FIRE_PUNCH
	dbw 36, LAVA_PLUME
	dbw 42, SUNNY_DAY
	dbw 49, FLAMETHROWER
	dbw 55, FIRE_BLAST
if DEF(_FAITHFUL)
	dbw 62, HYPER_BEAM
elif DEF(_NOPSS)
	dbw 62, HYPER_BEAM
else
	dbw 62, BELCH
endc
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	dbw 1, VICEGRIP
	dbw 1, FOCUS_ENERGY
	dbw 4, BIND
	dbw 8, SEISMIC_TOSS
	dbw 11, HARDEN
	dbw 15, REVENGE
	dbw 18, VITAL_THROW
	dbw 22, DOUBLE_HIT_M
	dbw 26, BRICK_BREAK
	dbw 29, X_SCISSOR
	dbw 33, SUBMISSION
	dbw 36, CIRCLE_THROW
	dbw 40, SWORDS_DANCE
	dbw 43, PINCIRFLURRY
	dbw 47, SUPERPOWER
	dbw 50, GUILLOTINE
	db 0 ; no more level-up moves
