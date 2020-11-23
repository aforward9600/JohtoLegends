	db 0 ; species ID placeholder

	db  65, 110, 130,  95,  60,  95
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 197 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 35 ; step cycles to hatch
	INCBIN "gfx/pokemon/leafeon/front.dimensions"
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, SOLARBEAM, IRON_TAIL, RETURN, DIG, SHADOW_BALL, DOUBLE_TEAM, AERIAL_ACE, SUBSTITUTE, REST, ATTRACT, THIEF, ENERGY_BALL, SLEEP_TALK, X_SCISSOR, IRON_HEAD, SWORDS_DANCE, POISON_JAB, GIGA_IMPACT, STRENGTH_SAP
	; end
