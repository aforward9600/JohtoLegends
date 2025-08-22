Copyright_GFPresents:
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearBGPalettes
	call ClearTileMap
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a
	ldh [hJoyDown], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $90
	ldh [hWY], a
	call WaitBGMap
	ld b, SCGB_GAMEFREAK_LOGO
	call GetSGBLayout
	call SetPalettes
	ld c, 10
	call DelayFrames
	callfar Copyright
	call WaitBGMap
	ld c, 100
	call DelayFrames
	call ClearTileMap
	farcall GBCOnlyScreen
	call .GetGFLogoGFX
.joy_loop
	call JoyTextDelay
	ldh a, [hJoyLast]
	and BUTTONS
	jr nz, .pressed_button
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finish
	call PlaceGameFreakPresents
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .joy_loop

.pressed_button
	call .StopGamefreakAnim
	scf
	ret

.finish
	call .StopGamefreakAnim
	and a
	ret

.GetGFLogoGFX:
	ld de, GameFreakLogo
	ld hl, vTiles2
	lb bc, BANK(GameFreakLogo), 28
	call Get1bpp

	ldh a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
	ldh [rSVBK], a

	ld hl, IntroLogoGFX
	ld de, wDecompressScratch
	ld a, BANK(IntroLogoGFX)
	call FarDecompress

	ld hl, vTiles0
	ld de, wDecompressScratch
	lb bc, 1, 8 tiles
	call Request2bpp

	ld hl, vTiles1
	ld de, wDecompressScratch + $80 tiles
	lb bc, 1, 8 tiles
	call Request2bpp

	pop af
	ldh [rSVBK], a

	farcall ClearSpriteAnims
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_GAMEFREAK_LOGO
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $a0
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $60
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $30
	xor a
	ld [wJumptableIndex], a
	ld [wIntroSceneFrameCounter], a
	ld [wIntroSceneTimer], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $1
	ldh [hBGMapMode], a
	ld a, $90
	ldh [hWY], a
	lb de, %11100100, %11100100
	jp DmgToCgbObjPals

.StopGamefreakAnim:
	farcall ClearSpriteAnims
	call ClearTileMap
	call ClearSprites
	ld c, 16
	jp DelayFrames

PlaceGameFreakPresents:
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.dw
	dw PlaceGameFreakPresents_0
	dw PlaceGameFreakPresents_1
	dw PlaceGameFreakPresents_2
	dw PlaceGameFreakPresents_3

PlaceGameFreakPresents_AdvanceIndex:
	ld hl, wJumptableIndex
	inc [hl]
	ret

PlaceGameFreakPresents_0:
	ret

PlaceGameFreakPresents_1:
	ld hl, wIntroSceneTimer
	ld a, [hl]
	cp $20
	jr nc, .PlaceGameFreak
	inc [hl]
	ret

.PlaceGameFreak:
	ld [hl], 0
	ld hl, .GAME_FREAK
	decoord 5, 10
	ld bc, .end - .GAME_FREAK
	call CopyBytes
	call PlaceGameFreakPresents_AdvanceIndex
	ld de, SFX_GAME_FREAK_PRESENTS
	jp PlaySFX

.GAME_FREAK:
	;  F  E  R  R  O  P  E   X  O  L  A
	db 0, 1, 2, 2, 3, 4, 1, 13, 3, 5, 6
.end
	db "@"

PlaceGameFreakPresents_2:
	ld hl, wIntroSceneTimer
	ld a, [hl]
	cp $40
	jr nc, .place_presents
	inc [hl]
	ret

.place_presents
	ld [hl], 0
	ld hl, .presents
	decoord 7, 11
	ld bc, .end - .presents
	call CopyBytes
	jp PlaceGameFreakPresents_AdvanceIndex

.presents
	db 7, 8, 9, 10, 11, 12
.end
	db "@"

PlaceGameFreakPresents_3:
	ld hl, wIntroSceneTimer
	ld a, [hl]
	cp $80
	jr nc, .finish
	inc [hl]
	ret

.finish
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

GameFreakLogoJumper:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, GameFreakLogoScenes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

GameFreakLogoScenes:
	dw GameFreakLogoScene1
	dw GameFreakLogoScene2
	dw GameFreakLogoScene3
	dw GameFreakLogoScene4
	dw GameFreakLogoScene5

GameFreakLogoScene1:
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret

GameFreakLogoScene2:
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_e4747
	ld d, a
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and %111111
	cp %100000
	jr nc, .asm_e4723
	add %100000
