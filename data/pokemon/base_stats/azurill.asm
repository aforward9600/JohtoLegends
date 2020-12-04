	db 0 ; species ID placeholder

	db  50,  40,  40,  20,  20,  40
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FAIRY ; type
	db 150 ; catch rate
	db 38 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/azurill/front.dimensions"
	db GROWTH_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, ICE_BEAM, BLIZZARD, LIGHT_SCREEN, PROTECT, RAIN_DANCE, IRON_TAIL, RETURN, DOUBLE_TEAM, SUBSTITUTE, REST, ATTRACT, SURF, WATERFALL, SLEEP_TALK, ICY_WIND, MOONBLAST
	; end
