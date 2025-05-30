	db 0 ; species ID placeholder

	db  80,  80,  50,  25,  40,  50
	evs  1,   0,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 190 ; catch rate
	db 90 ; base exp
	db NO_ITEM, NUGGET ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/grimer/front.dimensions"
	db STENCH, STICKY_HOLD, POISON_TOUCH ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, GIGA_DRAIN, BULLDOZE, THUNDERBOLT, THUNDER, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, FLAMETHROWER, SLUDGE_BOMB, FIRE_BLAST, ROCK_TOMB, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, THIEF, SLEEP_TALK, POWERUPPUNCH, POISON_JAB, VENOSHOCK, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, DRAIN_PUNCH, STRENGTH_SAP
	; end
