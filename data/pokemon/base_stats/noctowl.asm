	db 0 ; species ID placeholder

	db 100,  50,  65,  73,  91,  96
	evs  2,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

if DEF(_FAITHFUL)
	db NORMAL, FLYING ; type
else
	db GHOST, FLYING ; type
endc
	db 90 ; catch rate
	db 162 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/noctowl/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, HEX, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, STEEL_WING, FLY, ROOST, CALM_MIND, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, DARK_PULSE, WILL_O_WISP, GIGA_IMPACT, MOONBLAST, HYPNOSIS
	; end
