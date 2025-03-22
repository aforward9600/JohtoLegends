; item ids
; indexes for:
; - ItemNames (see data/items/names.asm)
; - ItemDescriptions (see data/items/descriptions.asm)
; - ItemAttributes (see data/items/attributes.asm)
; - ItemEffects (see engine/items/item_effects.asm)
	const_def
	const NO_ITEM      ; 00
	const MASTER_BALL  ; 01
	const ULTRA_BALL   ; 02
	const BRIGHTPOWDER ; 03
	const GREAT_BALL   ; 04
	const POKE_BALL    ; 05
	const BICYCLE      ; 07
	const MOON_STONE   ; 08
	const ANTIDOTE     ; 09
	const BURN_HEAL    ; 0a
	const ICE_HEAL     ; 0b
	const AWAKENING    ; 0c
	const PARLYZ_HEAL  ; 0d
	const FULL_RESTORE ; 0e
	const MAX_POTION   ; 0f
	const HYPER_POTION ; 10
	const SUPER_POTION ; 11
	const POTION       ; 12
	const ESCAPE_ROPE  ; 13
	const REPEL        ; 14
	const MAX_ELIXER   ; 15
	const FIRE_STONE   ; 16
	const THUNDERSTONE ; 17
	const WATER_STONE  ; 18
	const HP_UP        ; 1a
	const PROTEIN      ; 1b
	const IRON         ; 1c
	const CARBOS       ; 1d
	const LUCKY_PUNCH  ; 1e
	const CALCIUM      ; 1f
	const RARE_CANDY   ; 20
	const X_ACCURACY   ; 21
	const LEAF_STONE   ; 22
	const METAL_POWDER ; 23
	const NUGGET       ; 24
	const POKE_DOLL    ; 25
	const FULL_HEAL    ; 26
	const REVIVE       ; 27
	const MAX_REVIVE   ; 28
	const GUARD_SPEC   ; 29
	const SUPER_REPEL  ; 2a
	const MAX_REPEL    ; 2b
	const DIRE_HIT     ; 2c
	const FRESH_WATER  ; 2e
	const SODA_POP     ; 2f
	const LEMONADE     ; 30
	const X_ATTACK     ; 31
	const X_DEFEND     ; 33
	const X_SPEED      ; 34
	const X_SPECIAL    ; 35
	const COIN_CASE    ; 36
	const ITEMFINDER   ; 37
	const EXP_SHARE    ; 39
	const OLD_ROD      ; 3a
	const GOOD_ROD     ; 3b
	const SILVER_LEAF  ; 3c unused
	const SUPER_ROD    ; 3d
	const PP_UP        ; 3e
	const ETHER        ; 3f
	const MAX_ETHER    ; 40
	const ELIXER       ; 41
	const WIDE_LENS    ; 43
	const CHOICE_SPECS ; 44
	const FOCUS_SASH   ; 45
	const CLEAR_BELL   ; 46
	const SILVER_WING  ; 47
	const MOOMOO_MILK  ; 48
	const QUICK_CLAW   ; 49
	const PECHA_BERRY  ; 4a
	const GOLD_LEAF    ; 4b unused
	const SOFT_SAND    ; 4c
	const SHARP_BEAK   ; 4d
	const CHERRI_BERRY ; 4e
	const ASPEAR_BERRY ; 4f
	const RAWST_BERRY  ; 50
	const POISON_BARB  ; 51
	const KINGS_ROCK   ; 52
	const PERSIM_BERRY ; 53
	const CHESTO_BERRY ; 54
	const DAWN_STONE   ; 55
	const TINYMUSHROOM ; 56
	const BIG_MUSHROOM ; 57
	const SILVERPOWDER ; 58
	const OLD_AMBER    ; 59
	const AMULET_COIN  ; 5b
	const HELIX_FOSSIL ; 5c
	const DOME_FOSSIL  ; 5d
	const CLEANSE_TAG  ; 5e
	const MYSTIC_WATER ; 5f
	const TWISTEDSPOON ; 60
	const BADGE_POUCH  ; 61
	const BLACKBELT    ; 62
	const LIFE_ORB     ; 63
	const CHOICE_BAND  ; 65
	const BLACKGLASSES ; 66
	const SLOWPOKETAIL ; 67 unused
	const PINK_BOW     ; 68
	const STICK        ; 69
	const SMOKE_BALL   ; 6a
	const NEVERMELTICE ; 6b
	const MAGNET       ; 6c
	const LUM_BERRY    ; 6d
	const PEARL        ; 6e
	const BIG_PEARL    ; 6f
	const EVERSTONE    ; 70
	const SPELL_TAG    ; 71
	const RAGECANDYBAR ; 72
	const GS_BALL      ; 73
	const DUSK_BALL    ; 74
	const MIRACLE_SEED ; 75
	const THICK_CLUB   ; 76
	const FOCUS_BAND   ; 77
	const ENERGYPOWDER ; 79
	const ENERGY_ROOT  ; 7a
	const HEAL_POWDER  ; 7b
	const REVIVAL_HERB ; 7c
	const HARD_STONE   ; 7d
	const LUCKY_EGG    ; 7e
	const BATTLE_CARD  ; 7f
	const STRANGE_HAIR ; 80
	const POWER_BAND   ; 81 unused
	const CHOICE_SCARF ; 82
	const STARDUST     ; 83
	const STAR_PIECE   ; 84
	const SPECIALSPECS ; 85 unused
	const CHARCOAL     ; 8a
	const BERRY_JUICE  ; 8b
	const SCOPE_LENS   ; 8c
	const METAL_COAT   ; 8f
	const DRAGON_FANG  ; 90
	const LEFTOVERS    ; 92
	const LEPPA_BERRY  ; 96
	const DRAGON_SCALE ; 97
	const BERSERK_GENE ; 98
	const SACRED_ASH   ; 9c
	const HEAVY_BALL   ; 9d
	const FLOWER_MAIL  ; 9e unused
	const LEVEL_BALL   ; 9f
	const LURE_BALL    ; a0
	const FAST_BALL    ; a1
	const LIGHT_BALL   ; a3
	const FRIEND_BALL  ; a4
	const MOON_BALL    ; a5
	const LOVE_BALL    ; a6
	const ZINC         ; a7
	const SOOTHE_BELL  ; a8
	const SUN_STONE    ; a9
	const POLKADOT_BOW ; aa
	const UP_GRADE     ; ac
	const ORAN_BERRY   ; ad
	const SITRUS_BERRY ; ae
	const FLAME_DOWN   ; af
	const PARK_BALL    ; b1
	const RAINBOW_WING ; b2
	const DUSK_STONE   ; be
	const ICE_STONE    ; bf
	const SHINY_STONE  ; c0
	const DUBIOUSDISK  ; c1
	const LINK_CABLE   ; c2
	const ELECTIRIZER  ; c3
	const MAGMARIZER   ; c4
	const RAZOR_CLAW   ; c5
	const RAZOR_FANG   ; c6
	const PROTECTOR    ; c7
	const STEEL_DAGGER ; c8
	const ROYAL_ROCK   ; c9
	const SCYTHER_CALL ; ca
	const GOLEM_CALL   ; cb
	const VOLTORB_CALL ; cc
	const MACHAMP_CALL ; cd
	const SNUBBULLCALL ; ce
	const LAPRAS_CALLA ; cf
	const LAPRAS_CALLB ; d0 unused
	const LAPRAS_CALLC ; d1 unused
	const PIDGEOT_CALL ; d2
	const EVIOLITE     ; d3
	const POMEG_BERRY  ; d4
	const KELPSY_BERRY ; d5
	const QUALOT_BERRY ; d6
	const HONDEW_BERRY ; d7
	const EON_MAIL     ; d8
	const CANDY_POUCH  ; d9
	const GREPA_BERRY  ; da
	const TAMATO_BERRY ; db
	const MIRAGE_MAIL  ; dc unused

