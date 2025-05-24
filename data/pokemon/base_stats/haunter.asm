	db 0 ; species ID placeholder

	db  45,  50,  45,  95, 115,  55
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db GHOST, POISON ; type
	db 90 ; catch rate
	db 126 ; base exp
	db NO_ITEM, SPELL_TAG ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/haunter/front.dimensions"
	db LEVITATE, LEVITATE, LEVITATE ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm CURSE, HEX, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, THUNDERBOLT, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SLUDGE_BOMB, SUBSTITUTE, REST, ATTRACT, THIEF, ENERGY_BALL, DREAM_EATER, SLEEP_TALK, ICY_WIND, DARK_PULSE, WILL_O_WISP, POISON_JAB, VENOSHOCK, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH, MOONBLAST, HYPNOSIS
	; end
