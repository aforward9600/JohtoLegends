	db 0 ; species ID placeholder

	db  80,  82,  78,  85,  95,  80
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 75 ; catch rate
	db 174 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/golduck/front.dimensions"
	db DAMP, CLOUD_NINE, SWIFT_SWIM ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SHADOW_CLAW, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, IRON_TAIL, RETURN, DIG, PSYCHIC_M, BRICK_BREAK, DOUBLE_TEAM, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, SURF, WATERFALL, FOCUS_BLAST, CALM_MIND, DREAM_EATER, SLEEP_TALK, ICY_WIND, GIGA_IMPACT, ICE_PUNCH, HYPNOSIS
	; end
