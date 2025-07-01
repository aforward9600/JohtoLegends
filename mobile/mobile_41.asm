; These functions deal with miscellaneous statistics
; which were used for Trainer Rankings in Pokémon News.

; Copies certain values at the time the player enters the Hall of Fame.
StubbedTrainerRankings_HallOfFame2::
StubbedTrainerRankings_MagikarpLength:
StubbedTrainerRankings_BugContestScore:
StubbedTrainerRankings_AddToSlotsWinStreak:
StubbedTrainerRankings_EndSlotsWinStreak:
StubbedTrainerRankings_AddToSlotsPayouts:
StubbedTrainerRankings_AddToBattlePayouts:
StubbedTrainerRankings_StepCount:
StubbedTrainerRankings_TMsHMsTaught:
StubbedTrainerRankings_Battles:
StubbedTrainerRankings_WildBattles:
StubbedTrainerRankings_TrainerBattles:
StubbedTrainerRankings_Unused1:
StubbedTrainerRankings_HallOfFame::
StubbedTrainerRankings_WildMonsCaught:
StubbedTrainerRankings_HookedEncounters:
StubbedTrainerRankings_EggsHatched:
StubbedTrainerRankings_MonsEvolved:
StubbedTrainerRankings_FruitPicked:
StubbedTrainerRankings_Healings:
StubbedTrainerRankings_MysteryGift:
StubbedTrainerRankings_Trades:
StubbedTrainerRankings_Fly:
StubbedTrainerRankings_Surf:
StubbedTrainerRankings_Waterfall:
StubbedTrainerRankings_WhiteOuts:
StubbedTrainerRankings_LuckyNumberShow:
StubbedTrainerRankings_PhoneCalls:
StubbedTrainerRankings_LinkBattles:
StubbedTrainerRankings_Splash:
StubbedTrainerRankings_TreeEncounters:
StubbedTrainerRankings_ColosseumWins: ; win
StubbedTrainerRankings_ColosseumLosses: ; lose
StubbedTrainerRankings_ColosseumDraws: ; draw
; Counts uses of both Selfdestruct and Explosion.
StubbedTrainerRankings_Selfdestruct:
	ret

StubbedTrainerRankings_Increment4Byte:
	push bc
	ld bc, 3
	jr StubbedTrainerRankings_Increment

StubbedTrainerRankings_Increment3Byte:
	push bc
	ld bc, 2
	jr StubbedTrainerRankings_Increment

StubbedTrainerRankings_Increment2Byte:
	push bc
	ld bc, 1
	jr StubbedTrainerRankings_Increment

; Increments a big-endian value of bc + 1 bytes at hl
StubbedTrainerRankings_Increment:
	ld a, BANK(sTrainerRankings)
	call GetSRAMBank
	push hl
	push de
	ld e, c
	inc e
.asm_106136
	ld a, [hli]
	inc a
	jr nz, .asm_10613d
	dec e
	jr nz, .asm_106136

.asm_10613d
	pop de
	pop hl
	jr z, .asm_10614d
	add hl, bc
.asm_106142
	inc [hl]
	jr nz, .asm_10614d
	ld a, c
	and a
	jr z, .asm_10614d
	dec hl
	dec c
	jr .asm_106142

.asm_10614d
	call UpdateTrainerRankingsChecksum
	call CloseSRAM
	pop bc
	ret

; Used when SRAM bank 5 isn’t already loaded — what’s the point of this?
UpdateTrainerRankingsChecksum2:
	ret
	ld a, BANK(sTrainerRankings)
	call GetSRAMBank
	call UpdateTrainerRankingsChecksum
	jp CloseSRAM

UpdateTrainerRankingsChecksum:
	push de
	call CalculateTrainerRankingsChecksum
	ld hl, sTrainerRankingsChecksum
	ld [hl], d
	inc hl
	ld [hl], e
	pop de
	ret

CalculateTrainerRankingsChecksum:
	push bc
	ld hl, sTrainerRankings
	ld bc, sTrainerRankingsChecksum - sTrainerRankings
	xor a
	ld de, 0
.asm_106179
	ld a, e
	add [hl]
	ld e, a
	jr nc, .asm_10617f
	inc d

.asm_10617f
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .asm_106179
	pop bc
	ret

BackupMobileEventIndex:
	ld a, BANK(sMobileEventIndex)
	call GetSRAMBank
	ld a, [sMobileEventIndex]
	push af
	ld a, BANK(sMobileEventIndexBackup)
	call GetSRAMBank
	pop af
	ld [sMobileEventIndexBackup], a
	jp CloseSRAM

RestoreMobileEventIndex:
	ld a, BANK(sMobileEventIndexBackup)
	call GetSRAMBank
	ld a, [sMobileEventIndexBackup]
	push af
	ld a, BANK(sMobileEventIndex)
	call GetSRAMBank
	pop af
	ld [sMobileEventIndex], a
	jp CloseSRAM

DeleteMobileEventIndex:
	ld a, BANK(sMobileEventIndex)
	call GetSRAMBank
	xor a
	ld [sMobileEventIndex], a
	jp CloseSRAM