.asm_e4723
	ld e, a
	farcall BattleAnim_Sine_e
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	dec [hl]
	and $1f
	ret nz
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	sub $30
	ld [hl], a
	ld de, SFX_DITTO_BOUNCE
	jp PlaySFX

.asm_e4747
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $0
	ld de, SFX_DITTO_POP_UP
	jp PlaySFX

GameFreakLogoScene3:
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .asm_e4764
	inc [hl]
	ret

.asm_e4764
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $0
	ld de, SFX_DITTO_TRANSFORM
	jp PlaySFX

GameFreakLogoScene4:
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	cp $40
	jr z, .asm_e47a3
	inc [hl]
	srl a
	srl a
	ld e, a
	ld d, $0
	ld hl, GameFreakLogoPalettes
	add hl, de
	add hl, de
	ldh a, [rSVBK]
	push af
	ld a, BANK(wOBPals2)
	ldh [rSVBK], a
	ld a, [hli]
	ld [wOBPals2 + 12], a
	ld a, [hli]
	ld [wOBPals2 + 13], a
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

.asm_e47a3
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	call PlaceGameFreakPresents_AdvanceIndex
GameFreakLogoScene5:
	ret

GameFreakLogoPalettes:
INCLUDE "gfx/intro/gamefreak_logo.pal"

GameFreakLogo:
INCBIN "gfx/splash/logo1.1bpp"
INCBIN "gfx/splash/logo2.1bpp"

GoldSilverIntro:
	ldh a, [rIE]
	push af
	call NormalSpeed
	pop af
	ldh [rIE], a
	call .Init
.Loop:
	call .PlayFrame
	jr nc, .Loop
	ldh a, [rIE]
	push af
	call DoubleSpeed
	pop af
	ldh [rIE], a
	ret

.Init:
	ld a, BANK(wLYOverrides)
	ldh [rSVBK], a
	farcall ClearSpriteAnims
	xor a
	ld [wIntroJumptableIndex], a
	ldh [hBGMapMode], a
	ret

.PlayFrame:
	call JoyTextDelay
	ldh a, [hJoyLast]
	and BUTTONS
	jr nz, .Finish

; check done flag
	ld a, [wIntroJumptableIndex]
	bit 7, a
	jr nz, .Finish

	farcall PlaySpriteAnimations
	call IntroSceneJumper
	call DelayFrame
	and a
	ret

.Finish:
	ld a, 1
	ldh [rSVBK], a
	callfar ClearSpriteAnims
	call ClearSprites
	call DelayFrame
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ldh [hLCDCPointer], a
	ldh [hLYOverrideStart], a
	ldh [hLYOverrideEnd], a
	ld a, %11100100
	call DmgToCgbBGPals
	depixel 28, 28, 4, 4
	call DmgToCgbObjPals
	scf
	ret

IntroSceneJumper:
	jumptable .IntroScenes, wIntroJumptableIndex

.IntroScenes:
	dw IntroScene1
	dw IntroScene2
	dw IntroScene3
	dw IntroScene4
	dw IntroScene5
	dw IntroScene6
	dw IntroScene7
	dw IntroScene8
	dw IntroScene9
	dw IntroScene10
	dw IntroScene11
	dw IntroScene12
	dw IntroScene13
	dw IntroScene14
	dw IntroScene15
	dw IntroScene16
	dw IntroScene17
;	dw IntroScene18

;NextIntroScene:
;	ld hl, wIntroJumptableIndex
;	inc [hl]
;	ret

; This is used to skip the cutscene if the intro doesn't
; work out.

;IntroScene18:
;	; Cut out when the music ends, and lead into the title screen.
;	ld hl, wIntroSceneFrameCounter
;	ld a, [hl]
;	and a
;	jr z, .done
;	dec [hl]
;	cp $18
;	jr z, .clear
;	cp $8
;	ret nz
;
;	ld de, SFX_INTRO_WHOOSH
;	call PlaySFX
;	ret
;
;.clear
;	call ClearBGPalettes
;	ret
;
;.done
;	ld hl, wJumptableIndex
;	set 7, [hl]
;	ret

