	db 0 ; species ID placeholder

	db  80, 135, 130,  70,  95,  90
	evs  0,   0,   3,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db STEEL, PSYCHIC ; type
	db 3 ; catch rate
	db 210 ; base exp
	db STEEL_DAGGER, METAL_COAT ; items
	db GENDER_UNKNOWN ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/metagross/front.dimensions"
	db CLEAR_BODY, CLEAR_BODY, TOUGH_CLAWS ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, BULLDOZE, EARTHQUAKE, RETURN, PSYCHIC_M, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, SLUDGE_BOMB, SANDSTORM, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, ROCK_SLIDE, REST, FOCUS_BLAST, DREAM_EATER, SLEEP_TALK, POWERUPPUNCH, STONE_EDGE, ICY_WIND, DARK_PULSE, IRON_HEAD, GIGA_IMPACT, THUNDERPUNCH, ICE_PUNCH, STEEL_SLICE, HYPNOSIS, GRASS_KNOT
	; end
