	db 0 ; species ID placeholder

	db  65,  95,  57,  93, 100,  85
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 167 ; base exp
	db RAWST_BERRY, RAWST_BERRY ; items
	db GENDER_F25 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/magmar/front.dimensions"
	db FLAME_BODY, FLAME_BODY, VITAL_SPIRIT ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, IRON_TAIL, RETURN, PSYCHIC_M, BRICK_BREAK, DOUBLE_TEAM, FLAMETHROWER, SLUDGE_BOMB, FIRE_BLAST, SUBSTITUTE, REST, ATTRACT, THIEF, FOCUS_BLAST, NASTY_PLOT, SLEEP_TALK, POWERUPPUNCH, WILL_O_WISP, GIGA_IMPACT, FIRE_FANG, FIRE_PUNCH, THUNDERPUNCH, PIXIE_PUNCH, DRAIN_PUNCH
	; end