_MobilePrintNum::
; Supports signed 31-bit integers (up to 10 digits)
; b: Bits 0-4 = # bytes
;    Bit 7 = set if negative
; c: Number of digits
; de: highest byte of number to convert
; hl: where to print the converted string
	push bc
	xor a
	ldh [hPrintNumBuffer + 0], a
	ldh [hPrintNumBuffer + 1], a
	ldh [hPrintNumBuffer + 2], a
	ld a, b
	and $f
	cp $1
	jr z, .one_byte
	cp $2
	jr z, .two_bytes
	cp $3
	jr z, .three_bytes
; four bytes
	ld a, [de]
	ldh [hPrintNumBuffer + 0], a
	inc de

.three_bytes
	ld a, [de]
	ldh [hPrintNumBuffer + 1], a
	inc de

.two_bytes
	ld a, [de]
	ldh [hPrintNumBuffer + 2], a
	inc de

.one_byte
	ld a, [de]
	ldh [hPrintNumBuffer + 3], a
	inc de

	push de
	xor a
	ldh [hPrintNumBuffer + 8], a
	ld a, b
	ldh [hPrintNumBuffer + 9], a
	ld a, c
	cp 2
	jr z, .two_digits
	ld de, ._2
	cp 3
	jr z, .three_to_nine_digits
	ld de, ._3
	cp 4
	jr z, .three_to_nine_digits
	ld de, ._4
	cp 5
	jr z, .three_to_nine_digits
	ld de, ._5
	cp 6
	jr z, .three_to_nine_digits
	ld de, ._6
	cp 7
	jr z, .three_to_nine_digits
	ld de, ._7
	cp 8
	jr z, .three_to_nine_digits
	ld de, ._8
	cp 9
	jr z, .three_to_nine_digits
	ld de, ._9

.three_to_nine_digits
	inc de
	inc de
	inc de
	dec a
	dec a

.digit_loop
	push af
	call .Function1062b2
	call .Function1062ff
rept 4
	inc de
endr
	pop af
	dec a
	jr nz, .digit_loop

.two_digits
	ld c, 0
	ldh a, [hPrintNumBuffer + 3]
.mod_ten_loop
	cp 10
	jr c, .simple_divide_done
	sub 10
	inc c
	jr .mod_ten_loop

.simple_divide_done
	ld b, a
	ldh a, [hPrintNumBuffer + 8]
	or c
	ldh [hPrintNumBuffer + 8], a
	jr nz, .create_digit
	call .LoadMinusTenIfNegative
	jr .done

.create_digit
	ld a, "0"
	add c
	ld [hl], a

.done
	call .Function1062ff
	ld a, "0"
	add b
	ld [hli], a
	pop de
	pop bc
	ret

._9	dd 1000000000
._8	dd 100000000
._7	dd 10000000
._6	dd 1000000
._5	dd 100000
._4	dd 10000
._3	dd 1000
._2	dd 100

.Function1062b2:
	ld c, $0
.asm_1062b4
	ld a, [de]
	dec de
	ld b, a
	ldh a, [hPrintNumBuffer + 3]
	sub b
	ldh [hPrintNumBuffer + 7], a
	ld a, [de]
	dec de
	ld b, a
	ldh a, [hPrintNumBuffer + 2]
	sbc b
	ldh [hPrintNumBuffer + 6], a
	ld a, [de]
	dec de
	ld b, a
	ldh a, [hPrintNumBuffer + 1]
	sbc b
	ldh [hPrintNumBuffer + 5], a
	ld a, [de]
	inc de
	inc de
	inc de
	ld b, a
	ldh a, [hPrintNumBuffer + 0]
	sbc b
	ldh [hPrintNumBuffer + 4], a
	jr c, .asm_1062eb
	ldh a, [hPrintNumBuffer + 4]
	ldh [hPrintNumBuffer + 0], a
	ldh a, [hPrintNumBuffer + 5]
	ldh [hPrintNumBuffer + 1], a
	ldh a, [hPrintNumBuffer + 6]
	ldh [hPrintNumBuffer + 2], a
	ldh a, [hPrintNumBuffer + 7]
	ldh [hPrintNumBuffer + 3], a
	inc c
	jr .asm_1062b4

.asm_1062eb
	ldh a, [hPrintNumBuffer + 8]
	or c
	jr z, .LoadMinusTenIfNegative
	ld a, -10
	add c
	ld [hl], a
	ldh [hPrintNumBuffer + 8], a
	ret

.LoadMinusTenIfNegative:
	ldh a, [hPrintNumBuffer + 9]
	bit 7, a
	ret z

	ld [hl], -10
	ret

.Function1062ff:
	ldh a, [hPrintNumBuffer + 9]
	bit 7, a
	jr nz, .asm_10630d
	bit 6, a
	jr z, .asm_10630d
	ldh a, [hPrintNumBuffer + 8]
	and a
	ret z

.asm_10630d
	inc hl
	ret

; functions related to the cable club and various NPC scripts referencing communications

Function106464::
	ld de, GFX_106514
	ld hl, vTiles2 tile $62
	ld c, 9
	ld b, BANK(GFX_106514)
	call Get2bpp
	ld de, $40b0
	ld hl, vTiles2 tile $6b
	ld b, $f ; XXX no graphics at 0f:40b0
	call Get2bpp
	farcall LoadFrame
	ret

GFX_106514:
INCBIN "gfx/unknown/106514.2bpp"
