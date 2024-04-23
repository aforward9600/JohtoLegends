	db 0 ; species ID placeholder

	db  40,  20,  30,  55,  40,  80
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 255 ; catch rate
	db 54 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/ledyba/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, LIGHT_SCREEN, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, REFLECT, ACROBATICS, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, ROOST, SLEEP_TALK, POWERUPPUNCH, SWORDS_DANCE, POISON_JAB, THUNDERPUNCH, PIXIE_PUNCH, DRAIN_PUNCH, U_TURN
	; end
