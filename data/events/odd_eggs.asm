prob: MACRO
prob_total = prob_total + (\1)
	dw prob_total * $ffff / 100
ENDM

OddEggProbabilities:
prob_total = 0
; Pichu
	prob 8
	prob 1
; Cleffa
	prob 16
	prob 3
; Igglybuff
	prob 16
	prob 3
; Munchlax
	prob 14
	prob 2
; Azurill
	prob 10
	prob 2
; Happiny
	prob 12
	prob 2
; Tyrogue
	prob 10
	prob 1

OddEggSpecies:
	dw PICHU
	dw PICHU
	dw CLEFFA
	dw CLEFFA
	dw IGGLYBUFF
	dw IGGLYBUFF
	dw MUNCHLAX
	dw MUNCHLAX
	dw AZURILL
	dw AZURILL
	dw HAPPINY
	dw HAPPINY
	dw TYROGUE
	dw TYROGUE

OddEggMoves:
	dw THUNDERSHOCK, CHARM, TAIL_WHIP, DIZZY_PUNCH
	dw THUNDERSHOCK, CHARM, TAIL_WHIP, DIZZY_PUNCH
	dw POUND, CHARM, ENCORE, DIZZY_PUNCH
	dw POUND, CHARM, ENCORE, DIZZY_PUNCH
	dw SING, CHARM, DEFENSE_CURL, DIZZY_PUNCH
	dw SING, CHARM, DEFENSE_CURL, DIZZY_PUNCH
	dw DIZZY_PUNCH, DEFENSE_CURL, LICK, METRONOME
	dw DIZZY_PUNCH, DEFENSE_CURL, LICK, METRONOME
	dw WATER_GUN, TAIL_WHIP, DOUBLESLAP, DIZZY_PUNCH
	dw WATER_GUN, TAIL_WHIP, DOUBLESLAP, DIZZY_PUNCH
	dw DIZZY_PUNCH, MINIMIZE, DEFENSE_CURL, MIMIC
	dw DIZZY_PUNCH, MINIMIZE, DEFENSE_CURL, MIMIC
	dw TACKLE, FORESIGHT, FOCUS_ENERGY, DIZZY_PUNCH
	dw TACKLE, FORESIGHT, FOCUS_ENERGY, DIZZY_PUNCH

