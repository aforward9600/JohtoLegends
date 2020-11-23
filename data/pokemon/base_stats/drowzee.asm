	db 0 ; species ID placeholder

	db  60,  48,  45,  42,  43,  90
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 190 ; catch rate
	db 102 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/drowzee/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, HEX, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, PROTECT, RAIN_DANCE, RETURN, PSYCHIC_M, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, SUBSTITUTE, REST, ATTRACT, CALM_MIND, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, POWERUPPUNCH, POISON_JAB, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH, DRAIN_PUNCH, MOONBLAST, HYPNOSIS
	; end
