	db 0 ; species ID placeholder

	db  85,  60,  85, 100, 105, 100
	evs  0,   0,   0,   1,   1,   0
	;   hp  atk  def  spd  sat  sdf

if DEF(_FAITHFUL)
	db FIRE, FIRE ; type
elif DEF(_NOPSS)
	db FIRE, FIRE ; type
else
	db FIRE, GHOST ; type
endc
	db 75 ; catch rate
	db 178 ; base exp
	db RAWST_BERRY, RAWST_BERRY ; items
	db GENDER_F75 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/ninetales/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, HEX, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, SAFEGUARD, SOLARBEAM, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, SUBSTITUTE, REST, ATTRACT, ENERGY_BALL, CALM_MIND, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, DARK_PULSE, WILL_O_WISP, GIGA_IMPACT, FIRE_FANG, HYPNOSIS
	; end
