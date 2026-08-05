BattleCommand_ClearHazards:
; clearhazards

	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	bit SUBSTATUS_LEECH_SEED, [hl]
	jr z, .not_leeched
	res SUBSTATUS_LEECH_SEED, [hl]
	ld hl, ShedLeechSeedText
	call StdBattleTextbox
.not_leeched

	ld hl, wPlayerSpikes
	ld de, wPlayerWrapCount
	ld bc, wPlayerToxicSpikes
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens_wrap
	ld hl, wEnemySpikes
	ld de, wEnemyWrapCount
	ld bc, wEnemyToxicSpikes
.got_screens_wrap
	ld a, [hl]
	and a
	jr z, .no_spikes
	xor a
	ld [hl], a
	ld hl, BlewSpikesText
	push de
	call StdBattleTextbox
	pop de
.no_spikes

	ld a, [bc]
	and a
	jr z, .no_toxic_spikes

	xor a
	ld [hl], a
	ld hl, BlewToxicSpikesText
	push de
	call StdBattleTextbox
	pop de
.no_toxic_spikes

	ld a, [de]
	and a
	ret z
	xor a
	ld [de], a
	ld hl, ReleasedByText
	call StdBattleTextbox

	ld hl, wPlayerStealthRocks
	ldh a, [hBattleTurn]
	and a
	jr z, .got_stealth_rock
	ld hl, wEnemyStealthRocks
.got_stealth_rock
	ld a, [hl]
	and a
	ret z
	xor a
	ld [hl], a
	ld hl, RemovedStealthRockText
	jp StdBattleTextbox
