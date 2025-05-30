	db 0 ; species ID placeholder

	db  28,  25,  25,  40,  45,  35
	evs  0,   0,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FAIRY ; type
	db 235 ; catch rate
	db 70 ; base exp
	db TWISTEDSPOON, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ralts/front.dimensions"
	db SYNCHRONIZE, TRACE, PIXILATE ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, THUNDERBOLT, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SUBSTITUTE, REST, ATTRACT, THIEF, CALM_MIND, DREAM_EATER, SLEEP_TALK, ICY_WIND, WILL_O_WISP, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH, MOONBLAST, HYPNOSIS, GRASS_KNOT
	; end
