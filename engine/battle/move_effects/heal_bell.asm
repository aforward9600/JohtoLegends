BattleCommand_HealBell:
; healbell

	ld de, wPartyMon1Status
	ldh a, [hBattleTurn]
	and a
	jr z, .got_status
	ld de, wOTPartyMon1Status
.got_status
	ld a, BATTLE_VARS_STATUS
	call GetBattleVarAddr
	xor a
	ld [hl], a
	ld h, d
	ld l, e
	ld bc, PARTYMON_STRUCT_LENGTH
	ld d, PARTY_LENGTH
.loop
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .loop
	farcall AnimateCurrentMove

	ld hl, BellChimedText
	call StdBattleTextbox

	ldh a, [hBattleTurn]
	and a
	jr z, .CalcPlayerStats
	jr .CalcEnemyStats

.CalcPlayerStats
	farcall CalcPlayerStats
	ret
.CalcEnemyStats
	farcall CalcEnemyStats
	ret