OddEggs:

	db 0 ; Species, will be filled on load
	db NO_ITEM
	db 0, 0, 0, 0 ; Moves, will be filled on load
	dw 02048 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 13 ; DVs
	db 30, 20, 30, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 18 ; Max HP
	bigdw 10 ; Atk
	bigdw 7 ; Def
	bigdw 12 ; Spd
	bigdw 9 ; SAtk
	bigdw 9 ; SDef
	db "Egg@@@@@@@@"

	db 0 ; Species, will be filled on load
	db NO_ITEM
	db 0, 0, 0, 0 ; Moves, will be filled on load
	dw 00256 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 10, 10, 10 ; DVs
	db 30, 20, 30, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 17 ; Max HP
	bigdw 10 ; Atk
	bigdw 7 ; Def
	bigdw 12 ; Spd
	bigdw 9 ; SAtk
	bigdw 9 ; SDef
	db "Egg@@@@@@@@"

	db 0 ; Species, will be filled on load
	db NO_ITEM
	db 0, 0, 0, 0 ; Moves, will be filled on load
	dw 04096 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 13, 13, 13, 13 ; padding
	dn 0, 0, 0, 0 ; DVs
	db 35, 20, 5, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 21 ; Max HP
	bigdw 8 ; Atk
	bigdw 9 ; Def
	bigdw 7 ; Spd
	bigdw 10 ; SAtk
	bigdw 11 ; SDef
	db "Egg@@@@@@@@"

	db 0 ; Species, will be filled on load
	db NO_ITEM
	db 0, 0, 0, 0 ; Moves, will be filled on load
	dw 00768 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 10, 10, 10 ; DVs
	db 35, 20, 5, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 8 ; Atk
	bigdw 8 ; Def
	bigdw 7 ; Spd
	bigdw 10 ; SAtk
	bigdw 11 ; SDef
	db "Egg@@@@@@@@"

	db 0 ; Species, will be filled on load
	db NO_ITEM
	db 0, 0, 0, 0 ; Moves, will be filled on load
	dw 04096 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 13 ; DVs
	db 15, 20, 40, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 25 ; Max HP
	bigdw 9 ; Atk
	bigdw 7 ; Def
	bigdw 7 ; Spd
	bigdw 10 ; SAtk
	bigdw 8 ; SDef
	db "Egg@@@@@@@@"

	db 0 ; Species, will be filled on load
	db NO_ITEM
	db 0, 0, 0, 0 ; Moves, will be filled on load
	dw 00768 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 10, 10, 10 ; DVs
	db 15, 20, 40, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 24 ; Max HP
	bigdw 9 ; Atk
	bigdw 7 ; Def
	bigdw 7 ; Spd
	bigdw 10 ; SAtk
	bigdw 8 ; SDef
	db "Egg@@@@@@@@"

	db 0 ; Species, will be filled on load
	db NO_ITEM
	db 0, 0, 0, 0 ; Moves, will be filled on load
	dw 03584 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 13 ; DVs
	db 10, 40, 30, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 30 ; Max HP
	bigdw 14 ; Atk
	bigdw 10 ; Def
	bigdw 6 ; Spd
	bigdw 10 ; SAtk
	bigdw 14 ; SDef
	db "Egg@@@@@@@@"

	db 0 ; Species, will be filled on load
	db NO_ITEM
	db 0, 0, 0, 0 ; Moves, will be filled on load
	dw 00512 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 10, 10, 10 ; DVs
	db 10, 40, 30, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 29 ; Max HP
	bigdw 14 ; Atk
	bigdw 10 ; Def
	bigdw 6 ; Spd
	bigdw 10 ; SAtk
	bigdw 14 ; SDef
	db "Egg@@@@@@@@"

	db 0 ; Species, will be filled on load
	db NO_ITEM
	db 0, 0, 0, 0 ; Moves, will be filled on load
	dw 02560 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 13 ; DVs
	db 25, 30, 10, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 21 ; Max HP
	bigdw 10 ; Atk
	bigdw 10 ; Def
	bigdw 8 ; Spd
	bigdw 8 ; SAtk
	bigdw 10 ; SDef
	db "Egg@@@@@@@@"

	db 0 ; Species, will be filled on load
	db NO_ITEM
	db 0, 0, 0, 0 ; Moves, will be filled on load
	dw 00512 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 10, 10, 10 ; DVs
	db 25, 30, 10, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 10 ; Atk
	bigdw 10 ; Def
	bigdw 8 ; Spd
	bigdw 8 ; SAtk
	bigdw 10 ; SDef
	db "Egg@@@@@@@@"

	db 0 ; Species, will be filled on load
	db NO_ITEM
	db 0, 0, 0, 0 ; Moves, will be filled on load
	dw 03072 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 13 ; DVs
	db 10, 10, 40, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 26 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 9 ; Spd
	bigdw 7 ; SAtk
	bigdw 12 ; SDef
	db "Egg@@@@@@@@"

	db 0 ; Species, will be filled on load
	db NO_ITEM
	db 0, 0, 0, 0 ; Moves, will be filled on load
	dw 00512 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 10, 10, 10 ; DVs
	db 10, 10, 40, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 25 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 9 ; Spd
	bigdw 7 ; SAtk
	bigdw 12 ; SDef
	db "Egg@@@@@@@@"

	db 0 ; Species, will be filled on load
	db NO_ITEM
	db 0, 0, 0, 0 ; Moves, will be filled on load
	dw 02560 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 13, 13, 13, 13 ; DVs
	db 35, 40, 30, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 20 ; Max HP
	bigdw 9 ; Atk
	bigdw 9 ; Def
	bigdw 9 ; Spd
	bigdw 9 ; SAtk
	bigdw 9 ; SDef
	db "Egg@@@@@@@@"

	db 0 ; Species, will be filled on load
	db NO_ITEM
	db 0, 0, 0, 0 ; Moves, will be filled on load
	dw 00256 ; OT ID
	dt 125 ; Exp
	db 0, 0, 0, 0, 0, 0 ; EVs
	db 0, 0, 0, 0 ; padding
	dn 11, 10, 10, 10 ; DVs
	db 35, 40, 30, 10 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 5 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 19 ; Max HP
	bigdw 9 ; Atk
	bigdw 9 ; Def
	bigdw 9 ; Spd
	bigdw 9 ; SAtk
	bigdw 9 ; SDef
	db "Egg@@@@@@@@"
