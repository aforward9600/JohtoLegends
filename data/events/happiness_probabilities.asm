HappinessData_OlderHaircutBrother:
	db $4c, 4, HAPPINESS_YOUNGCUT1 ; 60% chance
	db $80, 5, HAPPINESS_YOUNGCUT2 ; 10% chance
	db $ff, 6, HAPPINESS_OLDERCUT3 ; 50% chance

HappinessData_YoungerHaircutBrother:
	db $9a, 2, HAPPINESS_YOUNGCUT1 ; 60% chance
	db $4c, 3, HAPPINESS_YOUNGCUT2 ; 10% chance
	db $ff, 4, HAPPINESS_YOUNGCUT3 ; 30% chance

HappinessData_DaisysGrooming:
	db $ff, 2, HAPPINESS_GROOMING ; 99.6% chance
