	db 0 ; species ID placeholder

	db 115, 140, 130,  40,  55,  55
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, ROCK ; type
	db 30 ; catch rate
	db 241 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/rhyperior/front.dimensions"
	db SOLID_ROCK, LIGHTNINGROD, RECKLESS ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, SHADOW_CLAW, ROAR, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, BULLDOZE, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, FLAMETHROWER, SANDSTORM, FIRE_BLAST, ROCK_TOMB, SUBSTITUTE, FLASH_CANNON, ROCK_SLIDE, REST, ATTRACT, SURF, FOCUS_BLAST, SLEEP_TALK, POWERUPPUNCH, STONE_EDGE, ICY_WIND, DRAGON_DANCE, DRAGON_PULSE, IRON_HEAD, SWORDS_DANCE, POISON_JAB, GIGA_IMPACT, FIRE_FANG, THUNDER_FANG, ICE_FANG, DRACO_FANG, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH
	; end
