	db 0 ; species ID placeholder

	db  60,  85,  42,  91,  85,  42
	;   hp  atk  def  spd  sat  sdf

	db DARK, FLYING ; type
	db 30 ; catch rate
	db 107 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/murkrow/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, STEEL_WING, FLY, ROOST, CALM_MIND, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, ICY_WIND, DARK_PULSE, HYPNOSIS
	; end
