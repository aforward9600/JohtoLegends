BattleCommand_Spikes:
; spikes

	ld hl, wEnemySpikes
	ldh a, [hBattleTurn]
	and a
	jr z, .asm_3768e
	ld hl, wPlayerSpikes
.asm_3768e

; Fails if spikes are already down!

	ld a, [hl]
	and a
	cp 3
	jr z, .failed
	cp 2
	jr z, .ThreeLayers
	cp 1
	jr z, .TwoLayers

; Nothing else stops it from working.

	ld a, 1
	ld [hl], a

.FinishSpikes
	farcall AnimateCurrentMove

	ld hl, SpikesText
	jp StdBattleTextbox

.failed
	farcall FailMove
	ret

.ThreeLayers
	ld a, 3
	ld [hl], a
	jr .FinishSpikes

.TwoLayers
	ld a, 2
	ld [hl], a
	jr .FinishSpikes
