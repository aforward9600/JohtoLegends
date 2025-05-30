	db 0 ; species ID placeholder

	db  90, 110,  80,  95, 100,  80
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 75 ; catch rate
	db 213 ; base exp
	db RAWST_BERRY, RAWST_BERRY ; items
	db GENDER_F25 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/arcanine/front.dimensions"
	db INTIMIDATE, FLASH_FIRE, JUSTIFIED ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ROAR, TOXIC, WILD_CHARGE, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, SAFEGUARD, BULLDOZE, SOLARBEAM, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, SLEEP_TALK, DRAGON_DANCE, DRAGON_PULSE, IRON_HEAD, WILL_O_WISP, GIGA_IMPACT, FIRE_FANG, THUNDER_FANG
	; end
