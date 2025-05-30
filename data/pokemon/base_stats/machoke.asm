	db 0 ; species ID placeholder

	db  80, 100,  70,  45,  50,  60
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 90 ; catch rate
	db 146 ; base exp
	db NO_ITEM, FOCUS_BAND ; items
	db GENDER_F25 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/machoke/front.dimensions"
	db GUTS, NO_GUARD, STEADFAST ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, LIGHT_SCREEN, PROTECT, RAIN_DANCE, BULLDOZE, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, FLAMETHROWER, FIRE_BLAST, ROCK_TOMB, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, THIEF, FOCUS_BLAST, SLEEP_TALK, POWERUPPUNCH, POISON_JAB, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, DRAIN_PUNCH
	; end
