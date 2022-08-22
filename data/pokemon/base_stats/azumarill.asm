	db 0 ; species ID placeholder

	db 100, 100,  80,  50,  70,  80
	evs  2,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, FAIRY ; type
	db 75 ; catch rate
	db 153 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/azumarill/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_WATER_1, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, HIDDEN_POWER, ICE_BEAM, BLIZZARD, LIGHT_SCREEN, PROTECT, RAIN_DANCE, BULLDOZE, IRON_TAIL, DIG, RETURN, BRICK_BREAK, DOUBLE_TEAM, SUBSTITUTE, REST, ATTRACT, SURF, FOCUS_BLAST, WATERFALL, SLEEP_TALK, POWERUPPUNCH, ICY_WIND, GIGA_IMPACT, ICE_PUNCH, PIXIE_PUNCH, MOONBLAST, GRASS_KNOT
	; end
