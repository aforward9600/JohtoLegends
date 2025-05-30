	db 0 ; species ID placeholder

	db  90, 110, 125,  30,  30,  95
	evs  0,   0,   2,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ROCK, ROCK ; type
	db 65 ; catch rate
	db 135 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sudowoodo/front.dimensions"
	db STURDY, ROCK_HEAD, RATTLED ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, BULLDOZE, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, SANDSTORM, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, THIEF, CALM_MIND, SLEEP_TALK, POWERUPPUNCH, STONE_EDGE, IRON_HEAD, POISON_JAB, GIGA_IMPACT, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH, DRAIN_PUNCH
	; end
