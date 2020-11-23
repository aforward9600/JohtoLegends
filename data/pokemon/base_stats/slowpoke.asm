	db 0 ; species ID placeholder

	db  90,  65,  65,  15,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC ; type
	db 190 ; catch rate
	db 99 ; base exp
	db NO_ITEM, KINGS_ROCK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/slowpoke/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HAIL, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, BULLDOZE, IRON_TAIL, EARTHQUAKE, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, SUBSTITUTE, REST, ATTRACT, SURF, CALM_MIND, DREAM_EATER, SLEEP_TALK, ICY_WIND, HYPNOSIS
	; end
