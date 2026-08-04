BattleCommand_ToxicSpikes:
; spikes

	ld hl, wEnemyToxicSpikes
	ldh a, [hBattleTurn]
	and a
	jr z, .asm_3768e
	ld hl, wPlayerToxicSpikes
.asm_3768e

; Fails if spikes are already down!

	ld a, [hl]
	and a
	cp 2
	jr z, .failed
	cp 1
	jr z, .TwoLayers

; Nothing else stops it from working.

	ld a, 1
	ld [hl], a

.FinishSpikes
	farcall AnimateCurrentMove

	ld hl, ToxicSpikesText
	jp StdBattleTextbox

.failed
	farcall FailMove
	ret

.TwoLayers
	ld a, 2
	ld [hl], a
	jr .FinishSpikes
