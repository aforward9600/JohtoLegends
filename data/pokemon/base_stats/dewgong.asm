	db 0 ; species ID placeholder

	db  90,  80,  90,  70,  80,  95
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE ; type
	db 75 ; catch rate
	db 176 ; base exp
	db ASPEAR_BERRY, NEVERMELTICE ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/dewgong/front.dimensions"
	db THICK_FAT, HYDRATION, ICE_BODY ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_1, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HAIL, BULK_UP, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, SAFEGUARD, RETURN, DOUBLE_TEAM, SUBSTITUTE, REST, ATTRACT, SURF, WATERFALL, CALM_MIND, SLEEP_TALK, ICY_WIND, IRON_HEAD, POISON_JAB, GIGA_IMPACT, ICE_FANG
	; end
