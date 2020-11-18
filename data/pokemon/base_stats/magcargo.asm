	db 0 ; species ID placeholder

	db  72,  70, 120,  30,  90, 110
	;   hp  atk  def  spd  sat  sdf

	db FIRE, STEEL ; type
	db 75 ; catch rate
	db 154 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/magcargo/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, EARTHQUAKE, RETURN, DOUBLE_TEAM, FIRE_BLAST, REST, ATTRACT, STEEL_SLICE
	; end
