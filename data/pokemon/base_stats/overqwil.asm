	db 0 ; species ID placeholder

	db  85, 115,  95,  85,  65,  65
	evs  0,   2,   0,   0,   0,   0
	;   hp  atk  def  spd  sat  sdf

	db DARK, POISON ; type
	db 45 ; catch rate
	db 179 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/overqwil/front.dimensions"
	db POISON_POINT, SWIFT_SWIM, INTIMIDATE ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_WATER_2, EGG_WATER_2 ; egg groups

	; tm/hm learnset
	tmhm HEX, TOXIC, HAIL, HIDDEN_POWER, ICE_BEAM, BLIZZARD, HYPER_BEAM, LIGHT_SCREEN, PROTECT, RAIN_DANCE, IRON_TAIL, RETURN, SHADOW_BALL, DOUBLE_TEAM, SLUDGE_BOMB, SUBSTITUTE, REST, ATTRACT, SURF, WATERFALL, SLEEP_TALK, ICY_WIND, DARK_PULSE, IRON_HEAD, SWORDS_DANCE, POISON_JAB, VENOSHOCK, GIGA_IMPACT
	; end
