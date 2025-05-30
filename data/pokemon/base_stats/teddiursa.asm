	db 0 ; species ID placeholder

	db  60,  80,  50,  40,  50,  50
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 120 ; catch rate
	db 124 ; base exp
	db ORAN_BERRY, SITRUS_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/teddiursa/front.dimensions"
	db PICKUP, QUICK_FEET, CUTE_CHARM ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, DRAGON_CLAW, SHADOW_CLAW, ROAR, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, BULLDOZE,  EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, THIEF, SLEEP_TALK, POWERUPPUNCH, IRON_HEAD, SWORDS_DANCE, POISON_JAB, FIRE_FANG, THUNDER_FANG, ICE_FANG, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH, DRAIN_PUNCH
	; end
