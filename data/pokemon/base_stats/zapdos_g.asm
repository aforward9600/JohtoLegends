	db 0 ; species ID placeholder

	db  90, 125,  90, 100,  85,  90
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FLYING ; type
	db 3 ; catch rate
	db 216 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/zapdos_g/front.dimensions"
	db DEFIANT, DEFIANT, DEFIANT ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm ROAR, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, BULLDOZE, RETURN, BRICK_BREAK, ACROBATICS, DOUBLE_TEAM, SANDSTORM, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, REST, STEEL_WING, FLY, ROOST, FOCUS_BLAST, SLEEP_TALK, GIGA_IMPACT, U_TURN
	; end
