	db 0 ; species ID placeholder

	db  40,  60,  40,  30,  40,  40
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db 255 ; catch rate
	db 54 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/spinarak/front.dimensions"
	db SWARM, INSOMNIA, SNIPER ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DIG, PSYCHIC_M, DOUBLE_TEAM, SLUDGE_BOMB, SUBSTITUTE, REST, ATTRACT, THIEF, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, X_SCISSOR, SWORDS_DANCE, POISON_JAB, VENOSHOCK, STRENGTH_SAP, U_TURN, MOONBLAST, HYPNOSIS
	; end
