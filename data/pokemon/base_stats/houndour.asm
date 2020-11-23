	db 0 ; species ID placeholder

	db  45,  60,  30,  65,  80,  50
	;   hp  atk  def  spd  sat  sdf

	db DARK, FIRE ; type
	db 120 ; catch rate
	db 114 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/houndour/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, HEX, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, SOLARBEAM, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, FLAMETHROWER, SLUDGE_BOMB, FIRE_BLAST, SUBSTITUTE, REST, ATTRACT, THIEF, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, DARK_PULSE, WILL_O_WISP, FIRE_FANG, THUNDER_FANG, HYPNOSIS
	; end
