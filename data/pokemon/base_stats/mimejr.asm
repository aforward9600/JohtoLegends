	db 0 ; species ID placeholder

	db  20,  25,  45,  60,  70,  90
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FAIRY ; type
	db 145 ; catch rate
	db 62 ; base exp
	db NO_ITEM, MYSTERYBERRY ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/mimejr/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, SOLARBEAM, THUNDERBOLT, THUNDER, RETURN, PSYCHIC_M, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, CALM_MIND, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, POWERUPPUNCH, ICY_WIND, DARK_PULSE, PIXIE_PUNCH, DRAIN_PUNCH, MOONBLAST, HYPNOSIS
	; end
