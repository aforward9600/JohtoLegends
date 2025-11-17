	db 0 ; species ID placeholder

	db  35, 106,  60, 121,  50,  70
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, STEEL ; type
	db 50 ; catch rate
	db 153 ; base exp
	db NO_ITEM, SOFT_SAND ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/dugtrio_a/front.dimensions"
	db SAND_VEIL, TANGLING_HAIR, SAND_FORCE ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DRAGON_CLAW, SHADOW_CLAW, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, BULLDOZE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SLUDGE_BOMB, SANDSTORM, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, ROCK_SLIDE, REST, ATTRACT, THIEF, SLEEP_TALK, STONE_EDGE, IRON_HEAD, GIGA_IMPACT, STEEL_SLICE
	; end
