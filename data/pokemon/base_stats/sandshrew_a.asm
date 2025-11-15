	db 0 ; species ID placeholder

	db  50,  75,  90,  40,  10,  35
	evs  0,   0,   1,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db ICE, STEEL ; type
	db 255 ; catch rate
	db 93 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sandshrew/front.dimensions"
	db SNOW_CLOAK, SNOW_CLOAK, SLUSH_RUSH ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, DRAGON_CLAW, SHADOW_CLAW, TOXIC, BULK_UP, WILD_CHARGE, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, PROTECT, BULLDOZE, IRON_TAIL, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, AERIAL_ACE, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, THIEF, SLEEP_TALK, POWERUPPUNCH, ICY_WIND, X_SCISSOR, IRON_HEAD, SWORDS_DANCE, POISON_JAB, ICE_PUNCH
	; end
