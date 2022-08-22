	db 0 ; species ID placeholder

	db  70, 130, 100,  65,  55,  80
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db BUG, STEEL ; type
	db 25 ; catch rate
	db 215 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/scizor/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, RAIN_DANCE, PROTECT, SAFEGUARD, RETURN, BRICK_BREAK, DOUBLE_TEAM, ACROBATICS, AERIAL_ACE, SANDSTORM, SUBSTITUTE, FLASH_CANNON, REST, ATTRACT, THIEF, STEEL_WING, FLY, ROOST, SLEEP_TALK, X_SCISSOR, IRON_HEAD, SWORDS_DANCE, VENOSHOCK, GIGA_IMPACT, STEEL_SLICE, U_TURN
	; end
