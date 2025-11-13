	db 0 ; species ID placeholder

	db  50, 150,  50, 150, 150,  50
	evs  0,   1,   0,   1,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 3 ; catch rate
	db 215 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/deoxys/front.dimensions"
	db PRESSURE, PRESSURE, PRESSURE ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, SOLARBEAM, THUNDERBOLT, THUNDER, RETURN, PSYCHIC_M, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, ROCK_SLIDE, REST, FOCUS_BLAST, ENERGY_BALL, CALM_MIND, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, POWERUPPUNCH, ICY_WIND, DARK_PULSE, SWORDS_DANCE, POISON_JAB, GIGA_IMPACT, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH, DRAIN_PUNCH, HYPNOSIS, GRASS_KNOT
	; end
