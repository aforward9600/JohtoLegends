	db 0 ; species ID placeholder

	db  70, 130,  85,  85,  60,  70
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GRASS, FIGHTING ; type
	db 90 ; catch rate
	db 165 ; base exp
	db TINYMUSHROOM, BIG_MUSHROOM ; items
	db GENDER_F50 ; gender ratio
	db 15 ; step cycles to hatch
	INCBIN "gfx/pokemon/breloom/front.dimensions"
	db EFFECT_SPORE, POISON_HEAL, TECHNICIAN ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FAIRY, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SAFEGUARD, SOLARBEAM, IRON_TAIL, RETURN, DIG, BRICK_BREAK, DOUBLE_TEAM, SLUDGE_BOMB, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, FOCUS_BLAST, ENERGY_BALL, SLEEP_TALK, POWERUPPUNCH, STONE_EDGE, X_SCISSOR, IRON_HEAD, SWORDS_DANCE, POISON_JAB, VENOSHOCK, GIGA_IMPACT, THUNDERPUNCH, DRAIN_PUNCH, STRENGTH_SAP, GRASS_KNOT
	; end
