	db 0 ; species ID placeholder

	db  70,  60,  60, 110, 110, 110
	evs  0,   0,   0,   0,   1,   1
	;   hp  atk  def  spd  sat  sdf

if DEF(_FAITHFUL)
	db GHOST, GHOST ; type
elif DEF(_NOPSS)
	db GHOST, GHOST ; type
else
	db GHOST, FAIRY ; type
endc
	db 45 ; catch rate
	db 187 ; base exp
	db NO_ITEM, SPELL_TAG ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/mismagius/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm CURSE, HEX, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, HYPER_BEAM, PROTECT, RAIN_DANCE, THUNDERBOLT, THUNDER, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, FLAMETHROWER, FIRE_BLAST, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, REST, ATTRACT, THIEF, FOCUS_BLAST, ENERGY_BALL, CALM_MIND, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, ICY_WIND, DARK_PULSE, WILL_O_WISP, GIGA_IMPACT, MOONBLAST, HYPNOSIS
	; end