IntroScene1:
; Set up water cutscene (Shellders/Magikarp/Lapras)
	call ClearBGPalettes
	call ClearTileMap
	ld hl, wIntroJumptableIndex
	inc [hl] ; only run once
	call DisableLCD

	xor a
	ldh [hBGMapMode], a
	callfar ClearSpriteAnims
	ld a, 1
	ldh [rVBK], a
	hlbgcoord 0, 0, vBGMap2
	lb bc, 4, 0

	xor a
	call ByteFill
	ld a, 0
	ldh [rVBK], a
	call Intro_ResetLYOverrides
	ld de, vTiles2 tile $00
;	ld b,b ; breakpoint
	ld hl, Intro_WaterGFX1
	call Decompress
	ld a, LOW(Intro_WaterMeta)
	ld [wIntroTilesPointer + 0], a
	ld a, HIGH(Intro_WaterMeta)
	ld [wIntroTilesPointer + 1], a
	hlbgcoord 0, 0, vBGMap2
	ld a, l
	ld [wIntroBGMapPointer + 0], a
	ld a, h
	ld [wIntroBGMapPointer + 1], a
	ld de, Intro_WaterTilemap + 15 tiles
	ld a, e
	ld [wIntroTilemapPointer + 0], a
	ld a, d
	ld [wIntroTilemapPointer + 1], a
	call Intro_DrawBackground

	ld de, vTiles0 tile $00
	ld hl, Intro_WaterGFX2
	call Decompress
	ld hl, wSpriteAnimDict
	ld a, $0
	ld [hli], a
	ld a, $00
	ld [hli], a
	xor a
	ldh [hSCY], a
	ld [wGlobalAnimYOffset], a
	ld [wGlobalAnimXOffset], a
	ld a, $58
	ldh [hSCX], a
	xor a
	ld [wIntroFrameCounter2], a
	ld a, $80
	ld [wIntroFrameCounter1], a
	ld a, $42
	ldh [hLCDCPointer], a
	call Intro_InitSineLYOverrides

	xor a ; FALSE
	ld [wIntroSpriteStateFlag], a
	call EnableLCD
	call DelayFrame
	ld b, SCGB_GS_INTRO
	ld c, 0
	call GetSGBLayout
	ld a, %11100100
	call DmgToCgbBGPals
	depixel 28, 28
	call DmgToCgbObjPals
	call Intro_InitShellders
	ld de, MUSIC_GS_OPENING
	jp PlayMusic

IntroScene2:
; shellders underwater
	call Intro_UpdateLYOverrides
	ld hl, wIntroFrameCounter1
	ld a, [hl]
	and a
	jr z, .skip_intro
	dec [hl]
	jp Intro_InitBubble

.skip_intro
	ld [hl], $10
	ld hl, wIntroJumptableIndex
	inc [hl]

IntroScene3:
; rise towards the surface
	call IntroScene3_Jumper
	call IntroScene3_ScrollToSurface
	ret nc
; next scene if carry flag is set
	call Intro_ResetLYOverrides
	ld hl, hSCY
	inc [hl]
	ld hl, wIntroJumptableIndex
	inc [hl]

IntroScene4:
; at surface; Lapras surfs to left of screen
	ld a, [wIntroSpriteStateFlag]
	and a
	jr nz, .next
	ld hl, wIntroFrameCounter2
	inc [hl]
	ld a, [hl]
	and $f
	jr nz, .skip_move_left
	ld hl, hSCX
	dec [hl]
	dec [hl]

.skip_move_left
	call Intro_AnimateOceanWaves
	ret

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	xor a
	ld [wIntroFrameCounter1], a

IntroScene5:
; fade out
	ld hl, wIntroFrameCounter1
	ld a, [hl]
	inc [hl]
	swap a
	and $f
	ld e, a
	ld d, 0
	ld hl, .palettes
	add hl, de
	ld a, [hl]
	cp -1
	jr z, .next
	call DmgToCgbBGPals
	call Intro_AnimateOceanWaves
	ld hl, hSCX
	dec [hl]
	dec [hl]
	ret

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	ret

.palettes:
	db %11100100
	db %11100100
	db %10010000
	db %01000000
	db %00000000
	db -1

IntroScene17:
; delay a bit before leading into the title screen
	ld c, 64
.loop
	call DelayFrame
	dec c
	jr nz, .loop
; set done flag
	ld hl, wIntroJumptableIndex
	set 7, [hl]
	ret

IntroScene3_ScrollToSurface:
	ld hl, wIntroFrameCounter2
	inc [hl]
	ld a, [hl]
	and 3
	jr nz, .skip_move_left
	ld hl, hSCX
	dec [hl]

