	db 0 ; species ID placeholder

	db  85,  50,  95,  80, 120, 115
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FLYING ; type
	db 30 ; catch rate
	db 245 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/togekiss/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_FLYING, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, FLAMETHROWER, FIRE_BLAST, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, REST, ATTRACT, STEEL_WING, FLY, ROOST, FOCUS_BLAST, CALM_MIND, NASTY_PLOT, SLEEP_TALK, GIGA_IMPACT
	; end
