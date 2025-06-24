	db 0 ; species ID placeholder

	db 110, 160, 110, 100,  80, 110
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 3 ; catch rate
	db 220 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/regigigas/front.dimensions"
	db SLOW_START, SLOW_START, SLOW_START ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, SAFEGUARD, BULLDOZE, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, ROCK_SLIDE, REST, FOCUS_BLAST, SLEEP_TALK, POWERUPPUNCH, STONE_EDGE, ICY_WIND, IRON_HEAD, GIGA_IMPACT, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, DRAIN_PUNCH
	; end
