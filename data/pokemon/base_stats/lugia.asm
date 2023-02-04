	db 0 ; species ID placeholder

	db 106,  90, 130, 110,  90, 154
	evs  0,   0,   0,   0,   0,   3
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, FLYING ; type
	db 30 ; catch rate
	db 220 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 120 ; step cycles to hatch
	INCBIN "gfx/pokemon/lugia/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROAR, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, GIGA_DRAIN, SAFEGUARD, BULLDOZE, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SANDSTORM, AERIAL_ACE, SUBSTITUTE, REST, STEEL_WING, FLY, SURF, ROOST, FOCUS_BLAST, WATERFALL, CALM_MIND, SLEEP_TALK, ICY_WIND, DRAGON_PULSE, IRON_HEAD, GIGA_IMPACT, MOONBLAST
	; end
