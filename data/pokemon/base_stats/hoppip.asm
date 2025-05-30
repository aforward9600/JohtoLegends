	db 0 ; species ID placeholder

	db  35,  35,  40,  50,  35,  55
	evs  0,   0,   0,   0,   0,   1
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FLYING ; type
	db 255 ; catch rate
	db 74 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/hoppip/front.dimensions"
	db CHLOROPHYLL, LEAF_GUARD, INFILTRATOR ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FAIRY, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, DOUBLE_TEAM, REFLECT, ACROBATICS, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, ENERGY_BALL, SLEEP_TALK, SWORDS_DANCE, STRENGTH_SAP, U_TURN, MOONBLAST, GRASS_KNOT
	; end
