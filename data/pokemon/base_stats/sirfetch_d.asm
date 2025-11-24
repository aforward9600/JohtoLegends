	db 0 ; species ID placeholder

	db  62, 135,  95,  65,  68,  82
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 177 ; base exp
	db NO_ITEM, STICK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/sirfetch_d/front.dimensions"
	db STEADFAST, STEADFAST, SCRAPPY ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RETURN, BRICK_BREAK, DOUBLE_TEAM, ACROBATICS, SUBSTITUTE, REST, ATTRACT, THIEF, STEEL_WING, SLEEP_TALK, SWORDS_DANCE, POISON_JAB, GIGA_IMPACT, STEEL_SLICE
	; end
