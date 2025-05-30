	db 0 ; species ID placeholder

	db  80,  70,  65, 100,  80, 120
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db 60 ; catch rate
	db 205 ; base exp
	db NO_ITEM, POISON_BARB ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/tentacruel/front.dimensions"
	db CLEAR_BODY, LIQUID_OOZE, RAIN_DISH ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_3, EGG_WATER_3 ; egg groups

	; tm/hm learnset
	tmhm HEX, TOXIC, HAIL, HIDDEN_POWER, DAZZLINGLEAM, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, SAFEGUARD, RETURN, DOUBLE_TEAM, SLUDGE_BOMB, SUBSTITUTE, REST, ATTRACT, SURF, WATERFALL, SLEEP_TALK, ICY_WIND, POISON_JAB, VENOSHOCK, GIGA_IMPACT, STRENGTH_SAP
	; end
