BattleTowerMons:
; 10 groups of 21 mons.
; Each mon is several bytes too long; the initial species, item and move IDs must be converted to 8-bit when loading.

BattleTowerMons1:

	dw JOLTEON
	db LUM_BERRY
	dw THUNDERBOLT, HYPER_BEAM, SHADOW_BALL, ROAR

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 11, 13 ; DVs
	db 15, 5, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 36 ; HP
	bigdw 36 ; Max HP
	bigdw 20 ; Atk
	bigdw 19 ; Def
	bigdw 37 ; Spd
	bigdw 35 ; SAtk
	bigdw 26 ; SDef
	db "SANDA-SU@@@"

	dw ESPEON
	db SPECIALSPECS
	dw SHADOW_BALL, PSYCHIC_M, MORNING_SUN, TOXIC

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 14, 13, 15, 11 ; DVs
	db 15, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 34 ; HP
	bigdw 34 ; Max HP
	bigdw 20 ; Atk
	bigdw 19 ; Def
	bigdw 36 ; Spd
	bigdw 39 ; SAtk
	bigdw 26 ; SDef
	db "E-HUi@@@@@@"

	dw UMBREON
	db LEFTOVERS
	dw FAINT_ATTACK, IRON_TAIL, PSYCH_UP, TOXIC

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 11, 14, 15 ; DVs
	db 20, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 47 ; HP
	bigdw 47 ; Max HP
	bigdw 20 ; Atk
	bigdw 35 ; Def
	bigdw 20 ; Spd
	bigdw 20 ; SAtk
	bigdw 34 ; SDef
	db "BURAtuKI-@@"

	dw WOBBUFFET
	db FOCUS_SASH
	dw COUNTER, MIRROR_COAT, SAFEGUARD, DESTINY_BOND

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 252, 0, 128, 0, 0, 128 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 15, 13, 7 ; DVs
	db 20, 20, 25, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 79 ; HP
	bigdw 79 ; Max HP
	bigdw 13 ; Atk
	bigdw 22 ; Def
	bigdw 14 ; Spd
	bigdw 13 ; SAtk
	bigdw 21 ; SDef
	db "SO-NANSU@@@"

	dw KANGASKHAN
	db POWER_BAND
	dw REVERSAL, RETURN, EARTHQUAKE, ATTRACT

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 14, 15, 12, 15 ; DVs
	db 15, 20, 10, 15 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 42 ; HP
	bigdw 42 ; Max HP
	bigdw 33 ; Atk
	bigdw 24 ; Def
	bigdw 31 ; Spd
	bigdw 16 ; SAtk
	bigdw 24 ; SDef
	db "GARU-RA@@@@"

	dw CORSOLA
	db LEFTOVERS
	dw NIGHT_SHADE, WILL_O_WISP, RECOVER, STRENGTH_SAP

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 14, 15, 13 ; DVs
	db 15, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 41 ; HP
	bigdw 41 ; Max HP
	bigdw 16 ; Atk
	bigdw 34 ; Def
	bigdw 14 ; Spd
	bigdw 28 ; SAtk
	bigdw 21 ; SDef
	db "SANI-GO@@@@"

	dw MILTANK
	db SITRUS_BERRY
	dw BLIZZARD, EARTHQUAKE, GIGA_IMPACT, TOXIC

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 11, 13, 15 ; DVs
	db 5, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 42 ; HP
	bigdw 42 ; Max HP
	bigdw 29 ; Atk
	bigdw 28 ; Def
	bigdw 33 ; Spd
	bigdw 16 ; SAtk
	bigdw 22 ; SDef
	db "MIRUTANKU@@"

	dw AERODACTYL
	db LIFE_ORB
	dw ROCK_TOMB, SUPERSONIC, EARTHQUAKE, BITE

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 11, 15, 11 ; DVs
	db 15, 20, 10, 25 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 39 ; HP
	bigdw 39 ; Max HP
	bigdw 34 ; Atk
	bigdw 20 ; Def
	bigdw 40 ; Spd
	bigdw 19 ; SAtk
	bigdw 22 ; SDef
	db "PUTERA@@@@@"

	dw LAPRAS
	db SPECIALSPECS
	dw BLIZZARD, SURF, THUNDERBOLT, PSYCHIC_M

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 11 ; DVs
	db 5, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 54 ; HP
	bigdw 54 ; Max HP
	bigdw 25 ; Atk
	bigdw 23 ; Def
	bigdw 19 ; Spd
	bigdw 30 ; SAtk
	bigdw 26 ; SDef
	db "RAPURASU@@@"

	dw SNEASEL
	db POWER_BAND
	dw SLASH, FAINT_ATTACK, ICE_PUNCH, HONE_CLAWS

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 11, 15 ; DVs
	db 20, 20, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 34 ; HP
	bigdw 34 ; Max HP
	bigdw 33 ; Atk
	bigdw 18 ; Def
	bigdw 36 ; Spd
	bigdw 15 ; SAtk
	bigdw 23 ; SDef
	db "NIyu-RA@@@@"

	dw PORYGON2
	db LEFTOVERS
	dw PSYCHIC_M, ICE_BEAM, RECOVER, THUNDERBOLT

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 252, 0, 128, 0, 0, 128 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 13, 14 ; DVs
	db 10, 10, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 46 ; HP
	bigdw 46 ; Max HP
	bigdw 24 ; Atk
	bigdw 28 ; Def
	bigdw 19 ; Spd
	bigdw 28 ; SAtk
	bigdw 30 ; SDef
	db "PORIGON2@@@"

	dw MISDREAVUS
	db FOCUS_SASH
	dw PERISH_SONG, MEAN_LOOK, PAIN_SPLIT, SHADOW_BALL

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 0, 0, 0, 170, 170, 170 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 14, 15, 13, 15 ; DVs
	db 5, 5, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 33 ; HP
	bigdw 33 ; Max HP
	bigdw 19 ; Atk
	bigdw 20 ; Def
	bigdw 28 ; Spd
	bigdw 29 ; SAtk
	bigdw 29 ; SDef
	db "MUUMA@@@@@@"

	dw HOUNDOUR
	db SPECIALSPECS
	dw DARK_PULSE, SOLARBEAM, FLAMETHROWER, SUNNY_DAY

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 15, 14 ; DVs
	db 15, 10, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 31 ; HP
	bigdw 31 ; Max HP
	bigdw 20 ; Atk
	bigdw 13 ; Def
	bigdw 27 ; Spd
	bigdw 30 ; SAtk
	bigdw 17 ; SDef
	db "DERUBIRU@@@"

	dw GIRAFARIG
	db KINGS_ROCK
	dw PSYBEAM, RETURN, SHADOW_BALL, AGILITY

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 0, 128, 0, 252, 128, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 15, 13 ; DVs
	db 20, 20, 15, 30 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 36 ; HP
	bigdw 36 ; Max HP
	bigdw 26 ; Atk
	bigdw 20 ; Def
	bigdw 31 ; Spd
	bigdw 28 ; SAtk
	bigdw 20 ; SDef
	db "KIRINRIKI@@"

	dw BLISSEY
	db LEFTOVERS
	dw HEADBUTT, SOLARBEAM, ROLLOUT, SOFTBOILED

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 252, 0, 0, 0, 0, 252 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 12, 14 ; DVs
	db 15, 10, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 79 ; HP
	bigdw 79 ; Max HP
	bigdw 9 ; Atk
	bigdw 10 ; Def
	bigdw 18 ; Spd
	bigdw 22 ; SAtk
	bigdw 41 ; SDef
	db "HAPINASU@@@"

	dw SNORLAX
	db LEFTOVERS
	dw HEADBUTT, PROTECT, SNORE, SURF

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 14, 15, 15, 7 ; DVs
	db 15, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 59 ; HP
	bigdw 59 ; Max HP
	bigdw 36 ; Atk
	bigdw 21 ; Def
	bigdw 14 ; Spd
	bigdw 19 ; SAtk
	bigdw 28 ; SDef
	db "KABIGON@@@@"

	dw EXEGGUTOR
	db LEFTOVERS
	dw TOXIC, GIGA_DRAIN, THIEF, CONFUSION

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 14, 15, 14 ; DVs
	db 10, 10, 10, 25 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 47 ; HP
	bigdw 47 ; Max HP
	bigdw 27 ; Atk
	bigdw 24 ; Def
	bigdw 19 ; Spd
	bigdw 39 ; SAtk
	bigdw 22 ; SDef
	db "NAtuSI-@@@@"

	dw HERACROSS
	db SITRUS_BERRY
	dw AERIAL_ACE, ENDURE, HORN_ATTACK, BRICK_BREAK

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 7, 15, 7 ; DVs
	db 20, 10, 25, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 39 ; HP
	bigdw 39 ; Max HP
	bigdw 39 ; Atk
	bigdw 21 ; Def
	bigdw 31 ; Spd
	bigdw 14 ; SAtk
	bigdw 25 ; SDef
	db "HERAKUROSU@"

	dw UNOWN
	db ORAN_BERRY
	dw HIDDEN_POWER, 0, 0, 0

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 15, 15 ; DVs
	db 15, 0, 0, 0 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 32 ; HP
	bigdw 32 ; Max HP
	bigdw 22 ; Atk
	bigdw 17 ; Def
	bigdw 23 ; Spd
	bigdw 28 ; SAtk
	bigdw 17 ; SDef
	db "ANNO-N@@@@@"

	dw TAUROS
	db KINGS_ROCK
	dw HEADBUTT, SWAGGER, TAIL_WHIP, BULLDOZE

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 6, 5, 5, 7 ; DVs
	db 15, 15, 30, 20 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 36 ; HP
	bigdw 36 ; Max HP
	bigdw 32 ; Atk
	bigdw 25 ; Def
	bigdw 34 ; Spd
	bigdw 14 ; SAtk
	bigdw 20 ; SDef
	db "KENTAROSU@@"

	dw MIME__JR
	db QUICK_CLAW
	dw TOXIC, DOUBLESLAP, MAGICAL_LEAF, CONFUSION

	dw 0 ; OT ID
	dt 1000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 3, 6, 7 ; DVs
	db 10, 10, 20, 25 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 10 ; Level
	db 0, 0 ; Status
	bigdw 26 ; HP
	bigdw 26 ; Max HP
	bigdw 11 ; Atk
	bigdw 14 ; Def
	bigdw 24 ; Spd
	bigdw 26 ; SAtk
	bigdw 24 ; SDef
	db "BARIYA-DO@@"


