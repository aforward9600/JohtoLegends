	db 0 ; species ID placeholder

	db  80, 100,  50, 200, 100,  50
	evs  0,   0,   0,   3,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 3 ; catch rate
	db 216 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/regieleki/front.dimensions"
	db TRANSISTOR, TRANSISTOR, TRANSISTOR ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm TOXIC, WILD_CHARGE, HIDDEN_POWER, DAZZLINGLEAM, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, BULLDOZE, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, REFLECT, ACROBATICS, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, REST, FOCUS_BLAST, SLEEP_TALK, GIGA_IMPACT, VOLT_SWITCH
	; end
