	db 0 ; species ID placeholder

	db  45,  30,  15,  65,  85,  65
	evs  0,   0,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db ICE, PSYCHIC ; type
	db 150 ; catch rate
	db 87 ; base exp
	db ASPEAR_BERRY, ASPEAR_BERRY ; items
	db GENDER_F100 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/smoochum/front.dimensions"
	db OBLIVIOUS, ICE_BODY, HYDRATION ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, DAZZLINGLEAM, ICE_BEAM, BLIZZARD, LIGHT_SCREEN, PROTECT, RAIN_DANCE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SUBSTITUTE, REST, ATTRACT, THIEF, CALM_MIND, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, ICY_WIND, ICE_PUNCH, PIXIE_PUNCH, MOONBLAST, HYPNOSIS, GRASS_KNOT
	; end
