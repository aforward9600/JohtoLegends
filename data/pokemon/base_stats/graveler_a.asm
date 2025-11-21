	db 0 ; species ID placeholder

	db  55,  95, 115,  35,  45,  45
	evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ELECTRIC ; type
	db 120 ; catch rate
	db 134 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/graveler_a/front.dimensions"
	db STURDY, MAGNET_PULL, GALVANIZE ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, BULLDOZE, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, FLAMETHROWER, SANDSTORM, FIRE_BLAST, ROCK_TOMB, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, SLEEP_TALK, POWERUPPUNCH, STONE_EDGE, IRON_HEAD, FIRE_PUNCH, THUNDERPUNCH, VOLT_SWITCH
	; end
