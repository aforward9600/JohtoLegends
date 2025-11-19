	db 0 ; species ID placeholder

	db  80, 110, 100,  75,  60,  75
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db STEEL, STEEL ; type
	db 90 ; catch rate
	db 154 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/perrserker/front.dimensions"
	db BATTLE_ARMOR, TOUGH_CLAWS, STEELY_SPIRIT ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DRAGON_CLAW, SHADOW_CLAW, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, DIG, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, REST, ATTRACT, THIEF, NASTY_PLOT, SLEEP_TALK, X_SCISSOR, DARK_PULSE, IRON_HEAD, SWORDS_DANCE, POISON_JAB, GIGA_IMPACT, THUNDER_FANG, U_TURN
	; end
