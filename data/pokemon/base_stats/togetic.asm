	db 0 ; species ID placeholder

	db  55,  40,  85,  40,  80, 105
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FLYING ; type
	db 75 ; catch rate
	db 114 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/togetic/front.dimensions"
	db SERENE_GRACE, HUSTLE, SUPER_LUCK ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_FAST ; growth rate
	dn EGG_FLYING, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, FLAMETHROWER, FIRE_BLAST, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, REST, ATTRACT, STEEL_WING, FLY, ROOST, FOCUS_BLAST, CALM_MIND, NASTY_PLOT, SLEEP_TALK, GIGA_IMPACT, DRAIN_PUNCH, MOONBLAST, GRASS_KNOT
	; end
