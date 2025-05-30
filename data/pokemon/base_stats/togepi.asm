	db 0 ; species ID placeholder

	db  35,  20,  65,  20,  40,  65
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY ; type
	db 190 ; catch rate
	db 74 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 10 ; step cycles to hatch
	INCBIN "gfx/pokemon/togepi/front.dimensions"
	db SERENE_GRACE, HUSTLE, SUPER_LUCK ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, SAFEGUARD, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, BRICK_BREAK, DOUBLE_TEAM, REFLECT, FLAMETHROWER, FIRE_BLAST, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, CALM_MIND, NASTY_PLOT, SLEEP_TALK, MOONBLAST, GRASS_KNOT
	; end
