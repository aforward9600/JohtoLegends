_TitleScreen:
	call ClearBGPalettes
	call ClearTileMap
	call DisableLCD
	call ClearSprites

; Turn BG Map update off
	xor a
	ldh [hBGMapMode], a

; Reset timing variables
	ld hl, wJumptableIndex
	ld [hli], a ; wJumptableIndex
	ld [hli], a ; wIntroSceneFrameCounter
	ld [hli], a ; wTitleScreenTimer
	ld [hl], a  ; wTitleScreenTimer + 1

	ldh [hMapAnims], a
	ldh [hSCY], a
	ldh [hSCX], a

	ld hl, vTiles0
	ld bc, $200 tiles
	xor a
	call ByteFill
	farcall ClearSpriteAnims

; VRAM bank 1
	ld a, 1
	ldh [rVBK], a

; Decompress running Suicune gfx
	ld hl, TitleSuicuneGFX
	ld de, vTiles1
	call Decompress

; Clear screen palettes
	hlbgcoord 0, 0
	ld bc, 20 * BG_MAP_WIDTH
	xor a
	call ByteFill

; Fill tile palettes:

; BG Map 1:

; line 0 (copyright)
	hlbgcoord 0, 0, vBGMap1
	ld bc, BG_MAP_WIDTH
	ld a, 7 ; palette
	call ByteFill

; BG Map 0:

; Apply logo gradient:

; lines 3-4
	hlbgcoord 0, 2
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 2
	call ByteFill
; line 5
	hlbgcoord 0, 4
	ld bc, BG_MAP_WIDTH
	ld a, 3
	call ByteFill
; line 6
	hlbgcoord 0, 5
	ld bc, BG_MAP_WIDTH
	ld a, 4
	call ByteFill
; line 7
	hlbgcoord 0, 6
	ld bc, BG_MAP_WIDTH
	ld a, 5
	call ByteFill
; lines 8-9
	hlbgcoord 0, 7
	ld bc, 2 * BG_MAP_WIDTH
	ld a, 6
	call ByteFill

; 'CRYSTAL VERSION'
	hlbgcoord 5, 8
	ld bc, NAME_LENGTH ; length of version text
	ld a, 7
	call ByteFill

; Suicune gfx
	hlbgcoord 0, 11
	ld bc, 8 ; the rest of the screen
	ld a, 1 | VRAM_BANK_1
	call ByteFill

	hlbgcoord 0, 12
	ld bc, 8 ; the rest of the screen
	ld a, 1 | VRAM_BANK_1
	call ByteFill

	hlbgcoord 0, 13
	ld bc, 8 ; the rest of the screen
	ld a, 1 | VRAM_BANK_1
	call ByteFill

	hlbgcoord 0, 14
	ld bc, 8 ; the rest of the screen
	ld a, 1 | VRAM_BANK_1
	call ByteFill

	hlbgcoord 0, 15
	ld bc, 8 ; the rest of the screen
	ld a, 1 | VRAM_BANK_1
	call ByteFill

	hlbgcoord 0, 16
	ld bc, 8 ; the rest of the screen
	ld a, 1 | VRAM_BANK_1
	call ByteFill

	hlbgcoord 0, 17
	ld bc, 8 ; the rest of the screen
	ld a, 1 | VRAM_BANK_1
	call ByteFill

	hlbgcoord 11, 11
	ld bc, 8 ; the rest of the screen
	ld a, 0 | VRAM_BANK_1
	call ByteFill

	hlbgcoord 11, 12
	ld bc, 8 ; the rest of the screen
	ld a, 0 | VRAM_BANK_1
	call ByteFill

	hlbgcoord 11, 13
	ld bc, 8 ; the rest of the screen
	ld a, 0 | VRAM_BANK_1
	call ByteFill

	hlbgcoord 11, 14
	ld bc, 8 ; the rest of the screen
	ld a, 0 | VRAM_BANK_1
	call ByteFill

	hlbgcoord 11, 15
	ld bc, 8 ; the rest of the screen
	ld a, 0 | VRAM_BANK_1
	call ByteFill

	hlbgcoord 11, 16
	ld bc, 8 ; the rest of the screen
	ld a, 0 | VRAM_BANK_1
	call ByteFill

	hlbgcoord 11, 17
	ld bc, 8 ; the rest of the screen
	ld a, 0 | VRAM_BANK_1
	call ByteFill

; Back to VRAM bank 0
	ld a, $0
	ldh [rVBK], a

; Decompress logo
	ld hl, TitleLogoGFX
	ld de, vTiles1
	call Decompress

; Decompress background crystal
	ld hl, TitleCrystalGFX
	ld de, vTiles0
	call Decompress

; Clear screen tiles
	hlbgcoord 0, 0
	ld bc, 64 * BG_MAP_WIDTH
	ld a, " "
	call ByteFill

; Draw Pokemon logo
	hlcoord 0, 2
	lb bc, 7, 20
	ld d, $80
	ld e, $14
	call DrawTitleGraphic

; Draw copyright text
	hlbgcoord 3, 0, vBGMap1
	lb bc, 1, 13
	ld d, $c
	ld e, $10
	call DrawTitleGraphic

; Initialize Dragonite?
	hlcoord 0, 11
	lb bc, 8, 8
	ld d, $80
	ld e, $10
	call DrawTitleGraphic

; Initialize Tyranitar?
	hlcoord 11, 11
	lb bc, 8, 8
	ld d, $88
	ld e, $10
	call DrawTitleGraphic

;	ld d, $0
;	call LoadTyranitarFrame

; Initialize background crystal
	call InitializeBackground

; Save WRAM bank
	ldh a, [rSVBK]
	push af
; WRAM bank 5
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