BattleTowerMons2:

	dw UMBREON
	db LEFTOVERS
	dw PROTECT, TOXIC, FAINT_ATTACK, ATTRACT

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 12, 15, 11, 12 ; DVs
	db 10, 10, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 83 ; HP
	bigdw 83 ; Max HP
	bigdw 35 ; Atk
	bigdw 67 ; Def
	bigdw 35 ; Spd
	bigdw 33 ; SAtk
	bigdw 61 ; SDef
	db "BURAtuKI-@@"

	dw STARYU
	db SITRUS_BERRY
	dw RECOVER, PSYCHIC_M, SURF, ICE_BEAM

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 11, 13, 11 ; DVs
	db 20, 10, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 48 ; HP
	bigdw 48 ; Max HP
	bigdw 28 ; Atk
	bigdw 31 ; Def
	bigdw 56 ; Spd
	bigdw 50 ; SAtk
	bigdw 31 ; SDef
	db "SUTA-MI-@@@"

	dw GYARADOS
	db LUM_BERRY
	dw SURF, DRAGON_RAGE, THUNDERBOLT, FIRE_BLAST

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 10, 15, 13 ; DVs
	db 5, 10, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 72 ; HP
	bigdw 72 ; Max HP
	bigdw 93 ; Atk
	bigdw 40 ; Def
	bigdw 56 ; Spd
	bigdw 46 ; SAtk
	bigdw 50 ; SDef
	db "GIyaRADOSU@"

	dw STEELIX
	db LEFTOVERS
	dw ROAR, IRON_TAIL, SWAGGER, EARTHQUAKE

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 15, 15 ; DVs
	db 20, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 78 ; HP
	bigdw 78 ; Max HP
	bigdw 45 ; Atk
	bigdw 91 ; Def
	bigdw 23 ; Spd
	bigdw 33 ; SAtk
	bigdw 37 ; SDef
	db "HAGANE-RU@@"

	dw KADABRA
	db TWISTEDSPOON
	dw PSYCHIC_M, PSYCH_UP, TOXIC, DAZZLINGLEAM

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 15 ; DVs
	db 10, 10, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 51 ; HP
	bigdw 51 ; Max HP
	bigdw 25 ; Atk
	bigdw 22 ; Def
	bigdw 65 ; Spd
	bigdw 71 ; SAtk
	bigdw 39 ; SDef
	db "HU-DEiN@@@@"

	dw ARCANINE
	db CHARCOAL
	dw FIRE_FANG, ROAR, EXTREMESPEED, DIG

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 11, 15, 11 ; DVs
	db 15, 20, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 72 ; HP
	bigdw 72 ; Max HP
	bigdw 66 ; Atk
	bigdw 41 ; Def
	bigdw 61 ; Spd
	bigdw 49 ; SAtk
	bigdw 41 ; SDef
	db "UINDEi@@@@@"

	dw HERACROSS
	db FOCUS_SASH
	dw ENDURE, REVERSAL, MEGAHORN, EARTHQUAKE

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 13, 14 ; DVs
	db 10, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 67 ; HP
	bigdw 67 ; Max HP
	bigdw 72 ; Atk
	bigdw 41 ; Def
	bigdw 56 ; Spd
	bigdw 26 ; SAtk
	bigdw 48 ; SDef
	db "HERAKUROSU@"

	dw EXEGGUTOR
	db LEFTOVERS
	dw HYPER_BEAM, GIGA_DRAIN, SLEEP_POWDER, DREAM_EATER

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 11 ; DVs
	db 5, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 85 ; HP
	bigdw 85 ; Max HP
	bigdw 49 ; Atk
	bigdw 44 ; Def
	bigdw 32 ; Spd
	bigdw 72 ; SAtk
	bigdw 39 ; SDef
	db "NAtuSI-@@@@"

	dw AERODACTYL
	db LIFE_ORB
	dw REST, ROCK_TOMB, EARTHQUAKE, AERIAL_ACE

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 11, 11 ; DVs
	db 10, 15, 10, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 68 ; HP
	bigdw 68 ; Max HP
	bigdw 65 ; Atk
	bigdw 35 ; Def
	bigdw 74 ; Spd
	bigdw 33 ; SAtk
	bigdw 39 ; SDef
	db "PUTERA@@@@@"

	dw BLISSEY
	db LEFTOVERS
	dw PSYCHIC_M, SUBMISSION, SOFTBOILED, COUNTER

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 252, 0, 0, 0, 0, 252 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 13, 15, 14 ; DVs
	db 10, 25, 10, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 150 ; HP
	bigdw 150 ; Max HP
	bigdw 13 ; Atk
	bigdw 14 ; Def
	bigdw 33 ; Spd
	bigdw 40 ; SAtk
	bigdw 77 ; SDef
	db "HAPINASU@@@"

	dw LAPRAS
	db LEFTOVERS
	dw PSYCHIC_M, THUNDERBOLT, BLIZZARD, CONFUSE_RAY

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 14, 13, 7 ; DVs
	db 10, 15, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 99 ; HP
	bigdw 99 ; Max HP
	bigdw 45 ; Atk
	bigdw 42 ; Def
	bigdw 34 ; Spd
	bigdw 54 ; SAtk
	bigdw 45 ; SDef
	db "RAPURASU@@@"

	dw PIKACHU
	db LIGHT_BALL
	dw THUNDERBOLT, THUNDER_WAVE, GRASS_KNOT, TOXIC

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 15, 14 ; DVs
	db 15, 20, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 49 ; HP
	bigdw 49 ; Max HP
	bigdw 33 ; Atk
	bigdw 26 ; Def
	bigdw 59 ; Spd
	bigdw 43 ; SAtk
	bigdw 30 ; SDef
	db "PIKATIyuU@@"

	dw SCIZOR
	db FOCUS_SASH
	dw STEEL_WING, X_SCISSOR, TOXIC, SANDSTORM

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 15, 14 ; DVs
	db 25, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 76 ; HP
	bigdw 76 ; Max HP
	bigdw 75 ; Atk
	bigdw 50 ; Def
	bigdw 37 ; Spd
	bigdw 32 ; SAtk
	bigdw 42 ; SDef
	db "HAtuSAMU@@@"

	dw HITMONCHAN
	db SITRUS_BERRY
	dw THUNDERPUNCH, ICE_PUNCH, FIRE_PUNCH, MEGA_PUNCH

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 15, 13 ; DVs
	db 15, 15, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 64 ; HP
	bigdw 64 ; Max HP
	bigdw 65 ; Atk
	bigdw 41 ; Def
	bigdw 54 ; Spd
	bigdw 24 ; SAtk
	bigdw 54 ; SDef
	db "EBIWARA-@@@"

	dw TAUROS
	db BRIGHTPOWDER
	dw THUNDERBOLT, EARTHQUAKE, GIGA_IMPACT, BLIZZARD

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 14, 15 ; DVs
	db 15, 10, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 65 ; HP
	bigdw 65 ; Max HP
	bigdw 63 ; Atk
	bigdw 47 ; Def
	bigdw 67 ; Spd
	bigdw 27 ; SAtk
	bigdw 39 ; SDef
	db "KENTAROSU@@"

	dw AZUMARILL
	db MYSTIC_WATER
	dw WATERFALL, ICE_PUNCH, ATTRACT, RAIN_DANCE

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 15, 7 ; DVs
	db 15, 15, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 88 ; HP
	bigdw 88 ; Max HP
	bigdw 62 ; Atk
	bigdw 42 ; Def
	bigdw 31 ; Spd
	bigdw 35 ; SAtk
	bigdw 39 ; SDef
	db "MARIRURI@@@"

	dw MILTANK
	db KINGS_ROCK
	dw EARTHQUAKE, THUNDER, ATTRACT, RETURN

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 15, 14 ; DVs
	db 10, 10, 15, 20 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 73 ; HP
	bigdw 73 ; Max HP
	bigdw 54 ; Atk
	bigdw 53 ; Def
	bigdw 63 ; Spd
	bigdw 26 ; SAtk
	bigdw 38 ; SDef
	db "MIRUTANKU@@"

	dw WIGGLYTUFF
	db LEFTOVERS
	dw HYPER_BEAM, MOONBLAST, FIRE_BLAST, ATTRACT

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 7, 15, 14 ; DVs
	db 5, 15, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 104 ; HP
	bigdw 104 ; Max HP
	bigdw 40 ; Atk
	bigdw 35 ; Def
	bigdw 29 ; Spd
	bigdw 57 ; SAtk
	bigdw 38 ; SDef
	db "PUKURIN@@@@"

	dw WIGGLYTUFF
	db PINK_BOW
	dw PSYCHIC_M, SWAGGER, PSYCH_UP, HYPER_BEAM

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 7, 7, 7 ; DVs
	db 10, 15, 10, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 104 ; HP
	bigdw 104 ; Max HP
	bigdw 39 ; Atk
	bigdw 35 ; Def
	bigdw 25 ; Spd
	bigdw 54 ; SAtk
	bigdw 35 ; SDef
	db "PUKURIN@@@@"

	dw NIDOKING
	db ORAN_BERRY
	dw POISON_JAB, EARTHQUAKE, SURF, THUNDERPUNCH

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 5, 6, 4, 6 ; DVs
	db 20, 10, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 65 ; HP
	bigdw 65 ; Max HP
	bigdw 60 ; Atk
	bigdw 38 ; Def
	bigdw 53 ; Spd
	bigdw 41 ; SAtk
	bigdw 37 ; SDef
	db "NIDOKINGU@@"

	dw QUAGSIRE
	db QUICK_CLAW
	dw AMNESIA, EARTHQUAKE, WATERFALL, RAIN_DANCE

	dw 0 ; OT ID
	dt 8000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 5, 5, 4, 7 ; DVs
	db 20, 10, 15, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 20 ; Level
	db 0, 0 ; Status
	bigdw 87 ; HP
	bigdw 87 ; Max HP
	bigdw 57 ; Atk
	bigdw 45 ; Def
	bigdw 24 ; Spd
	bigdw 37 ; SAtk
	bigdw 37 ; SDef
	db "NUO-@@@@@@@"


BattleTowerMons3:

	dw JOLTEON
	db LUM_BERRY
	dw THUNDERBOLT, THUNDER_WAVE, ROAR, SHADOW_BALL

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 11, 14, 13 ; DVs
	db 15, 20, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 86 ; HP
	bigdw 86 ; Max HP
	bigdw 51 ; Atk
	bigdw 47 ; Def
	bigdw 110 ; Spd
	bigdw 97 ; SAtk
	bigdw 69 ; SDef
	db "SANDA-SU@@@"

	dw POLIWRATH
	db BRIGHTPOWDER
	dw DOUBLE_TEAM, WATERFALL, ICE_PUNCH, BRICK_BREAK

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 15, 11 ; DVs
	db 15, 15, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 121 ; HP
	bigdw 121 ; Max HP
	bigdw 88 ; Atk
	bigdw 69 ; Def
	bigdw 56 ; Spd
	bigdw 53 ; SAtk
	bigdw 65 ; SDef
	db "NIyoROBON@@"

	dw STARMIE
	db LEFTOVERS
	dw ICE_BEAM, PSYCHIC_M, RECOVER, SURF

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 15, 15 ; DVs
	db 10, 10, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 85 ; HP
	bigdw 85 ; Max HP
	bigdw 59 ; Atk
	bigdw 65 ; Def
	bigdw 101 ; Spd
	bigdw 92 ; SAtk
	bigdw 65 ; SDef
	db "SUTA-MI-@@@"

	dw JYNX
	db SPECIALSPECS
	dw BLIZZARD, LOVELY_KISS, DREAM_EATER, ATTRACT

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 14, 14 ; DVs
	db 5, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 98 ; HP
	bigdw 98 ; Max HP
	bigdw 56 ; Atk
	bigdw 39 ; Def
	bigdw 89 ; Spd
	bigdw 107 ; SAtk
	bigdw 73 ; SDef
	db "RU-ZIyuRA@@"

	dw DUGTRIO
	db KINGS_ROCK
	dw EARTHQUAKE, ROCK_SLIDE, SLASH, MUD_SLAP

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 14, 15, 15, 15 ; DVs
	db 10, 10, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 65 ; HP
	bigdw 65 ; Max HP
	bigdw 95 ; Atk
	bigdw 44 ; Def
	bigdw 111 ; Spd
	bigdw 44 ; SAtk
	bigdw 56 ; SDef
	db "DAGUTORIO@@"

	dw BELLOSSOM
	db BRIGHTPOWDER
	dw GIGA_DRAIN, SLUDGE_BOMB, MOONBLAST, DOUBLE_TEAM

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 13, 11 ; DVs
	db 10, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 115 ; HP
	bigdw 115 ; Max HP
	bigdw 57 ; Atk
	bigdw 71 ; Def
	bigdw 42 ; Spd
	bigdw 84 ; SAtk
	bigdw 71 ; SDef
	db "KIREIHANA@@"

	dw BLISSEY
	db LEFTOVERS
	dw TOXIC, REFLECT, SOFTBOILED, PROTECT

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 252, 0, 0, 0, 0, 252 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 14, 13 ; DVs
	db 10, 20, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 219 ; HP
	bigdw 219 ; Max HP
	bigdw 20 ; Atk
	bigdw 17 ; Def
	bigdw 46 ; Spd
	bigdw 57 ; SAtk
	bigdw 112 ; SDef
	db "HAPINASU@@@"

	dw HOUNDOOM
	db CHARCOAL
	dw FLAMETHROWER, DARK_PULSE, SHADOW_BALL, NASTY_PLOT

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 13 ; DVs
	db 15, 15, 15, 30 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 92 ; HP
	bigdw 92 ; Max HP
	bigdw 68 ; Atk
	bigdw 42 ; Def
	bigdw 89 ; Spd
	bigdw 97 ; SAtk
	bigdw 60 ; SDef
	db "HERUGA-@@@@"

	dw MACHAMP
	db LUM_BERRY
	dw CROSS_CHOP, ICE_PUNCH, EARTHQUAKE, FIRE_BLAST

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 11, 14 ; DVs
	db 5, 15, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 121 ; HP
	bigdw 121 ; Max HP
	bigdw 110 ; Atk
	bigdw 60 ; Def
	bigdw 44 ; Spd
	bigdw 52 ; SAtk
	bigdw 64 ; SDef
	db "KAIRIKI-@@@"

	dw CROBAT
	db SITRUS_BERRY
	dw POISON_FANG, CONFUSE_RAY, TOXIC, WING_ATTACK

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 14, 15, 13, 12 ; DVs
	db 15, 10, 10, 35 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 94 ; HP
	bigdw 94 ; Max HP
	bigdw 86 ; Atk
	bigdw 62 ; Def
	bigdw 109 ; Spd
	bigdw 54 ; SAtk
	bigdw 60 ; SDef
	db "KUROBAtuTO@"

	dw PORYGON2
	db LEFTOVERS
	dw PSYCHIC_M, RECOVER, THUNDERBOLT, TRI_ATTACK

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 252, 0, 128, 0, 0, 128 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 13, 11 ; DVs
	db 10, 20, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 118 ; HP
	bigdw 118 ; Max HP
	bigdw 60 ; Atk
	bigdw 77 ; Def
	bigdw 48 ; Spd
	bigdw 74 ; SAtk
	bigdw 78 ; SDef
	db "PORIGON2@@@"

	dw MAROWAK
	db THICK_CLUB
	dw EARTHQUAKE, RETURN, SWORDS_DANCE, ROCK_SLIDE

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 14, 11 ; DVs
	db 10, 20, 20, 10 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 109 ; HP
	bigdw 109 ; Max HP
	bigdw 79 ; Atk
	bigdw 78 ; Def
	bigdw 46 ; Spd
	bigdw 41 ; SAtk
	bigdw 65 ; SDef
	db "GARAGARA@@@"

	dw ELECTRODE
	db BRIGHTPOWDER
	dw SELFDESTRUCT, THUNDERBOLT, PROTECT, WILD_CHARGE

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 0, 252, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 13, 14, 15 ; DVs
	db 5, 15, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 83 ; HP
	bigdw 83 ; Max HP
	bigdw 78 ; Atk
	bigdw 54 ; Def
	bigdw 97 ; Spd
	bigdw 80 ; SAtk
	bigdw 62 ; SDef
	db "MARUMAIN@@@"

	dw LAPRAS
	db LEFTOVERS
	dw RAIN_DANCE, SURF, ICE_BEAM, STRENGTH

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 11 ; DVs
	db 5, 15, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 144 ; HP
	bigdw 144 ; Max HP
	bigdw 65 ; Atk
	bigdw 60 ; Def
	bigdw 49 ; Spd
	bigdw 81 ; SAtk
	bigdw 68 ; SDef
	db "RAPURASU@@@"

	dw LANTURN
	db SITRUS_BERRY
	dw RAIN_DANCE, THUNDER, SURF, ICE_BEAM

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 14, 11 ; DVs
	db 5, 10, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 141 ; HP
	bigdw 141 ; Max HP
	bigdw 47 ; Atk
	bigdw 47 ; Def
	bigdw 53 ; Spd
	bigdw 82 ; SAtk
	bigdw 63 ; SDef
	db "RANTA-N@@@@"

	dw ESPEON
	db SPECIALSPECS
	dw PSYCHIC_M, SWIFT, TOXIC, SHADOW_BALL

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 14, 15, 15, 7 ; DVs
	db 10, 20, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 83 ; HP
	bigdw 83 ; Max HP
	bigdw 52 ; Atk
	bigdw 50 ; Def
	bigdw 98 ; Spd
	bigdw 106 ; SAtk
	bigdw 66 ; SDef
	db "E-HUi@@@@@@"

	dw TENTACRUEL
	db LEFTOVERS
	dw ICE_BEAM, TOXIC, SLUDGE_BOMB, SURF

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 14, 15, 14 ; DVs
	db 10, 10, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 112 ; HP
	bigdw 112 ; Max HP
	bigdw 56 ; Atk
	bigdw 52 ; Def
	bigdw 74 ; Spd
	bigdw 80 ; SAtk
	bigdw 85 ; SDef
	db "DOKUKURAGE@"

	dw GENGAR
	db SITRUS_BERRY
	dw WILL_O_WISP, HEX, NIGHT_SHADE, GIGA_DRAIN

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 7, 15, 7 ; DVs
	db 15, 10, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 85 ; HP
	bigdw 85 ; Max HP
	bigdw 53 ; Atk
	bigdw 45 ; Def
	bigdw 98 ; Spd
	bigdw 106 ; SAtk
	bigdw 54 ; SDef
	db "GENGA-@@@@@"

	dw URSARING
	db SITRUS_BERRY
	dw RETURN, PROTECT, ROAR, THUNDERPUNCH

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 7, 4, 7 ; DVs
	db 20, 10, 20, 15 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 120 ; HP
	bigdw 120 ; Max HP
	bigdw 106 ; Atk
	bigdw 54 ; Def
	bigdw 40 ; Spd
	bigdw 54 ; SAtk
	bigdw 54 ; SDef
	db "RINGUMA@@@@"

	dw FEAROW
	db BRIGHTPOWDER
	dw MIRROR_MOVE, DRILL_RUN, AERIAL_ACE, PAYBACK

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 7, 7, 7 ; DVs
	db 20, 10, 20, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 94 ; HP
	bigdw 94 ; Max HP
	bigdw 88 ; Atk
	bigdw 48 ; Def
	bigdw 92 ; Spd
	bigdw 45 ; SAtk
	bigdw 45 ; SDef
	db "ONIDORIRU@@"

	dw PRIMEAPE
	db LUM_BERRY
	dw LOW_SWEEP, CROSS_CHOP, THUNDERPUNCH, PAYBACK

	dw 0 ; OT ID
	dt 27000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 7, 6, 7 ; DVs
	db 20, 5, 15, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 30 ; Level
	db 0, 0 ; Status
	bigdw 86 ; HP
	bigdw 86 ; Max HP
	bigdw 91 ; Atk
	bigdw 45 ; Def
	bigdw 84 ; Spd
	bigdw 45 ; SAtk
	bigdw 51 ; SDef
	db "OKORIZARU@@"


