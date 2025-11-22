	db 0 ; species ID placeholder

	db  50,  85,  55,  90,  65,  65
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC, PSYCHIC ; type
	db 190 ; catch rate
	db 152 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ponyta_g/front.dimensions"
	db RUN_AWAY, IMMUNITY, PIXILATE ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm TOXIC, WILD_CHARGE, HIDDEN_POWER, DAZZLINGLEAM, PROTECT, SAFEGUARD, IRON_TAIL, RETURN, PSYCHIC_M, DOUBLE_TEAM, REFLECT, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, CALM_MIND, DREAM_EATER, SLEEP_TALK, MOONBLAST, HYPNOSIS
	; end