add_tm: MACRO
if !DEF(TM01)
TM01 EQU const_value
	enum_start 1
endc
	define _\@_1, "TM_\1"
	const _\@_1
	enum \1_TMNUM
ENDM

; see data/moves/tmhm_moves.asm for moves
	add_tm DYNAMICPUNCH ; c2
	add_tm DRAGON_CLAW  ; c3
	add_tm CURSE        ; c4
	add_tm HEX	        ; c5
	add_tm ROAR         ; c6
	add_tm TOXIC        ; c7
	add_tm HAIL		    ; c8
	add_tm BULK_UP	    ; c9
	add_tm WILD_CHARGE  ; ca
	add_tm HIDDEN_POWER ; cb
	add_tm SUNNY_DAY    ; cc
	add_tm DAZZLINGLEAM ; cd
	add_tm ICE_BEAM     ; ce
	add_tm BLIZZARD     ; cf
	add_tm HYPER_BEAM   ; d0
	add_tm LIGHT_SCREEN ; d1
	add_tm PROTECT      ; d2
	add_tm RAIN_DANCE   ; d3
	add_tm GIGA_DRAIN   ; d4
	add_tm SAFEGUARD    ; d5
	add_tm BULLDOZE	    ; d6
	add_tm SOLARBEAM    ; d7
	add_tm IRON_TAIL    ; d8
	add_tm THUNDERBOLT  ; d9
	add_tm THUNDER      ; da
	add_tm EARTHQUAKE   ; db
	add_tm RETURN       ; dc
	add_tm DIG          ; dd
	add_tm PSYCHIC_M    ; de
	add_tm SHADOW_BALL  ; df
	add_tm BRICK_BREAK  ; e0
	add_tm DOUBLE_TEAM  ; e1
	add_tm REFLECT      ; e2
	add_tm ACROBATICS   ; e3
	add_tm FLAMETHROWER ; e4
	add_tm SLUDGE_BOMB  ; e5
	add_tm SANDSTORM    ; e6
	add_tm FIRE_BLAST   ; e7
	add_tm ROCK_TOMB    ; e8
	add_tm AERIAL_ACE   ; e9
	add_tm SUBSTITUTE   ; ea
	add_tm FLASH_CANNON ; fb
	add_tm ROCK_SLIDE   ; fc
	add_tm REST         ; ed
	add_tm ATTRACT      ; ee
	add_tm THIEF        ; ef
	add_tm STEEL_WING   ; f0
	add_tm FLY          ; f1
	add_tm SURF         ; f2
	add_tm ROOST	    ; f3
	add_tm FOCUS_BLAST
	add_tm ENERGY_BALL
	add_tm WATERFALL
	add_tm CALM_MIND
	add_tm NASTY_PLOT
	add_tm DREAM_EATER
	add_tm SLEEP_TALK
	add_tm POWERUPPUNCH
	add_tm STONE_EDGE
	add_tm X_SCISSOR
	add_tm ICY_WIND
	add_tm DRAGON_DANCE
	add_tm DARK_PULSE
	add_tm DRAGON_PULSE
	add_tm IRON_HEAD
	add_tm SWORDS_DANCE
	add_tm WILL_O_WISP
	add_tm POISON_JAB
	add_tm VENOSHOCK
	add_tm GIGA_IMPACT
