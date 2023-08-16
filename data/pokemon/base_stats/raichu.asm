	db 0 ; species ID placeholder

	db  70,  90,  60, 110,  90,  80
	evs  0,   0,   0,   3,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 75 ; catch rate
	db 122 ; base exp
	db NO_ITEM, LIGHT_BALL ; items
	db GENDER_F50 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/raichu/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, WILD_CHARGE, HIDDEN_POWER, DAZZLINGLEAM, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, BRICK_BREAK, DOUBLE_TEAM, REFLECT, SUBSTITUTE, REST, ATTRACT, THIEF, SURF, FOCUS_BLAST, NASTY_PLOT, SLEEP_TALK, POWERUPPUNCH, GIGA_IMPACT, THUNDER_FANG, THUNDERPUNCH, VOLT_SWITCH, GRASS_KNOT
	; end
