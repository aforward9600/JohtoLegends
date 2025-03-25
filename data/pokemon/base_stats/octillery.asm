	db 0 ; species ID placeholder

	db  75, 105,  85,  45, 105,  85
	evs  0,   1,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

if DEF(_FAITHFUL)
	db WATER, WATER ; type
elif DEF(_NOPSS)
	db WATER, WATER ; type
else
	db WATER, STEEL ; type
endc
	db 75 ; catch rate
	db 164 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/octillery/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, RETURN, PSYCHIC_M, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, SUBSTITUTE, FLASH_CANNON, REST, ATTRACT, THIEF, SURF, WATERFALL, FOCUS_BLAST, ENERGY_BALL, SLEEP_TALK, ICY_WIND, DARK_PULSE, DRAGON_PULSE, IRON_HEAD, GIGA_IMPACT, STEEL_SLICE, MOONBLAST
	; end
