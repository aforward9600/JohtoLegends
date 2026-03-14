	db 0 ; species ID placeholder

	db  50, 105, 125,  50,  55,  95
	evs  0,   1,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db STEEL, FAIRY ; type
	db 45 ; catch rate
	db 133 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/mawile/front.dimensions"
	db INTIMIDATE, HYPER_CUTTER, HUGE_POWER ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, ICE_BEAM, HYPER_BEAM, PROTECT, RAIN_DANCE, SOLARBEAM, EARTHQUAKE, RETURN, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, FLAMETHROWER, SLUDGE_BOMB, SANDSTORM, FIRE_BLAST, ROCK_TOMB, SUBSTITUTE, FLASH_CANNON, ROCK_SLIDE, REST, ATTRACT, FOCUS_BLAST, NASTY_PLOT, SLEEP_TALK, POWERUPPUNCH, STONE_EDGE, ICY_WIND, DARK_PULSE, IRON_HEAD, SWORDS_DANCE, GIGA_IMPACT, FIRE_FANG, THUNDER_FANG, ICE_FANG, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH, DRAIN_PUNCH, STEEL_SLICE, MOONBLAST, GRASS_KNOT
	; end
