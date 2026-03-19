	db 0 ; species ID placeholder

	db  75, 130,  70,  85,  85,  70
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 30 ; catch rate
	db 163 ; base exp
	db NO_ITEM, LIFE_ORB ; items
	db GENDER_F50 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/absol/front.dimensions"
	db PRESSURE, SUPER_LUCK, MAGIC_BOUNCE ; wBaseAbility1, wBaseAbility2
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm SHADOW_CLAW, HEX, ROAR, TOXIC, HAIL, WILD_CHARGE, HIDDEN_POWER, SUNNY_DAY, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, IRON_TAIL, THUNDERBOLT, THUNDER, EARTHQUAKE, RETURN, DIG, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, FLAMETHROWER, SANDSTORM, FIRE_BLAST, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, THIEF, CALM_MIND, NASTY_PLOT, DREAM_EATER, SLEEP_TALK, STONE_EDGE, X_SCISSOR, ICY_WIND, DARK_PULSE, IRON_HEAD, SWORDS_DANCE, POISON_JAB, GIGA_IMPACT, STEEL_SLICE, HYPNOSIS
	; end
