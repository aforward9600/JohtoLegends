	db 0 ; species ID placeholder

	db  70, 120,  40, 105,  95,  40
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db WATER, DARK ; type
	db 60 ; catch rate
	db 161 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sharpedo/front.dimensions"
	db ROUGH_SKIN, ROUGH_SKIN, SPEED_BOOST ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, BULLDOZE, EARTHQUAKE, RETURN, DOUBLE_TEAM, ROCK_TOMB, SUBSTITUTE, REST, ATTRACT, THIEF, SURF, WATERFALL, NASTY_PLOT, SLEEP_TALK, ICY_WIND, DARK_PULSE, POISON_JAB, GIGA_IMPACT, ICE_FANG
	; end
