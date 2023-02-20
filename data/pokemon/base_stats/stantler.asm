	db 0 ; species ID placeholder

	db  73,  95,  62,  85,  85,  65
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 165 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/stantler/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROAR, TOXIC, WILD_CHARGE, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SOLARBEAM, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SUBSTITUTE, FLASH_CANNON, REST, ATTRACT, THIEF, FOCUS_BLAST, ENERGY_BALL, CALM_MIND, DREAM_EATER, SLEEP_TALK, DARK_PULSE, IRON_HEAD, GIGA_IMPACT, MOONBLAST, HYPNOSIS
	; end
