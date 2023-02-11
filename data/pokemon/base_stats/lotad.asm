	db 0 ; species ID placeholder

	db  40,  30,  30,  30,  40,  50
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db WATER, GRASS ; type
	db 255 ; catch rate
	db 74 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/lotad/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, GIGA_DRAIN, SOLARBEAM, RETURN, DOUBLE_TEAM, SUBSTITUTE, REST, ATTRACT, THIEF, SURF, ENERGY_BALL, WATERFALL, SLEEP_TALK, ICY_WIND, STRENGTH_SAP, GRASS_KNOT
	; end
