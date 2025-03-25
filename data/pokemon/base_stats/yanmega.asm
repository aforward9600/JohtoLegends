	db 0 ; species ID placeholder

	db  96,  66,  86,  95, 116,  66
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

if DEF(_FAITHFUL)
	db BUG, FLYING ; type
elif DEF(_NOPSS)
	db BUG, FLYING ; type
else
	db BUG, ROCK ; type
endc
	db 30 ; catch rate
	db 180 ; base exp
	db NO_ITEM, WIDE_LENS ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/yanmega/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, SANDSTORM, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, ROCK_SLIDE, REST, ATTRACT, THIEF, STEEL_WING, ROOST, FOCUS_BLAST, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, STONE_EDGE, X_SCISSOR, SWORDS_DANCE, GIGA_IMPACT, U_TURN, HYPNOSIS
	; end
