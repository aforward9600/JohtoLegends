SwapTextboxPalettes::
	hlcoord 0, 0
	decoord 0, 0, wAttrMap
	ld b, SCREEN_HEIGHT
.loop
	push bc
	ld c, SCREEN_WIDTH
	call GetBGMapTilePalettes
	pop bc
	dec b
	jr nz, .loop
	ret

ScrollBGMapPalettes::
	ld hl, wBGMapBuffer
	ld de, wBGMapPalBuffer
	; fallthrough
GetBGMapTilePalettes:
.loop
	ld a, [hl]
	push hl
	ld hl, wTilesetPalettes
	add [hl]
	ld l, a
	ld a, [wTilesetPalettes + 1]
	adc 0
	ld h, a
	ld a, [hl]
	pop hl
	ld [de], a
	res 7, [hl]
	inc hl
	inc de
	dec c
	jr nz, .loop
	ret
