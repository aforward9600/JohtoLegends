	db 0 ; species ID placeholder

	db  40,  70, 130,  25,  60, 130
	evs  0,   0,   1,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GHOST ; type
	db 90 ; catch rate
	db 179 ; base exp
	db SPELL_TAG, SPELL_TAG ; items
	db GENDER_F50 ; gender ratio
	db 22 ; step cycles to hatch
	INCBIN "gfx/pokemon/dusclops/front.dimensions"
	db PRESSURE, PRESSURE, FRISK ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, HEX, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, BULLDOZE, EARTHQUAKE, RETURN, PSYCHIC_M, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, ROCK_TOMB, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, THIEF, CALM_MIND, DREAM_EATER, SLEEP_TALK, POWERUPPUNCH, ICY_WIND, DARK_PULSE, WILL_O_WISP, GIGA_IMPACT, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, HYPNOSIS
	; end
