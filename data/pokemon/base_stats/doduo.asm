	db 0 ; species ID placeholder

	db  35,  85,  45,  75,  35,  35
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 190 ; catch rate
	db 96 ; base exp
	db NO_ITEM, SHARP_BEAK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/doduo/front.dimensions"
	db RUN_AWAY, EARLY_BIRD, TANGLED_FEET ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RETURN, DOUBLE_TEAM, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, STEEL_WING, FLY, ROOST, SLEEP_TALK, SWORDS_DANCE
	; end
