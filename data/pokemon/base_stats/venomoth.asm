	db 0 ; species ID placeholder

	db  75,  70,  65, 100, 100,  80
	evs  0,   0,   0,   1,   1,   0
	;   hp  atk  def  spd  sat  sdf

if DEF(_FAITHFUL)
	db BUG, POISON ; type
else
	db BUG, PSYCHIC ; type
endc
	db 75 ; catch rate
	db 138 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/venomoth/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, HEX, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, ACROBATICS, SLUDGE_BOMB, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, STEEL_WING, ROOST, FOCUS_BLAST, ENERGY_BALL, CALM_MIND, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, X_SCISSOR, DARK_PULSE, VENOSHOCK, GIGA_IMPACT, U_TURN, MOONBLAST, HYPNOSIS
	; end
