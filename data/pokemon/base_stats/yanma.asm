	db 0 ; species ID placeholder

	db  65,  65,  45,  95,  75,  45
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 75 ; catch rate
	db 147 ; base exp
	db NO_ITEM, WIDE_LENS ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/yanma/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, STEEL_WING, ROOST, ENERGY_BALL, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, X_SCISSOR, SWORDS_DANCE, U_TURN, HYPNOSIS
	; end