.skip_move_left
	and 1
	jr nz, .no_carry
	ld hl, wGlobalAnimYOffset
	inc [hl]
	ld hl, hSCY
	ld a, [hl]
	dec [hl]
	and $f
	call z, Intro_UpdateTilemapAndBGMap
	ld a, [wIntroFrameCounter1]
	and a
	jr z, .carry

.no_carry
	and a
	ret

.carry
	scf
	ret

IntroScene3_Jumper:
	jumptable .dw, wIntroFrameCounter1

.dw
	dw .scene3_2
	dw .scene3_2
	dw .scene3_2
	dw .scene3_1
	dw .scene3_2
	dw .scene3_2
	dw .scene3_3
	dw .scene3_3
	dw .scene3_3
	dw .scene3_4
	dw .scene3_5
	dw .scene3_6
	dw .scene3_6
	dw .scene3_6
	dw .scene3_6
	dw .scene3_6
	dw .scene3_6

.scene3_1:
	call Intro_InitLapras
	depixel 28, 28, 4, 4
	call DmgToCgbObjPals
; fallthrough

.scene3_2:
	jp Intro_AnimateOceanWaves

.scene3_3:
	call Intro_InitMagikarps
	jp Intro_AnimateOceanWaves

.scene3_4:
	ld hl, wIntroFrameCounter2
	ld a, [hl]
	and %00011111
	jr z, .load_palettes
	jp Intro_InitMagikarps

.load_palettes
	callfar Unreferenced_Function8b07
	ret

.scene3_5:
	xor a
	ldh [hLCDCPointer], a
	ret

.scene3_6:
	jp Intro_UpdateLYOverrides

Intro_InitBubble:
	ld hl, wIntroFrameCounter1
	ld a, [hl]
	and $f
	ret nz
	ld a, [hl]
	and $70
	swap a
	ld e, a
	ld d, 0
	ld hl, .pixel_table
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_BUBBLE
	jp _InitSpriteAnimStruct

.pixel_table
	db  6 * 8, 14 * 8 + 4
	db 14 * 8, 18 * 8 + 4
	db 10 * 8, 16 * 8 + 4
	db 12 * 8, 15 * 8
	db  4 * 8, 13 * 8
	db  8 * 8, 17 * 8

Intro_InitMagikarps:
	depixel 8, 7, 0, 7
	ldh a, [hSGB]
	and a
	jr z, .ok
	depixel 4, 3, 0, 7

.ok
	ld hl, wIntroFrameCounter2
	ld a, [hl]
	and e
	ret nz
	ld a, [hl]
	and d
	jr nz, .alternate_frame
	depixel 29, 28
	call .InitAnim
	depixel 26, 0
	call .InitAnim
	depixel 0, 24
	jr .InitAnim

.alternate_frame
	depixel 28, 30
	call .InitAnim
	depixel 31, 24
	call .InitAnim
	depixel 2, 28

.InitAnim:
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_MAGIKARP
	jp _InitSpriteAnimStruct

Intro_InitShellders:
	depixel 18, 7
	call .InitAnim
	depixel 14, 10
	call .InitAnim
	depixel 16, 15

.InitAnim:
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_SHELLDER
	jp _InitSpriteAnimStruct

Intro_InitLapras:
	ld a, [wIntroFrameCounter2]
	and %00011111
	ret nz
	depixel 16, 24
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_LAPRAS
	jp _InitSpriteAnimStruct

Intro_UpdateTilemapAndBGMap:
; add new tiles to top as water scene scrolls up to surface
	push hl
	push de

	ld a, [wIntroTilemapPointer + 0]
	ld e, a
	ld a, [wIntroTilemapPointer + 1]
	ld d, a
	ld hl, -BG_MAP_WIDTH / 2
	add hl, de
	ld a, l
	ld e, l
	ld [wIntroTilemapPointer + 0], a
	ld a, h
	ld d, h
	ld [wIntroTilemapPointer + 1], a

	hlcoord 0, 0
	ld c, BG_MAP_WIDTH / 2
.loop
	call Intro_Draw2x2Tiles
	dec c
	jr nz, .loop

	ld a, [wIntroBGMapPointer + 0]
	ld e, a
	ld a, [wIntroBGMapPointer + 1]
	ld d, a
	ld hl, -2 * BG_MAP_WIDTH
	add hl, de
	ld a, l
	ld [wIntroBGMapPointer + 0], a
	ld [wRequested2bppDest + 0], a
	ld a, h
	and %11111011
	or %00001000
	ld [wIntroBGMapPointer + 1], a
	ld [wRequested2bppDest + 1], a
	ld a, LOW(wTileMap)
	ld [wRequested2bppSource + 0], a
	ld a, HIGH(wTileMap)
	ld [wRequested2bppSource + 1], a
	ld a, 4
	ld [wRequested2bppSize], a
	ld hl, wIntroFrameCounter1
	dec [hl]

	pop de
	pop hl
	ret

