	db 0 ; species ID placeholder

	db 100,  05,  05,  30,  15,  65
	evs  1,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 130 ; catch rate
	db 110 ; base exp
	db NO_ITEM, LUCKY_EGG ; items
	db GENDER_F100 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/happiny/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, ICE_BEAM, BLIZZARD, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, BULLDOZE, SOLARBEAM, IRON_TAIL, RETURN, PSYCHIC_M, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, FLAMETHROWER, SANDSTORM, FIRE_BLAST, SUBSTITUTE, REST, ATTRACT, CALM_MIND, SLEEP_TALK, POWERUPPUNCH, ICY_WIND, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, DRAIN_PUNCH, MOONBLAST, GRASS_KNOT
	; end
