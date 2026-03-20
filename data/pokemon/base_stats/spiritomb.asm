	db 0 ; species ID placeholder

	db  50,  92, 108,  35,  92, 108
	evs  0,   0,   1,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db GHOST, DARK ; type
	db 100 ; catch rate
	db 170 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 30 ; step cycles to hatch
	INCBIN "gfx/pokemon/spiritomb/front.dimensions"
	db PRESSURE, PRESSURE, INFILTRATOR ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm HEX, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, ROCK_TOMB, SUBSTITUTE, REST, ATTRACT, THIEF, CALM_MIND, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, ICY_WIND, DARK_PULSE, WILL_O_WISP, GIGA_IMPACT, HYPNOSIS
	; end
