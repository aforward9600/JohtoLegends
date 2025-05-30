	db 0 ; species ID placeholder

	db  85,  80,  70,  90, 135,  75
	evs  0,   0,   0,   0,   3,   0
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 30 ; catch rate
	db 241 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 20 ; step cycles to hatch
	INCBIN "gfx/pokemon/porygon_z/front.dimensions"
	db ADAPTABILITY, DOWNLOAD, ANALYTIC ; wBaseAbility1, wBaseAbility2, wBaseAbility3
	db 0 ; Padding left-over from the unused back pic
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm TOXIC, HIDDEN_POWER, SUNNY_DAY, DAZZLINGLEAM, ICE_BEAM, BLIZZARD, HYPER_BEAM, PROTECT, RAIN_DANCE, SOLARBEAM, IRON_TAIL, THUNDERBOLT, THUNDER, RETURN, PSYCHIC_M, SHADOW_BALL, DOUBLE_TEAM, AERIAL_ACE, SUBSTITUTE, FLASH_CANNON, REST, THIEF, FOCUS_BLAST, ENERGY_BALL, CALM_MIND, NASTY_PLOT, SLEEP_TALK, ICY_WIND, DARK_PULSE, GIGA_IMPACT, MOONBLAST, HYPNOSIS
	; end
