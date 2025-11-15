	db 0 ; species ID placeholder

	db  38,  41,  40,  65,  50,  65
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ICE, ICE ; type
	db 190 ; catch rate
	db 63 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/vulpix_a/front.dimensions"
	db SNOW_CLOAK, SNOW_CLOAK, SNOW_WARNING ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEX, ROAR, TOXIC, HAIL, HIDDEN_POWER, DAZZLINGLEAM, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, SAFEGUARD, IRON_TAIL, RETURN, DIG, DOUBLE_TEAM, SUBSTITUTE, REST, ATTRACT, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, ICY_WIND, ICE_FANG, HYPNOSIS
	; end
