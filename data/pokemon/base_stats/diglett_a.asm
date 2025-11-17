	db 0 ; species ID placeholder

	db  10,  55,  30,  90,  35,  45
	evs  0,   0,   0,   1,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db GROUND, STEEL ; type
	db 255 ; catch rate
	db 81 ; base exp
	db NO_ITEM, SOFT_SAND ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/diglett_a/front.dimensions"
	db SAND_VEIL, TANGLING_HAIR, SAND_FORCE ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DRAGON_CLAW, SHADOW_CLAW, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, BULLDOZE, EARTHQUAKE, RETURN, DIG, DOUBLE_TEAM, SLUDGE_BOMB, SANDSTORM, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, ROCK_SLIDE, REST, ATTRACT, THIEF, SLEEP_TALK, IRON_HEAD, STEEL_SLICE
	; end
