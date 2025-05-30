	db 0 ; species ID placeholder

	db  50,  64,  50,  41,  45,  50
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 83 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/larvitar/front.dimensions"
	db GUTS, GUTS, SAND_VEIL ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, BULLDOZE, IRON_TAIL, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, SANDSTORM, ROCK_TOMB, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, SLEEP_TALK, STONE_EDGE, DRAGON_DANCE, DARK_PULSE, IRON_HEAD, FIRE_FANG, THUNDER_FANG, ICE_FANG, DRACO_FANG, EXTREMESPEED
	; end
