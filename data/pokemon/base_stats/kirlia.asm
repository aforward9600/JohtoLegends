	db 0 ; species ID placeholder

	db  38,  35,  35,  50,  65,  55
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FAIRY ; type
	db 120 ; catch rate
	db 140 ; base exp
	db TWISTEDSPOON, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/kirlia/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, THUNDERBOLT, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SUBSTITUTE, REST, ATTRACT, THIEF, CALM_MIND, DREAM_EATER, SLEEP_TALK, ICY_WIND, WILL_O_WISP, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH, MOONBLAST, HYPNOSIS, GRASS_KNOT
	; end
