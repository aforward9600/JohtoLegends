	db 0 ; species ID placeholder

	db  70, 110, 180,  50,  60,  60
	evs  0,   0,   3,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

if DEF(_FAITHFUL)
	db STEEL, ROCK ; type
elif DEF(_NOPSS)
	db STEEL, ROCK ; type
else
	db STEEL, DRAGON ; type
endc
	db 45 ; catch rate
	db 239 ; base exp
	db HARD_STONE, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/aggron/front.dimensions"
	db STURDY, ROCK_HEAD, FILTER ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_MONSTER ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, DRAGON_CLAW, SHADOW_CLAW, ROAR, TOXIC, BULK_UP, WILD_CHARGE, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, BULLDOZE, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, FLAMETHROWER, SANDSTORM, FIRE_BLAST, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, ROCK_SLIDE, REST, ATTRACT, FOCUS_BLAST, SLEEP_TALK, STONE_EDGE, POWERUPPUNCH, DRAGON_DANCE, DRAGON_PULSE, IRON_HEAD, GIGA_IMPACT, FIRE_FANG, THUNDER_FANG, ICE_FANG, DRACO_FANG, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH, PIXIE_PUNCH, STEEL_SLICE
	; end