Intro_AnimateOceanWaves:
; uses a 2bpp request to copy tile IDs to the BG map
	ld hl, wIntroFrameCounter2
	ld a, [hl]
	and 3
	cp 3
	ret z
	ld a, [wRequested2bppSize]
	and a
	ret nz
	ld a, [hl]
	and $30
	swap a
	ld l, a
	ld h, 0
rept 5
	add hl, hl
endr
	ld de, .wave_tiles
	add hl, de
	ld a, l
	ld [wRequested2bppSource + 0], a
	ld a, h
	ld [wRequested2bppSource + 1], a
	ld a, LOW(vBGMap0 tile $1e)
	ld [wRequested2bppDest + 0], a
	ld a, HIGH(vBGMap0 tile $1e)
	ld [wRequested2bppDest + 1], a
	ld a, 2
	ld [wRequested2bppSize], a
	ret

.wave_tiles:
rept 8
	db $70, $71, $72, $73
endr
rept 8
	db $74, $75, $76, $77
endr
rept 8
	db $78, $79, $7a, $7b
endr
rept 8
	db $7c, $7d, $7e, $7f
endr

Intro_InitSineLYOverrides:
	ld bc, wLYOverrides2
	ld a, wLYOverrides2End - wLYOverrides2
	ld de, vBGMap1 - vBGMap0

.loop
	push af
	push de
	farcall BattleAnim_Sine_e
	ld a, e
	ld [bc], a
	inc bc
	pop de
	inc e
	pop af
	dec a
	jr nz, .loop
	ret

Intro_UpdateLYOverrides:
	ld bc, wLYOverrides
	ld e, $10

.loop1
	ldh a, [hSCY]
	ld [bc], a
	inc bc
	dec e
	jr nz, .loop1

	ld hl, wLYOverrides2
	ld de, wLYOverrides2 + 1
	ld a, [hl]
	push af
	ld a, $80

.loop2
	push af
	ld a, [de]
	inc de
	ld [hli], a
	push hl
	ld hl, hSCY
	add [hl]
	ld [bc], a
	inc bc
	pop hl
	pop af
	dec a
	jr nz, .loop2

	pop af
	ld [hl], a
	ret

IntroScene6:
; Set up grass cutscene (Pikachu/Jigglypuff)
	ld hl, wIntroJumptableIndex
	inc [hl] ; only run once
	call DisableLCD
	callfar ClearSpriteAnims
	call Intro_ResetLYOverrides

	ld de, vTiles2
	ld hl, Intro_GrassGFX1
	call Decompress
	ld a, LOW(Intro_GrassMeta)
	ld [wIntroTilesPointer + 0], a
	ld a, HIGH(Intro_GrassMeta)
	ld [wIntroTilesPointer + 1], a
	hlbgcoord 0, 0
	ld a, l
	ld [wIntroBGMapPointer + 0], a
	ld a, h
	ld [wIntroBGMapPointer + 1], a
	ld de, Intro_GrassTilemap
	ld a, e
	ld [wIntroTilemapPointer + 0], a
	ld a, d
	ld [wIntroTilemapPointer + 1], a
	call Intro_DrawBackground

	ld de, vTiles0
	ld hl, Intro_GrassGFX2
	call Decompress
	ld hl, wSpriteAnimDict
	ld a, $1
	ld [hli], a
	ld a, $00
	ld [hli], a
	xor a
	ldh [hSCY], a
	ld [wGlobalAnimYOffset], a
	ld a, $60
	ldh [hSCX], a
	ld a, $a0
	ld [wGlobalAnimXOffset], a

	xor a
	ld [wIntroFrameCounter2], a
	call EnableLCD
	ld b, SCGB_GS_INTRO
	ld c, 1
	call GetSGBLayout
	ld a, %11100100
	call DmgToCgbBGPals
	depixel 28, 28, 4, 4
	call DmgToCgbObjPals
	call Intro_InitJigglypuff
	xor a ; FALSE
	ld [wIntroSpriteStateFlag], a
	ret

