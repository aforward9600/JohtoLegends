	db 0 ; species ID placeholder

	db  70,  80,  65,  85,  90,  65
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, PSYCHIC ; type
	db 60 ; catch rate
	db 149 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/girafarig/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SUBSTITUTE, FLASH_CANNON, REST, ATTRACT, THIEF, FOCUS_BLAST, ENERGY_BALL, CALM_MIND, DREAM_EATER, SLEEP_TALK, DARK_PULSE, IRON_HEAD, GIGA_IMPACT, MOONBLAST, HYPNOSIS, GRASS_KNOT
	; end
