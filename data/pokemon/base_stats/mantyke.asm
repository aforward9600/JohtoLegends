	db 0 ; species ID placeholder

	db  45,  20,  50,  50,  60, 120
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING ; type
	db 25 ; catch rate
	db 69 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/mantyke/front.dimensions"
	db SWIFT_SWIM, WATER_ABSORB, WATER_VEIL ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, PROTECT, RAIN_DANCE, BULLDOZE, EARTHQUAKE, RETURN, DOUBLE_TEAM, ACROBATICS, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, SURF, WATERFALL, SLEEP_TALK, ICY_WIND, IRON_HEAD
	; end
