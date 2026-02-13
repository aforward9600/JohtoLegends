BattleCommand_RagingBull:
	ld de, wEnemyMonSpecies
	ldh a, [hBattleTurn]
	and a
	jr nz, .GotSpecies
	ld de, wBattleMonSpecies
.GotSpecies
	ld a, [de]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(TAUROS_P)
	if HIGH(TAUROS_P) == 0
		or h
	else
		jr nz, .Normal
		ld a, h
		if HIGH(TAUROS_P) == 1
			dec a
		else
			cp HIGH(TAUROS_P)
		endc
	endc
	jr nz, .Normal
	ld hl, wEnemyMonForm
	ldh a, [hBattleTurn]
	and a
	jr nz, .GotSpecies2
	ld a, [wCurBattleMon]
	ld hl, wPartyMon1Species
	call GetPartyLocation
	ld a, [hl]
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetPartyMonForm
.GotSpecies2
	ld a, [hl]
	and CAUGHT_FORM_1_MASK
	jr z, .Water
	ld a, $2
	ld [wKickCounter], a
	ld b, FIRE
	jr .Finish

.Water
	ld a, [hl]
	and CAUGHT_FORM_2_MASK
	jr z, .Fighting
	ld a, $3
	ld [wKickCounter], a
	ld b, WATER
	jr .Finish

.Fighting
	ld a, $1
	ld [wKickCounter], a
	ld b, FIGHTING
.Finish
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	and TYPE_MASK
	and a
	ret nz
	ld [hl], b
	ret

.Normal
	xor a
	ld [wKickCounter], a
	ret
