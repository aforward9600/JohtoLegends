	db 0 ; species ID placeholder

	db  83,  90,  75, 101,  91,  70
	evs  0,   0,   0,   3,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 172 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/pidgeot/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, RETURN, DOUBLE_TEAM, REFLECT, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, STEEL_WING, FLY, ROOST, SLEEP_TALK, IRON_HEAD, SWORDS_DANCE, GIGA_IMPACT, U_TURN
	; end
