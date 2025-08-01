	db 0 ; species ID placeholder

	db  60,  95,  50,  30, 145, 130
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GHOST ; type
	db 30 ; catch rate
	db 179 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/cursola/front.dimensions"
	db WEAK_ARMOR, WEAK_ARMOR, PERISH_BODY ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_WATER_3 ; egg groups

	tmhm HEX, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, GIGA_DRAIN, BULLDOZE, EARTHQUAKE, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SANDSTORM, ROCK_TOMB, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, SURF, CALM_MIND, SLEEP_TALK, STONE_EDGE, ICY_WIND, DARK_PULSE, WILL_O_WISP, GIGA_IMPACT, STRENGTH_SAP
	; end
