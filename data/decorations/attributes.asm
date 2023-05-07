decoration: MACRO
	; type, name, command, event flag, tile/sprite
	db \1, \2, \3
	dw \4
	db \5
ENDM

DecorationAttributes:
; entries correspond to deco constants
	decoration DECO_PLANT,   $00,            $0,                EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,       $00
	decoration DECO_PLANT,   PUT_IT_AWAY,    PUT_AWAY_BED,      EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,       $00
	decoration DECO_BED,     FEATHERY_BED,   SET_UP_BED,        EVENT_DECO_BED_1,                $1b
	decoration DECO_BED,     PINK_BED,       SET_UP_BED,        EVENT_DECO_BED_2,                $1c
	decoration DECO_BED,     POLKADOT_BED,   SET_UP_BED,        EVENT_DECO_BED_3,                $1d
	decoration DECO_BED,     PIKACHU_BED,    SET_UP_BED,        EVENT_DECO_BED_4,                $1e
	decoration DECO_PLANT,   PUT_IT_AWAY,    PUT_AWAY_CARPET,   EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,       $00
	decoration DECO_CARPET,  RED_CARPET,     SET_UP_CARPET,     EVENT_DECO_CARPET_1,             $08
	decoration DECO_CARPET,  BLUE_CARPET,    SET_UP_CARPET,     EVENT_DECO_CARPET_2,             $0b
	decoration DECO_CARPET,  YELLOW_CARPET,  SET_UP_CARPET,     EVENT_DECO_CARPET_3,             $0e
	decoration DECO_CARPET,  GREEN_CARPET,   SET_UP_CARPET,     EVENT_DECO_CARPET_4,             $11
	decoration DECO_PLANT,   PUT_IT_AWAY,    PUT_AWAY_PLANT,    EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,       $00
	decoration DECO_PLANT,   MAGNAPLANT,     SET_UP_PLANT,      EVENT_DECO_PLANT_1,              $20
	decoration DECO_PLANT,   TROPICPLANT,    SET_UP_PLANT,      EVENT_DECO_PLANT_2,              $21
	decoration DECO_PLANT,   JUMBOPLANT,     SET_UP_PLANT,      EVENT_DECO_PLANT_3,              $22
	decoration DECO_PLANT,   PUT_IT_AWAY,    PUT_AWAY_POSTER,   EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,       $00
	decoration DECO_PLANT,   TOWN_MAP_D,     SET_UP_POSTER,     EVENT_DECO_PLANT_4,              $1f
	decoration DECO_POSTER,  4,              SET_UP_POSTER,     EVENT_DECO_POSTER_1,             $23
	decoration DECO_POSTER,  5,              SET_UP_POSTER,     EVENT_DECO_POSTER_2,             $24
	decoration DECO_POSTER,  6,              SET_UP_POSTER,     EVENT_DECO_POSTER_3,             $25
	decoration DECO_PLANT,   PUT_IT_AWAY,    PUT_AWAY_CONSOLE,  EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,       $00
	decoration DECO_PLANT,   FAMICOM,        SET_UP_CONSOLE,    EVENT_DECO_FAMICOM,              SPRITE_FAMICOM
	decoration DECO_PLANT,   SUPER_NES,      SET_UP_CONSOLE,    EVENT_DECO_SNES,                 SPRITE_SNES
	decoration DECO_PLANT,   NINTENDO_64,    SET_UP_CONSOLE,    EVENT_DECO_N64,                  SPRITE_N64
	decoration DECO_PLANT,   VIRTUAL_BOY,    SET_UP_CONSOLE,    EVENT_DECO_VIRTUAL_BOY,          SPRITE_VIRTUAL_BOY
	decoration DECO_PLANT,   PUT_IT_AWAY,    PUT_AWAY_BIG_DOLL, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,       $00
	decoration DECO_BIGDOLL, 21,             SET_UP_BIG_DOLL,   EVENT_DECO_BIG_SNORLAX_DOLL,     SPRITE_BIG_SNORLAX
	decoration DECO_BIGDOLL, 16,             SET_UP_BIG_DOLL,   EVENT_DECO_BIG_ONIX_DOLL,        SPRITE_BIG_ONIX
	decoration DECO_BIGDOLL, 20,             SET_UP_BIG_DOLL,   EVENT_DECO_BIG_LAPRAS_DOLL,      SPRITE_BIG_LAPRAS
	decoration DECO_BIGDOLL, 25,             SET_UP_BIG_DOLL,   EVENT_DECO_BIG_SALAMENCE_DOLL,   SPRITE_BIG_SALAMENCE
	decoration DECO_PLANT,   PUT_IT_AWAY,    PUT_AWAY_DOLL,     EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1,       $00
	decoration DECO_DOLL,    4,              SET_UP_DOLL,       EVENT_DECO_PIKACHU_DOLL,         SPRITE_PIKACHU
	decoration DECO_PLANT,   SURF_PIKA_DOLL, SET_UP_DOLL,       EVENT_DECO_SURFING_PIKACHU_DOLL, SPRITE_SURFING_PIKACHU
	decoration DECO_DOLL,    5,              SET_UP_DOLL,       EVENT_DECO_CLEFAIRY_DOLL,        SPRITE_CLEFAIRY
	decoration DECO_DOLL,    6,              SET_UP_DOLL,       EVENT_DECO_JIGGLYPUFF_DOLL,      SPRITE_JIGGLYPUFF
	decoration DECO_DOLL,    0,              SET_UP_DOLL,       EVENT_DECO_BULBASAUR_DOLL,       SPRITE_BULBASAUR_STILL
	decoration DECO_DOLL,    1,              SET_UP_DOLL,       EVENT_DECO_CHARMANDER_DOLL,      SPRITE_CHARMANDER
	decoration DECO_DOLL,    2,              SET_UP_DOLL,       EVENT_DECO_SQUIRTLE_DOLL,        SPRITE_SQUIRTLE_STILL
	decoration DECO_DOLL,    9,              SET_UP_DOLL,       EVENT_DECO_POLIWAG_DOLL,         SPRITE_POLIWAG
	decoration DECO_DOLL,    8,              SET_UP_DOLL,       EVENT_DECO_DIGLETT_DOLL,         SPRITE_DIGLETT_STILL
	decoration DECO_DOLL,    18,             SET_UP_DOLL,       EVENT_DECO_STARMIE_DOLL,         SPRITE_STARMIE_STILL
	decoration DECO_DOLL,    19,             SET_UP_DOLL,       EVENT_DECO_MAGIKARP_DOLL,        SPRITE_MAGIKARP
	decoration DECO_DOLL,    7,              SET_UP_DOLL,       EVENT_DECO_KOTORA_DOLL,          SPRITE_KOTORA
	decoration DECO_DOLL,    15,             SET_UP_DOLL,       EVENT_DECO_GENGAR_DOLL,          SPRITE_GENGAR
	decoration DECO_DOLL,    14,             SET_UP_DOLL,       EVENT_DECO_CYNDAQUIL_DOLL,       SPRITE_CYNDAQUIL
	decoration DECO_DOLL,    13,             SET_UP_DOLL,       EVENT_DECO_SWABLU_DOLL,          SPRITE_SWABLU_STILL
	decoration DECO_DOLL,    17,             SET_UP_DOLL,       EVENT_DECO_LOTAD_DOLL,           SPRITE_LOTAD_STILL
	decoration DECO_DOLL,    3,              SET_UP_DOLL,       EVENT_DECO_CHIKORITA_DOLL,       SPRITE_CHIKORITA_STILL
	decoration DECO_DOLL,    22,             SET_UP_DOLL,       EVENT_DECO_UNOWN_DOLL,           SPRITE_UNOWN
	decoration DECO_DOLL,    12,             SET_UP_DOLL,       EVENT_DECO_SKARMINI_DOLL,        SPRITE_SKARMINI
	decoration DECO_DOLL,    10,             SET_UP_DOLL,       EVENT_DECO_TOTODILE_DOLL,        SPRITE_TOTODILE_STILL
	decoration DECO_DOLL,    11,             SET_UP_DOLL,       EVENT_DECO_RATTATA_DOLL,         SPRITE_RATTATA_STILL
	decoration DECO_DOLL,    23,             SET_UP_DOLL,       EVENT_DECO_DRATINI_DOLL,         SPRITE_DRATINI_STILL
	decoration DECO_DOLL,    24,             SET_UP_DOLL,       EVENT_DECO_LARVITAR_DOLL,        SPRITE_LARVITAR_STILL
	decoration DECO_PLANT,   GOLD_TROPHY,    SET_UP_DOLL,       EVENT_DECO_GOLD_TROPHY,          SPRITE_GOLD_TROPHY
	decoration DECO_PLANT,   SILVER_TROPHY,  SET_UP_DOLL,       EVENT_DECO_SILVER_TROPHY,        SPRITE_SILVER_TROPHY

DecorationAttributePokemonNames:
	dw BULBASAUR  ;  0
	dw CHARMANDER ;  1
	dw SQUIRTLE   ;  2
	dw CHIKORITA  ;  3
	dw PIKACHU    ;  4
	dw CLEFAIRY   ;  5
	dw JIGGLYPUFF ;  6
	dw KOTORA     ;  7
	dw DIGLETT    ;  8
	dw POLIWAG    ;  9
	dw TOTODILE   ; 10
	dw RATTATA    ; 11
	dw SKARMINI   ; 12
	dw SWABLU     ; 13
	dw CYNDAQUIL  ; 14
	dw GENGAR     ; 15
	dw ONIX       ; 16
	dw LOTAD      ; 17
	dw STARMIE    ; 18
	dw MAGIKARP   ; 19
	dw LAPRAS     ; 20
	dw SNORLAX    ; 21
	dw UNOWN      ; 22
	dw DRATINI    ; 23
	dw LARVITAR   ; 24
	dw SALAMENCE
