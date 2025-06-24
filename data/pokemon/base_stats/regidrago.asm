	db 0 ; species ID placeholder

	db 200, 100,  50,  80, 100,  50
	evs  3,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, DRAGON ; type
	db 3 ; catch rate
	db 217 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 80 ; step cycles to hatch
	INCBIN "gfx/pokemon/regidrago/front.dimensions"
	db DRAGONS_MAW, DRAGONS_MAW, DRAGONS_MAW ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DRAGON_CLAW, SHADOW_CLAW, TOXIC, HIDDEN_POWER, HYPER_BEAM, LIGHT_SCREEN, PROTECT, SAFEGUARD, BULLDOZE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, REFLECT, FLAMETHROWER, FIRE_BLAST, SUBSTITUTE, FLASH_CANNON, REST, FOCUS_BLAST, SLEEP_TALK, DRAGON_DANCE, DRAGON_PULSE, DARK_PULSE, IRON_HEAD, GIGA_IMPACT, FIRE_FANG, THUNDER_FANG, ICE_FANG, DRACO_FANG
	; end
