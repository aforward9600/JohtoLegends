	db 0 ; species ID placeholder

	db  75,  75,  90,  80,  75, 105
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

if DEF(_FAITHFUL)
	db DRAGON, FLYING ; type
elif DEF(_NOPSS)
	db DRAGON, FLYING ; type
else
	db DRAGON, FAIRY ; type
endc
	db 45 ; catch rate
	db 172 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/altaria/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm DRAGON_CLAW, CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, ICE_BEAM, HYPER_BEAM, PROTECT, RAIN_DANCE, SAFEGUARD, BULLDOZE, SOLARBEAM, EARTHQUAKE, RETURN, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, STEEL_WING, FLY, ROOST, CALM_MIND, DREAM_EATER, SLEEP_TALK, ICY_WIND, DRAGON_DANCE, DRAGON_PULSE, GIGA_IMPACT, U_TURN, MOONBLAST, HYPNOSIS
	; end
