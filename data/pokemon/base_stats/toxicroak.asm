	db 0 ; species ID placeholder

	db  83,  106, 65,  85,  86,  65
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db POISON, FIGHTING ; type
	db 75 ; catch rate
	db 181 ; base exp
	db POISON_BARB, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/toxicroak/front.dimensions"
	db INNER_FOCUS, DRY_SKIN, POISON_TOUCH ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, BULLDOZE, EARTHQUAKE, RETURN, DIG, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, SLUDGE_BOMB, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, THIEF, FOCUS_BLAST, SLEEP_TALK, POWERUPPUNCH, STONE_EDGE, X_SCISSOR, ICY_WIND, DARK_PULSE, SWORDS_DANCE, POISON_JAB, VENOSHOCK, GIGA_IMPACT, THUNDERPUNCH, ICE_PUNCH, DRAIN_PUNCH
	; end
