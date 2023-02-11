	db 0 ; species ID placeholder

	db 120,  95,  65,  80,  95,  80
	evs  3,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, DARK ; type
	db 30 ; catch rate
	db 205 ; base exp
	db CHERRI_BERRY, MAGNET ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/gorotora/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DRAGON_CLAW, CURSE, ROAR, TOXIC, WILD_CHARGE, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, BULLDOZE, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, REST, ATTRACT, THIEF, FOCUS_BLAST, NASTY_PLOT, SLEEP_TALK, DARK_PULSE, IRON_HEAD, GIGA_IMPACT, THUNDER_FANG, FIRE_FANG, DRACO_FANG, VOLT_SWITCH
	; end
