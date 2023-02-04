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
	db PRYCE_2
	db PRYCE_3
	db ENOKI_2
	db ENOKI_3
	db CHIGUSA_2
	db BYRON_2
EliteFour:
	db FLORINA
	db MARTHA
	db AGATHA
	db CHAMPION_DAHLIA
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
VillainBosses:
	db ARIANA
	db MIYAMOTO
	db ARCHER
	db MADAME_BOSS
	db FED_LEADER
	db -1

DepressedRivals:
	db DEPRESSED_DAHLIA
	db DEPRESSED_DRACO
	db -1