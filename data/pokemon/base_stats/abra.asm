	db 0 ; species ID placeholder

	db  25,  20,  15,  90, 105,  55
	evs  0,   0,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 200 ; catch rate
	db 73 ; base exp
	db NO_ITEM, TWISTEDSPOON ; items
	db GENDER_F25 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/abra/front.dimensions"
	db SYNCHRONIZE, INNER_FOCUS, MAGIC_GUARD ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, IRON_TAIL, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SUBSTITUTE, REST, ATTRACT, THIEF, ENERGY_BALL, CALM_MIND, DREAM_EATER, SLEEP_TALK, POWERUPPUNCH, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH, DRAIN_PUNCH, HYPNOSIS, GRASS_KNOT
	; end