BattleTowerMons4:

	dw TAUROS
	db SITRUS_BERRY
	dw RETURN, GIGA_IMPACT, EARTHQUAKE, IRON_TAIL

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 15, 14 ; DVs
	db 20, 5, 10, 15 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 121 ; HP
	bigdw 121 ; Max HP
	bigdw 122 ; Atk
	bigdw 91 ; Def
	bigdw 130 ; Spd
	bigdw 48 ; SAtk
	bigdw 72 ; SDef
	db "KENTAROSU@@"

	dw KINGDRA
	db SCOPE_LENS
	dw SURF, DRAGON_PULSE, HYPER_BEAM, ICE_BEAM

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 13 ; DVs
	db 15, 15, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 122 ; HP
	bigdw 122 ; Max HP
	bigdw 91 ; Atk
	bigdw 91 ; Def
	bigdw 108 ; Spd
	bigdw 116 ; SAtk
	bigdw 91 ; SDef
	db "KINGUDORA@@"

	dw SNORLAX
	db QUICK_CLAW
	dw ATTRACT, BODY_SLAM, RETURN, EARTHQUAKE

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 14, 13, 13, 13 ; DVs
	db 15, 15, 20, 10 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 208 ; HP
	bigdw 208 ; Max HP
	bigdw 129 ; Atk
	bigdw 67 ; Def
	bigdw 39 ; Spd
	bigdw 57 ; SAtk
	bigdw 103 ; SDef
	db "KABIGON@@@@"

	dw LAPRAS
	db LEFTOVERS
	dw THUNDERBOLT, ICE_BEAM, CONFUSE_RAY, SURF

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 11 ; DVs
	db 15, 10, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 189 ; HP
	bigdw 189 ; Max HP
	bigdw 85 ; Atk
	bigdw 79 ; Def
	bigdw 64 ; Spd
	bigdw 107 ; SAtk
	bigdw 89 ; SDef
	db "RAPURASU@@@"

	dw STEELIX
	db LEFTOVERS
	dw SANDSTORM, IRON_TAIL, EARTHQUAKE, TOXIC

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 14, 15, 13, 11 ; DVs
	db 10, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 141 ; HP
	bigdw 141 ; Max HP
	bigdw 84 ; Atk
	bigdw 202 ; Def
	bigdw 39 ; Spd
	bigdw 57 ; SAtk
	bigdw 65 ; SDef
	db "HAGANE-RU@@"

	dw ALAKAZAM
	db KINGS_ROCK
if DEF(_FAITHFUL)
	dw PSYCHIC_M, THUNDERPUNCH, RECOVER, FIRE_PUNCH
elif DEF(_NOPSS)
	dw PSYCHIC_M, THUNDERPUNCH, RECOVER, FIRE_PUNCH
else
	dw PSYCHIC_M, MOONBLAST, RECOVER, SHADOW_BALL
endc

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 14, 15 ; DVs
if DEF(_FAITHFUL)
	db 10, 15, 20, 15 ; PP
elif DEF(_NOPSS)
	db 10, 15, 20, 15 ; PP
else
	db 10, 15, 20, 20
endc
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 104 ; HP
	bigdw 104 ; Max HP
	bigdw 55 ; Atk
	bigdw 51 ; Def
	bigdw 137 ; Spd
	bigdw 150 ; SAtk
	bigdw 93 ; SDef
	db "HU-DEiN@@@@"

	dw STARMIE
	db LEFTOVERS
	dw BLIZZARD, THUNDERBOLT, SURF, PSYCHIC_M

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 11, 14 ; DVs
	db 5, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 109 ; HP
	bigdw 109 ; Max HP
	bigdw 77 ; Atk
	bigdw 83 ; Def
	bigdw 131 ; Spd
	bigdw 121 ; SAtk
	bigdw 84 ; SDef
	db "SUTA-MI-@@@"

	dw WOBBUFFET
	db LEFTOVERS
	dw COUNTER, MIRROR_COAT, SAFEGUARD, DESTINY_BOND

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 252, 0, 128, 0, 0, 128 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 15, 14, 7 ; DVs
	db 20, 20, 25, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 285 ; HP
	bigdw 285 ; Max HP
	bigdw 40 ; Atk
	bigdw 76 ; Def
	bigdw 42 ; Spd
	bigdw 37 ; SAtk
	bigdw 69 ; SDef
	db "SO-NANSU@@@"

	dw GOLEM
	db FOCUS_SASH
	dw EXPLOSION, EARTHQUAKE, GYRO_BALL, ROCK_SLIDE

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 0, 252, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 14, 13 ; DVs
	db 5, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 124 ; HP
	bigdw 124 ; Max HP
	bigdw 136 ; Atk
	bigdw 144 ; Def
	bigdw 60 ; Spd
	bigdw 59 ; SAtk
	bigdw 67 ; SDef
	db "GORO-NIya@@"

	dw SCIZOR
	db SCOPE_LENS
	dw SLASH, STEEL_WING, PURSUIT, X_SCISSOR

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 13, 15, 14 ; DVs
	db 20, 25, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 142 ; HP
	bigdw 142 ; Max HP
	bigdw 143 ; Atk
	bigdw 95 ; Def
	bigdw 69 ; Spd
	bigdw 60 ; SAtk
	bigdw 80 ; SDef
	db "HAtuSAMU@@@"

	dw DUGTRIO
	db KINGS_ROCK
	dw EARTHQUAKE, GIGA_IMPACT, ROCK_SLIDE, MUD_SLAP

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 14, 11, 11 ; DVs
	db 10, 5, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 86 ; HP
	bigdw 86 ; Max HP
	bigdw 127 ; Atk
	bigdw 56 ; Def
	bigdw 143 ; Spd
	bigdw 53 ; SAtk
	bigdw 69 ; SDef
	db "DAGUTORIO@@"

	dw SLOWBRO
	db LUM_BERRY
	dw SURF, PSYCHIC_M, CALM_MIND, BLIZZARD

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 0, 0, 252, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 15, 12, 15 ; DVs
	db 15, 10, 20, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 136 ; HP
	bigdw 136 ; Max HP
	bigdw 73 ; Atk
	bigdw 130 ; Def
	bigdw 38 ; Spd
	bigdw 122 ; SAtk
	bigdw 81 ; SDef
	db "YADORAN@@@@"

	dw PORYGON2
	db LEFTOVERS
	dw NASTY_PLOT, CONVERSION, PSYCHIC_M, THUNDERBOLT

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 252, 0, 128, 0, 0, 128 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 12, 14, 15 ; DVs
	db 30, 30, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 150 ; HP
	bigdw 150 ; Max HP
	bigdw 77 ; Atk
	bigdw 99 ; Def
	bigdw 64 ; Spd
	bigdw 101 ; SAtk
	bigdw 105 ; SDef
	db "PORIGON2@@@"

	dw ARCANINE
	db CHARCOAL
	dw FLAME_WHEEL, DIG, EXTREMESPEED, ROAR

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 14, 11, 11 ; DVs
	db 25, 10, 5, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 130 ; HP
	bigdw 130 ; Max HP
	bigdw 130 ; Atk
	bigdw 80 ; Def
	bigdw 115 ; Spd
	bigdw 93 ; SAtk
	bigdw 77 ; SDef
	db "UINDEi@@@@@"

	dw FORRETRESS
	db LEFTOVERS
	dw RAPID_SPIN, PROTECT, TOXIC, SANDSTORM

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 252, 0, 0, 0, 0, 252 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 10, 7, 15 ; DVs
	db 40, 10, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 144 ; HP
	bigdw 144 ; Max HP
	bigdw 89 ; Atk
	bigdw 125 ; Def
	bigdw 58 ; Spd
	bigdw 49 ; SAtk
	bigdw 106 ; SDef
	db "HUoRETOSU@@"

	dw OMASTAR
	db SITRUS_BERRY
	dw ICE_BEAM, SURF, ANCIENTPOWER, SHELL_SMASH

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 15, 7 ; DVs
	db 10, 15, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 155 ; HP
	bigdw 155 ; Max HP
	bigdw 63 ; Atk
	bigdw 147 ; Def
	bigdw 61 ; Spd
	bigdw 127 ; SAtk
	bigdw 66 ; SDef
	db "OMUSUTA-@@@"

	dw CHARIZARD
	db KINGS_ROCK
	dw FLAMETHROWER, DRAGON_PULSE, AIR_SLASH, SLASH

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 14, 15, 14 ; DVs
	db 15, 15, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 120 ; HP
	bigdw 120 ; Max HP
	bigdw 84 ; Atk
	bigdw 78 ; Def
	bigdw 122 ; Spd
	bigdw 128 ; SAtk
	bigdw 84 ; SDef
	db "RIZA-DON@@@"

	dw EXEGGUTOR
	db BRIGHTPOWDER
	dw SLEEP_POWDER, GIGA_DRAIN, PSYCH_UP, CONFUSION

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 7, 14, 7 ; DVs
	db 15, 10, 10, 25 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 161 ; HP
	bigdw 161 ; Max HP
	bigdw 93 ; Atk
	bigdw 78 ; Def
	bigdw 60 ; Spd
	bigdw 135 ; SAtk
	bigdw 70 ; SDef
	db "NAtuSI-@@@@"

	dw HYPNO
	db BRIGHTPOWDER
	dw PSYCHIC_M, MOONBLAST, NASTY_PLOT, SHADOW_BALL

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 7, 7, 10 ; DVs
	db 10, 15, 30, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 154 ; HP
	bigdw 154 ; Max HP
	bigdw 73 ; Atk
	bigdw 70 ; Def
	bigdw 65 ; Spd
	bigdw 100 ; SAtk
	bigdw 105 ; SDef
	db "SURI-PA-@@@"

	dw MUK
	db QUICK_CLAW
	dw SCREECH, TOXIC, SLUDGE_BOMB, KNOCK_OFF

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 5, 6, 11 ; DVs
	db 40, 10, 10, 20 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 169 ; HP
	bigdw 161 ; Max HP
	bigdw 119 ; Atk
	bigdw 69 ; Def
	bigdw 49 ; Spd
	bigdw 65 ; SAtk
	bigdw 93 ; SDef
	db "BETOBETON@@"

	dw ELECTABUZZ
	db KINGS_ROCK
	dw LIGHT_SCREEN, THUNDERBOLT, PSYCHIC_M, VOLT_SWITCH

	dw 0 ; OT ID
	dt 64000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 5, 7, 7 ; DVs
	db 30, 15, 10, 20 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 40 ; Level
	db 0, 0 ; Status
	bigdw 114 ; HP
	bigdw 114 ; Max HP
	bigdw 77 ; Atk
	bigdw 54 ; Def
	bigdw 119 ; Spd
	bigdw 111 ; SAtk
	bigdw 78 ; SDef
	db "EREBU-@@@@@"


