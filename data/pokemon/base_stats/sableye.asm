	db 0 ; species ID placeholder

	db  50,  85, 110,  50,  85, 100
	evs  0,   1,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, GHOST ; type
	db 45 ; catch rate
	db 133 ; base exp
	db NO_ITEM, WIDE_LENS ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/sableye/front.dimensions"
	db PRANKSTER, KEEN_EYE, MAGIC_BOUNCE ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SHADOW_CLAW, HEX, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, HYPER_BEAM, PROTECT, RAIN_DANCE, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, CALM_MIND, DREAM_EATER, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, POWERUPPUNCH, DARK_PULSE, WILL_O_WISP, POISON_JAB, GIGA_IMPACT, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, DRAIN_PUNCH, HYPNOSIS
	; end