IntroScene7:
; scroll left to Jigglypuff
	call Intro_InitNote
	ld hl, wIntroFrameCounter2
	ld a, [hl]
	inc [hl]
	and 3
	ret z
	ld hl, hSCX
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ld hl, wGlobalAnimXOffset
	inc [hl]
	ret

.next
	ld a, -1
	ld [wIntroFrameCounter1], a
	call Intro_InitPikachu
	ld hl, wIntroJumptableIndex
	inc [hl]
	ret

IntroScene8:
; stop scrolling, Pikachu attacks
	ld hl, wIntroFrameCounter1
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	call Intro_InitNote
	ld hl, wIntroFrameCounter2
	inc [hl]
	ret

.next
	xor a
	ld [wIntroFrameCounter1], a
	ld hl, wIntroJumptableIndex
	inc [hl]
	ret

IntroScene9:
; scroll down and fade out
	ld hl, wIntroFrameCounter1
	ld a, [hl]
	inc [hl]
	srl a
	srl a
	srl a
	ld e, a
	ld d, 0
	ld hl, .palettes
	add hl, de
	ld a, [hl]
	cp -1
	jr z, .next
	call DmgToCgbBGPals
	ld hl, hSCY
	inc [hl]
	ld hl, wGlobalAnimYOffset
	dec [hl]
	ret

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	ret

.palettes:
	db %11100100
	db %11100100
	db %11100100
	db %11100100
	db %11100100
	db %10010000
	db %01000000
	db %00000000
	db -1

Intro_InitNote:
	ld a, [wIntroSpriteStateFlag]
	and a
	ret nz
	ld hl, wIntroFrameCounter2
	ld a, [hl]
	and %00111111
	ret nz
	ld a, [hl]
	and %01111111
	jr z, .invisible
	depixel 11, 6, 4, 0
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_NOTE
	jp _InitSpriteAnimStruct

.invisible
	depixel 10, 6, 4, 0
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_INVISIBLE_NOTE
	jp _InitSpriteAnimStruct

Intro_InitJigglypuff:
	depixel 14, 6
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_JIGGLYPUFF
	jp _InitSpriteAnimStruct

Intro_InitPikachu:
	depixel 14, 24
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_PIKACHU
	call _InitSpriteAnimStruct
	depixel 14, 24
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_PIKACHU_TAIL
	jp _InitSpriteAnimStruct

IntroScene10:
; Set up fireball cutscene (Charizard, Johto starters)
	ld hl, wIntroJumptableIndex
	inc [hl] ; only run once
	call DisableLCD
	callfar ClearSpriteAnims
	call Intro_ResetLYOverrides
	call Intro_BlankTilemapAndBGMap

	ld de, vTiles2
	ld hl, Intro_FireGFX1
	call Decompress
	ld de, vTiles1
	ld hl, Intro_FireGFX2
	call Decompress
	ld de, vTiles0
	ld hl, Intro_FireGFX3
	ld bc, vTiles1 - vTiles0
	call Decompress

	ld hl, Intro_DratiniGFX
	ld de, vTiles0 tile $10
	call Decompress
	ld hl, Intro_LarvitarGFX
	ld de, vTiles0 tile $29
	call Decompress
	ld hl, Intro_BagonGFX
	ld de, vTiles0 tile $42
	call Decompress

	ld hl, wSpriteAnimDict
	ld a, $1
	ld [hli], a
	ld a, $00
	ld [hli], a
	call EnableLCD
	ld a, 0
	call DrawIntroCharizardGraphic

	ld a, $80
	ldh [hSCY], a
	xor a
	ldh [hSCX], a
	ld [wGlobalAnimYOffset], a
	ld [wGlobalAnimXOffset], a

	xor a
	ld [wIntroFrameCounter2], a
	ld b, SCGB_GS_INTRO
	ld c, 2
	call GetSGBLayout
	ld a, %00111111
	call DmgToCgbBGPals
	lb de, %11111111, %11111111
	call DmgToCgbObjPals
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_GS_OPENING_2
	jp PlayMusic

IntroScene11:
; scroll up to Charizard silhoutte, flash Johto starters
	ld hl, wIntroFrameCounter2
	ld a, [hl]
	inc [hl]
	and 1
	ret z
	call Intro_CheckSCYEvent
	ld hl, hSCY
	ld a, [hl]
	and a
	jr z, .next
	inc [hl]
	ret

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	xor a
	ld [wIntroFrameCounter1], a
; fallthrough

