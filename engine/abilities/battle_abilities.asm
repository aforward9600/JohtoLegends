SetPlayerAbility::

	ld de, ENGINE_ABILITIES_OFF
	farcall CheckEngineFlag
	jr nc, .NoAbility

	ld a, [wCurBattleMon]
	ld hl, wPartyMon1CaughtAbility
	call GetPartyLocation
	ld a, [wBattleMonSpecies]
	ld c, a
	call GetAbility
.FinishPlayerAbility:
	ld [wPlayerAbility], a
	ret

.NoAbility:
	ld a, NO_ABILITY
	jr .FinishPlayerAbility

SetEnemyAbility::

	ld de, ENGINE_ABILITIES_OFF
	farcall CheckEngineFlag
	jr nc, .NoAbility

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
.FullyFinishEnemyAbility:
	ld [wEnemyAbility], a
	ret

.NoAbility:
	ld a, NO_ABILITY
	jr .FullyFinishEnemyAbility
