	db 0 ; species ID placeholder

	db  52,  95,  55,  55,  58,  62
	evs  0,   1,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 132 ; base exp
	db NO_ITEM, STICK ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/farfetch_d_g/front.dimensions"
	db STEADFAST, STEADFAST, SCRAPPY ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_FLYING, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RETURN, BRICK_BREAK, DOUBLE_TEAM, ACROBATICS, SUBSTITUTE, REST, ATTRACT, THIEF, STEEL_WING, SLEEP_TALK, SWORDS_DANCE, POISON_JAB, STEEL_SLICE
	; end
