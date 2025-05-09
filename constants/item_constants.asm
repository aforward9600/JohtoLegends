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
	const BADGE_POUCH  ; 61 unused
	const BLACKBELT    ; 62
	const LIFE_ORB     ; 63
	const CHOICE_BAND  ; 65
	const BLACKGLASSES ; 66
	const MACHO_BRACE  ; 67
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


USE_SCRIPT_VAR EQU $00
ITEM_FROM_MEM  EQU $ff

; leftovers from red
SAFARI_BALL    EQU $08 ; MOON_STONE
MOON_STONE_RED EQU $0a ; BURN_HEAL
FULL_HEAL_RED  EQU $34 ; X_SPEED
