CreditsScript:

; Clear the banner.
	db CREDITS_CLEAR

; Pokemon Crystal Version Staff
	db                STAFF, 1

	db CREDITS_WAIT, 8

; Play the credits music.
	db CREDITS_MUSIC

	db CREDITS_WAIT2, 10

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 0 ; Pichu

	db      POKEMON_CRYSTAL, 1
	db  ORIGINAL_DEVELOPERS, 2
	db           GAME_FREAK, 3
	db        CREATURES_INC, 4

	db CREDITS_WAIT, 12

	db          PROGRAMMERS, 0
	db          FERROPEXOLA, 1
	db         CARDBOARDBOX, 2
	db                  AX6, 3
	db                 MAPO, 4

	db CREDITS_WAIT, 12

	db     PROGRAMMING_HELP, 0
	db        MOUNTVESUVIUS, 1
	db            DARK_ZETA, 2
	db             CELADONK, 3
	db            PIACARROT, 4
	db              RAJA239, 5

	db CREDITS_WAIT, 12

	db     PROGRAMMING_HELP, 0
	db                RANGI, 1
	db                IDAIN, 2
	db               KDLPRO, 3
	db            VULCANDTH, 4
	db             TOM_WANG, 5

	db CREDITS_WAIT, 12

	db     PROGRAMMING_HELP, 0
	db           DGAMERS_64, 1 ;DGAMERS_64
	db              VENDILY, 2
	db       CHATTY_CRYSTAL, 3
	db        DRAGON_ARBOCK, 4
	db     VICTORIA_LACROIX, 5

	db CREDITS_WAIT, 12

	db     PROGRAMMING_HELP, 0
	db            AZUREKEYS, 1
	db        DAMIEN_CREDIT, 2
	db           LANDESHERR, 3
	db   GRATE_ORACLE_LEWOT, 4
	db            RODMCOSTA, 5

	db CREDITS_WAIT, 12

	db      POKEMON_SPRITES, 0
	db           KOOLBOYMAN, 1
	db           PRISM_TEAM, 2
	db           SOUPPOTATO, 3
	db                 NUUK, 4

	db CREDITS_WAIT, 12

	db      POKEMON_SPRITES, 0
	db                RANGI, 1
	db           CHAOS_RUSH, 2
	db        BRONZESWAGGER, 3
	db          ADAM_SHAMAN, 4
	db          CYNDERQUILL, 5

	db CREDITS_WAIT, 12

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 1 ; Smoochum

	db      POKEMON_SPRITES, 0
	db              SCMIDNA, 1
	db            SHADOWONE, 2
	db              NUKKIIE, 3
	db        HELIX_CHAMBER, 4
	db         FRENCHORANGE, 5

	db CREDITS_WAIT, 12

	db      POKEMON_SPRITES, 0
	db          LAKEOFDANCE, 1
	db          FERROPEXOLA, 2
	db             FROGTOES, 3
	db       INTERNETGOBLIN, 4
	db         SAGE_CREDITS, 5

	db CREDITS_WAIT, 12

	db      SKARMINI_DESIGN, 0
	db      GRAPHICS_DESIGN, 1
	db          FERROPEXOLA, 2
	db             FROGTOES, 3
	db          RYANS_TRYIN, 4

	db CREDITS_WAIT, 12

	db        POKEMON_ICONS, 0
	db           KOOLBOYMAN, 1
	db           PRISM_TEAM, 2
	db              CHAMBER, 3
	db                 SOLO, 4
	db             LUIGITKO, 5

	db CREDITS_WAIT, 12

	db        POKEMON_ICONS, 0
	db         BLUE_EMERALD, 1
	db               NESLUG, 2
	db      PIKACHU_CREDITS, 3
	db                 RYTA, 4

	db CREDITS_WAIT, 12

	db        POKEMON_ICONS, 0
	db              EEVEEEE, 1
	db       EMI_MONSERRATE, 2
	db                RANGI, 3
	db          FERROPEXOLA, 4

	db CREDITS_WAIT, 12

	db      TRAINER_SPRITES, 0
	db           GAME_FREAK, 1
	db          SIRWHIBBLES, 2
	db                RANGI, 3
	db         MEGAMANOMEGA, 4

	db CREDITS_WAIT, 12

	db      TRAINER_SPRITES, 0
	db        JUSTINNUGGETS, 1
	db            SINDORMAN, 2
	db                 KAGE, 3
	db                TETRA, 4

	db CREDITS_WAIT, 12

	db      TRAINER_SPRITES, 0
	db         FRENCHORANGE, 1
	db          RAMEN_PIXEL, 2
	db               CDRX73, 3
	db          FERROPEXOLA, 4

	db CREDITS_WAIT, 12

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 2 ; Ditto

	db    OVERWORLD_SPRITES, 0
	db           GAME_FREAK, 1
	db          SIRWHIBBLES, 2
	db                RANGI, 3
	db              SEASICK, 4

	db CREDITS_WAIT, 12

	db    OVERWORLD_SPRITES, 0
	db          FERROPEXOLA, 1
	db         MEGAMANOMEGA, 2
	db         FRENCHORANGE, 3
	db             TOM_WANG, 4

	db CREDITS_WAIT, 12

	db   STORY_AND_DIALOGUE, 1
	db          FERROPEXOLA, 2
	db           GAME_FREAK, 3

	db CREDITS_WAIT, 12

	db       TILESET_DESIGN, 0
	db           MAP_DESIGN, 1
	db           GAME_FREAK, 2
	db          FERROPEXOLA, 3
	db                RANGI, 4
	db           PRISM_TEAM, 5

	db CREDITS_WAIT, 12

	db         POKEDEX_TEXT, 1
	db           GAME_FREAK, 2
	db          FERROPEXOLA, 3

	db CREDITS_WAIT, 12

	db      MOVE_ANIMATIONS, 0
	db           GAME_FREAK, 1
	db          METALFLYGON, 2
	db           ELFINHILON, 3

	db CREDITS_WAIT, 12

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 3 ; Igglybuff

	db      MOVE_ANIMATIONS, 0
	db          FERROPEXOLA, 1
	db       CHATTY_CRYSTAL, 2
	db           SOUPPOTATO, 3

	db CREDITS_WAIT, 12

	db         CREDIT_MUSIC, 0
	db           GAME_FREAK, 1
	db         TRITEHEXAGON, 2
	db    MMMMMMMMMMMMMMMMM, 3

	db CREDITS_WAIT, 9

	db         CREDIT_MUSIC, 0
	db                 PIGU, 1
	db                 GACT, 2
	db               DANNYE, 3

	db CREDITS_WAIT, 12

	db         CREDIT_MUSIC, 0
	db            LYRICWULF, 1
	db      CYNTHIACELESTIC, 2
	db        RYANISTHEBOMB, 3

	db CREDITS_WAIT, 12

	db         CREDIT_MUSIC, 0
	db          SHOCKSLAYER, 1
	db            RADIATION, 2

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db           ELFINHILON, 1
	db                  AX6, 2
	db                RANGI, 3
	db         CARDBOARDBOX, 4

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db                 MAPO, 1
	db        MOUNTVESUVIUS, 2
	db            DARK_ZETA, 3
	db             CELADONK, 4

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db           KOOLBOYMAN, 1
	db           PRISM_TEAM, 2
	db       CHATTY_CRYSTAL, 3
	db            PIACARROT, 4

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db                 MSKD, 1
	db                IDAIN, 2
	db               KDLPRO, 3
	db           GAME_FREAK, 4

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db  POKECRYSTAL_DISCORD, 1

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db        JOHTO_DISCORD, 1

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db     ROM_HACKS_REDDIT, 1

	db CREDITS_WAIT, 12

	db       SPECIAL_THANKS, 0
	db        TO_MY_FRIENDS, 1

	db CREDITS_WAIT, 12

	db         PRESENTED_BY, 1
	db          FERROPEXOLA, 2

	db CREDITS_WAIT, 12

	db            COPYRIGHT, 1

	db CREDITS_WAIT, 9

; Display "The End" graphic.
	db CREDITS_THEEND

	db CREDITS_WAIT, 20

	db CREDITS_END
