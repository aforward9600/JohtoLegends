	db 0 ; species ID placeholder

	db  60,  65,  75,  90, 110, 120
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FAIRY ; type
	db 45 ; catch rate
	db 136 ; base exp
	db NO_ITEM, LEPPA_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/mr__mime/front.dimensions"
	db SOUNDPROOF, FILTER, TECHNICIAN ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, SOLARBEAM, THUNDERBOLT, THUNDER, RETURN, PSYCHIC_M, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, FOCUS_BLAST, ENERGY_BALL, CALM_MIND, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, POWERUPPUNCH, ICY_WIND, DARK_PULSE, GIGA_IMPACT, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH, DRAIN_PUNCH, MOONBLAST, HYPNOSIS, GRASS_KNOT
	; end
