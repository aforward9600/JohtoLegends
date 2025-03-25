	db 0 ; species ID placeholder

	db  80,  90,  70,  70,  90,  70
	evs  0,   1,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

if DEF(_FAITHFUL)
	db BUG, POISON ; type
elif DEF(_NOPSS)
	db BUG, POISON ; type
else
	db BUG, DARK ; type
endc
	db 90 ; catch rate
	db 134 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/ariados/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, BULLDOZE, SOLARBEAM, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SLUDGE_BOMB, SUBSTITUTE, REST, ATTRACT, THIEF, NASTY_PLOT, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, X_SCISSOR, DARK_PULSE, SWORDS_DANCE, POISON_JAB, VENOSHOCK, GIGA_IMPACT, STRENGTH_SAP, U_TURN, MOONBLAST, HYPNOSIS
	; end
