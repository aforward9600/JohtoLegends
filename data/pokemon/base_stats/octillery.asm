	db 0 ; species ID placeholder

	db  75, 105,  85,  45, 105,  85
	;   hp  atk  def  spd  sat  sdf

	db WATER, STEEL ; type
	db 75 ; catch rate
	db 164 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/octillery/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, RETURN, DOUBLE_TEAM, REST, ATTRACT, THIEF, SURF
	; end
