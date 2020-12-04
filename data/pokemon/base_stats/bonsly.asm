	db 0 ; species ID placeholder

	db  50,  80,  95,  10,  10,  45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ROCK ; type
	db 255 ; catch rate
	db 68 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/bonsly/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, BULLDOZE, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, SANDSTORM, ROCK_TOMB, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, THIEF, CALM_MIND, SLEEP_TALK, STONE_EDGE, IRON_HEAD
	; end