BattleTowerMons5:

	dw KINGDRA
	db SITRUS_BERRY
	dw SURF, HYPER_BEAM, BLIZZARD, DRAGON_PULSE

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 13 ; DVs
	db 15, 5, 5, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 150 ; HP
	bigdw 150 ; Max HP
	bigdw 113 ; Atk
	bigdw 113 ; Def
	bigdw 134 ; Spd
	bigdw 144 ; SAtk
	bigdw 113 ; SDef
	db "KINGUDORA@@"

	dw HOUNDOOM
	db LUM_BERRY
	dw REST, DARK_PULSE, NASTY_PLOT, FLAMETHROWER

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 15, 12 ; DVs
	db 10, 15, 30, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 149 ; HP
	bigdw 149 ; Max HP
	bigdw 108 ; Atk
	bigdw 68 ; Def
	bigdw 146 ; Spd
	bigdw 158 ; SAtk
	bigdw 97 ; SDef
	db "HERUGA-@@@@"

	dw SHUCKLE
	db LEFTOVERS
	dw SANDSTORM, REST, TOXIC, WRAP

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 252, 0, 128, 0, 0, 128 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 13, 15 ; DVs
	db 10, 10, 10, 20 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 126 ; HP
	bigdw 126 ; Max HP
	bigdw 30 ; Atk
	bigdw 264 ; Def
	bigdw 23 ; Spd
	bigdw 30 ; SAtk
	bigdw 266 ; SDef
	db "TUBOTUBO@@@"

	dw SNORLAX
	db CHESTO_BERRY
	dw HYPER_BEAM, EARTHQUAKE, SURF, REST

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 15 ; DVs
	db 5, 10, 15, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 264 ; HP
	bigdw 264 ; Max HP
	bigdw 161 ; Atk
	bigdw 83 ; Def
	bigdw 49 ; Spd
	bigdw 85 ; SAtk
	bigdw 130 ; SDef
	db "KABIGON@@@@"

	dw LAPRAS
	db LEFTOVERS
	dw THUNDERBOLT, SURF, CONFUSE_RAY, BLIZZARD

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 13 ; DVs
	db 15, 15, 10, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 236 ; HP
	bigdw 236 ; Max HP
	bigdw 103 ; Atk
	bigdw 98 ; Def
	bigdw 78 ; Spd
	bigdw 134 ; SAtk
	bigdw 113 ; SDef
	db "RAPURASU@@@"

	dw JOLTEON
	db KINGS_ROCK
	dw THUNDERBOLT, THUNDER_WAVE, SHADOW_BALL, HIDDEN_POWER

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 14, 13, 15, 15 ; DVs
	db 15, 20, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 132 ; HP
	bigdw 132 ; Max HP
	bigdw 84 ; Atk
	bigdw 78 ; Def
	bigdw 181 ; Spd
	bigdw 161 ; SAtk
	bigdw 115 ; SDef
	db "SANDA-SU@@@"

	dw SCIZOR
	db LEFTOVERS
	dw X_SCISSOR, SLASH, AGILITY, METAL_CLAW

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 14, 13 ; DVs
	db 15, 20, 30, 35 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 174 ; HP
	bigdw 174 ; Max HP
	bigdw 179 ; Atk
	bigdw 120 ; Def
	bigdw 84 ; Spd
	bigdw 73 ; SAtk
	bigdw 98 ; SDef
	db "HAtuSAMU@@@"

	dw SLOWKING
	db CHESTO_BERRY
	dw REST, SURF, PSYCHIC_M, NASTY_PLOT

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 13, 14 ; DVs
	db 10, 15, 10, 30 ; PP
	db 15 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 200 ; HP
	bigdw 200 ; Max HP
	bigdw 93 ; Atk
	bigdw 100 ; Def
	bigdw 48 ; Spd
	bigdw 150 ; SAtk
	bigdw 129 ; SDef
	db "YADOKINGU@@"

	dw MACHAMP
	db SITRUS_BERRY
	dw CROSS_CHOP, EARTHQUAKE, FIRE_BLAST, THUNDERPUNCH

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 14, 12 ; DVs
	db 5, 10, 5, 15 ; PP
	db 13 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 194 ; HP
	bigdw 194 ; Max HP
	bigdw 181 ; Atk
	bigdw 100 ; Def
	bigdw 74 ; Spd
	bigdw 82 ; SAtk
	bigdw 102 ; SDef
	db "KAIRIKI-@@@"

	dw STARMIE
	db SCOPE_LENS
	dw PSYCHIC_M, RECOVER, THUNDERBOLT, SURF

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 15, 15 ; DVs
	db 10, 20, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 135 ; HP
	bigdw 135 ; Max HP
	bigdw 95 ; Atk
	bigdw 105 ; Def
	bigdw 166 ; Spd
	bigdw 151 ; SAtk
	bigdw 105 ; SDef
	db "SUTA-MI-@@@"

	dw DUGTRIO
	db KINGS_ROCK
	dw EARTHQUAKE, SLASH, GIGA_IMPACT, ROCK_SLIDE

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 7, 15, 14 ; DVs
	db 10, 20, 5, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 109 ; HP
	bigdw 109 ; Max HP
	bigdw 157 ; Atk
	bigdw 62 ; Def
	bigdw 182 ; Spd
	bigdw 69 ; SAtk
	bigdw 89 ; SDef
	db "DAGUTORIO@@"

	dw ELECTRODE
	db LUM_BERRY
	dw THUNDERBOLT, EXPLOSION, SUCKER_PUNCH, GYRO_BALL

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 0, 252, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 13, 15, 11 ; DVs
	db 15, 5, 5, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 135 ; HP
	bigdw 135 ; Max HP
	bigdw 127 ; Atk
	bigdw 88 ; Def
	bigdw 160 ; Spd
	bigdw 127 ; SAtk
	bigdw 96 ; SDef
	db "MARUMAIN@@@"

	dw AERODACTYL
	db LIFE_ORB
	dw ROCK_SLIDE, EARTHQUAKE, AERIAL_ACE, IRON_TAIL

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 13, 13 ; DVs
	db 15, 10, 20, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 155 ; HP
	bigdw 155 ; Max HP
	bigdw 156 ; Atk
	bigdw 83  ; Def
	bigdw 179 ; Spd
	bigdw 78  ; SAtk
	bigdw 93  ; SDef
	db "PUTERA@@@@@"

	dw CROBAT
	db LEFTOVERS
	dw CONFUSE_RAY, VENOSHOCK, AIR_CUTTER, TOXIC

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 14, 15, 15, 15 ; DVs
	db 10, 10, 25, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 152 ; HP
	bigdw 152 ; Max HP
	bigdw 109 ; Atk
	bigdw 100 ; Def
	bigdw 181 ; Spd
	bigdw 121 ; SAtk
	bigdw 100 ; SDef
	db "KUROBAtuTO@"

	dw ZAPDOS
	db LUM_BERRY
	dw DRILL_PECK, THUNDERBOLT, THUNDER_WAVE, ROOST

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 13, 14 ; DVs
	db 20, 15, 20, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 164 ; HP
	bigdw 164 ; Max HP
	bigdw 110 ; Atk
	bigdw 103 ; Def
	bigdw 149 ; Spd
	bigdw 175 ; SAtk
	bigdw 109 ; SDef
	db "SANDA-@@@@@"

	dw SKARMORY
	db SITRUS_BERRY
	dw ROOST, DRILL_PECK, STEEL_WING, TOXIC

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 7, 14, 13 ; DVs
	db 10, 20, 25, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 179 ; HP
	bigdw 179 ; Max HP
	bigdw 108 ; Atk
	bigdw 183 ; Def
	bigdw 89 ; Spd
	bigdw 58 ; SAtk
	bigdw 88 ; SDef
	db "EA-MUDO@@@@"

	dw FORRETRESS
	db LEFTOVERS
	dw SANDSTORM, TOXIC, EXPLOSION, SWAGGER

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 13, 13 ; DVs
	db 10, 10, 5, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 181 ; HP
	bigdw 181 ; Max HP
	bigdw 139 ; Atk
	bigdw 160 ; Def
	bigdw 78 ; Spd
	bigdw 58 ; SAtk
	bigdw 98 ; SDef
	db "HUoRETOSU@@"

	dw STEELIX
	db LEER
	dw SANDSTORM, IRON_TAIL, REST, EARTHQUAKE

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 13 ; DVs
	db 10, 15, 10, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 181 ; HP
	bigdw 181 ; Max HP
	bigdw 103 ; Atk
	bigdw 249 ; Def
	bigdw 48 ; Spd
	bigdw 73 ; SAtk
	bigdw 83 ; SDef
	db "HAGANE-RU@@"

	dw FARIGIRAF
	db SCOPE_LENS
	dw RETURN, SHADOW_BALL, PSYCHIC_M, EARTHQUAKE

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 252, 128, 0, 0, 128, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 5, 5, 5, 6 ; DVs
	db 20, 15, 10, 10 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 225 ; HP
	bigdw 225 ; Max HP
	bigdw 116 ; Atk
	bigdw 80 ; Def
	bigdw 70 ; Spd
	bigdw 127 ; SAtk
	bigdw 81 ; SDef
	db "KIRINRIKI@@"

	dw GYARADOS
	db LUM_BERRY
	dw GIGA_IMPACT, WATERFALL, RAIN_DANCE, THUNDER

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 5, 6, 5 ; DVs
	db 5, 15, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 168 ; HP
	bigdw 168 ; Max HP
	bigdw 168 ; Atk
	bigdw 89 ; Def
	bigdw 123 ; Spd
	bigdw 70 ; SAtk
	bigdw 110 ; SDef
	db "GIyaRADOSU@"

	dw ARTICUNO
	db SITRUS_BERRY
	dw BLIZZARD, HAIL, ROOST, DUALWINGBEAT

	dw 0 ; OT ID
	dt 125000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 5, 5, 5, 6 ; DVs
	db 5, 10, 10, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 50 ; Level
	db 0, 0 ; Status
	bigdw 164 ; HP
	bigdw 164 ; Max HP
	bigdw 95 ; Atk
	bigdw 110 ; Def
	bigdw 126 ; Spd
	bigdw 137 ; SAtk
	bigdw 136 ; SDef
	db "HURI-ZA-@@@"


