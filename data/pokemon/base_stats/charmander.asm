	db 0 ; species ID placeholder

	db  39,  52,  43,  65,  60,  50
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 65 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/charmander/front.dimensions"
	db BLAZE, BLAZE, SOLAR_POWER ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, DRAGON_CLAW, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, IRON_TAIL, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, ACROBATICS, FLAMETHROWER, FIRE_BLAST, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, NASTY_PLOT, SLEEP_TALK, POWERUPPUNCH, DRAGON_DANCE, DRAGON_PULSE, SWORDS_DANCE, WILL_O_WISP, FIRE_FANG, DRACO_FANG, FIRE_PUNCH, THUNDERPUNCH
	; end
