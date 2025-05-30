	db 0 ; species ID placeholder

	db  70, 135,  95,  85,  45,  70
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db BUG, ROCK ; type
	db 15 ; catch rate
	db 215 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/kleavor/front.dimensions"
	db SWARM, SHEER_FORCE, SHARPNESS ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, LIGHT_SCREEN, RAIN_DANCE, PROTECT, SAFEGUARD, RETURN, BRICK_BREAK, DOUBLE_TEAM, ACROBATICS, SANDSTORM, ROCK_TOMB, AERIAL_ACE, SUBSTITUTE, ROCK_SLIDE, REST, ATTRACT, THIEF, STEEL_WING, FLY, ROOST, SLEEP_TALK, STONE_EDGE, X_SCISSOR, IRON_HEAD, SWORDS_DANCE, GIGA_IMPACT, U_TURN
	; end
