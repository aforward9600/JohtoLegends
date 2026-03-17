	db 0 ; species ID placeholder

	db  70, 100,  70,  40, 105,  75
	evs  0,   1,   0,   0,   1,   0
	;   hp  atk  def  spd  sat  sdf

	db FIRE, GROUND ; type
	db 150 ; catch rate
	db 161 ; base exp
	db RAWST_BERRY, RAWST_BERRY ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/camerupt/front.dimensions"
	db MAGMA_ARMOR, SOLID_ROCK, SHEER_FORCE ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, BULLDOZE, SOLARBEAM, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, FLAMETHROWER, SANDSTORM, FIRE_BLAST, ROCK_TOMB, SUBSTITUTE, FLASH_CANNON, ROCK_SLIDE, REST, ATTRACT, SLEEP_TALK, STONE_EDGE, IRON_HEAD, WILL_O_WISP, GIGA_IMPACT
	; end
