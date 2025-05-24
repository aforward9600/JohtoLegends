	db 0 ; species ID placeholder

	db  65,  80,  90, 115,  80,  70
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 148 ; base exp
	db NO_ITEM, QUICK_CLAW ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/persian/front.dimensions"
	db LIMBER, TECHNICIAN, UNNERVE ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DRAGON_CLAW, CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, NASTY_PLOT, SLEEP_TALK, ICY_WIND, DARK_PULSE, SWORDS_DANCE, POISON_JAB, GIGA_IMPACT, THUNDER_FANG, U_TURN, HYPNOSIS
	; end
