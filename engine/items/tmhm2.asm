CanLearnTMHMMove:
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
;	push hl
;	farcall PaldeanTaurosCheck
;	jr nc, .NotTauros

;	ld b,b

;	pop hl

;	ld a, [hl]
;	and CAUGHT_FORM_1_MASK
;	jr z, .TrySecond
;	ld hl, TAUROS_P_FIRE
;	jr .GotTauros

;.TrySecond
;	ld a, [hl]
;	and CAUGHT_FORM_2_MASK
;	jr z, .NotTauros
;	ld hl, TAUROS_P_WATER
;.GotTauros
;	ld a, [hl]
;	ld [wCurSpecies], a
;	jr .GotTauros2
;.NotTauros
;	pop hl
.GotTauros2
	call GetBaseData
	ld hl, wBaseTMHM
	push hl

	ld a, [wPutativeTMHMMove]
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld hl, TMHMMoves
.loop
	ld a, [hli]
	or [hl]
	jr z, .end
	dec hl
	ld a, [hli]
	cp c
	ld a, [hli]
	jr nz, .loop
	cp b
	jr nz, .loop

	ld a, l
	sub LOW(TMHMMoves + 2)
	rrca
	ld c, a
	pop hl
	ld b, CHECK_FLAG
	push de
	ld d, 0
	predef SmallFarFlagAction
	pop de
	ret

.end
	pop hl
	ld c, 0
	ret

GetTMHMMove:
	ld a, [wTempTMHM]
	dec a
	add a, a
	ld hl, TMHMMoves
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMoveIDFromIndex
	ld [wTempTMHM], a
	ret

INCLUDE "data/moves/tmhm_moves.asm"
