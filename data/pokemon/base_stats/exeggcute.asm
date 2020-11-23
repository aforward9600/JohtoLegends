	db 0 ; species ID placeholder

	db  60,  40,  80,  40,  60,  45
	;   hp  atk  def  spd  sat  sdf

	db GRASS, PSYCHIC ; type
	db 90 ; catch rate
	db 98 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/exeggcute/front.dimensions"
	db GROWTH_SLOW ; growth rate
	dn EGG_PLANT, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, LIGHT_SCREEN, PROTECT, GIGA_DRAIN, SOLARBEAM, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, REFLECT, SLUDGE_BOMB, SUBSTITUTE, REST, ATTRACT, THIEF, ENERGY_BALL, CALM_MIND, DREAM_EATER, SLEEP_TALK, SWORDS_DANCE, MOONBLAST, HYPNOSIS
	; end
