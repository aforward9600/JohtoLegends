	db 0 ; species ID placeholder

	db  80, 105,  65, 130,  60,  75
	evs  0,   0,   0,   2,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, FLYING ; type
	db 45 ; catch rate
	db 202 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/aerodactyl/front.dimensions"
	db ROCK_HEAD, PRESSURE, UNNERVE ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm DRAGON_CLAW, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, IRON_TAIL, EARTHQUAKE, RETURN, DOUBLE_TEAM, FLAMETHROWER, SANDSTORM, FIRE_BLAST, ROCK_TOMB, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, STEEL_WING, FLY, ROOST, SLEEP_TALK, STONE_EDGE, DRAGON_DANCE, DRAGON_PULSE, IRON_HEAD, GIGA_IMPACT, FIRE_FANG, THUNDER_FANG, ICE_FANG, DRACO_FANG
	; end
