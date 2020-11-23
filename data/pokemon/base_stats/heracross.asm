	db 0 ; species ID placeholder

	db  80, 125,  75,  85,  40,  95
	;   hp  atk  def  spd  sat  sdf

	db BUG, FIGHTING ; type
	db 45 ; catch rate
	db 200 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/heracross/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, BULLDOZE, EARTHQUAKE, RETURN, BRICK_BREAK, DOUBLE_TEAM, ROCK_TOMB, AERIAL_ACE, ROCK_SLIDE, REST, ATTRACT, THIEF, FOCUS_BLAST, SLEEP_TALK, POWERUPPUNCH, STONE_EDGE, X_SCISSOR, IRON_HEAD, SWORDS_DANCE, POISON_JAB, VENOSHOCK, GIGA_IMPACT, THUNDERPUNCH, ICE_PUNCH, DRAIN_PUNCH
	; end