IntroScene12:
; load Charizard palettes
	ld hl, wIntroFrameCounter1
	ld a, [hl]
	inc [hl]
	srl a
	srl a
	and 3
	ld e, a
	ld d, 0
	ld hl, .palettes
	add hl, de
	ld a, [hl]
	and a
	jr z, .next
	call DmgToCgbBGPals
	ld e, a
	ld d, a
	jp DmgToCgbObjPals

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	ld a, $80
	ld [wIntroFrameCounter1], a
	ret

.palettes:
	db %01101010
	db %10100101
	db %11100100
	db %00000000

IntroScene13:
; Charizard mouth open
	ld hl, wIntroFrameCounter1
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ret

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	ld a, 1
	call DrawIntroCharizardGraphic
	ld a, 4
	ld [wIntroFrameCounter1], a
	ret

IntroScene14:
; Charizard breathing fire
	ld hl, wIntroFrameCounter1
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ret

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	ld a, 2
	call DrawIntroCharizardGraphic
	ld a, 64
	ld [wIntroFrameCounter1], a
	xor a
	ld [wIntroFrameCounter2], a
	ld de, SFX_GS_INTRO_CHARIZARD_FIREBALL
	call PlaySFX
; fallthrough

IntroScene15:
; Charizard mouth wide open / fireball starts
	call Intro_AnimateFireball
	ld hl, wIntroFrameCounter1
	ld a, [hl]
	and a
	jr z, .next
	dec [hl]
	ret

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	xor a
	ld [wIntroFrameCounter1], a
	ret

IntroScene16:
; continue fireball / fade out palettes
	call Intro_AnimateFireball
	ld hl, wIntroFrameCounter1
	ld a, [hl]
	inc [hl]
	swap a
	and 7
	ld e, a
	ld d, 0
	ld hl, .palettes
	add hl, de
	ld a, [hl]
	cp -1
	jr z, .next
	call DmgToCgbBGPals
	ld e, a
	ld d, a
	jp DmgToCgbObjPals

.next
	ld hl, wIntroJumptableIndex
	inc [hl]
	ret

.palettes:
	db %11100100
	db %10010000
	db %01000000
	db %00000000
	db -1

Intro_BlankTilemapAndBGMap:
	hlcoord 0, 0
	ld bc, wTileMapEnd - wTileMap
	xor a
	call ByteFill
	hlbgcoord 0, 0
	ld bc, vBGMap1 - vBGMap0
	xor a
	jp ByteFill

Intro_CheckSCYEvent:
	ldh a, [hSCY]
	ld c, a
	ld hl, .scy_jumptable

.loop
	ld a, [hli]
	cp -1
	ret z
	cp c
	jr z, .value_found
	inc hl
	inc hl
	jr .loop

.value_found
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.scy_jumptable
	dbw $86, Intro_LoadChikoritaPalette
	dbw $87, Intro_ChikoritaAppears
	dbw $88, Intro_FlashMonPalette
	dbw $98, Intro_FlashSilhouette
	dbw $99, Intro_LoadCyndaquilPalette
	dbw $af, Intro_CyndaquilAppears
	dbw $b0, Intro_FlashMonPalette
	dbw $c0, Intro_FlashSilhouette
	dbw $c1, Intro_LoadTotodilePalette
	dbw $d7, Intro_TotodileAppears
	dbw $d8, Intro_FlashMonPalette
	dbw $e8, Intro_FlashSilhouette
	dbw $e9, Intro_LoadCharizardPalette
	db -1

Intro_ChikoritaAppears:
	ld de, SFX_GS_INTRO_POKEMON_APPEARS
	call PlaySFX
	depixel 22, 1
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_CHIKORITA
	jp _InitSpriteAnimStruct

Intro_CyndaquilAppears:
	ld de, SFX_GS_INTRO_POKEMON_APPEARS
	call PlaySFX
	depixel 22, 20
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_CYNDAQUIL
	jp _InitSpriteAnimStruct

Intro_TotodileAppears:
	ld de, SFX_GS_INTRO_POKEMON_APPEARS
	call PlaySFX
	depixel 22, 1
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_TOTODILE
	jp _InitSpriteAnimStruct

Intro_FlashMonPalette:
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	xor a
	jp DmgToCgbBGPals

Intro_FlashSilhouette:
	lb de, %11111111, %11111111
	call DmgToCgbObjPals
	ld a, %00111111
	jp DmgToCgbBGPals