; Update palette colors
	ld hl, TitleScreenPalettes
	ld de, wBGPals1
	ld bc, 16 palettes
	call CopyBytes

	ld hl, TitleScreenPalettes
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes

; Restore WRAM bank
	pop af
	ldh [rSVBK], a

; LY/SCX trickery starts here

	ldh a, [rSVBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a

; Make alternating lines come in from opposite sides

; (This part is actually totally pointless, you can't
;  see anything until these values are overwritten!)

	ld b, 78 / 2 ; alternate for 80 lines
	ld hl, wLYOverrides
.loop
; $00 is the middle position
	ld [hl], +112 ; coming from the left
	inc hl
	ld [hl], -112 ; coming from the right
	inc hl
	dec b
	jr nz, .loop

; Make sure the rest of the buffer is empty
	ld hl, wLYOverrides + 78
	xor a
	ld bc, wLYOverridesEnd - (wLYOverrides + 78)
	call ByteFill

; Let LCD Stat know we're messing around with SCX
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a

	pop af
	ldh [rSVBK], a

; Reset audio
	call ChannelsOff
	call EnableLCD

; Set sprite size to 8x16
	ldh a, [rLCDC]
	set rLCDC_SPRITE_SIZE, a
	ldh [rLCDC], a

	ld a, +112
	ldh [hSCX], a
	ld a, 8
	ldh [hSCY], a
	ld a, 7
	ldh [hWX], a
	ld a, -112
	ldh [hWY], a

	ld a, $1
	ldh [hCGBPalUpdate], a

; Update BG Map 0 (bank 0)
	ldh [hBGMapMode], a

	xor a
	ld [wSuicuneFrame], a

	ldh [hBGMapMode], a

	xor a
	ld [wTyranitarFrame], a


; Play starting sound effect
	call SFXChannelsOff
	ld de, SFX_TITLE_SCREEN_ENTRANCE
	call PlaySFX
	ret

SuicuneFrameIterator:
	ld hl, wSuicuneFrame
	ld a, [hl]
	ld c, a
	inc [hl]

; Only do this once every eight frames
	and %111
	ret nz

	ld a, c
	and %11000
	add a
	swap a
	ld e, a
	ld d, $0
	ld hl, .Frames
	add hl, de
	ld d, [hl]
	xor a
	ldh [hBGMapMode], a
	call LoadSuicuneFrame
	ld a, $1
	ldh [hBGMapMode], a
	ldh [hBGMapThird], a
	ret

.Frames:
	db $80 ; vTiles3 tile $80
	db $80 ; vTiles3 tile $88
	db $80 ; vTiles5 tile $00
	db $80 ; vTiles5 tile $08

LoadSuicuneFrame:
	hlcoord 0, 11
	ld b, 8
.bgrows
	ld c, 8
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	ld a, SCREEN_WIDTH - 8
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, 8
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

TyranitarFrameIterator:
	ld hl, wTyranitarFrame
	ld a, [hl]
	ld c, a
	inc [hl]

; Only do this once every eight frames
	and %111
	ret nz

	ld a, c
	and %11000
	add a
	swap a
	ld e, a
	ld d, $0
	ld hl, .Frames
	add hl, de
	ld d, [hl]
	xor a
	ldh [hBGMapMode], a
	call LoadTyranitarFrame
	ld a, $1
	ldh [hBGMapMode], a
	ld a, $3
	ldh [hBGMapThird], a
	ret

.Frames:
	db $88 ; vTiles3 tile $80
	db $88 ; vTiles3 tile $88
	db $88 ; vTiles5 tile $00
	db $88 ; vTiles5 tile $08

LoadTyranitarFrame:
	hlcoord 11, 12
	ld b, 8
.bgrows
	ld c, 8
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	ld a, SCREEN_WIDTH - 8
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, 8
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

DrawTitleGraphic:
; input:
;   hl: draw location
;   b: height
;   c: width
;   d: tile to start drawing from
;   e: number of tiles to advance for each bgrows
.bgrows
	push de
	push bc
	push hl
.col
	ld a, d
	ld [hli], a
	inc d
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	pop de
	ld a, e
	add d
	ld d, a
	dec b
	jr nz, .bgrows
	ret

InitializeBackground:
	ld hl, wVirtualOAMSprite00
	ld d, -$22
	ld e, $0
	ld c, 5
.loop
	push bc
	call .InitColumn
	pop bc
	ld a, $10
	add d
	ld d, a
	dec c
	jr nz, .loop
	ret

.InitColumn:
	ld c, $6
	ld b, $40
.loop2
	ld a, d
	ld [hli], a ; y
	ld a, b
	ld [hli], a ; x
	add $8
	ld b, a
	ld a, e
	ld [hli], a ; tile id
	inc e
	inc e
	ld a, 0 | PRIORITY
	ld [hli], a ; attributes
	dec c
	jr nz, .loop2
	ret

AnimateTitleCrystal:
; Move the title screen crystal downward until it's fully visible

; Stop at y=6
; y is really from the bottom of the sprite, which is two tiles high
	ld hl, wVirtualOAMSprite00YCoord
	ld a, [hl]
	cp 6 + 2 * TILE_WIDTH
	ret z

; Move all 30 parts of the crystal down by 2
	ld c, 30
.loop
	ld a, [hl]
	add 2
	ld [hli], a ; y
rept SPRITEOAMSTRUCT_LENGTH + -1
	inc hl
endr
	dec c
	jr nz, .loop

	ret

TitleSuicuneGFX:
INCBIN "gfx/title/suicune.2bpp.lz"

TitleLogoGFX:
INCBIN "gfx/title/logo.2bpp.lz"

TitleCrystalGFX:
INCBIN "gfx/title/crystal.2bpp.lz"

TitleScreenPalettes:
INCLUDE "gfx/title/title.pal"
