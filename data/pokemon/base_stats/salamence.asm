	db 0 ; species ID placeholder

	db  95, 135,  80, 100, 110,  80
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FLYING ; type
	db 45 ; catch rate
	db 230 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/salamence/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_DRAGON, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm DRAGON_CLAW, CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, BULLDOZE, IRON_TAIL, EARTHQUAKE, RETURN, BRICK_BREAK, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, STEEL_WING, FLY, ROOST, SLEEP_TALK, STONE_EDGE, DRAGON_DANCE, DRAGON_PULSE, IRON_HEAD, GIGA_IMPACT, FIRE_FANG, THUNDER_FANG, DRACO_FANG, EXTREMESPEED
	; end
