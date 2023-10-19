	db 0 ; species ID placeholder

	db  68,  65,  65,  80, 125, 115
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FAIRY ; type
	db 45 ; catch rate
	db 208 ; base exp
	db TWISTEDSPOON, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/gardevoir/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, THUNDERBOLT, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SUBSTITUTE, REST, ATTRACT, THIEF, FOCUS_BLAST, ENERGY_BALL, CALM_MIND, DREAM_EATER, SLEEP_TALK, ICY_WIND, DARK_PULSE, WILL_O_WISP, GIGA_IMPACT, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH, MOONBLAST, HYPNOSIS, GRASS_KNOT
	; end
