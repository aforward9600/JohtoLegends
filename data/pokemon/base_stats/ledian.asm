	db 0 ; species ID placeholder

	db  65,  85,  60, 105,  65,  90
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

if DEF(_FAITHFUL)
	db BUG, FLYING ; type
else
	db BUG, FIGHTING ; type
endc
	db 90 ; catch rate
	db 134 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/ledian/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, REFLECT, ACROBATICS, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, ROOST, FOCUS_BLAST, SLEEP_TALK, POWERUPPUNCH, X_SCISSOR, IRON_HEAD, SWORDS_DANCE, POISON_JAB, GIGA_IMPACT, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH, DRAIN_PUNCH, U_TURN
	; end
