	db 0 ; species ID placeholder

	db  80, 105,  65,  70, 100,  70
	evs  0,   3,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 191 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/victreebel/front.dimensions"
	db CHLOROPHYLL, CHLOROPHYLL, GLUTTONY ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DOUBLE_TEAM, REFLECT, SLUDGE_BOMB, SUBSTITUTE, REST, ATTRACT, THIEF, ENERGY_BALL, SLEEP_TALK, X_SCISSOR, SWORDS_DANCE, POISON_JAB, VENOSHOCK, GIGA_IMPACT, STRENGTH_SAP, GRASS_KNOT
	; end
