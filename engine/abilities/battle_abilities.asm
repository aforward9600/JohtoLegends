SetPlayerAbility::
	ld a, [wCurBattleMon]
	ld hl, wPartyMon1CaughtAbility
	call GetPartyLocation
	ld a, [wBattleMonSpecies]
	ld c, a
	call GetAbility
	ld [wPlayerAbility], a
	ret

SetEnemyAbility::
	ld a, [wBattleMode]
	dec a
	jr z, .WildAbilities

	ld a, 0
	jr .FinishEnemyAbility

.WildAbilities
	call Random
	jr z, .HiddenAbility

	call Random
	cp 50 percent + 1
	jr c, .secondability

	ld a, 0
	jr .FinishEnemyAbility

.secondability
	ld a, 1
	jr .FinishEnemyAbility

.HiddenAbility
	ld a, 2
.FinishEnemyAbility
	ld [wEnemyMonAbility], a
	ld hl, wEnemyMonAbility
	ld a, [wEnemyMonSpecies]
	ld c, a
	call GetAbility
	ld [wEnemyAbility], a
	ret
