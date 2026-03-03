BattleCommand_BloodMoon:
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerTurn
	ld a, 1
	ld [wEnemyBloodMoon], a
	ret
.PlayerTurn
	ld a, 1
	ld [wPlayerBloodMoon], a
	ret

ResetBloodMoon:
	ldh a, [hBattleTurn]
	and a
	jr z, .PlayerTurn
	xor a
	ld [wEnemyBloodMoon], a
	ret
.PlayerTurn
	xor a
	ld [wPlayerBloodMoon], a
	ret