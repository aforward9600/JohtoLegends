	db 0 ; species ID placeholder

	db  55,  95,  55, 115,  35,  75
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, POISON ; type
	db 190 ; catch rate
	db 132 ; base exp
	db NO_ITEM, RAZOR_CLAW ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sneasel_h/front.dimensions"
	db INNER_FOCUS, KEEN_EYE, PICKPOCKET ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnest
	tmhm DYNAMICPUNCH, SHADOW_CLAW, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, IRON_TAIL, RETURN, DIG, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, SLUDGE_BOMB, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, FOCUS_BLAST, CALM_MIND, NASTY_PLOT, SLEEP_TALK, POWERUPPUNCH, X_SCISSOR, DARK_PULSE, SWORDS_DANCE, POISON_JAB, VENOSHOCK, GIGA_IMPACT
	; end
