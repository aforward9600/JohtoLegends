	db 0 ; species ID placeholder

	db 110, 130,  80,  80,  70,  60
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ICE, GROUND ; type
	db 50 ; catch rate
	db 239 ; base exp
	db ASPEAR_BERRY, NEVERMELTICE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/mamoswine/front.dimensions"
	db OBLIVIOUS, SNOW_CLOAK, THICK_FAT ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm ROAR, TOXIC, HAIL, BULK_UP, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, BULLDOZE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, REFLECT, SANDSTORM, ROCK_TOMB, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, SLEEP_TALK, STONE_EDGE, ICY_WIND, IRON_HEAD, POISON_JAB, GIGA_IMPACT, ICE_FANG
	; end
