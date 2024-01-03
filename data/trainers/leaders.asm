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
	db CHAMPION_DRACO
	db CHALLENGER_DAHLIA
	db CHALLENGER_DRACO
	db CHALLENGER_CYNTHIA
	db GEN_SURGE
	db FERROPEXOLA_TRAINER
; fallthrough
KantoGymLeaders:
	db FLINT
	db SENSATIONAL1
	db LT_SURGE
	db ERIKA
	db KOGA
	db SABRINA
	db BLAINE
	db GIOVANNI
	db SENSATIONAL2
	db SENSATIONAL3
	db KARATE_KING
	db -1

VillainBosses:
	db ARIANA
	db MYSTERIOUS
	db ARCHER
	db MADAME_BOSS
	db FED_LEADER
	db -1

DepressedRivals:
	db DEPRESSED_DAHLIA
	db DEPRESSED_DRACO
	db -1