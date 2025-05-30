	db 0 ; species ID placeholder

	db  65,  65,  60, 110, 130,  95
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 45 ; catch rate
	db 197 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/espeon/front.dimensions"
	db SYNCHRONIZE, SYNCHRONIZE, MAGIC_BOUNCE ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, IRON_TAIL, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, CALM_MIND, DREAM_EATER, SLEEP_TALK, GIGA_IMPACT, MOONBLAST, HYPNOSIS, GRASS_KNOT
	; end
