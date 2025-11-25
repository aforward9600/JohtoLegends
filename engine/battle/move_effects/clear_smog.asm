BattleCommand_ClearSmog:
	ld hl, wPlayerStatLevels
	ldh a, [hBattleTurn]
	and a
	jr nz, .EnemyTurn
	ld hl, wEnemyStatLevels
.EnemyTurn
	ld a, 7
	ld b, wPlayerStatLevelsEnd - wPlayerStatLevels
.next
	ld [hli], a
	dec b
	jr nz, .next
	ldh a, [hBattleTurn]
	push af
	farcall SetEnemyTurn
	farcall CalcEnemyStats
	farcall SetPlayerTurn
	farcall CalcPlayerStats
	pop af
	ldh [hBattleTurn], a
	ld hl, ClearSmogText
	jp StdBattleTextbox
