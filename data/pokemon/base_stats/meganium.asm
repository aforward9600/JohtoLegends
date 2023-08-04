	db 0 ; species ID placeholder

	db  80,  82, 100,  80,  83, 100
	evs  0,   0,   1,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

if DEF(_FAITHFUL)
	db GRASS, GRASS ; type
else
	db GRASS, FAIRY ; type
endc
	db 45 ; catch rate
	db 208 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/meganium/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, HYPER_BEAM, LIGHT_SCREEN, PROTECT, GIGA_DRAIN, SAFEGUARD, BULLDOZE, SOLARBEAM, IRON_TAIL, EARTHQUAKE, RETURN, DOUBLE_TEAM, REFLECT, SUBSTITUTE, REST, ATTRACT, ENERGY_BALL, CALM_MIND, SLEEP_TALK, SWORDS_DANCE, GIGA_IMPACT, STRENGTH_SAP, MOONBLAST, GRASS_KNOT
	; end
