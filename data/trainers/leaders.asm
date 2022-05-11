; These lists determine the battle music and victory music, and whether to
; award HAPPINESS_GYMBATTLE for winning.

; Note: CHAMPION and RED are unused for battle music checks, since they are
; accounted for prior to the list check.

GymLeaders:
	db WALKER
	db MILTON
	db KURT
	db ENOKI
	db PRYCE
	db BYRON
	db CHIGUSA
	db MASTER
	db FLORINA
	db MARTHA
	db AGATHA
	db CHAMPION
	db RED
	db GEN_SURGE
; fallthrough
KantoGymLeaders:
	db FLINT
	db MISTY
	db LT_SURGE
	db ERIKA
	db JANINE
	db SABRINA
	db BLAINE
	db GIOVANNI
	db -1
