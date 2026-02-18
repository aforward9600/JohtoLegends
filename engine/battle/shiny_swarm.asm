GenerateShinySwarm:
	call Random
	cp 7
	jr nc, .trynext
	ld hl, wEnemyMonForm
	ld a, [hl]
	or CAUGHT_SHINY_MASK
	ld [hl], a
	jr .UpdateDVsSwarm
.trynext:
	call Random
	cp 7
	jr nc, .skipshineswarm
	ld hl, wEnemyMonForm
	ld a, [hl]
	or CAUGHT_SHINY_MASK
	ld [hl], a

.skipshineswarm:

.UpdateDVsSwarm:
; Input DVs in register bc
; 	Need to do gender next
	farcall SetEnemyAbility
	ret
