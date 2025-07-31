	db 0 ; species ID placeholder

	db  70,  70, 115,  60, 130,  90
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, STEEL ; type
	db 30 ; catch rate
	db 241 ; base exp
	db NO_ITEM, METAL_COAT ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/magnezone/front.dimensions"
	db STURDY, MAGNET_PULL, ANALYTIC ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm TOXIC, WILD_CHARGE, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, THUNDERBOLT, THUNDER, RETURN, DOUBLE_TEAM, REFLECT, SANDSTORM, SUBSTITUTE, FLASH_CANNON, REST, SLEEP_TALK, IRON_HEAD, GIGA_IMPACT, STEEL_SLICE, VOLT_SWITCH
	; end
