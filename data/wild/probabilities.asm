mon_prob: MACRO
; percent, index
	db \1, \2 * 3
ENDM

GrassMonProbTable:
	mon_prob 30,  0 ; 30% chance
	mon_prob 50,  1 ; 20% chance
	mon_prob 65,  2 ; 15% chance
	mon_prob 80,  3 ; 15% chance
	mon_prob 90,  4 ; 10% chance
	mon_prob 95,  5 ;  5% chance
	mon_prob 99,  6 ;  4% chance
	mon_prob 100, 7 ;  1% chance

WaterMonProbTable:
	mon_prob 60,  0 ; 60% chance
	mon_prob 80,  1 ; 20% chance
	mon_prob 95,  2 ; 15% chance
	mon_prob 100, 3 ;  5% chance
