; AI_AGGRESSIVE does not discourage these moves
; even if a stronger one is available.

RecklessMoves:
	db EFFECT_MULTI_HIT
	db EFFECT_DOUBLE_HIT
	db EFFECT_POISON_MULTI_HIT
	db EFFECT_TRIPLE_KICK
	db EFFECT_AVALANCHE
	db -1 ; end
