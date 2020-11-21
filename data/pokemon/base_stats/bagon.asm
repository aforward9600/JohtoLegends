	db 0 ; species ID placeholder

	db  45,  75,  60,  50,  40,  30
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 60 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 40 ; step cycles to hatch
	INCBIN "gfx/pokemon/bagon/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_DRAGON, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm DRAGON_CLAW, CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, RETURN, BRICK_BREAK, DOUBLE_TEAM, HONE_CLAWS, FLAMETHROWER, FIRE_BLAST, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, SLEEP_TALK, DRAGON_DANCE, DRAGON_PULSE, IRON_HEAD, FIRE_FANG, DRACO_FANG, EXTREMESPEED
	; end
