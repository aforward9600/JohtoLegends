InitCrystalData:
	ld a, $1
	ld [wd474], a
	xor a
	ld [wd473], a
	ld [wPlayerGender], a
	ld [wd475], a
	ld [wd476], a
	ld [wd477], a
	ld [wd478], a
	ld [wd002], a
	ld [wd003], a
	; could have done "ld a, [wd479] \ and %11111100", saved four operations
	ld a, [wd479]
	res 0, a
	ld [wd479], a
	ld a, [wd479]
	res 1, a
	ld [wd479], a
	ret

InitGenderScreenPrep:
	ld a, $10
	ld [wMusicFade], a
	ld a, MUSIC_NONE
	ld [wMusicFadeID], a
	ld a, $0
	ld [wMusicFadeID + 1], a
	ld c, 8
	call DelayFrames
	call ClearBGPalettes
	call InitCrystalData
	call LoadFontsExtra
	call InitGenderScreen
	call LoadGenderScreenPal
	call LoadGenderScreenLightBlueTile
	call WaitBGMap2
	jp SetPalettes

InitGender:
;	call InitGenderScreen
	call LoadGenderScreenPal
	call LoadGenderScreenLightBlueTile
	call WaitBGMap2
	call SetPalettes
	ld hl, TextJump_AreYouABoyOrAreYouAGirl
	call PrintText
	ld hl, .MenuHeader
	call LoadMenuHeader
	call WaitBGMap2
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	dec a
	ld [wPlayerGender], a
	ld c, 10
	call DelayFrames

;	xor a
	call ClearTileMap
	farcall DrawIntroPlayerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	farcall Intro_RotatePalettesLeftFrontpic

	ld a, [wPlayerGender]
	cp 0
	jr nz, .AreYouAGirl
	ld hl, AreYouABoyText
	call PrintText
	call YesNoBox
	jr c, .RestartGender
	ret

.RestartGender:
	ld c, 10
	call DelayFrames
	farcall RotateThreePalettesRight
	call ClearTileMap
	ld c, 10
	call DelayFrames
	jr InitGender

.AreYouAGirl
	ld hl, AreYouAGirlText
	call PrintText
	call YesNoBox
	jr c, .RestartGender
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 6, 4, 12, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_WRAP | STATICMENU_DISABLE_B ; flags
	db 2 ; items
	db "Boy@"
	db "Girl@"

TextJump_AreYouABoyOrAreYouAGirl:
	; Are you a boy? Or are you a girl?
	text_far Text_AreYouABoyOrAreYouAGirl
	text_end

AreYouAGirlText:
	text_far Text_AreYouAGirlText
	text_end

AreYouABoyText:
	text_far Text_AreYouABoyText
	text_end

InitGenderScreen:
;	ld a, $10
;	ld [wMusicFade], a
;	ld a, MUSIC_NONE
;	ld [wMusicFadeID], a
;	ld a, $0
;	ld [wMusicFadeID + 1], a
;	ld c, 8
;	call DelayFrames
;	call ClearBGPalettes
;	call InitCrystalData
;	call LoadFontsExtra
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, $0
	call ByteFill
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	jp ByteFill

LoadGenderScreenPal:
	ld hl, .Palette
	ld de, wBGPals1
	ld bc, 1 palettes
	ld a, BANK(wBGPals1)
	call FarCopyWRAM
	farcall ApplyPals
	ret

.Palette:
INCLUDE "gfx/new_game/gender_screen.pal"

LoadGenderScreenLightBlueTile:
	ld de, .LightBlueTile
	ld hl, vTiles2 tile $00
	lb bc, BANK(.LightBlueTile), 1
	jp Get2bpp

.LightBlueTile:
INCBIN "gfx/new_game/gender_screen.2bpp"
