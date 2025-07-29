	db 0 ; species ID placeholder

	db  75,  95,  67,  83, 125,  95
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

if DEF(_FAITHFUL)
	db FIRE, FIRE ; type
elif DEF(_NOPSS)
	db FIRE, FIRE ; type
else
	db FIRE, POISON ; type
endc
	db 30 ; catch rate
	db 199 ; base exp
	db RAWST_BERRY, RAWST_BERRY ; items
	db GENDER_F25 ; gender ratio
	db 25 ; step cycles to hatch
	INCBIN "gfx/pokemon/magmortar/front.dimensions"
	db FLAME_BODY, FLAME_BODY, MEGA_LAUNCHER ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, TOXIC, BULK_UP, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, BULLDOZE, SOLARBEAM, IRON_TAIL, THUNDERBOLT, RETURN, PSYCHIC_M, BRICK_BREAK, DOUBLE_TEAM, FLAMETHROWER, SLUDGE_BOMB, FIRE_BLAST, ROCK_TOMB, SUBSTITUTE, FLASH_CANNON, ROCK_SLIDE, REST, ATTRACT, THIEF, FOCUS_BLAST, NASTY_PLOT, SLEEP_TALK, POWERUPPUNCH, DARK_PULSE, DRAGON_PULSE, WILL_O_WISP, VENOSHOCK, POISON_JAB, GIGA_IMPACT, FIRE_FANG, FIRE_PUNCH, THUNDERPUNCH, PIXIE_PUNCH, DRAIN_PUNCH
	; end
