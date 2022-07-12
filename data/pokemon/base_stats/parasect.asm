	db 0 ; species ID placeholder

	db  90, 105,  90,  40,  80,  90
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db BUG, GRASS ; type
	db 75 ; catch rate
	db 128 ; base exp
	db TINYMUSHROOM, BIG_MUSHROOM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/parasect/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm DRAGON_CLAW, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, PROTECT, GIGA_DRAIN, BULLDOZE, SOLARBEAM, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, REFLECT, SLUDGE_BOMB, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, ENERGY_BALL, NASTY_PLOT, SLEEP_TALK, X_SCISSOR, SWORDS_DANCE, POISON_JAB, VENOSHOCK, GIGA_IMPACT, STRENGTH_SAP, GRASS_KNOT
	; end