BattleTowerMons6:

	dw KINGDRA
	db LEFTOVERS
	dw DRAGON_PULSE, SURF, HYPER_BEAM, BLIZZARD

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 13 ; DVs
	db 15, 15, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 178 ; HP
	bigdw 178 ; Max HP
	bigdw 134 ; Atk
	bigdw 134 ; Def
	bigdw 160 ; Spd
	bigdw 172 ; SAtk
	bigdw 134 ; SDef
	db "KINGUDORA@@"

	dw TYRANITAR
	db SITRUS_BERRY
	dw CRUNCH, EARTHQUAKE, ROCK_SLIDE, CLOSE_COMBAT

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 13 ; DVs
	db 15, 10, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 243 ; HP
	bigdw 243 ; Max HP
	bigdw 221 ; Atk
	bigdw 152 ; Def
	bigdw 95 ; Spd
	bigdw 134 ; SAtk
	bigdw 140 ; SDef
	db "BANGIRASU@@"

	dw HOUNDOOM
	db LUM_BERRY
	dw FLAMETHROWER, DARK_PULSE, NASTY_PLOT, REST

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 14, 15 ; DVs
	db 15, 15, 30, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 175 ; HP
	bigdw 175 ; Max HP
	bigdw 131 ; Atk
	bigdw 78 ; Def
	bigdw 173 ; Spd
	bigdw 192 ; SAtk
	bigdw 119 ; SDef
	db "HERUGA-@@@@"

	dw PORYGON_Z
	db LIFE_ORB
	dw NASTY_PLOT, THUNDERBOLT, HYPER_BEAM, PSYCHIC_M

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 14 ; DVs
	db 20, 15, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 189 ; HP
	bigdw 189 ; Max HP
	bigdw 123 ; Atk
	bigdw 105 ; Def
	bigdw 166 ; Spd
	bigdw 222 ; SAtk
	bigdw 112 ; SDef
	db "PORIGON2@@@"

	dw MACHAMP
	db QUICK_CLAW
	dw FIRE_PUNCH, CROSS_CHOP, THUNDERPUNCH, EARTHQUAKE

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 15 ; DVs
	db 15, 5, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 231 ; HP
	bigdw 231 ; Max HP
	bigdw 216 ; Atk
	bigdw 116 ; Def
	bigdw 87 ; Spd
	bigdw 101 ; SAtk
	bigdw 125 ; SDef
	db "KAIRIKI-@@@"

	dw ZAPDOS
	db CHESTO_BERRY
	dw REST, DRILL_PECK, THUNDERBOLT, THUNDER_WAVE

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 15, 13 ; DVs
	db 10, 20, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 196 ; HP
	bigdw 196 ; Max HP
	bigdw 128 ; Atk
	bigdw 122 ; Def
	bigdw 180 ; Spd
	bigdw 208 ; SAtk
	bigdw 128 ; SDef
	db "SANDA-@@@@@"

	dw WOBBUFFET
	db LEFTOVERS
	dw COUNTER, MIRROR_COAT, DESTINY_BOND, SAFEGUARD

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 252, 0, 128, 0, 0, 128 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 13 ; DVs
	db 20, 20, 5, 25 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 423 ; HP
	bigdw 423 ; Max HP
	bigdw 62 ; Atk
	bigdw 109 ; Def
	bigdw 61 ; Spd
	bigdw 60 ; SAtk
	bigdw 109 ; SDef
	db "SO-NANSU@@@"

	dw AERODACTYL
	db LICK
	dw ROCK_SLIDE, AERIAL_ACE, EARTHQUAKE, BITE

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 13, 13 ; DVs
	db 10, 20, 10, 25 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 184 ; HP
	bigdw 184 ; Max HP
	bigdw 186 ; Atk
	bigdw 98  ; Def
	bigdw 214 ; Spd
	bigdw 92  ; SAtk
	bigdw 110 ; SDef
	db "PUTERA@@@@@"

	dw DRAGONITE
	db SPECIALSPECS
	dw DRAGON_PULSE, ICE_BEAM, THUNDERBOLT, SURF

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 15, 13 ; DVs
	db 20, 15, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 197 ; HP
	bigdw 197 ; Max HP
	bigdw 181 ; Atk
	bigdw 134 ; Def
	bigdw 156 ; Spd
	bigdw 178 ; SAtk
	bigdw 140 ; SDef
	db "KAIRIyu-@@@"

	dw UMBREON
	db LEFTOVERS
	dw MUD_SLAP, MOONLIGHT, PSYCHIC_M, FAINT_ATTACK

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 15 ; DVs
	db 10, 5, 10, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 237 ; HP
	bigdw 237 ; Max HP
	bigdw 101 ; Atk
	bigdw 190 ; Def
	bigdw 99 ; Spd
	bigdw 95 ; SAtk
	bigdw 179 ; SDef
	db "BURAtuKI-@@"

	dw ARCANINE
	db CHARCOAL
	dw FLARE_BLITZ, CRUNCH, EXTREMESPEED, IRON_TAIL

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 13 ; DVs
	db 15, 15, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 231 ; HP
	bigdw 231 ; Max HP
	bigdw 192 ; Atk
	bigdw 116 ; Def
	bigdw 173 ; Spd
	bigdw 140 ; SAtk
	bigdw 116 ; SDef
	db "UINDEi@@@@@"

	dw SKARMORY
	db LUM_BERRY
	dw STEEL_WING, DRILL_PECK, TOXIC, PROTECT

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 14, 11 ; DVs
	db 25, 20, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 213 ; HP
	bigdw 213 ; Max HP
	bigdw 131 ; Atk
	bigdw 224 ; Def
	bigdw 105 ; Spd
	bigdw 66 ; SAtk
	bigdw 102 ; SDef
	db "EA-MUDO@@@@"

	dw BLISSEY
	db LEFTOVERS
	dw SOFTBOILED, TOXIC, PROTECT, PSYCHIC_M

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 252, 0, 0, 0, 0, 252 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 12, 13 ; DVs
	db 10, 10, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 429 ; HP
	bigdw 429 ; Max HP
	bigdw 35 ; Atk
	bigdw 30 ; Def
	bigdw 85 ; Spd
	bigdw 110 ; SAtk
	bigdw 220 ; SDef
	db "HAPINASU@@@"

	dw SNORLAX
	db LEFTOVERS
	dw ROCK_SLIDE, SURF, BODY_SLAM, EARTHQUAKE

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 15, 12 ; DVs
	db 10, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 316 ; HP
	bigdw 316 ; Max HP
	bigdw 192 ; Atk
	bigdw 96 ; Def
	bigdw 59 ; Spd
	bigdw 97 ; SAtk
	bigdw 151 ; SDef
	db "KABIGON@@@@"

	dw HERACROSS
	db FOCUS_SASH
	dw REVERSAL, MEGAHORN, EARTHQUAKE, COUNTER

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 14, 13 ; DVs
	db 15, 10, 10, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 181 ; HP
	bigdw 181 ; Max HP
	bigdw 208 ; Atk
	bigdw 113 ; Def
	bigdw 161 ; Spd
	bigdw 68 ; SAtk
	bigdw 134 ; SDef
	db "HERAKUROSU@"

	dw JYNX
	db SPECIALSPECS
	dw BLIZZARD, PSYCHIC_M, SHADOW_BALL, LOVELY_KISS

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 14, 11 ; DVs
	db 5, 10, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 188 ; HP
	bigdw 188 ; Max HP
	bigdw 107 ; Atk
	bigdw 77 ; Def
	bigdw 174 ; Spd
	bigdw 206 ; SAtk
	bigdw 138 ; SDef
	db "RU-ZIyuRA@@"

	dw BLASTOISE
	db SITRUS_BERRY
	dw HYDRO_PUMP, FLASH_CANNON, RAPID_SPIN, BLIZZARD

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 14, 15, 14 ; DVs
	db 5, 10, 40, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 214 ; HP
	bigdw 214 ; Max HP
	bigdw 122 ; Atk
	bigdw 141 ; Def
	bigdw 116 ; Spd
	bigdw 161 ; SAtk
	bigdw 147 ; SDef
	db "KAMEtuKUSU@"

	dw RHYPERIOR
	db QUICK_CLAW
	dw EARTHQUAKE, HAMMER_ARM, IRON_HEAD, STONE_EDGE

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 15, 10 ; DVs
	db 10, 10, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 262 ; HP
	bigdw 262 ; Max HP
	bigdw 228 ; Atk
	bigdw 174 ; Def
	bigdw 71 ; Spd
	bigdw 83 ; SAtk
	bigdw 83 ; SDef
	db "SAIDON@@@@@"

	dw SANDSLASH
	db SCOPE_LENS
	dw EARTHQUAKE, SLASH, STONE_EDGE, SWORDS_DANCE

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 7, 6, 7 ; DVs
	db 10, 20, 5, 20 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 175 ; HP
	bigdw 175 ; Max HP
	bigdw 194 ; Atk
	bigdw 145 ; Def
	bigdw 146 ; Spd
	bigdw 67 ; SAtk
	bigdw 103 ; SDef
	db "SANDOPAN@@@"

	dw PARASECT
	db SITRUS_BERRY
	dw SPORE, X_SCISSOR, SUNNY_DAY, SOLAR_BLADE

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 7, 5, 15 ; DVs
	db 15, 15, 5, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 233 ; HP
	bigdw 233 ; Max HP
	bigdw 177 ; Atk
	bigdw 121 ; Def
	bigdw 59 ; Spd
	bigdw 119 ; SAtk
	bigdw 131 ; SDef
	db "PARASEKUTO@"

	dw GOLEM
	db BRIGHTPOWDER
	dw EXPLOSION, EARTHQUAKE, FIRE_PUNCH, STONE_EDGE

	dw 0 ; OT ID
	dt 216000 ; Exp
	db 0, 252, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 6, 5, 7 ; DVs
	db 5, 10, 15, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 60 ; Level
	db 0, 0 ; Status
	bigdw 179 ; HP
	bigdw 179 ; Max HP
	bigdw 195 ; Atk
	bigdw 206 ; Def
	bigdw 77 ; Spd
	bigdw 79 ; SAtk
	bigdw 91 ; SDef
	db "GORO-NIya@@"


