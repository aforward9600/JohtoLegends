BattleCommand_GrassKnot:
; BP depends on opponent's weight
	; Get weight
	ldh a, [hBattleTurn]
	and a
	ld a, [wEnemyMonSpecies]
	jr z, .got_opponent_species
	ld a, [wBattleMonSpecies]
.got_opponent_species
	call GetPokemonIndexFromID
	dec hl
	ld d, h
	ld e, l
	add hl, hl
	add hl, de
	ld de, PokedexDataPointerTable
	add hl, de
	ld a, BANK(PokedexDataPointerTable)
	call GetFarByte
	push af
	inc hl
	ld a, BANK(PokedexDataPointerTable)
	call GetFarHalfword
	pop de

.text_loop
	ld a, d
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .text_loop

	ld a, d
	inc hl
	inc hl
	call GetFarHalfword

	; Now hl contains the mon's weight.
	ld d, h
	ld e, l

	ld hl, GrassKnotWeightTable
.weight_loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	sub e
	ld a, [hli]
	sbc d
	jr nc, .weight_loop
.got_power
	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	ld [hl], c
	ret

GrassKnotWeightTable:
	;    BP, weight
	dbw 120, 4407
	dbw 100, 2202
	dbw  80, 1100
	dbw  60, 550
	dbw  40, 218
	dbw  20, 0
