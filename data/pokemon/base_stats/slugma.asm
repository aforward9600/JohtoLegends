	db 0 ; species ID placeholder

	db  40,  40,  40,  20,  70,  40
	evs  0,   0,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 190 ; catch rate
	db 78 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/slugma/front.dimensions"
	db MAGMA_ARMOR, FLAME_BODY, WEAK_ARMOR ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, LIGHT_SCREEN, PROTECT, RETURN, DOUBLE_TEAM, REFLECT, FLAMETHROWER, FIRE_BLAST, ROCK_TOMB, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, SLEEP_TALK, WILL_O_WISP, FIRE_FANG
	; end