BattleTowerMons7:

	dw JOLTEON
	db LUM_BERRY
	dw THUNDERBOLT, HYPER_BEAM, SHADOW_BALL, ROAR

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 14, 15 ; DVs
	db 15, 5, 15, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 189 ; HP
	bigdw 189 ; Max HP
	bigdw 117 ; Atk
	bigdw 104 ; Def
	bigdw 250 ; Spd
	bigdw 224 ; SAtk
	bigdw 159 ; SDef
	db "SANDA-SU@@@"

	dw VAPOREON
	db LEFTOVERS
	dw BLIZZARD, SHADOW_BALL, SURF, HAZE

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ;padding
	dn 11, 15, 14, 15 ; DVs
	db 5, 15, 15, 30 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 324 ; HP
	bigdw 324 ; Max HP
	bigdw 111 ; Atk
	bigdw 110 ; Def
	bigdw 115 ; Spd
	bigdw 224 ; SAtk
	bigdw 159 ; SDef
	db "SIyaWA-ZU@@"

	dw UMBREON
	db LEFTOVERS
	dw FAINT_ATTACK, MOONLIGHT, PSYCH_UP, TOXIC

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 13 ; DVs
	db 20, 5, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 278 ; HP
	bigdw 278 ; Max HP
	bigdw 114 ; Atk
	bigdw 221 ; Def
	bigdw 114 ; Spd
	bigdw 107 ; SAtk
	bigdw 205 ; SDef
	db "BURAtuKI-@@"

	dw BLISSEY
	db LEFTOVERS
	dw COUNTER, SOFTBOILED, SHADOW_BALL, THUNDERBOLT

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 252, 0, 0, 0, 0, 252 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 14, 13 ; DVs
	db 20, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 499 ; HP
	bigdw 499 ; Max HP
	bigdw 37 ; Atk
	bigdw 40 ; Def
	bigdw 101 ; Spd
	bigdw 128 ; SAtk
	bigdw 256 ; SDef
	db "HAPINASU@@@"

	dw SNORLAX
	db LEFTOVERS
	dw ROCK_SLIDE, EARTHQUAKE, BLIZZARD, RETURN

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 13 ; DVs
	db 10, 10, 5, 20 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 369 ; HP
	bigdw 369 ; Max HP
	bigdw 221 ; Atk
	bigdw 114 ; Def
	bigdw 65 ; Spd
	bigdw 114 ; SAtk
	bigdw 177 ; SDef
	db "KABIGON@@@@"

	dw HOUNDOOM
	db KINGS_ROCK
	dw DARK_PULSE, FLAMETHROWER, NASTY_PLOT, ROAR

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 12, 13 ; DVs
	db 15, 15, 30, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 203 ; HP
	bigdw 203 ; Max HP
	bigdw 149 ; Atk
	bigdw 93 ; Def
	bigdw 198 ; Spd
	bigdw 221 ; SAtk
	bigdw 135 ; SDef
	db "HERUGA-@@@@"

	dw TYRANITAR
	db LEFTOVERS
	dw EARTHQUAKE, CRUNCH, ROCK_SLIDE, CLOSE_COMBAT

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 11, 13, 15 ; DVs
	db 10, 15, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 285 ; HP
	bigdw 285 ; Max HP
	bigdw 254 ; Atk
	bigdw 174 ; Def
	bigdw 108 ; Spd
	bigdw 159 ; SAtk
	bigdw 166 ; SDef
	db "BANGIRASU@@"

	dw ZAPDOS
	db SITRUS_BERRY
	dw THUNDERBOLT, DRILL_PECK, THUNDER_WAVE, ROOST

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 11, 13, 15 ; DVs
	db 15, 20, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 227 ; HP
	bigdw 227 ; Max HP
	bigdw 149 ; Atk
	bigdw 139 ; Def
	bigdw 207 ; Spd
	bigdw 245 ; SAtk
	bigdw 152 ; SDef
	db "SANDA-@@@@@"

	dw EXEGGUTOR
	db LUM_BERRY
	dw REST, EXPLOSION, PSYCHIC_M, GIGA_DRAIN

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 14, 13 ; DVs
	db 10, 5, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 275 ; HP
	bigdw 275 ; Max HP
	bigdw 156 ; Atk
	bigdw 142 ; Def
	bigdw 101 ; Spd
	bigdw 243 ; SAtk
	bigdw 128 ; SDef
	db "NAtuSI-@@@@"

	dw UMBREON
	db LEFTOVERS
	dw MOONLIGHT, FAINT_ATTACK, PSYCHIC_M, SHADOW_BALL

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 11 ; DVs
	db 5, 20, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 275 ; HP
	bigdw 275 ; Max HP
	bigdw 117 ; Atk
	bigdw 221 ; Def
	bigdw 115 ; Spd
	bigdw 104 ; SAtk
	bigdw 202 ; SDef
	db "BURAtuKI-@@"

	dw GYARADOS
	db BRIGHTPOWDER
	dw WAVE_CRASH, BOUNCE, GIGA_IMPACT, DRAGON_DANCE

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 11, 14, 15 ; DVs
	db 10, 5, 5, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 231 ; HP
	bigdw 231 ; Max HP
	bigdw 242 ; Atk
	bigdw 131 ; Def
	bigdw 182 ; Spd
	bigdw 110 ; SAtk
	bigdw 166 ; SDef
	db "GIyaRADOSU@"

	dw QUAGSIRE
	db LUM_BERRY
	dw EARTHQUAKE, WATERFALL, SLUDGE_BOMB, IRON_TAIL

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 14, 13, 13 ; DVs
	db 10, 15, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 300 ; HP
	bigdw 300 ; Max HP
	bigdw 200 ; Atk
	bigdw 157 ; Def
	bigdw 86 ; Spd
	bigdw 128 ; SAtk
	bigdw 128 ; SDef
	db "NUO-@@@@@@@"

	dw URSALUNA
	db SCOPE_LENS
	dw SLASH, EARTHQUAKE, CRUNCH, THUNDERPUNCH

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 13 ; DVs
	db 20, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 324 ; HP
	bigdw 324 ; Max HP
	bigdw 266 ; Atk
	bigdw 170 ; Def
	bigdw 94 ; Spd
	bigdw 86 ; SAtk
	bigdw 135 ; SDef
	db "RINGUMA@@@@"

	dw MR__MIME
	db KINGS_ROCK
	dw REFLECT, MOONBLAST, PSYCHIC_M, ENCORE

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 13, 15, 11 ; DVs
	db 20, 15, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 229 ; HP
	bigdw 229 ; Max HP
	bigdw 111 ; Atk
	bigdw 128 ; Def
	bigdw 152 ; Spd
	bigdw 218 ; SAtk
	bigdw 188 ; SDef
	db "BARIYA-DO@@"

	dw ANNIHILAPE
	db QUICK_CLAW
	dw CROSS_CHOP, SHADOW_PUNCH, THUNDERPUNCH, ROCK_SLIDE

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 13, 15, 15 ; DVs
	db 5, 20, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 255 ; HP
	bigdw 255 ; Max HP
	bigdw 225 ; Atk
	bigdw 135 ; Def
	bigdw 196 ; Spd
	bigdw 96 ; SAtk
	bigdw 152 ; SDef
	db "OKORIZARU@@"

	dw FARIGIRAF
	db SITRUS_BERRY
	dw AGILITY, BATON_PASS, CRUNCH, EARTHQUAKE

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 14, 15, 13 ; DVs
	db 30, 40, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 311 ; HP
	bigdw 311 ; Max HP
	bigdw 196 ; Atk
	bigdw 122 ; Def
	bigdw 110 ; Spd
	bigdw 163 ; SAtk
	bigdw 121 ; SDef
	db "KIRINRIKI@@"

	dw HITMONLEE
	db FOCUS_BAND
	dw HI_JUMP_KICK, EARTHQUAKE, ROCK_SLIDE, BLAZE_KICK

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 14, 15, 14 ; DVs
	db 10, 10, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 192 ; HP
	bigdw 192 ; Max HP
	bigdw 238 ; Atk
	bigdw 98 ; Def
	bigdw 191 ; Spd
	bigdw 73 ; SAtk
	bigdw 178 ; SDef
	db "SAWAMURA-@@"

	dw HERACROSS
	db FOCUS_SASH
	dw REVERSAL, ENDURE, MEGAHORN, EARTHQUAKE

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 7, 15, 7 ; DVs
	db 15, 10, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 213 ; HP
	bigdw 213 ; Max HP
	bigdw 245 ; Atk
	bigdw 119 ; Def
	bigdw 189 ; Spd
	bigdw 70 ; SAtk
	bigdw 147 ; SDef
	db "HERAKUROSU@"

	dw VENUSAUR
	db BRIGHTPOWDER
	dw SUNNY_DAY, SOLARBEAM, SYNTHESIS, SLUDGE_BOMB

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 7, 5, 5 ; DVs
	db 5, 10, 5, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 257 ; HP
	bigdw 257 ; Max HP
	bigdw 129 ; Atk
	bigdw 129 ; Def
	bigdw 124 ; Spd
	bigdw 196 ; SAtk
	bigdw 152 ; SDef
	db "HUSIGIBANA@"

	dw CHARIZARD
	db SCOPE_LENS
	dw SLASH, EARTHQUAKE, AIR_SLASH, FLAMETHROWER

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 5, 6, 5, 5 ; DVs
	db 20, 10, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 204 ; HP
	bigdw 204 ; Max HP
	bigdw 129 ; Atk
	bigdw 122 ; Def
	bigdw 196 ; Spd
	bigdw 208 ; SAtk
	bigdw 131 ; SDef
	db "RIZA-DON@@@"

	dw BLASTOISE
	db SPECIALSPECS
	dw HYDRO_CANNON, ICE_BEAM, HYDRO_PUMP, FLASH_CANNON

	dw 0 ; OT ID
	dt 343000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 7, 7, 7 ; DVs
	db 5, 10, 5, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 70 ; Level
	db 0, 0 ; Status
	bigdw 255 ; HP
	bigdw 255 ; Max HP
	bigdw 131 ; Atk
	bigdw 154 ; Def
	bigdw 124 ; Spd
	bigdw 177 ; SAtk
	bigdw 161 ; SDef
	db "KAMEtuKUSU@"


BattleTowerMons8:

	dw JOLTEON
	db LUM_BERRY
	dw THUNDER_WAVE, THUNDERBOLT, SHADOW_BALL, FLASH_CANNON

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 11 ; DVs
	db 20, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 214 ; HP
	bigdw 214 ; Max HP
	bigdw 133 ; Atk
	bigdw 121 ; Def
	bigdw 285 ; Spd
	bigdw 249 ; SAtk
	bigdw 174 ; SDef
	db "SANDA-SU@@@"

	dw SNORLAX
	db LEFTOVERS
	dw REST, BELLY_DRUM, RETURN, EARTHQUAKE

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 11, 14, 13 ; DVs
	db 10, 10, 20, 10 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 417 ; HP
	bigdw 417 ; Max HP
	bigdw 252 ; Atk
	bigdw 126 ; Def
	bigdw 75 ; Spd
	bigdw 129 ; SAtk
	bigdw 181 ; SDef
	db "KABIGON@@@@"

	dw HOUNDOOM
	db CHESTO_BERRY
	dw REST, DARK_PULSE, FLAMETHROWER, SUNNY_DAY

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 13, 11 ; DVs
	db 10, 15, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 234 ; HP
	bigdw 234 ; Max HP
	bigdw 173 ; Atk
	bigdw 105 ; Def
	bigdw 228 ; Spd
	bigdw 249 ; SAtk
	bigdw 150 ; SDef
	db "HERUGA-@@@@"

	dw TAUROS
	db SITRUS_BERRY
	dw EARTHQUAKE, BODY_SLAM, IRON_TAIL, GIGA_IMPACT

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 13, 14 ; DVs
	db 10, 15, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 232 ; HP
	bigdw 232 ; Max HP
	bigdw 239 ; Atk
	bigdw 177 ; Def
	bigdw 252 ; Spd
	bigdw 91 ; SAtk
	bigdw 139 ; SDef
	db "KENTAROSU@@"

	dw LAPRAS
	db CHESTO_BERRY
	dw REST, SURF, ICE_BEAM, PSYCHIC_M

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 13, 11 ; DVs
	db 10, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 372 ; HP
	bigdw 372 ; Max HP
	bigdw 161 ; Atk
	bigdw 157 ; Def
	bigdw 121 ; Spd
	bigdw 209 ; SAtk
	bigdw 174 ; SDef
	db "RAPURASU@@@"

	dw TYRANITAR
	db LUM_BERRY
	dw REST, CRUNCH, EARTHQUAKE, ROCK_SLIDE

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 13, 11 ; DVs
	db 10, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 324 ; HP
	bigdw 324 ; Max HP
	bigdw 290 ; Atk
	bigdw 205 ; Def
	bigdw 123 ; Spd
	bigdw 174 ; SAtk
	bigdw 182 ; SDef
	db "BANGIRASU@@"

	dw GENGAR
	db NO_ITEM
	dw THUNDERBOLT, SHADOW_BALL, CONFUSE_RAY, THIEF

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 14, 13, 13 ; DVs
	db 15, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 203 ; HP
	bigdw 203 ; Max HP
	bigdw 129 ; Atk
	bigdw 123 ; Def
	bigdw 252 ; Spd
	bigdw 284 ; SAtk
	bigdw 145 ; SDef
	db "GENGA-@@@@@"

	dw FORRETRESS
	db LEFTOVERS
	dw EXPLOSION, TOXIC, GYRO_BALL, SWAGGER

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 13 ; DVs
	db 5, 10, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 281 ; HP
	bigdw 281 ; Max HP
	bigdw 223 ; Atk
	bigdw 229 ; Def
	bigdw 123 ; Spd
	bigdw 89 ; SAtk
	bigdw 153 ; SDef
	db "HUoRETOSU@@"

	dw KINGDRA
	db CHESTO_BERRY
	dw REST, SURF, BLIZZARD, DRAGON_PULSE

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 14, 13 ; DVs
	db 10, 15, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 230 ; HP
	bigdw 230 ; Max HP
	bigdw 181 ; Atk
	bigdw 174 ; Def
	bigdw 213 ; Spd
	bigdw 228 ; SAtk
	bigdw 177 ; SDef
	db "KINGUDORA@@"

	dw DRAGONITE
	db SITRUS_BERRY
	dw THUNDER_WAVE, DUALWINGBEAT, DRAGON_DANCE, OUTRAGE

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 13 ; DVs
	db 20, 10, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 259 ; HP
	bigdw 259 ; Max HP
	bigdw 290 ; Atk
	bigdw 177 ; Def
	bigdw 204 ; Spd
	bigdw 185 ; SAtk
	bigdw 185 ; SDef
	db "KAIRIyu-@@@"

	dw PORYGON_Z
	db LIFE_ORB
	dw PSYCHIC_M, RECOVER, HYPER_BEAM, THUNDERBOLT

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 14, 13 ; DVs
	db 10, 20, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 247 ; HP
	bigdw 247 ; Max HP
	bigdw 154 ; Atk
	bigdw 125 ; Def
	bigdw 222 ; Spd
	bigdw 292 ; SAtk
	bigdw 146 ; SDef
	db "PORIGON2@@@"

	dw JYNX
	db SPECIALSPECS
	dw LOVELY_KISS, BLIZZARD, DREAM_EATER, PSYCHIC_M

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 13, 15 ; DVs
	db 10, 5, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 250 ; HP
	bigdw 250 ; Max HP
	bigdw 138 ; Atk
	bigdw 101 ; Def
	bigdw 228 ; Spd
	bigdw 279 ; SAtk
	bigdw 189 ; SDef
	db "RU-ZIyuRA@@"

	dw MANTINE
	db SITRUS_BERRY
	dw RAIN_DANCE, CONFUSE_RAY, HURRICANE, HYDRO_PUMP

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 13, 12 ; DVs
	db 5, 10, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 298 ; HP
	bigdw 298 ; Max HP
	bigdw 89 ; Atk
	bigdw 141 ; Def
	bigdw 137 ; Spd
	bigdw 202 ; SAtk
	bigdw 248 ; SDef
	db "MANTAIN@@@@"

	dw SKARMORY
	db QUICK_CLAW
	dw STEEL_WING, DRILL_PECK, SPIKES, TOXIC

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 14, 15 ; DVs
	db 25, 20, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 281 ; HP
	bigdw 281 ; Max HP
	bigdw 169 ; Atk
	bigdw 300 ; Def
	bigdw 139 ; Spd
	bigdw 93 ; SAtk
	bigdw 1841 ; SDef
	db "EA-MUDO@@@@"

	dw MOLTRES
	db CHARCOAL
	dw FLAMETHROWER, SKY_ATTACK, SOLARBEAM, SUNNY_DAY

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 10, 14 ; DVs
	db 15, 5, 25, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 253 ; HP
	bigdw 253 ; Max HP
	bigdw 185 ; Atk
	bigdw 169 ; Def
	bigdw 215 ; Spd
	bigdw 277 ; SAtk
	bigdw 163 ; SDef
	db "HUaIYA-@@@@"

	dw AERODACTYL
	db LIFE_ORB
	dw ROCK_SLIDE, AERIAL_ACE, EARTHQUAKE, ROAR

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 14, 13 ; DVs
	db 10, 20, 10, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 238 ; HP
	bigdw 238 ; Max HP
	bigdw 247 ; Atk
	bigdw 133 ; Def
	bigdw 285 ; Spd
	bigdw 121 ; SAtk
	bigdw 145 ; SDef
	db "PUTERA@@@@@"

	dw ELECTRODE
	db KINGS_ROCK
	dw VOLT_TACKLE, EXPLOSION, SUCKER_PUNCH, TOXIC

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 15, 14, 15 ; DVs
	db 15, 5, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 206 ; HP
	bigdw 206 ; Max HP
	bigdw 207 ; Atk
	bigdw 141 ; Def
	bigdw 301 ; Spd
	bigdw 157 ; SAtk
	bigdw 157 ; SDef
	db "MARUMAIN@@@"

	dw DUGTRIO
	db SCOPE_LENS
	dw SLASH, EARTHQUAKE, THIEF, MUD_SLAP

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 13, 13 ; DVs
	db 20, 10, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 170 ; HP
	bigdw 170 ; Max HP
	bigdw 249 ; Atk
	bigdw 105 ; Def
	bigdw 285 ; Spd
	bigdw 105 ; SAtk
	bigdw 137 ; SDef
	db "DAGUTORIO@@"

	dw VICTREEBEL
	db QUICK_CLAW
	dw POWER_WHIP, POISON_JAB, SWORDS_DANCE, SLEEP_POWDER

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 5, 6, 5 ; DVs
	db 10, 20, 20, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 238 ; HP
	bigdw 238 ; Max HP
	bigdw 234 ; Atk
	bigdw 117 ; Def
	bigdw 177 ; Spd
	bigdw 173 ; SAtk
	bigdw 125 ; SDef
	db "UTUBOtuTO@@"

	dw PINSIR
	db SITRUS_BERRY
	dw PINCIRFLURRY, SUPERPOWER, X_SCISSOR, SWORDS_DANCE

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 5, 6, 4 ; DVs
	db 10, 5, 15, 20 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 213 ; HP
	bigdw 213 ; Max HP
	bigdw 266 ; Atk
	bigdw 173 ; Def
	bigdw 201 ; Spd
	bigdw 99 ; SAtk
	bigdw 123 ; SDef
	db "KAIROSU@@@@"

	dw GRANBULL
	db BRIGHTPOWDER
	dw EARTHQUAKE, SWORDS_DANCE, PLAY_ROUGH, FIRE_PUNCH

	dw 0 ; OT ID
	dt 512000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 7, 5, 7 ; DVs
	db 10, 20, 10, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 80 ; Level
	db 0, 0 ; Status
	bigdw 316 ; HP
	bigdw 316 ; Max HP
	bigdw 258 ; Atk
	bigdw 136 ; Def
	bigdw 125 ; Spd
	bigdw 112 ; SAtk
	bigdw 136 ; SDef
	db "GURANBURU@@"