NUM_TMS EQU const_value - TM01

add_hm: MACRO
if !DEF(HM01)
HM01 EQU const_value
endc
	define _\@_1, "HM_\1"
	const _\@_1
	enum \1_TMNUM
ENDM

	add_hm CUT          ; f4
NUM_HMS EQU const_value - HM01

add_mt: MACRO
	enum \1_TMNUM
ENDM

	add_mt FIRE_FANG
	add_mt THUNDER_FANG
	add_mt ICE_FANG
	add_mt DRACO_FANG
	add_mt FIRE_PUNCH
	add_mt THUNDERPUNCH
	add_mt ICE_PUNCH
	add_mt PIXIE_PUNCH
	add_mt DRAIN_PUNCH
	add_mt STEEL_SLICE
	add_mt EXTREMESPEED
	add_mt STRENGTH_SAP
	add_mt U_TURN
	add_mt VOLT_SWITCH
	add_mt MOONBLAST
	add_mt HYPNOSIS
	add_mt GRASS_KNOT
NUM_TM_HM_TUTOR EQU __enum__ + -1

USE_SCRIPT_VAR EQU $00
ITEM_FROM_MEM  EQU $ff

; leftovers from red
SAFARI_BALL    EQU $08 ; MOON_STONE
MOON_STONE_RED EQU $0a ; BURN_HEAL
FULL_HEAL_RED  EQU $34 ; X_SPEED
