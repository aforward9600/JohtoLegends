	db 0 ; species ID placeholder

	db  80,  85,  95,  25,  30,  30
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, ROCK ; type
	db 120 ; catch rate
	db 135 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/rhyhorn/front.dimensions"
	db ROCK_HEAD, LIGHTNINGROD, RECKLESS ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, PROTECT, BULLDOZE, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, FLAMETHROWER, SANDSTORM, FIRE_BLAST, ROCK_TOMB, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, SURF, SLEEP_TALK, STONE_EDGE, ICY_WIND, DRAGON_DANCE, DRAGON_PULSE, IRON_HEAD, SWORDS_DANCE, POISON_JAB, FIRE_FANG, THUNDER_FANG, ICE_FANG, DRACO_FANG
	; end
