	db 0 ; species ID placeholder

	db  58,  64,  58,  80,  80,  65
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 142 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/quilava/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, WILD_CHARGE, HIDDEN_POWER, SUNNY_DAY, PROTECT, IRON_TAIL, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, SLEEP_TALK, IRON_HEAD, WILL_O_WISP, FIRE_FANG, THUNDER_FANG, DRACO_FANG
	; end
