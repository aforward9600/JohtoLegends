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
	const_def
	const NO_TMHM

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
