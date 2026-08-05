BattleCommand_StoneAxe:
; stealthrock

	ld hl, wEnemyStealthRocks
	ldh a, [hBattleTurn]
	and a
	jr z, .asm_3768e
	ld hl, wPlayerStealthRocks
.asm_3768e

; Fails if stealth rocks are already down!

	ld a, [hl]
	and a
	ret nz

; Nothing else stops it from working.

	ld a, 1
	ld [hl], a

.FinishSpikes

	ld hl, StealthRocksText
	jp StdBattleTextbox