Intro_LoadChikoritaPalette:
	ld hl, DRATINI
	call GetPokemonIDFromIndex
	ld [wCurSpecies], a
	farcall Intro_LoadMonPalette
	ret

Intro_LoadCyndaquilPalette:
	ld hl, LARVITAR
	call GetPokemonIDFromIndex
	ld [wCurSpecies], a
	farcall Intro_LoadMonPalette
	ret

Intro_LoadTotodilePalette:
	ld hl, BAGON
	call GetPokemonIDFromIndex
	ld [wCurSpecies], a
	farcall Intro_LoadMonPalette
	ret

Intro_LoadCharizardPalette:
	ld hl, CHARIZARD
	call GetPokemonIDFromIndex
	ld [wCurSpecies], a
	farcall Intro_LoadMonPalette

DrawIntroCharizardGraphic:
	push af
	hlcoord 0, 6
	ld c, SCREEN_WIDTH * 8
	xor a
.loop1
	ld [hli], a
	dec c
	jr nz, .loop1

	pop af
	ld e, a
	ld d, 0
	ld hl, .charizard_data
rept 5
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, e

.loop2_outer
	push bc
	push hl
.loop2_inner
	ld [hli], a
	inc a
	dec c
	jr nz, .loop2_inner

	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop2_outer

	ld a, 1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ldh [hBGMapMode], a
	ret

.charizard_data
; db vtile offset, width, height; dwcoord x, y
; mouth closed
	db $00, 8, 8
	dwcoord 10, 6
; mouth open
	db $40, 9, 8
	dwcoord 9, 6
; breathing fire
	db $88, 9, 8
	dwcoord 8, 6

Intro_AnimateFireball:
	ld hl, wIntroFrameCounter2
	ld a, [hl]
	inc [hl]
	and 3
	ret nz
	depixel 12, 10, 4, 4
	ld a, SPRITE_ANIM_INDEX_GS_INTRO_FIREBALL
	call _InitSpriteAnimStruct
	ld hl, hSCX
	dec [hl]
	ld hl, wGlobalAnimXOffset
	inc [hl]
	ret

Intro_DrawBackground:
	ld b, BG_MAP_WIDTH / 2
.outer_loop
	push hl
	ld c, BG_MAP_HEIGHT / 2
.inner_loop
	call Intro_Draw2x2Tiles
	dec c
	jr nz, .inner_loop
	pop hl
	push bc
	ld bc, 2 * BG_MAP_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .outer_loop
	ret

Intro_Draw2x2Tiles:
; load tile data into a 2x2 section of the bgmap or tilemap
	push bc
	push de
	push hl
	push hl
	push hl

	ld a, [de]
	ld l, a
	ld h, 0
	ld a, [wIntroTilesPointer + 0]
	ld e, a
	ld a, [wIntroTilesPointer + 1]
	ld d, a
	add hl, hl
	add hl, hl
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	pop hl
	ld bc, BG_MAP_WIDTH
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a

	pop hl
	inc hl
	inc hl
	pop de
	inc de
	pop bc
	ret

Intro_ResetLYOverrides:
	ld hl, wLYOverrides
	xor a
	ld c, wLYOverrides2 - wLYOverrides
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret

Intro_WaterGFX1:
INCBIN "gfx/intro/water1.2bpp.lz"

Intro_WaterTilemap:
INCBIN "gfx/intro/water.tilemap"

Intro_WaterMeta:
INCBIN "gfx/intro/water.bin"

Intro_WaterGFX2:
INCBIN "gfx/intro/water2.2bpp.lz"

Intro_GrassGFX1:
INCBIN "gfx/intro/grass1.2bpp.lz"

Intro_GrassTilemap:
INCBIN "gfx/intro/grass.tilemap"

Intro_GrassMeta:
INCBIN "gfx/intro/grass.bin"

Intro_GrassGFX2:
INCBIN "gfx/intro/grass2.2bpp.lz"

Intro_FireGFX1:
INCBIN "gfx/intro/fire1.2bpp.lz"

Intro_FireGFX2:
INCBIN "gfx/intro/fire2.2bpp.lz"

Intro_FireGFX3:
INCBIN "gfx/intro/fire3.2bpp.lz"

Intro_DratiniGFX:
INCBIN "gfx/intro/intro_dratini.2bpp.lz"

Intro_LarvitarGFX:
INCBIN "gfx/intro/intro_larvitar.2bpp.lz"

Intro_BagonGFX:
INCBIN "gfx/intro/intro_bagon.2bpp.lz"
