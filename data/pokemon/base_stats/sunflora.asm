	db 0 ; species ID placeholder

	db  85,  75,  70,  30, 140,  90
	evs  0,   0,   0,   0,   2,   0
	;   hp  atk  def  spd  sat  sdf

if DEF(_FAITHFUL)
	db GRASS, GRASS ; type
elif DEF(_NOPSS)
	db GRASS, GRASS ; type
else
	db GRASS, FIRE ; type
endc
	db 120 ; catch rate
	db 146 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sunflora/front.dimensions"
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, HYPER_BEAM, LIGHT_SCREEN, PROTECT, GIGA_DRAIN, SAFEGUARD, SOLARBEAM, RETURN, DOUBLE_TEAM, FLAMETHROWER, SLUDGE_BOMB, FIRE_BLAST, SUBSTITUTE, REST, ATTRACT, ENERGY_BALL, SLEEP_TALK, SWORDS_DANCE, GIGA_IMPACT, STRENGTH_SAP, MOONBLAST, GRASS_KNOT
	; end