BattleTowerMons9:

	dw UMBREON
	db LEFTOVERS
	dw FAINT_ATTACK, MUD_SLAP, MOONLIGHT, CONFUSE_RAY

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 13 ; DVs
	db 20, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 351 ; HP
	bigdw 351 ; Max HP
	bigdw 149 ; Atk
	bigdw 283 ; Def
	bigdw 147 ; Spd
	bigdw 136 ; SAtk
	bigdw 262 ; SDef
	db "BURAtuKI-@@"

	dw DRAGONITE
	db QUICK_CLAW
	dw DUALWINGBEAT, DRAGON_DANCE, OUTRAGE, ROOST

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 13 ; DVs
	db 10, 20, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 287 ; HP
	bigdw 287 ; Max HP
	bigdw 329 ; Atk
	bigdw 199 ; Def
	bigdw 230 ; Spd
	bigdw 208 ; SAtk
	bigdw 208 ; SDef
	db "KAIRIyu-@@@"

	dw STARMIE
	db LEFTOVERS
	dw RECOVER, THUNDERBOLT, SURF, PSYCHIC_M

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 13, 13 ; DVs
	db 20, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 235 ; HP
	bigdw 235 ; Max HP
	bigdw 163 ; Atk
	bigdw 185 ; Def
	bigdw 292 ; Spd
	bigdw 265 ; SAtk
	bigdw 181 ; SDef
	db "SUTA-MI-@@@"

	dw CLOYSTER
	db LEFTOVERS
	dw EXPLOSION, ICICLE_CRASH, WATERFALL, SHELL_SMASH

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 0, 252, 0, 0, 0, 252 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 11, 13, 15 ; DVs
	db 5, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 217 ; HP
	bigdw 217 ; Max HP
	bigdw 256 ; Atk
	bigdw 348 ; Def
	bigdw 154 ; Spd
	bigdw 185 ; SAtk
	bigdw 169 ; SDef
	db "PARUSIeN@@@"

	dw CROBAT
	db SITRUS_BERRY
	dw BRAVE_BIRD, HAZE, GUNK_SHOT, LEECH_LIFE

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 12, 15 ; DVs
	db 15, 30, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 276 ; HP
	bigdw 276 ; Max HP
	bigdw 250 ; Atk
	bigdw 172 ; Def
	bigdw 317 ; Spd
	bigdw 158 ; SAtk
	bigdw 176 ; SDef
	db "KUROBAtuTO@"

	dw PORYGON_Z
	db LIFE_ORB
	dw THUNDERBOLT, PSYCHIC_M, RECOVER, HYPER_BEAM

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 13 ; DVs
	db 15, 10, 20, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 276 ; HP
	bigdw 276 ; Max HP
	bigdw 176 ; Atk
	bigdw 154 ; Def
	bigdw 249 ; Spd
	bigdw 328 ; SAtk
	bigdw 140 ; SDef
	db "PORIGON2@@@"

	dw KINGDRA
	db LEFTOVERS
	dw DRAGON_PULSE, SURF, HYPER_BEAM, ICE_BEAM

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 13, 14 ; DVs
	db 15, 15, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 260 ; HP
	bigdw 260 ; Max HP
	bigdw 199 ; Atk
	bigdw 203 ; Def
	bigdw 238 ; Spd
	bigdw 257 ; SAtk
	bigdw 201 ; SDef
	db "KINGUDORA@@"

	dw TYRANITAR
	db QUICK_CLAW
	dw CLOSE_COMBAT, CRUNCH, EARTHQUAKE, ROCK_SLIDE

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 13, 14 ; DVs
	db 5, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 361 ; HP
	bigdw 361 ; Max HP
	bigdw 326 ; Atk
	bigdw 230 ; Def
	bigdw 138 ; Spd
	bigdw 201 ; SAtk
	bigdw 210 ; SDef
	db "BANGIRASU@@"

	dw LAPRAS
	db CHESTO_BERRY
	dw REST, SURF, THUNDERBOLT, PSYCHIC_M

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 13, 14, 15 ; DVs
	db 10, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 414 ; HP
	bigdw 414 ; Max HP
	bigdw 177 ; Atk
	bigdw 172 ; Def
	bigdw 138 ; Spd
	bigdw 241 ; SAtk
	bigdw 203 ; SDef
	db "RAPURASU@@@"

	dw ESPEON
	db SPECIALSPECS
	dw PSYCHIC_M, SHADOW_BALL, SUNNY_DAY, MORNING_SUN

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 15, 14 ; DVs
	db 10, 15, 5, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 242 ; HP
	bigdw 242 ; Max HP
	bigdw 145 ; Atk
	bigdw 136 ; Def
	bigdw 286 ; Spd
	bigdw 320 ; SAtk
	bigdw 201 ; SDef
	db "E-HUi@@@@@@"

	dw MACHAMP
	db QUICK_CLAW
	dw CROSS_CHOP, VITAL_THROW, FIRE_PUNCH, EARTHQUAKE

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 14, 13 ; DVs
	db 5, 10, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 342 ; HP
	bigdw 342 ; Max HP
	bigdw 319 ; Atk
	bigdw 172 ; Def
	bigdw 129 ; Spd
	bigdw 145 ; SAtk
	bigdw 181 ; SDef
	db "KAIRIKI-@@@"

	dw SNORLAX
	db LUM_BERRY
	dw FIRE_BLAST, SURF, EARTHQUAKE, HYPER_BEAM

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 14, 15, 13 ; DVs
	db 5, 15, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 464 ; HP
	bigdw 464 ; Max HP
	bigdw 230 ; Atk
	bigdw 147 ; Def
	bigdw 86 ; Spd
	bigdw 202 ; SAtk
	bigdw 226 ; SDef
	db "KABIGON@@@@"

	dw ARCANINE
	db CHESTO_BERRY
	dw SUNNY_DAY, FLARE_BLITZ, EXTREMESPEED, REST

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 13, 14 ; DVs
	db 5, 15, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 287 ; HP
	bigdw 287 ; Max HP
	bigdw 283 ; Atk
	bigdw 176 ; Def
	bigdw 256 ; Spd
	bigdw 210 ; SAtk
	bigdw 174 ; SDef
	db "UINDEi@@@@@"

	dw BLISSEY
	db LEFTOVERS
	dw SOLARBEAM, SUNNY_DAY, SOFTBOILED, FIRE_BLAST

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 252, 0, 0, 0, 0, 252 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 13, 15, 14 ; DVs
	db 10, 5, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 640 ; HP
	bigdw 640 ; Max HP
	bigdw 42 ; Atk
	bigdw 46 ; Def
	bigdw 131 ; Spd
	bigdw 165 ; SAtk
	bigdw 329 ; SDef
	db "HAPINASU@@@"

	dw HOUNDOOM
	db BRIGHTPOWDER
	dw FLAMETHROWER, DARK_PULSE, SUNNY_DAY, SOLARBEAM

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 11, 15, 14 ; DVs
	db 15, 15, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 260 ; HP
	bigdw 260 ; Max HP
	bigdw 190 ; Atk
	bigdw 114 ; Def
	bigdw 259 ; Spd
	bigdw 284 ; SAtk
	bigdw 174 ; SDef
	db "HERUGA-@@@@"

	dw SKARMORY
	db LEFTOVERS
	dw SANDSTORM, STEEL_WING, TOXIC, DRILL_PECK

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 15, 7 ; DVs
	db 10, 25, 10, 20 ; PP
	db 255 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 353 ; HP
	bigdw 353 ; Max HP
	bigdw 211 ; Atk
	bigdw 378 ; Def
	bigdw 175 ; Spd
	bigdw 99 ; SAtk
	bigdw 159 ; SDef
	db "EA-MUDO@@@@"

	dw SHUCKLE
	db LEFTOVERS
	dw TOXIC, WRAP, PROTECT, ENCORE

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 252, 0, 128, 0, 0, 128 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 15, 13 ; DVs
	db 10, 20, 10, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 219 ; HP
	bigdw 219 ; Max HP
	bigdw 50 ; Atk
	bigdw 471 ; Def
	bigdw 41 ; Spd
	bigdw 46 ; SAtk
	bigdw 471 ; SDef
	db "TUBOTUBO@@@"

	dw FLAREON
	db LEFTOVERS
	dw FLARE_BLITZ, EARTHQUAKE, WILL_O_WISP, THUNDER_FANG

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 7, 15, 7 ; DVs
	db 15, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 300 ; HP
	bigdw 300 ; Max HP
	bigdw 322 ; Atk
	bigdw 125 ; Def
	bigdw 149 ; Spd
	bigdw 188 ; SAtk
	bigdw 215 ; SDef
	db "BU-SUTA-@@@"

	dw MILTANK
	db LEFTOVERS
	dw MILK_DRINK, EARTHQUAKE, ATTRACT, BODY_SLAM

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 4, 7, 5, 7 ; DVs
	db 10, 10, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 283 ; HP
	bigdw 283 ; Max HP
	bigdw 212 ; Atk
	bigdw 206 ; Def
	bigdw 250 ; Spd
	bigdw 98 ; SAtk
	bigdw 143 ; SDef
	db "MIRUTANKU@@"

	dw TAUROS
	db PINK_BOW
	dw THUNDERBOLT, GIGA_IMPACT, ATTRACT, EARTHQUAKE

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 6, 5, 7, 6 ; DVs
	db 15, 5, 15, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 245 ; HP
	bigdw 245 ; Max HP
	bigdw 252 ; Atk
	bigdw 185 ; Def
	bigdw 272 ; Spd
	bigdw 87 ; SAtk
	bigdw 141 ; SDef
	db "KENTAROSU@@"

	dw MUK
	db QUICK_CLAW
	dw TOXIC, GUNK_SHOT, ATTRACT, KNOCK_OFF

	dw 0 ; OT ID
	dt 729000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 5, 5, 5, 5 ; DVs
	db 10, 5, 15, 20 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 90 ; Level
	db 0, 0 ; Status
	bigdw 372 ; HP
	bigdw 372 ; Max HP
	bigdw 259 ; Atk
	bigdw 149 ; Def
	bigdw 104 ; Spd
	bigdw 131 ; SAtk
	bigdw 194 ; SDef
	db "BETOBETON@@"


