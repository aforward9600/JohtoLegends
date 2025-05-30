	db 0 ; species ID placeholder

	db  70, 105,  79,  76,  35, 110
	evs  0,   0,   0,   0,   0,   2
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 140 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/hitmonchan/front.dimensions"
	db KEEN_EYE, IRON_FIST, INNER_FOCUS ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, BULLDOZE, EARTHQUAKE, RETURN, BRICK_BREAK, DOUBLE_TEAM, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, THIEF, FOCUS_BLAST, SLEEP_TALK, STONE_EDGE, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, DRAIN_PUNCH
	; end
