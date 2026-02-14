	db 0 ; species ID placeholder

	db  80, 130,  60, 120,  40,  80
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, POISON ; type
	db 20 ; catch rate
	db 179 ; base exp
	db NO_ITEM, RAZOR_CLAW ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sneasler/front.dimensions"
	db PRESSURE, UNBURDEN, POISON_TOUCH ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnest
	tmhm DYNAMICPUNCH, SHADOW_CLAW, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, IRON_TAIL, RETURN, DIG, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, ACROBATICS, SLUDGE_BOMB, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, THIEF, FOCUS_BLAST, CALM_MIND, NASTY_PLOT, SLEEP_TALK, POWERUPPUNCH, X_SCISSOR, DARK_PULSE, SWORDS_DANCE, POISON_JAB, VENOSHOCK, GIGA_IMPACT, FIRE_PUNCH, U_TURN
	; end