BattleTowerMons10:

	dw HOUNDOOM
	db CHESTO_BERRY
	dw DARK_PULSE, FLAMETHROWER, ROAR, REST

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 13 ; DVs
	db 15, 15, 20, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 286 ; HP
	bigdw 286 ; Max HP
	bigdw 215 ; Atk
	bigdw 131 ; Def
	bigdw 286 ; Spd
	bigdw 314 ; SAtk
	bigdw 191 ; SDef
	db "HERUGA-@@@@"

	dw MACHAMP
	db QUICK_CLAW
	dw CROSS_CHOP, EARTHQUAKE, GIGA_IMPACT, VITAL_THROW

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 15 ; DVs
	db 5, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 379 ; HP
	bigdw 379 ; Max HP
	bigdw 358 ; Atk
	bigdw 191 ; Def
	bigdw 143 ; Spd
	bigdw 165 ; SAtk
	bigdw 205 ; SDef
	db "KAIRIKI-@@@"

	dw KINGDRA
	db LEFTOVERS
	dw SURF, DRAGON_PULSE, REST, TOXIC

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 252, 0, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 15, 15, 14 ; DVs
	db 15, 15, 10, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 351 ; HP
	bigdw 351 ; Max HP
	bigdw 221 ; Atk
	bigdw 288 ; Def
	bigdw 205 ; Spd
	bigdw 223 ; SAtk
	bigdw 223 ; SDef
	db "KINGUDORA@@"

	dw JOLTEON
	db BRIGHTPOWDER
	dw THUNDERBOLT, ROAR, THUNDER_WAVE, SHADOW_BALL

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 15, 14 ; DVs
	db 15, 20, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 268 ; HP
	bigdw 268 ; Max HP
	bigdw 161 ; Atk
	bigdw 155 ; Def
	bigdw 358 ; Spd
	bigdw 316 ; SAtk
	bigdw 223 ; SDef
	db "SANDA-SU@@@"

	dw TAUROS
	db KINGS_ROCK
	dw GIGA_IMPACT, EARTHQUAKE, IRON_TAIL, THUNDERBOLT

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 15 ; DVs
	db 5, 10, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 286 ; HP
	bigdw 286 ; Max HP
	bigdw 298 ; Atk
	bigdw 221 ; Def
	bigdw 316 ; Spd
	bigdw 115 ; SAtk
	bigdw 175 ; SDef
	db "KENTAROSU@@"

	dw ARCANINE
	db LEFTOVERS
	dw FLARE_BLITZ, EXTREMESPEED, IRON_TAIL, CRUNCH

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 14, 15 ; DVs
	db 15, 5, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 316 ; HP
	bigdw 316 ; Max HP
	bigdw 314 ; Atk
	bigdw 191 ; Def
	bigdw 286 ; Spd
	bigdw 235 ; SAtk
	bigdw 195 ; SDef
	db "UINDEi@@@@@"

	dw CHARIZARD
	db SCOPE_LENS
	dw FLAMETHROWER, NASTY_PLOT, HYPER_BEAM, AIR_SLASH

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 14, 13, 15 ; DVs
	db 15, 30, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 288 ; HP
	bigdw 288 ; Max HP
	bigdw 203 ; Atk
	bigdw 189 ; Def
	bigdw 294 ; Spd
	bigdw 316 ; SAtk
	bigdw 205 ; SDef
	db "RIZA-DON@@@"

	dw ELECTRODE
	db BRIGHTPOWDER
	dw VOLT_TACKLE, SUCKER_PUNCH, EXPLOSION, MIRROR_COAT

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 14, 15 ; DVs
	db 15, 5, 5, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 256 ; HP
	bigdw 256 ; Max HP
	bigdw 258 ; Atk
	bigdw 167 ; Def
	bigdw 376 ; Spd
	bigdw 195 ; SAtk
	bigdw 195 ; SDef
	db "MARUMAIN@@@"

	dw RHYPERIOR
	db LEFTOVERS
	dw HAMMER_ARM, EARTHQUAKE, IRON_HEAD, STONE_EDGE

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 15 ; DVs
	db 10, 10, 15, 5 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 429 ; HP
	bigdw 429 ; Max HP
	bigdw 378 ; Atk
	bigdw 291 ; Def
	bigdw 113 ; Spd
	bigdw 145 ; SAtk
	bigdw 145 ; SDef
	db "SAIDON@@@@@"

	dw STEELIX
	db LEFTOVERS
	dw EARTHQUAKE, IRON_HEAD, SWAGGER, CRUNCH

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 13, 14 ; DVs
	db 10, 15, 15, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 351 ; HP
	bigdw 351 ; Max HP
	bigdw 268 ; Atk
	bigdw 431 ; Def
	bigdw 91 ; Spd
	bigdw 143 ; SAtk
	bigdw 163 ; SDef
	db "HAGANE-RU@@"

	dw HONCHKROW
	db LEFTOVERS
	dw DRILL_PECK, STEEL_WING, NIGHT_SLASH, ROOST

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 12, 13 ; DVs
	db 20, 25, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 399 ; HP
	bigdw 399 ; Max HP
	bigdw 348 ; Atk
	bigdw 145 ; Def
	bigdw 171 ; Spd
	bigdw 251 ; SAtk
	bigdw 145 ; SDef
	db "ONIDORIRU@@"

	dw MISMAGIUS
	db SPECIALSPECS
	dw PERISH_SONG, MEAN_LOOK, PAIN_SPLIT, SHADOW_BALL

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 0, 0, 0, 252, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 13, 14, 15 ; DVs
	db 5, 5, 20, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 256 ; HP
	bigdw 256 ; Max HP
	bigdw 147 ; Atk
	bigdw 151 ; Def
	bigdw 316 ; Spd
	bigdw 318 ; SAtk
	bigdw 255 ; SDef
	db "MUUMA@@@@@@"

	dw WEAVILE
	db SCOPE_LENS
	dw SLASH, ICICLE_CRASH, HAIL, FAINT_ATTACK

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 14, 15 ; DVs
	db 20, 10, 10, 20 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 276 ; HP
	bigdw 276 ; Max HP
	bigdw 338 ; Atk
	bigdw 161 ; Def
	bigdw 346 ; Spd
	bigdw 125 ; SAtk
	bigdw 205 ; SDef
	db "NIyu-RA@@@@"

	dw SCIZOR
	db FOCUS_SASH
	dw STEEL_WING, X_SCISSOR, NIGHT_SLASH, TOXIC

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 252, 252, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 15, 14 ; DVs
	db 25, 15, 15, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 341 ; HP
	bigdw 341 ; Max HP
	bigdw 358 ; Atk
	bigdw 227 ; Def
	bigdw 165 ; Spd
	bigdw 143 ; SAtk
	bigdw 193 ; SDef
	db "HAtuSAMU@@@"

	dw BLISSEY
	db LEFTOVERS
	dw THUNDERBOLT, BLIZZARD, FIRE_BLAST, SOFTBOILED

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 252, 0, 0, 0, 0, 252 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 15, 14 ; DVs
	db 15, 5, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 711 ; HP
	bigdw 711 ; Max HP
	bigdw 51 ; Atk
	bigdw 51 ; Def
	bigdw 145 ; Spd
	bigdw 183 ; SAtk
	bigdw 366 ; SDef
	db "HAPINASU@@@"

	dw GARCHOMP
	db LIFE_ORB
	dw EARTHQUAKE, SWORDS_DANCE, DRAGON_RUSH, IRON_HEAD

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 13, 15, 7 ; DVs
	db 10, 20, 10, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 356 ; HP
	bigdw 356 ; Max HP
	bigdw 358 ; Atk
	bigdw 221 ; Def
	bigdw 302 ; Spd
	bigdw 179 ; SAtk
	bigdw 189 ; SDef
	db "INOMU-@@@@@"

	dw EXEGGUTOR
	db QUICK_CLAW
	dw PSYCHIC_M, TOXIC, EXPLOSION, GIGA_DRAIN

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 14, 15, 14 ; DVs
	db 10, 10, 5, 10 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 383 ; HP
	bigdw 383 ; Max HP
	bigdw 225 ; Atk
	bigdw 203 ; Def
	bigdw 145 ; Spd
	bigdw 346 ; SAtk
	bigdw 183 ; SDef
	db "NAtuSI-@@@@"

	dw OMASTAR
	db LEFTOVERS
	dw SURF, JURASSICBEAM, BLIZZARD, SHELL_SMASH

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 15, 11, 14, 7 ; DVs
	db 15, 10, 5, 15 ; PP
	db 100 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 369 ; HP
	bigdw 369 ; Max HP
	bigdw 155 ; Atk
	bigdw 227 ; Def
	bigdw 143 ; Spd
	bigdw 312 ; SAtk
	bigdw 159 ; SDef
	db "OMUSUTA-@@@"

	dw GOLEM
	db BRIGHTPOWDER
	dw EXPLOSION, EARTHQUAKE, ROCK_SLIDE, GYRO_BALL

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 0, 252, 252, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 5, 4, 6 ; DVs
	db 5, 10, 10, 5 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 296 ; HP
	bigdw 296 ; Max HP
	bigdw 322 ; Atk
	bigdw 338 ; Def
	bigdw 123 ; Spd
	bigdw 127 ; SAtk
	bigdw 147 ; SDef
	db "GORO-NIya@@"

	dw HITMONCHAN
	db FOCUS_BAND
	dw CLOSE_COMBAT, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 0, 252, 0, 252, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 6, 7, 7, 6 ; DVs
	db 5, 15, 15, 15 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 262 ; HP
	bigdw 262 ; Max HP
	bigdw 290 ; Atk
	bigdw 177 ; Def
	bigdw 234 ; Spd
	bigdw 87 ; SAtk
	bigdw 237 ; SDef
	db "EBIWARA-@@@"

	dw LANTURN
	db QUICK_CLAW
	dw SURF, RAIN_DANCE, THUNDER, CONFUSE_RAY

	dw 0 ; OT ID
	dt 1000000 ; Exp
	db 252, 0, 0, 0, 252, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 7, 6, 5, 7 ; DVs
	db 15, 5, 10, 10 ; PP
	db 0 ; Happiness
	db 0, 0, 0 ; Pokerus, Caught data
	db 100 ; Level
	db 0, 0 ; Status
	bigdw 445 ; HP
	bigdw 445 ; Max HP
	bigdw 135 ; Atk
	bigdw 133 ; Def
	bigdw 149 ; Spd
	bigdw 254 ; SAtk
	bigdw 191 ; SDef
	db "RANTA-N@@@@"
