; Pokégear cards
	const_def
	const POKEGEARCARD_CLOCK ; 0
	const POKEGEARCARD_MAP   ; 1
	const POKEGEARCARD_RADIO ; 2
	const POKEGEARCARD_PHONE ; 3
NUM_POKEGEAR_CARDS EQU const_value

; PokegearJumptable.Jumptable indexes
	const_def
	const POKEGEARSTATE_CLOCKINIT       ; 0
	const POKEGEARSTATE_CLOCKJOYPAD     ; 1
	const POKEGEARSTATE_MAPCHECKREGION  ; 2
	const POKEGEARSTATE_JOHTOMAPINIT    ; 3
	const POKEGEARSTATE_JOHTOMAPJOYPAD  ; 4
	const POKEGEARSTATE_KANTOMAPINIT    ; 5
	const POKEGEARSTATE_KANTOMAPJOYPAD  ; 6
	const POKEGEARSTATE_SEVIIMAPINIT
	const POKEGEARSTATE_SEVIIMAPJOYPAD
	const POKEGEARSTATE_RADIOINIT       ; b
	const POKEGEARSTATE_RADIOJOYPAD     ; c
	const POKEGEARSTATE_PHONEINIT       ; 7
	const POKEGEARSTATE_PHONEJOYPAD     ; 8
	const POKEGEARSTATE_MAKEPHONECALL   ; 9
	const POKEGEARSTATE_FINISHPHONECALL ; a

PokeGear:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a
	call .InitTilemap
	call DelayFrame
.loop
	call UpdateTime
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call PokegearJumptable
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .loop

.done
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	pop af
	ld [wVramState], a
	pop af
	ldh [hInMenu], a
	pop af
	ld [wOptions], a
	call ClearBGPalettes
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	ld a, $90
	ldh [hWY], a
	call ExitPokegearRadio_HandleMusic
	ret

.InitTilemap:
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	xor a
	ldh [hSCY], a
	ldh [hSCX], a
	ld a, $7
	ldh [hWX], a
	call Pokegear_LoadGFX
	farcall ClearSpriteAnims
	call InitPokegearModeIndicatorArrow
	ld a, 8
	call SkipMusic
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	call TownMap_InitCursorAndPlayerIconPositions
	xor a
	ld [wJumptableIndex], a ; POKEGEARSTATE_CLOCKINIT
	ld [wPokegearCard], a ; POKEGEARCARD_CLOCK
	ld [wPokegearMapRegion], a ; JOHTO_REGION
	ld [wcf66], a
	ld [wPokegearPhoneScrollPosition], a
	ld [wPokegearPhoneCursorPosition], a
	ld [wPokegearPhoneSelectedPerson], a
	ld [wPokegearRadioChannelBank], a
	ld [wPokegearRadioChannelAddr], a
	ld [wPokegearRadioChannelAddr + 1], a
	call Pokegear_InitJumptableIndices
	call InitPokegearTilemap
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
	ldh a, [hCGB]
	and a
	ret z
	ld a, %11100100
	call DmgToCgbObjPal0
	ret

Pokegear_LoadGFX:
	call ClearVBank1
	ld hl, TownMapGFX
	ld de, vTiles2
	ld a, BANK(TownMapGFX)
	call FarDecompress
	ld hl, PokegearSpritesGFX
	ld de, vTiles0
	ld a, BANK(PokegearSpritesGFX)
	call Decompress
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	farcall GetPlayerIcon
	push de
	ld h, d
	ld l, e
	ld a, b
	; standing sprite
	push af
	ld de, vTiles0 tile $10
	ld bc, 4 tiles
	call FarCopyBytes
	pop af
	pop hl
	; walking sprite
	ld de, 12 tiles
	add hl, de
	ld de, vTiles0 tile $14
	ld bc, 4 tiles
	call FarCopyBytes
	ret

.ssaqua
	ld hl, FastShipGFX
	ld de, vTiles0 tile $10
	ld bc, 8 tiles
	call CopyBytes
	ret

FastShipGFX:
INCBIN "gfx/pokegear/fast_ship.2bpp"

InitPokegearModeIndicatorArrow:
	depixel 4, 2, 4, 0
	ld a, SPRITE_ANIM_INDEX_POKEGEAR_ARROW
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $0
	ret

AnimatePokegearModeIndicatorArrow:
	ld hl, wPokegearCard
	ld e, [hl]
	ld d, 0
	ld hl, .XCoords
	add hl, de
	ld a, [hl]
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.XCoords:
	db $00 ; POKEGEARCARD_CLOCK
	db $10 ; POKEGEARCARD_MAP
	db $20 ; POKEGEARCARD_PHONE
	db $30 ; POKEGEARCARD_RADIO

TownMap_GetCurrentLandmark:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp SPECIAL_MAP
	ret nz
	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	call GetWorldMapLocation
	ret

TownMap_InitCursorAndPlayerIconPositions:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp SPECIAL_MAP
	jr nz, .LoadLandmark
	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	call GetWorldMapLocation
.LoadLandmark:
	ld [wPokegearMapPlayerIconLandmark], a
	ld [wPokegearMapCursorLandmark], a
	ret

.FastShip:
	ld [wPokegearMapPlayerIconLandmark], a
	ld a, BLACKTHORN_CITY
	ld [wPokegearMapCursorLandmark], a
	ret

Pokegear_InitJumptableIndices:
	ld a, POKEGEARSTATE_CLOCKINIT
	ld [wJumptableIndex], a
	xor a ; POKEGEARCARD_CLOCK
	ld [wPokegearCard], a
	ret

InitPokegearTilemap:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $4f
	call ByteFill
	ld a, [wPokegearCard]
	maskbits NUM_POKEGEAR_CARDS
	add a
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .return_from_jumptable
	push de
	jp hl

.return_from_jumptable
	call Pokegear_FinishTilemap
	farcall TownMapPals
	ld a, [wPokegearMapRegion]
	and a
	jr nz, .kanto_0
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	call .UpdateBGMap
	ld a, $90
	jr .finish

.kanto_0
	xor a ; LOW(vBGMap1)
	ldh [hBGMapAddress], a
	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	call .UpdateBGMap
	xor a
.finish
	ldh [hWY], a
	; swap region maps
	ld a, [wPokegearMapRegion]
	maskbits NUM_REGIONS
	xor 1
	ld [wPokegearMapRegion], a
	ret

.UpdateBGMap:
	ldh a, [hCGB]
	and a
	jr z, .dmg
	ld a, $2
	ldh [hBGMapMode], a
	ld c, 3
	call DelayFrames
.dmg
	call WaitBGMap
	ret

.Jumptable:
; entries correspond to POKEGEARCARD_* constants
	dw .Clock
	dw .Map
	dw .Radio
	dw .Phone

.Clock:
	ld de, ClockTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 12, 1
	ld de, .switch
	call PlaceString
	hlcoord 0, 12
	lb bc, 4, 18
	call Textbox
	call Pokegear_UpdateClock
	ret

.switch
	db " SWITCH▶@"

.Map:
	ld a, [wPokegearMapPlayerIconLandmark]
	cp SEVII_LANDMARK
	jr nc, .sevii
	cp KANTO_LANDMARK
	jr nc, .kanto
.johto
	ld e, 0
	jr .ok

.kanto
	ld e, 1
	jr .ok

.sevii
	ld e, 2
.ok
	farcall PokegearMap
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName
	ret

.Radio:
	ld de, RadioTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 0, 12
	lb bc, 4, 18
	call Textbox
	ret

.Phone:
	ld de, PhoneTilemapRLE
	call Pokegear_LoadTilemapRLE
	hlcoord 0, 12
	lb bc, 4, 18
	call Textbox
	call .PlacePhoneBars
	call PokegearPhone_UpdateDisplayList
	ret

.PlacePhoneBars:
	hlcoord 17, 1
	ld a, $3c
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 17, 2
	inc a
	ld [hli], a
	call GetMapPhoneService
	and a
	ret nz
	hlcoord 18, 2
	ld [hl], $3f
	ret

Pokegear_FinishTilemap:
	hlcoord 0, 0
	ld bc, $8
	ld a, $4f
	call ByteFill
	hlcoord 0, 1
	ld bc, $8
	ld a, $4f
	call ByteFill
	ld de, wPokegearFlags
	ld a, [de]
	bit POKEGEAR_MAP_CARD_F, a
	call nz, .PlaceMapIcon
	ld a, [de]
	bit POKEGEAR_PHONE_CARD_F, a
	call nz, .PlacePhoneIcon
	ld a, [de]
	bit POKEGEAR_RADIO_CARD_F, a
	call nz, .PlaceRadioIcon
	hlcoord 0, 0
	ld a, $46
	call .PlacePokegearCardIcon
	ret

.PlaceMapIcon:
	hlcoord 2, 0
	ld a, $40
	jr .PlacePokegearCardIcon

.PlacePhoneIcon:
	hlcoord 6, 0
	ld a, $44
	jr .PlacePokegearCardIcon

.PlaceRadioIcon:
	hlcoord 4, 0
	ld a, $42
.PlacePokegearCardIcon:
	ld [hli], a
	inc a
	ld [hld], a
	ld bc, $14
	add hl, bc
	add $f
	ld [hli], a
	inc a
	ld [hld], a
	ret

PokegearJumptable:
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
; entries correspond to POKEGEARSTATE_* constants
	dw PokegearClock_Init
	dw PokegearClock_Joypad
	dw PokegearMap_CheckRegion
	dw PokegearMap_Init
	dw PokegearMap_JohtoMap
	dw PokegearMap_Init
	dw PokegearMap_KantoMap
	dw PokegearMap_Init
	dw PokegearMap_SeviiMap
	dw PokegearRadio_Init
	dw PokegearRadio_Joypad
	dw PokegearPhone_Init
	dw PokegearPhone_Joypad
	dw PokegearPhone_MakePhoneCall
	dw PokegearPhone_FinishPhoneCall

PokegearClock_Init:
	call InitPokegearTilemap
	ld hl, PokegearText_PressAnyButtonToExit
	call PrintText
	ld hl, wJumptableIndex
	inc [hl]
	call ExitPokegearRadio_HandleMusic
	ret

PokegearClock_Joypad:
	call .UpdateClock
	ld hl, hJoyLast
	ld a, [hl]
	and A_BUTTON | B_BUTTON | START | SELECT
	jr nz, .quit
	ld a, [hl]
	and D_RIGHT
	ret z
	ld a, [wPokegearFlags]
	bit POKEGEAR_MAP_CARD_F, a
	jr z, .no_map_card
	ld c, POKEGEARSTATE_MAPCHECKREGION
	ld b, POKEGEARCARD_MAP
	jr .done

.no_map_card
	ld a, [wPokegearFlags]
	bit POKEGEAR_PHONE_CARD_F, a
	jr z, .no_phone_card
	ld c, POKEGEARSTATE_PHONEINIT
	ld b, POKEGEARCARD_PHONE
	jr .done

.no_phone_card
	ld a, [wPokegearFlags]
	bit POKEGEAR_RADIO_CARD_F, a
	ret z
	ld c, POKEGEARSTATE_RADIOINIT
	ld b, POKEGEARCARD_RADIO
.done
	call Pokegear_SwitchPage
	ret

.quit
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.UpdateClock:
	xor a
	ldh [hBGMapMode], a
	call Pokegear_UpdateClock
	ld a, $1
	ldh [hBGMapMode], a
	ret

Pokegear_UpdateClock:
	hlcoord 3, 5
	lb bc, 5, 14
	call ClearBox
	ldh a, [hHours]
	ld b, a
	ldh a, [hMinutes]
	ld c, a
	decoord 6, 8
	farcall PrintHoursMins
	ld hl, .DayText
	bccoord 6, 6
	call PlaceHLTextAtBC
	ret

	db "ごぜん@"
	db "ごご@"

.DayText:
	text_far UnknownText_0x1c5821
	text_end

PokegearMap_CheckRegion:
	ld b,b
	ld a, [wPokegearMapPlayerIconLandmark]
	cp SEVII_LANDMARK
	jr nc, .sevii
	cp KANTO_LANDMARK
	jr nc, .kanto
.johto
	ld a, POKEGEARSTATE_JOHTOMAPINIT
	jr .done

.kanto
	ld a, POKEGEARSTATE_KANTOMAPINIT
	jr .done
.sevii
	ld a, POKEGEARSTATE_SEVIIMAPINIT
.done
	ld [wJumptableIndex], a
	call ExitPokegearRadio_HandleMusic
	ret

PokegearMap_Init:
	call InitPokegearTilemap
	ld a, [wPokegearMapPlayerIconLandmark]
	call PokegearMap_InitPlayerIcon
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_InitCursor
	ld a, c
	ld [wPokegearMapCursorObjectPointer], a
	ld a, b
	ld [wPokegearMapCursorObjectPointer + 1], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

PokegearMap_KantoMap:
	call TownMap_GetKantoLandmarkLimits
	jr PokegearMap_ContinueMap

PokegearMap_SeviiMap:
	call TownMap_GetSeviiLandmarkLimits
	jr PokegearMap_ContinueMap

PokegearMap_JohtoMap:
	ld d, SILVER_CAVE
	ld e, BLACKTHORN_CITY
	ld b,b
PokegearMap_ContinueMap:
	ld hl, hJoyLast
	ld a, [hl]
	and B_BUTTON
	jr nz, .cancel
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	call .DPad
	ret

.right
	ld a, [wPokegearFlags]
	bit POKEGEAR_PHONE_CARD_F, a
	jr z, .no_phone
	ld c, POKEGEARSTATE_PHONEINIT
	ld b, POKEGEARCARD_PHONE
	jr .done

.no_phone
	ld a, [wPokegearFlags]
	bit POKEGEAR_RADIO_CARD_F, a
	ret z
	ld c, POKEGEARSTATE_RADIOINIT
	ld b, POKEGEARCARD_RADIO
	jr .done

.left
	ld c, POKEGEARSTATE_CLOCKINIT
	ld b, POKEGEARCARD_CLOCK
.done
	call Pokegear_SwitchPage
	ret

.cancel
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.DPad:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ret

.up
	ld hl, wPokegearMapCursorLandmark
	ld a, [hl]
	cp d
	jr c, .wrap_around_up
	ld a, e
	dec a
	ld [hl], a
.wrap_around_up
	inc [hl]
	jr .done_dpad

.down
	ld hl, wPokegearMapCursorLandmark
	ld a, [hl]
	cp e
	jr nz, .wrap_around_down
	ld a, d
	inc a
	ld [hl], a
.wrap_around_down
	dec [hl]
.done_dpad
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName
	ld a, [wPokegearMapCursorObjectPointer]
	ld c, a
	ld a, [wPokegearMapCursorObjectPointer + 1]
	ld b, a
	ld a, [wPokegearMapCursorLandmark]
	call PokegearMap_UpdateCursorPosition
	ret

PokegearMap_InitPlayerIcon:
	push af
	depixel 0, 0
	ld b, SPRITE_ANIM_INDEX_BLUE_WALK
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_gender
	ld b, SPRITE_ANIM_INDEX_RED_WALK
.got_gender
	ld a, b
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $10
	pop af
	ld e, a
	push bc
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

PokegearMap_InitCursor:
	push af
	depixel 0, 0
	ld a, SPRITE_ANIM_INDEX_POKEGEAR_ARROW
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $04
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	pop af
	push bc
	call PokegearMap_UpdateCursorPosition
	pop bc
	ret

PokegearMap_UpdateLandmarkName:
	push af
	hlcoord 8, 0
	lb bc, 2, 12
	call ClearBox
	pop af
	ld e, a
	push de
	farcall GetLandmarkName
	pop de
	farcall TownMap_ConvertLineBreakCharacters
	hlcoord 8, 0
	ld [hl], $34
	ret

PokegearMap_UpdateCursorPosition:
	push bc
	ld e, a
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

TownMap_GetKantoLandmarkLimits:
	ld a, [wStatusFlags]
	bit STATUSFLAGS_HALL_OF_FAME_F, a
	jr z, .not_hof
	ld d, ROUTE_28
	ld e, PALLET_TOWN
	ret

.not_hof
	ld d, ROUTE_28
	ld e, VICTORY_ROAD
	ret

TownMap_GetSeviiLandmarkLimits:
	ld d, ONAGAN_TEMPLE
	ld e, ONE_ISLAND
	ret

PokegearRadio_Init:
	call NoRadioMusic
	call InitPokegearTilemap
	depixel 4, 10, 4, 4
	ld a, SPRITE_ANIM_INDEX_RADIO_TUNING_KNOB
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $08
	call _UpdateRadioStation
	ld hl, wJumptableIndex
	inc [hl]
	ret

PokegearRadio_Joypad:
	ld hl, hJoyLast
	ld a, [hl]
	and B_BUTTON
	jr nz, .cancel
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [wPokegearRadioChannelAddr]
	ld l, a
	ld a, [wPokegearRadioChannelAddr + 1]
	ld h, a
	ld a, [wPokegearRadioChannelBank]
	and a
	ret z
	rst FarCall
	ret

.left
	ld a, [wPokegearFlags]
	bit POKEGEAR_PHONE_CARD_F, a
	jr z, .no_phone
	ld c, POKEGEARSTATE_PHONEINIT
	ld b, POKEGEARCARD_PHONE
	jr .switch_page

.no_phone
	ld a, [wPokegearFlags]
	bit POKEGEAR_MAP_CARD_F, a
	jr z, .no_map
	ld c, POKEGEARSTATE_MAPCHECKREGION
	ld b, POKEGEARCARD_MAP
	jr .switch_page

.no_map
	ld c, POKEGEARSTATE_CLOCKINIT
	ld b, POKEGEARCARD_CLOCK
.switch_page
	call Pokegear_SwitchPage
	ret

.cancel
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

PokegearPhone_Init:
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ld [wPokegearPhoneScrollPosition], a
	ld [wPokegearPhoneCursorPosition], a
	ld [wPokegearPhoneSelectedPerson], a
	call InitPokegearTilemap
	call ExitPokegearRadio_HandleMusic
	ld hl, PokegearText_WhomToCall
	call PrintText
	ret

PokegearPhone_Joypad:
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	call PokegearPhone_GetDPad
	ret

.left
	ld a, [wPokegearFlags]
	bit POKEGEAR_MAP_CARD_F, a
	jr z, .no_map
	ld c, POKEGEARSTATE_MAPCHECKREGION
	ld b, POKEGEARCARD_MAP
	jr .switch_page

.no_map
	ld c, POKEGEARSTATE_CLOCKINIT
	ld b, POKEGEARCARD_CLOCK
	jr .switch_page

.right
	ld a, [wPokegearFlags]
	bit POKEGEAR_RADIO_CARD_F, a
	ret z
	ld c, POKEGEARSTATE_RADIOINIT
	ld b, POKEGEARCARD_RADIO
.switch_page
	call Pokegear_SwitchPage
	ret

.b
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.a
	ld hl, wPhoneList
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wPokegearPhoneCursorPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	and a
	ret z
	ld [wPokegearPhoneSelectedPerson], a
	hlcoord 1, 4
	ld a, [wPokegearPhoneCursorPosition]
	ld bc, 20 * 2
	call AddNTimes
	ld [hl], "▷"
	call PokegearPhoneContactSubmenu
	jr c, .quit_submenu
	ld hl, wJumptableIndex
	inc [hl]
	ret

.quit_submenu
	ld a, POKEGEARSTATE_PHONEJOYPAD
	ld [wJumptableIndex], a
	ret

PokegearPhone_MakePhoneCall:
	call GetMapPhoneService
	and a
	jr nz, .no_service
	ld hl, wOptions
	res NO_TEXT_SCROLL, [hl]
	xor a
	ldh [hInMenu], a
	ld de, SFX_CALL
	call PlaySFX
	ld hl, .dotdotdot
	call PrintText
	call WaitSFX
	ld de, SFX_CALL
	call PlaySFX
	ld hl, .dotdotdot
	call PrintText
	call WaitSFX
	ld a, [wPokegearPhoneSelectedPerson]
	ld b, a
	call Function90199
	ld c, 10
	call DelayFrames
	ld hl, wOptions
	set NO_TEXT_SCROLL, [hl]
	ld a, $1
	ldh [hInMenu], a
	call PokegearPhone_UpdateCursor
	ld hl, wJumptableIndex
	inc [hl]
	ret

.no_service
	farcall Phone_NoSignal
	ld hl, .OutOfServiceArea
	call PrintText
	ld a, POKEGEARSTATE_PHONEJOYPAD
	ld [wJumptableIndex], a
	ld hl, PokegearText_WhomToCall
	call PrintText
	ret

.dotdotdot
	;
	text_far UnknownText_0x1c5824
	text_end

.OutOfServiceArea:
	; You're out of the service area.
	text_far UnknownText_0x1c5827
	text_end

PokegearPhone_FinishPhoneCall:
	ldh a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	ret z
	farcall HangUp
	ld a, POKEGEARSTATE_PHONEJOYPAD
	ld [wJumptableIndex], a
	ld hl, PokegearText_WhomToCall
	call PrintText
	ret

PokegearPhone_GetDPad:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ret

.up
	ld hl, wPokegearPhoneCursorPosition
	ld a, [hl]
	and a
	jr z, .scroll_page_up
	dec [hl]
	jr .done_joypad_same_page

.scroll_page_up
	ld hl, wPokegearPhoneScrollPosition
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jr .done_joypad_update_page

.down
	ld hl, wPokegearPhoneCursorPosition
	ld a, [hl]
	cp 3
	jr nc, .scroll_page_down
	inc [hl]
	jr .done_joypad_same_page

.scroll_page_down
	ld hl, wPokegearPhoneScrollPosition
	ld a, [hl]
	cp 6
	ret nc
	inc [hl]
	jr .done_joypad_update_page

.done_joypad_same_page
	xor a
	ldh [hBGMapMode], a
	call PokegearPhone_UpdateCursor
	call WaitBGMap
	ret

.done_joypad_update_page
	xor a
	ldh [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	call WaitBGMap
	ret

PokegearPhone_UpdateCursor:
	ld a, " "
	hlcoord 1, 4
	ld [hl], a
	hlcoord 1, 6
	ld [hl], a
	hlcoord 1, 8
	ld [hl], a
	hlcoord 1, 10
	ld [hl], a
	hlcoord 1, 4
	ld a, [wPokegearPhoneCursorPosition]
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld [hl], "▶"
	ret

PokegearPhone_UpdateDisplayList:
	hlcoord 1, 3
	ld b, 9
	ld a, " "
.row
	ld c, 18
.col
	ld [hli], a
	dec c
	jr nz, .col
	inc hl
	inc hl
	dec b
	jr nz, .row
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, $0
	ld hl, wPhoneList
	add hl, de
	xor a
	ld [wPokegearPhoneLoadNameBuffer], a
.loop
	ld a, [hli]
	push hl
	push af
	hlcoord 2, 4
	ld a, [wPokegearPhoneLoadNameBuffer]
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld d, h
	ld e, l
	pop af
	ld b, a
	call Function90380
	pop hl
	ld a, [wPokegearPhoneLoadNameBuffer]
	inc a
	ld [wPokegearPhoneLoadNameBuffer], a
	cp 4
	jr c, .loop
	call PokegearPhone_UpdateCursor
	ret

PokegearPhone_DeletePhoneNumber:
	ld hl, wPhoneList
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wPokegearPhoneCursorPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], 0
	ld hl, wPhoneList
	ld c, CONTACT_LIST_SIZE
.loop
	ld a, [hli]
	and a
	jr nz, .skip
	ld a, [hld]
	ld [hli], a
	ld [hl], 0
.skip
	dec c
	jr nz, .loop
	ret

PokegearPhoneContactSubmenu:
	ld hl, wPhoneList
	ld a, [wPokegearPhoneScrollPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld a, [wPokegearPhoneCursorPosition]
	ld e, a
	ld d, 0
	add hl, de
	ld c, [hl]
	farcall CheckCanDeletePhoneNumber
	ld a, c
	and a
	jr z, .cant_delete
	ld hl, .CallDeleteCancelJumptable
	ld de, .CallDeleteCancelStrings
	jr .got_menu_data

.cant_delete
	ld hl, .CallCancelJumptable
	ld de, .CallCancelStrings
.got_menu_data
	xor a
	ldh [hBGMapMode], a
	push hl
	push de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	inc de
	push hl
	ld bc, hBGMapAddress + 1
	add hl, bc
	ld a, [de]
	inc de
	sla a
	ld b, a
	ld c, 8
	push de
	call Textbox
	pop de
	pop hl
	inc hl
	call PlaceString
	pop de
	xor a
	ld [wPokegearPhoneSubmenuCursor], a
	call .UpdateCursor
	call WaitBGMap
.loop
	push de
	call JoyTextDelay
	pop de
	ld hl, hJoyPressed
	ld a, [hl]
	and D_UP
	jr nz, .d_up
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .a_b
	call DelayFrame
	jr .loop

.d_up
	ld hl, wPokegearPhoneSubmenuCursor
	ld a, [hl]
	and a
	jr z, .loop
	dec [hl]
	call .UpdateCursor
	jr .loop

.d_down
	ld hl, 2
	add hl, de
	ld a, [wPokegearPhoneSubmenuCursor]
	inc a
	cp [hl]
	jr nc, .loop
	ld [wPokegearPhoneSubmenuCursor], a
	call .UpdateCursor
	jr .loop

.a_b
	xor a
	ldh [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	ld a, $1
	ldh [hBGMapMode], a
	pop hl
	ldh a, [hJoyPressed]
	and B_BUTTON
	jr nz, .Cancel
	ld a, [wPokegearPhoneSubmenuCursor]
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Cancel:
	ld hl, PokegearText_WhomToCall
	call PrintText
	scf
	ret

.Delete:
	ld hl, PokegearText_DeleteStoredNumber
	call MenuTextbox
	call YesNoBox
	call ExitMenu
	jr c, .CancelDelete
	call PokegearPhone_DeletePhoneNumber
	xor a
	ldh [hBGMapMode], a
	call PokegearPhone_UpdateDisplayList
	ld hl, PokegearText_WhomToCall
	call PrintText
	call WaitBGMap
.CancelDelete:
	scf
	ret

.Call:
	and a
	ret

.UpdateCursor:
	push de
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	inc de
	ld h, a
	ld a, [de]
	ld c, a
	push hl
	ld a, " "
	ld de, SCREEN_WIDTH * 2
.clear_column
	ld [hl], a
	add hl, de
	dec c
	jr nz, .clear_column
	pop hl
	ld a, [wPokegearPhoneSubmenuCursor]
	ld bc, SCREEN_WIDTH  * 2
	call AddNTimes
	ld [hl], "▶"
	pop de
	ret

.CallDeleteCancelStrings:
	dwcoord 10, 6
	db 3
	db   "CALL"
	next "DELETE"
	next "CANCEL"
	db   "@"

.CallDeleteCancelJumptable:
	dw .Call
	dw .Delete
	dw .Cancel

.CallCancelStrings:
	dwcoord 10, 8
	db 2
	db   "CALL"
	next "CANCEL"
	db   "@"

.CallCancelJumptable:
	dw .Call
	dw .Cancel

.am
	ld [wTempByteValue], a
	and a
	ret

Pokegear_SwitchPage:
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, c
	ld [wJumptableIndex], a
	ld a, b
	ld [wPokegearCard], a
	call DeleteSpriteAnimStruct2ToEnd
	ret

ExitPokegearRadio_HandleMusic:
	ld a, [wPokegearRadioMusicPlaying]
	cp RESTART_MAP_MUSIC
	jr z, .restart_map_music
	cp ENTER_MAP_MUSIC
	call z, EnterMapMusic
	xor a
	ld [wPokegearRadioMusicPlaying], a
	ret

.restart_map_music
	call RestartMapMusic
	xor a
	ld [wPokegearRadioMusicPlaying], a
	ret

DeleteSpriteAnimStruct2ToEnd:
	ld hl, wSpriteAnim2
	ld bc, wSpriteAnimationStructsEnd - wSpriteAnim2
	xor a
	call ByteFill
	ld a, 2
	ld [wSpriteAnimCount], a
	ret

Pokegear_LoadTilemapRLE:
	; Format: repeat count, tile ID
	; Terminated with -1
	hlcoord 0, 0
.loop
	ld a, [de]
	cp -1
	ret z
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	ld a, b
.load
	ld [hli], a
	dec c
	jr nz, .load
	jr .loop

PokegearText_WhomToCall:
	; Whom do you want to call?
	text_far UnknownText_0x1c5847
	text_end

PokegearText_PressAnyButtonToExit:
	; Press any button to exit.
	text_far UnknownText_0x1c5862
	text_end

PokegearText_DeleteStoredNumber:
	; Delete this stored phone number?
	text_far UnknownText_0x1c587d
	text_end

PokegearSpritesGFX:
INCBIN "gfx/pokegear/pokegear_sprites.2bpp.lz"

RadioTilemapRLE:
INCBIN "gfx/pokegear/radio.tilemap.rle"
PhoneTilemapRLE:
INCBIN "gfx/pokegear/phone.tilemap.rle"
ClockTilemapRLE:
INCBIN "gfx/pokegear/clock.tilemap.rle"

_UpdateRadioStation:
	jr UpdateRadioStation

; called from engine/sprite_anims.asm

AnimateTuningKnob:
	push bc
	call .TuningKnob
	pop bc
	ld a, [wRadioTuningKnob]
;	ld hl, SPRITEANIMSTRUCT_XOFFSET
;	add hl, bc
;	ld [hl], a
	ret

.TuningKnob:
	ld hl, hJoyLast
	ld a, [hl]
	and A_BUTTON
	jp nz, MusicPlayer
	ld a, [hl]
	and D_UP
	jr nz, .down
	ld a, [hl]
	and D_DOWN
	jr nz, .up
	ret

.down
	ld hl, wRadioTuningKnob
	ld a, [hl]
	and a
	ret z
	dec [hl]
	dec [hl]
	jr .update

.up
	ld hl, wRadioTuningKnob
	ld a, [hl]
	cp 160
	ret nc
	inc [hl]
	inc [hl]
.update
UpdateRadioStation:
	ld hl, wRadioTuningKnob
	ld d, [hl]
	ld hl, RadioChannels
.loop
	ld a, [hli]
	cp -1
	jr z, .nostation
	cp d
	jr z, .foundstation
	inc hl
	inc hl
	jr .loop

.nostation
	call NoRadioStation
	ret

.foundstation
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .returnafterstation
	push de
	jp hl

.returnafterstation
	ld a, [wPokegearRadioChannelBank]
	and a
	ret z
	xor a
	ldh [hBGMapMode], a
	hlcoord 2, 9
	call PlaceString
	ld a, $1
	ldh [hBGMapMode], a
	ret

MusicPlayer:
	ld hl, wRadioTuningKnob
	ld d, [hl]
	ld hl, MusicPlayerData
.musicplayerloop
	ld a, [hli]
	cp -1
	jr z, .musicplayernostation
	cp d
	jr z, .musicplayerfoundstation
	inc hl
	inc hl
	jr .musicplayerloop

.musicplayernostation
	call NoRadioStation
	ret

.musicplayerfoundstation
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .musicplayerreturnafterstation
	push de
	jp hl

.musicplayerreturnafterstation
	ld a, [wPokegearRadioChannelBank]
	and a
	ret z
	xor a
;	ldh [hBGMapMode], a
;	hlcoord 2, 9
;	call PlaceString
;	ld a, $1
;	ldh [hBGMapMode], a
	ret

MusicPlayerData:
; entries correspond to constants/radio_constants.asm

; frequency value given here = 4 × ingame_frequency − 2
	dbw  0, .NewBarkTownMusic
	dbw  2, .CherrygroveCityMusic
	dbw  4, .VioletCityMusic
	dbw  6, .AzaleaTownMusic
	dbw  8, .GoldenrodCityMusic
	dbw 10, .EcruteakCityMusic
	dbw 12, .DanceTheatreMusic
	dbw 14, .LakeOfRageMusic
	dbw 16, .DragonsDenMusic
	dbw 18, .SSAquaMusic
	dbw 20, .IndigoPlateauMusic
	dbw 22, .PalletTownMusic
	dbw 24, .ViridianCityMusic
	dbw 26, .VermilionCityMusic
	dbw 28, .LavenderTownMusic
	dbw 30, .CeladonCityMusic
	dbw 32, .CinnabarIslandMusic
	dbw 34, .Route1Music
	dbw 36, .Route3Music
	dbw 38, .Route12Music
	dbw 40, .Route26Music
	dbw 42, .Route29Music
	dbw 44, .Route30Music
	dbw 46, .Route36Music
	dbw 48, .Route37Music
	dbw 50, .Route47Music
	dbw 52, .ElmsLabMusic
	dbw 54, .DarkCaveMusic
	dbw 56, .SproutTowerMusic
	dbw 58, .RuinsOfAlphMusic
	dbw 60, .UnionCaveMusic
	dbw 62, .GameCornerMusic
	dbw 64, .NationalForestMusic
	dbw 66, .CatchingContestMusic
	dbw 68, .BurnedTowerMusic
	dbw 70, .BellTowerMusic
	dbw 72, .LighthouseMusic
	dbw 74, .WildAreaMusic
	dbw 76, .WildAreaInsideMusic
	dbw 78, .NinjaHideoutMusic
	dbw 80, .VictoryRoadMusic
	dbw 82, .OaksLabMusic
	dbw 84, .ViridianForestMusic
	dbw 86, .MtMoonMusic
	dbw 88, .CeruleanCaveMusic
	dbw 90, .SilphCoMusic
	dbw 92, .PokemonMansionMusic
	dbw 94, .VictoryRoadRSEMusic
	dbw 96, .JohtoWildMusic
	dbw 98, .JohtoTrainerMusic
	dbw 100, .JohtoGymLeaderMusic
	dbw 102, .DracoMusic
	dbw 104, .DahliaMusic
	dbw 106, .RocketBattleMusic
	dbw 108, .MadameBossMusic
	dbw 110, .SuicuneMusic
	dbw 112, .LugiaMusic
	dbw 114, .HoOhMusic
	dbw 116, .EliteFourMusic
	dbw 118, .ChampionMusic
	dbw 120, .KantoWildMusic
	dbw 122, .KantoTrainerMusic
	dbw 124, .KantoGymLeaderMusic
	dbw 126, .XYLegendaryMusic
	dbw 128, .MewtwoMusic
	dbw 130, .CynthiaBattleMusic
	dbw 132, .OakBattleMusic
	dbw 134, .Megalovania
	dbw 136, .AnthemMusic
	dbw 138, .MomsMusic
	dbw 140, .EusineMusic
	dbw 142, .CynthiaEncounterMusic
	dbw 144, .UnwaveringHeartMusic
	dbw 146, .SurfMusic
	dbw 148, .ClairMusic
	dbw 150, .UnownSignalMusic
	dbw 152, .BikeMusic
	dbw 154, .ProfessorOakMusic
	dbw 156, .ClefairyDanceMusic
	dbw 158, .PokemonMarchMusic
	dbw 160, .BuenasPasswordMusic
	db -1

.BuenasPasswordMusic:
	ld de, MUSIC_BUENAS_PASSWORD
	callfar RadioMusicRestartDE
	ret

.PokemonMarchMusic:
	ld de, MUSIC_POKEMON_MARCH
	callfar RadioMusicRestartDE
	ret

.ClefairyDanceMusic:
	ld de, MUSIC_MT_MOON_SQUARE
	callfar RadioMusicRestartDE
	ret

.ProfessorOakMusic:
	ld de, MUSIC_PROF_OAK
	callfar RadioMusicRestartDE
	ret

.BikeMusic:
	ld de, MUSIC_BICYCLE
	callfar RadioMusicRestartDE
	ret

.ClairMusic:
	ld de, MUSIC_CLAIR
	callfar RadioMusicRestartDE
	ret

.UnownSignalMusic:
	ld de, MUSIC_RUINS_OF_ALPH_RADIO
	callfar RadioMusicRestartDE
	ret

.SurfMusic:
	ld de, MUSIC_SURF
	callfar RadioMusicRestartDE
	ret

.UnwaveringHeartMusic:
	ld de, MUSIC_UNWAVERING_HEART
	callfar RadioMusicRestartDE
	ret

.CynthiaEncounterMusic:
	ld de, MUSIC_CYNTHIA_ENCOUNTER
	callfar RadioMusicRestartDE
	ret

.EusineMusic:
	ld de, MUSIC_MYSTICALMAN_ENCOUNTER
	callfar RadioMusicRestartDE
	ret

.MomsMusic:
	ld de, MUSIC_MOM
	callfar RadioMusicRestartDE
	ret

.AnthemMusic:
	ld de, MUSIC_ANTHEM
	callfar RadioMusicRestartDE
	ret

.SSAquaMusic:
	ld de, MUSIC_SS_AQUA
	callfar RadioMusicRestartDE
	ret

.DragonsDenMusic:
	ld de, MUSIC_DRAGONS_DEN
	callfar RadioMusicRestartDE
	ret

.LakeOfRageMusic:
	ld de, MUSIC_LAKE_OF_RAGE
	callfar RadioMusicRestartDE
	ret

.DanceTheatreMusic:
	ld de, MUSIC_DANCING_HALL
	callfar RadioMusicRestartDE
	ret

.Megalovania:
	ld de, MUSIC_MEGALOVANIA
	callfar RadioMusicRestartDE
	ret

.OakBattleMusic:
	ld de, MUSIC_OAK_BATTLE
	callfar RadioMusicRestartDE
	ret

.CynthiaBattleMusic:
	ld de, MUSIC_CYNTHIA_BATTLE
	callfar RadioMusicRestartDE
	ret

.MewtwoMusic:
	ld de, MUSIC_MEWTWO_BATTLE
	callfar RadioMusicRestartDE
	ret

.XYLegendaryMusic:
	ld de, MUSIC_KANTO_LEGEND_BATTLE_XY
	callfar RadioMusicRestartDE
	ret

.KantoGymLeaderMusic:
	ld de, MUSIC_KANTO_GYM_LEADER_BATTLE
	callfar RadioMusicRestartDE
	ret

.KantoTrainerMusic:
	ld de, MUSIC_KANTO_TRAINER_BATTLE
	callfar RadioMusicRestartDE
	ret

.KantoWildMusic:
	ld de, MUSIC_KANTO_WILD_BATTLE
	callfar RadioMusicRestartDE
	ret

.ChampionMusic:
	ld de, MUSIC_CHAMPION_BATTLE
	callfar RadioMusicRestartDE
	ret

.EliteFourMusic:
	ld de, MUSIC_ELITE_FOUR
	callfar RadioMusicRestartDE
	ret

.HoOhMusic:
	ld de, MUSIC_HO_OH_BATTLE
	callfar RadioMusicRestartDE
	ret

.LugiaMusic:
	ld de, MUSIC_LUGIA_BATTLE
	callfar RadioMusicRestartDE
	ret

.SuicuneMusic:
	ld de, MUSIC_SUICUNE_BATTLE
	callfar RadioMusicRestartDE
	ret

.MadameBossMusic:
	ld de, MUSIC_MADAME_BOSS
	callfar RadioMusicRestartDE
	ret

.RocketBattleMusic:
	ld de, MUSIC_ROCKET_BATTLE
	callfar RadioMusicRestartDE
	ret

.DahliaMusic:
	ld de, MUSIC_MARNIE_BATTLE
	callfar RadioMusicRestartDE
	ret

.DracoMusic:
	ld de, MUSIC_RIVAL_BATTLE
	callfar RadioMusicRestartDE
	ret

.JohtoGymLeaderMusic:
	ld de, MUSIC_JOHTO_GYM_LEADER_BATTLE
	callfar RadioMusicRestartDE
	ret

.JohtoTrainerMusic:
	ld de, MUSIC_JOHTO_TRAINER_BATTLE
	callfar RadioMusicRestartDE
	ret

.JohtoWildMusic:
	ld de, MUSIC_JOHTO_WILD_BATTLE
	callfar RadioMusicRestartDE
	ret

.CinnabarIslandMusic:
	ld de, MUSIC_CINNABAR_ISLAND
	callfar RadioMusicRestartDE
	ret

.PokemonMansionMusic:
	ld de, MUSIC_CINNABAR_MANSION
	callfar RadioMusicRestartDE
	ret

.GameCornerMusic:
	ld de, MUSIC_GAME_CORNER
	callfar RadioMusicRestartDE
	ret

.VictoryRoadRSEMusic:
	ld de, MUSIC_VICTORY_ROAD_RSE
	callfar RadioMusicRestartDE
	ret

.SilphCoMusic:
	ld de, MUSIC_SILPH_CO
	callfar RadioMusicRestartDE
	ret

.CeruleanCaveMusic:
	ld de, MUSIC_ROCKET_LAIR
	callfar RadioMusicRestartDE
	ret

.MtMoonMusic:
	ld de, MUSIC_MT_MOON
	callfar RadioMusicRestartDE
	ret

.OaksLabMusic:
	ld de, MUSIC_POKEMON_TALK
	callfar RadioMusicRestartDE
	ret

.ViridianForestMusic:
	ld de, MUSIC_ROUTE_2
	callfar RadioMusicRestartDE
	ret

.VictoryRoadMusic:
	ld de, MUSIC_VICTORY_ROAD
	callfar RadioMusicRestartDE
	ret

.NinjaHideoutMusic:
	ld de, MUSIC_ROCKET_HIDEOUT
	callfar RadioMusicRestartDE
	ret

.WildAreaInsideMusic:
	ld de, MUSIC_WILD_AREA
	callfar RadioMusicRestartDE
	ret

.WildAreaMusic:
	ld de, MUSIC_WILD_AREA_OUTSIDE
	callfar RadioMusicRestartDE
	ret

.LighthouseMusic:
	ld de, MUSIC_LIGHTHOUSE
	callfar RadioMusicRestartDE
	ret

.BellTowerMusic:
	ld de, MUSIC_TIN_TOWER
	callfar RadioMusicRestartDE
	ret

.BurnedTowerMusic:
	ld de, MUSIC_BURNED_TOWER
	callfar RadioMusicRestartDE
	ret

.CatchingContestMusic:
	ld de, MUSIC_BUG_CATCHING_CONTEST
	callfar RadioMusicRestartDE
	ret

.NationalForestMusic:
	ld de, MUSIC_NATIONAL_PARK
	callfar RadioMusicRestartDE
	ret

.UnionCaveMusic:
	ld de, MUSIC_UNION_CAVE
	callfar RadioMusicRestartDE
	ret

.RuinsOfAlphMusic:
	ld de, MUSIC_RUINS_OF_ALPH_INTERIOR
	callfar RadioMusicRestartDE
	ret

.SproutTowerMusic:
	ld de, MUSIC_SPROUT_TOWER
	callfar RadioMusicRestartDE
	ret

.DarkCaveMusic:
	ld de, MUSIC_DARK_CAVE
	callfar RadioMusicRestartDE
	ret

.ElmsLabMusic:
	ld de, MUSIC_PROF_ELM
	callfar RadioMusicRestartDE
	ret

.AzaleaTownMusic:
	ld de, MUSIC_AZALEA_TOWN
	callfar RadioMusicRestartDE
	ret

.Route1Music:
	ld de, MUSIC_ROUTE_1
	callfar RadioMusicRestartDE
	ret

.Route3Music:
	ld de, MUSIC_ROUTE_3
	callfar RadioMusicRestartDE
	ret

.Route12Music:
	ld de, MUSIC_ROUTE_12
	callfar RadioMusicRestartDE
	ret

.Route26Music:
	ld de, MUSIC_ROUTE_26
	callfar RadioMusicRestartDE
	ret

.Route29Music:
	ld de, MUSIC_ROUTE_29
	callfar RadioMusicRestartDE
	ret

.Route30Music:
	ld de, MUSIC_ROUTE_30
	callfar RadioMusicRestartDE
	ret

.Route36Music:
	ld de, MUSIC_ROUTE_36
	callfar RadioMusicRestartDE
	ret

.Route37Music:
	ld de, MUSIC_ROUTE_37
	callfar RadioMusicRestartDE
	ret

.Route47Music:
	ld de, MUSIC_ROUTE_47
	callfar RadioMusicRestartDE
	ret

.LavenderTownMusic:
	ld de, MUSIC_LAVENDER_TOWN
	callfar RadioMusicRestartDE
	ret

.CeladonCityMusic:
	ld de, MUSIC_CELADON_CITY
	callfar RadioMusicRestartDE
	ret

.PalletTownMusic:
	ld de, MUSIC_PALLET_TOWN
	callfar RadioMusicRestartDE
	ret

.EcruteakCityMusic:
	ld de, MUSIC_ECRUTEAK_CITY
	callfar RadioMusicRestartDE
	ret

.IndigoPlateauMusic:
	ld de, MUSIC_INDIGO_PLATEAU
	callfar RadioMusicRestartDE
	ret

.GSIntroPlayMusic:
.AnthemPlayMusic:
	ld de, MUSIC_ANTHEM
	callfar RadioMusicRestartDE
	ret

.CherrygroveCityMusic:
	ld de, MUSIC_CHERRYGROVE_CITY
	callfar RadioMusicRestartDE
	ret

.NewBarkTownMusic:
	ld de, MUSIC_NEW_BARK_TOWN
	callfar RadioMusicRestartDE
	ret

.VioletCityMusic:
	ld de, MUSIC_VIOLET_CITY
	callfar RadioMusicRestartDE
	ret

.GoldenrodCityMusic:
	ld de, MUSIC_GOLDENROD_CITY
	callfar RadioMusicRestartDE
	ret

.ViridianCityMusic:
	ld de, MUSIC_VIRIDIAN_CITY
	callfar RadioMusicRestartDE
	ret

.VermilionCityMusic:
	ld de, MUSIC_VERMILION_CITY
	callfar RadioMusicRestartDE
	ret

RadioChannels:
; entries correspond to constants/radio_constants.asm

; frequency value given here = 4 × ingame_frequency − 2
	dbw  0, .NewBarkTownMusic
	dbw  2, .CherrygroveCityMusic
	dbw  4, .VioletCityMusic
	dbw  6, .AzaleaTownMusic
	dbw  8, .GoldenrodCityMusic
	dbw 10, .EcruteakCityMusic
	dbw 12, .DanceTheatreMusic
	dbw 14, .LakeOfRageMusic
	dbw 16, .DragonsDenMusic
	dbw 18, .SSAquaMusic
	dbw 20, .IndigoPlateauMusic
	dbw 22, .PalletTownMusic
	dbw 24, .ViridianCityMusic
	dbw 26, .VermilionCityMusic
	dbw 28, .LavenderTownMusic
	dbw 30, .CeladonCityMusic
	dbw 32, .CinnabarIslandMusic
	dbw 34, .Route1Music
	dbw 36, .Route3Music
	dbw 38, .Route12Music
	dbw 40, .Route26Music
	dbw 42, .Route29Music
	dbw 44, .Route30Music
	dbw 46, .Route36Music
	dbw 48, .Route37Music
	dbw 50, .Route47Music
	dbw 52, .ElmsLabMusic
	dbw 54, .DarkCaveMusic
	dbw 56, .SproutTowerMusic
	dbw 58, .RuinsOfAlphMusic
	dbw 60, .UnionCaveMusic
	dbw 62, .GameCornerMusic
	dbw 64, .NationalForestMusic
	dbw 66, .CatchingContestMusic
	dbw 68, .BurnedTowerMusic
	dbw 70, .BellTowerMusic
	dbw 72, .LighthouseMusic
	dbw 74, .WildAreaMusic
	dbw 76, .WildAreaInsideMusic
	dbw 78, .NinjaHideoutMusic
	dbw 80, .VictoryRoadMusic
	dbw 82, .OaksLabMusic
	dbw 84, .ViridianForestMusic
	dbw 86, .MtMoonMusic
	dbw 88, .CeruleanCaveMusic
	dbw 90, .SilphCoMusic
	dbw 92, .PokemonMansionMusic
	dbw 94, .VictoryRoadRSEMusic
	dbw 96, .JohtoWildMusic
	dbw 98, .JohtoTrainerMusic
	dbw 100, .JohtoGymLeaderMusic
	dbw 102, .DracoMusic
	dbw 104, .DahliaMusic
	dbw 106, .RocketBattleMusic
	dbw 108, .MadameBossMusic
	dbw 110, .SuicuneMusic
	dbw 112, .LugiaMusic
	dbw 114, .HoOhMusic
	dbw 116, .EliteFourMusic
	dbw 118, .ChampionMusic
	dbw 120, .KantoWildMusic
	dbw 122, .KantoTrainerMusic
	dbw 124, .KantoGymLeaderMusic
	dbw 126, .XYLegendaryMusic
	dbw 128, .MewtwoMusic
	dbw 130, .CynthiaBattleMusic
	dbw 132, .OakBattleMusic
	dbw 134, .Megalovania
	dbw 136, .AnthemMusic
	dbw 138, .MomsMusic
	dbw 140, .EusineMusic
	dbw 142, .CynthiaEncounterMusic
	dbw 144, .UnwaveringHeartMusic
	dbw 146, .SurfMusic
	dbw 148, .ClairMusic
	dbw 150, .UnownSignalMusic
	dbw 152, .BikeMusic
	dbw 154, .ProfessorOakMusic
	dbw 156, .ClefairyDanceMusic
	dbw 158, .PokemonMarchMusic
	dbw 160, .BuenasPasswordMusic
	db -1

.BuenasPasswordMusic:
	jp LoadStation_BuenasPasswordMusic

.PokemonMarchMusic:
	jp LoadStation_PokemonMarchMusic

.ClefairyDanceMusic:
	jp LoadStation_ClefairyDanceMusic

.ProfessorOakMusic:
	jp LoadStation_ProfessorOakMusic

.BikeMusic:
	jp LoadStation_BikeMusic

.UnownSignalMusic:
	jp LoadStation_UnownSignalMusic

.ClairMusic:
	jp LoadStation_ClairMusic

.SurfMusic:
	jp LoadStation_SurfMusic

.UnwaveringHeartMusic:
	jp LoadStation_UnwaveringMusic

.CynthiaEncounterMusic:
	jp LoadStation_CynthiaEncounterMusic

.EusineMusic:
	jp LoadStation_EusineMusic

.MomsMusic:
	jp LoadStation_MomsMusic

.AnthemMusic:
	jp LoadStation_AnthemMusic

.SSAquaMusic:
	jp LoadStation_SSAquaMusic

.DragonsDenMusic:
	jp LoadStation_DragonsDenMusic

.LakeOfRageMusic:
	jp LoadStation_LakeOfRageMusic

.DanceTheatreMusic:
	jp LoadStation_DanceTheatreMusic

.Megalovania:
	jp LoadStation_Megalovania

.OakBattleMusic:
	jp LoadStation_OakBattleMusic

.CynthiaBattleMusic:
	jp LoadStation_CynthiaMusic

.MewtwoMusic:
	jp LoadStation_MewtwoMusic

.XYLegendaryMusic:
	jp LoadStation_XYLegendaryMusic

.KantoGymLeaderMusic:
	jp LoadStation_KantoGymLeaderMusic

.KantoTrainerMusic:
	jp LoadStation_KantoTrainerMusic

.KantoWildMusic:
	jp LoadStation_KantoWildMusic

.ChampionMusic:
	jp LoadStation_ChampionMusic

.EliteFourMusic:
	jp LoadStation_EliteFourMusic

.HoOhMusic:
	jp LoadStation_HoOhMusic

.LugiaMusic:
	jp LoadStation_LugiaMusic

.SuicuneMusic:
	jp LoadStation_SuicuneMusic

.MadameBossMusic:
	jp LoadStation_MadameBossMusic

.RocketBattleMusic:
	jp LoadStation_RocketBattleMusic

.DahliaMusic:
	jp LoadStation_DahliaMusic

.DracoMusic:
	jp LoadStation_DracoMusic

.JohtoGymLeaderMusic:
	jp LoadStation_JohtoGymLeaderMusic

.JohtoTrainerMusic:
	jp LoadStation_JohtoTrainerMusic

.JohtoWildMusic:
	jp LoadStation_JohtoWildMusic

.CinnabarIslandMusic:
	jp LoadStation_CinnabarIslandMusic

.PokemonMansionMusic:
	jp LoadStation_PokemonMansionMusic

.GameCornerMusic:
	jp LoadStation_GameCornerMusic

.VictoryRoadRSEMusic:
	jp LoadStation_VictoryRoadRSEMusic

.SilphCoMusic:
	jp LoadStation_SilphCoMusic

.CeruleanCaveMusic:
	jp LoadStation_CeruleanCaveMusic

.MtMoonMusic:
	jp LoadStation_MtMoonMusic

.ViridianForestMusic:
	jp LoadStation_ViridianForestMusic

.OaksLabMusic:
	jp LoadStation_OaksLabMusic

.VictoryRoadMusic:
	jp LoadStation_VictoryRoadMusic

.NinjaHideoutMusic:
	jp LoadStation_NinjaHideoutMusic

.WildAreaInsideMusic:
	jp LoadStation_WildAreaInsideMusic

.WildAreaMusic:
	jp LoadStation_WildAreaMusic

.LighthouseMusic:
	jp LoadStation_LighthouseMusic

.BellTowerMusic:
	jp LoadStation_BellTowerMusic

.BurnedTowerMusic:
	jp LoadStation_BurnedTowerMusic

.CatchingContestMusic:
	jp LoadStation_CatchingContestMusic

.NationalForestMusic:
	jp LoadStation_NationalForestMusic

.UnionCaveMusic:
	jp LoadStation_UnionCaveMusic

.RuinsOfAlphMusic:
	jp LoadStation_RuinsOfAlphMusic

.SproutTowerMusic:
	jp LoadStation_SproutTower

.DarkCaveMusic:
	jp LoadStation_DarkCaveMusic

.ElmsLabMusic:
	jp LoadStation_ElmsLabMusic

.PKMNTalkAndPokedexShow:
	jp LoadStation_NewBarkTownMusic

.Route1Music:
	jp LoadStation_Route1Music

.Route3Music:
	jp LoadStation_Route3Music

.Route12Music:
	jp LoadStation_Route12Music

.Route26Music:
	jp LoadStation_Route26Music

.Route29Music:
	jp LoadStation_Route29Music

.Route30Music:
	jp LoadStation_Route30Music

.Route36Music:
	jp LoadStation_Route36Music

.Route37Music:
	jp LoadStation_Route37Music

.Route47Music:
	jp LoadStation_Route47Music

.IntroMusic:
.AzaleaTownMusic:
	jp LoadStation_AzaleaTown

.CherrygroveCityMusic:
	jp LoadStation_CherrygroveCityMusic

.NewBarkTownMusic:
	jp LoadStation_NewBarkTownMusic

.VioletCityMusic:
	jp LoadStation_VioletCityMusic

.GoldenrodCityMusic:
	jp LoadStation_GoldenrodCityMusic

.EcruteakCityMusic:
	jp LoadStation_EcruteakCityMusic

.PalletTownMusic:
	jp LoadStation_PalletTownMusic

.IndigoPlateauMusic:
	jp LoadStation_IndigoPlateauMusic

.ViridianCityMusic:
	jp LoadStation_ViridianCityMusic

.VermilionCityMusic:
	jp LoadStation_VermilionCityMusic

.CeladonCityMusic:
	jp LoadStation_CeladonCityMusic

.LavenderTownMusic:
	jp LoadStation_LavenderTownMusic

;	call JoyTextDelay
;	ld hl, hJoyPressed
;	ld a, [hl]
;	and A_BUTTON
;	jr nz, .pressedA
;	ret

;.pressedA:
;	push de
;	ld a, RESTART_MAP_MUSIC
;	ld [wPokegearRadioMusicPlaying], a
;	ld de, MUSIC_GS_OPENING
;	call PlayMusic
;	ret

.LuckyChannel:
	jp LoadStation_LuckyChannel

.BuenasPassword:
	jp LoadStation_BuenasPassword

.RuinsOfAlphRadio:
	jp LoadStation_UnownRadio

.PlacesAndPeople:
	jp LoadStation_PlacesAndPeople

.LetsAllSing:
	jp LoadStation_LetsAllSing

.PokeFluteRadio:
	jp LoadStation_PokeFluteRadio

.EvolutionRadio:
	jp LoadStation_EvolutionRadio
	ret

.InJohto:
; if in Johto or on the S.S. Aqua, set carry

; otherwise clear carry
	ld a, [wPokegearMapPlayerIconLandmark]
	cp KANTO_LANDMARK
	jr c, .johto
.kanto
	and a
	ret

.johto
	scf
	ret

StoreMusicPlayerData:
	ld [wCurRadioLine], a
	xor a
	ld [wNumRadioLinesPrinted], a
	ld a, BANK(PlayRadioShow)
	ld hl, PlayRadioShow
	call Radio_BackUpFarCallParams
	ret

LoadStation_SurfMusic:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, SurfMusicName
	ret

LoadStation_BuenasPasswordMusic:
	ld a, BUENAS_PASSWORD ; Morikazu Aoki
	call StoreMusicPlayerData
	ld de, BuenasPasswordMusicName
	ret

LoadStation_PokemonMarchMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, PokemonMarchMusicName
	ret

LoadStation_ClefairyDanceMusic:
	ld a, BUENAS_PASSWORD ; Morikazu Aoki
	call StoreMusicPlayerData
	ld de, ClefairyDanceMusicName
	ret

LoadStation_ProfessorOakMusic:
	ld a, BUENAS_PASSWORD ; Morikazu Aoki
	call StoreMusicPlayerData
	ld de, ProfessorOakMusicName
	ret

LoadStation_BikeMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, BikeMusicName
	ret

LoadStation_UnownSignalMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, UnownSignalMusicName
	ret

LoadStation_ClairMusic:
	ld a, BUENAS_PASSWORD ; Morikazu Aoki
	call StoreMusicPlayerData
	ld de, ClairMusicName
	ret

LoadStation_UnwaveringMusic:
	ld a, BUENAS_PASSWORD_19 ; Shota Kageyama & Lyric Wulf
	call StoreMusicPlayerData
	ld de, UnwaveringHeartMusicName
	ret

LoadStation_EusineMusic:
	ld a, BUENAS_PASSWORD ; Morikazu Aoki
	call StoreMusicPlayerData
	ld de, EusineMusicName
	ret

LoadStation_CynthiaEncounterMusic:
	ld a, BUENAS_PASSWORD_3 ; Go Ichinose & TriteHexagon
	call StoreMusicPlayerData
	ld de, CynthiaEncounterMusicName
	ret

LoadStation_MomsMusic:
	xor a ; OAKS_POKEMON_TALK Masuda & Ichinose
	call StoreMusicPlayerData
	ld de, MomsMusicName
	ret

LoadStation_AnthemMusic:
	ld a, POKEMON_MUSIC ; Hajime Wakai & ShockSlayer
	call StoreMusicPlayerData
	ld de, AnthemMusicName
	ret

LoadStation_SSAquaMusic:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, SSAquaMusicName
	ret

LoadStation_DragonsDenMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, DragonsDenMusicName
	ret

LoadStation_LakeOfRageMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, LakeOfRageMusicName
	ret

LoadStation_DanceTheatreMusic:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, DanceTheatreMusicName
	ret

LoadStation_Megalovania:
	ld a, BUENAS_PASSWORD_15 ; Radiation & ShockSlayer
	call StoreMusicPlayerData
	ld de, MegalovaniaMusicName
	ret

LoadStation_OakBattleMusic:
	ld a, LETS_ALL_SING ; Junichi Masuda & Dannye
	call StoreMusicPlayerData
	ld de, OakBattleMusicName
	ret

LoadStation_CynthiaMusic:
	ld a, BUENAS_PASSWORD_3 ; Go Ichinose & TriteHexagon
	call StoreMusicPlayerData
	ld de, CynthiaMusicName
	ret

LoadStation_MewtwoMusic:
	ld a, BUENAS_PASSWORD_10 ; Kenta Nagata, Hajime Wakai, Toru Minegishi, ShockSlayer
	call StoreMusicPlayerData
	ld de, MewtwoMusicName
	ret

LoadStation_XYLegendaryMusic:
	ld a, BUENAS_PASSWORD_6 ; Shota Kageyama, GACT, Pigu
	call StoreMusicPlayerData
	ld de, XYLegendaryMusicName
	ret

LoadStation_KantoGymLeaderMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, KantoGymLeaderMusicName
	ret

LoadStation_KantoTrainerMusic:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, KantoTrainerMusicName
	ret

LoadStation_KantoWildMusic:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, KantoWildMusicName
	ret

LoadStation_ChampionMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, ChampionMusicName
	ret

LoadStation_EliteFourMusic:
	ld a, BUENAS_PASSWORD_3 ; Go Ichinose & TriteHexagon
	call StoreMusicPlayerData
	ld de, EliteFourMusicName
	ret

LoadStation_HoOhMusic:
	ld a, ROCKET_RADIO_8 ; Go Ichinose & Pigu
	call StoreMusicPlayerData
	ld de, HoOhMusicName
	ret

LoadStation_LugiaMusic:
	ld a, ROCKET_RADIO_8 ; Go Ichinose & Pigu
	call StoreMusicPlayerData
	ld de, LugiaMusicName
	ret

LoadStation_SuicuneMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, SuicuneMusicName
	ret

LoadStation_RocketBattleMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, RocketBattleMusicName
	ret

LoadStation_MadameBossMusic:
	ld a, ROCKET_RADIO_4 ; Junichi Masuda, Go Ichinose, TriteHexagon
	call StoreMusicPlayerData
	ld de, MadameBossMusicName
	ret

LoadStation_DahliaMusic:
	ld a, ROCKET_RADIO ; Junichi Masuda & ryanisthebomb203
	call StoreMusicPlayerData
	ld de, DahliaMusicName
	ret

LoadStation_DracoMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, DracoMusicName
	ret

LoadStation_JohtoGymLeaderMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, JohtoGymLeaderMusicName
	ret

LoadStation_JohtoTrainerMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, JohtoTrainerMusicName
	ret

LoadStation_JohtoWildMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, JohtoWildMusicName
	ret

LoadStation_CinnabarIslandMusic:
	ld a, OAKS_POKEMON_TALK_7 ; Hitomi Sato & TriteHexagon
	call StoreMusicPlayerData
	ld de, CinnabarIslandMusicName
	ret

LoadStation_PokemonMansionMusic:
	ld a, LETS_ALL_SING ; Junichi Masuda & Dannye
	call StoreMusicPlayerData
	ld de, PokemonMansionMusicName
	ret

LoadStation_GameCornerMusic:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, GameCornerMusicName
	ret

LoadStation_VictoryRoadRSEMusic:
	ld a, OAKS_POKEMON_TALK_4 ; Go Ichinose & Monstarules
	call StoreMusicPlayerData
	ld de, VictoryRoadRSEMusicName
	ret

LoadStation_SilphCoMusic:
	ld a, LETS_ALL_SING ; Junichi Masuda & Dannye
	call StoreMusicPlayerData
	ld de, SilphCoMusicName
	ret

LoadStation_CeruleanCaveMusic:
	ld a, LETS_ALL_SING ; Junichi Masuda & Dannye
	call StoreMusicPlayerData
	ld de, CeruleanCaveMusicName
	ret

LoadStation_MtMoonMusic:
	ld a, BUENAS_PASSWORD ; Morikazu Aoki
	call StoreMusicPlayerData
	ld de, MtMoonMusicName
	ret

LoadStation_ViridianForestMusic:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, ViridianForestMusicName
	ret

LoadStation_OaksLabMusic:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, OaksLabMusicName
	ret

LoadStation_VictoryRoadMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, VictoryRoadMusicName
	ret

LoadStation_NinjaHideoutMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, NinjaHideoutMusicName
	ret

LoadStation_WildAreaInsideMusic:
	ld a, PLACES_AND_PEOPLE ; Hitomi Sato & Mmmmmm
	call StoreMusicPlayerData
	ld de, WildAreaInsideMusicName
	ret

LoadStation_WildAreaMusic:
	ld a, PLACES_AND_PEOPLE ; Hitomi Sato & Mmmmmm
	call StoreMusicPlayerData
	ld de, WildAreaMusicName
	ret

LoadStation_LighthouseMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, LighthouseMusicName
	ret

LoadStation_BellTowerMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, BellTowerMusicName
	ret

LoadStation_BurnedTowerMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, BurnedTowerMusicName
	ret

LoadStation_CatchingContestMusic:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, CatchingContestMusicName
	ret

LoadStation_NationalForestMusic:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, NationalForestMusicName
	ret

LoadStation_RuinsOfAlphMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, RuinsOfAlphMusicName
	ret

LoadStation_UnionCaveMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, UnionCaveMusicName
	ret

LoadStation_SproutTower:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, SproutTowerMusicName
	ret

LoadStation_DarkCaveMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, DarkCaveMusicName
	ret

LoadStation_ElmsLabMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, ElmsLabMusicName
	ret

LoadStation_NewBarkTownMusic:
	xor a ; OAKS_POKEMON_TALK Masuda & Ichinose
	call StoreMusicPlayerData
	ld de, NewBarkTownPlayerName
	ret

LoadStation_VioletCityMusic:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, VioletCityPlayerName
	ret

LoadStation_ViridianCityMusic:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, ViridianCityMusicName
	ret

LoadStation_VermilionCityMusic:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, VermilionCityMusicName
	ret

LoadStation_AzaleaTown:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, AzaleaTownMusicName
	ret

LoadStation_Route1Music:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, Route1MusicName
	ret

LoadStation_Route3Music:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, Route3MusicName
	ret

LoadStation_Route26Music:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, Route26MusicName
	ret

LoadStation_LavenderTownMusic:
	ld a, LUCKY_CHANNEL ; Go Ichinose Solo
	call StoreMusicPlayerData
	ld de, LavenderTownMusicName
	ret

LoadStation_PalletTownMusic:
	ld a, BUENAS_PASSWORD ; Morikazu Aoki
	call StoreMusicPlayerData
	ld de, PalletTownMusicName
	ret

LoadStation_Route12Music:
	ld a, BUENAS_PASSWORD ; Morikazu Aoki
	call StoreMusicPlayerData
	ld de, Route12MusicName
	ret

LoadStation_CeladonCityMusic:
	ld a, BUENAS_PASSWORD ; Morikazu Aoki
	call StoreMusicPlayerData
	ld de, CeladonCityMusicName
	ret

LoadStation_EcruteakCityMusic:
	ld a, LUCKY_CHANNEL
	call StoreMusicPlayerData
	ld de, EcruteakCityMusicName
	ret

LoadStation_GoldenrodCityMusic:
	ld a, LUCKY_CHANNEL
	call StoreMusicPlayerData
	ld de, GoldenrodCityMusicName
	ret

LoadStation_CherrygroveCityMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, CherrygroveCityPlayerName
	ret

LoadStation_Route29Music:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, Route29MusicName
	ret

LoadStation_Route30Music:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, Route30MusicName
	ret

LoadStation_Route36Music:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, Route36MusicName
	ret

LoadStation_Route37Music:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, Route37MusicName
	ret

LoadStation_Route47Music:
	ld a, PLACES_AND_PEOPLE ; Hitomi Sato & Mmmmmm
	call StoreMusicPlayerData
	ld de, Route47MusicName
	ret

LoadStation_IndigoPlateauMusic:
	ld a, POKEDEX_SHOW ; Junichi Masuda Solo
	call StoreMusicPlayerData
	ld de, IndigoPlateauPlayerName
	ret

LoadStation_LuckyChannel:
	ret

LoadStation_BuenasPassword:
	ret

LoadStation_UnownRadio:
	ret

LoadStation_PlacesAndPeople:
	ret

LoadStation_LetsAllSing:
	ret

LoadStation_RocketRadio:
	ret

LoadStation_PokeFluteRadio:
	ret

LoadStation_EvolutionRadio:
	ret

RadioMusicRestartDE:
	push de
	ld a, e
	ld [wPokegearRadioMusicPlaying], a
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	ret

RadioMusicRestartPokemonChannel:
	push de
	ld a, RESTART_MAP_MUSIC
	ld [wPokegearRadioMusicPlaying], a
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	ld de, MUSIC_POKEMON_CHANNEL
	call PlayMusic
	ret

Radio_BackUpFarCallParams:
	ld [wPokegearRadioChannelBank], a
	ld a, l
	ld [wPokegearRadioChannelAddr], a
	ld a, h
	ld [wPokegearRadioChannelAddr + 1], a
	ret

NoRadioStation:
	call NoRadioMusic
	call NoRadioName
	xor a
	ld [wPokegearRadioChannelBank], a
	ld [wPokegearRadioChannelAddr], a
	ld [wPokegearRadioChannelAddr + 1], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

NoRadioMusic:
	ld de, MUSIC_NONE
	call PlayMusic
	ld a, ENTER_MAP_MUSIC
	ld [wPokegearRadioMusicPlaying], a
	ret

NoRadioName:
	xor a
	ldh [hBGMapMode], a
	hlcoord 1, 8
	lb bc, 3, 18
	call ClearBox
	hlcoord 0, 12
	lb bc, 4, 18
	call Textbox
	ret

NewBarkTownPlayerName:     db "New Bark Town   @"
VioletCityPlayerName:      db "Violet City     @"
AzaleaTownMusicName:       db "Azalea Town     @"
CherrygroveCityPlayerName: db "Cherrygrove City@"
LuckyChannelName:          db "Lucky Channel@"
UnownStationName:          db "?????@"
EcruteakCityMusicName:     db "Ecruteak City   @"
PlacesAndPeopleName:       db "Places & People @"
LetsAllSingName:           db "Let's All Sing! @"
PokeFluteStationName:      db "# FLUTE@"
PalletTownMusicName:       db "Pallet Town     @"
GoldenrodCityMusicName:    db "Goldenrod City  @"
IndigoPlateauPlayerName:   db "Indigo Plateau  @"
ViridianCityMusicName:     db "Viridian City   @"
VermilionCityMusicName:    db "Vermilion City  @"
CeladonCityMusicName:      db "Celadon City    @"
LavenderTownMusicName:     db "Lavender Town   @"
Route1MusicName:           db "Route 1         @"
Route3MusicName:           db "Route 3         @"
Route12MusicName:          db "Route 12        @"
Route26MusicName:          db "Route 26        @"
Route29MusicName:          db "Route 29        @"
Route30MusicName:          db "Route 30        @"
Route36MusicName:          db "Route 36        @"
Route37MusicName:          db "Route 37        @"
Route47MusicName:          db "Route 47        @"
ElmsLabMusicName:          db "Elm's Lab       @"
DarkCaveMusicName:         db "Dark Cave       @"
SproutTowerMusicName:      db "Sprout Tower    @"
RuinsOfAlphMusicName:      db "Ruins of Alph   @"
UnionCaveMusicName:        db "Union Cave      @"
NationalForestMusicName:   db "National Forest @"
CatchingContestMusicName:  db "Catching Contest@"
BurnedTowerMusicName:      db "Burned Tower    @"
BellTowerMusicName:        db "Bell Tower      @"
LighthouseMusicName:       db "Lighthouse      @"
WildAreaMusicName:         db "Safari Zone Gate@"
WildAreaInsideMusicName:   db "Safari Zone     @"
NinjaHideoutMusicName:     db "Ninja Hideout   @"
VictoryRoadMusicName:      db "Victory Road    @"
OaksLabMusicName:          db "Oak's Lab       @"
ViridianForestMusicName:   db "Viridian Forest @"
MtMoonMusicName:           db "Mt. Moon        @"
CeruleanCaveMusicName:     db "Cerulean Cave   @"
SilphCoMusicName:          db "Silph Co.       @"
VictoryRoadRSEMusicName:   db "Victory Road RSE@"
GameCornerMusicName:       db "Game Corner     @"
PokemonMansionMusicName:   db "#mon Mansion @"
CinnabarIslandMusicName:   db "Cinnabar Island @"
JohtoWildMusicName:        db "Johto Wild      @"
JohtoTrainerMusicName:     db "Johto Trainer   @"
JohtoGymLeaderMusicName:   db "Johto Gym Leader@"
DracoMusicName:            db "Rival Battle    @"
DahliaMusicName:           db "Marnie Battle   @"
RocketBattleMusicName:     db "Rocket Battle   @"
MadameBossMusicName:       db "The Boss        @"
SuicuneMusicName:          db "Suicune Battle  @"
LugiaMusicName:            db "Lugia Battle    @"
HoOhMusicName:             db "Ho-Oh Battle    @"
EliteFourMusicName:        db "Elite Four FRLG @"
ChampionMusicName:         db "Champion Battle @"
KantoWildMusicName:        db "Kanto Wild      @"
KantoTrainerMusicName:     db "Kanto Trainer   @"
KantoGymLeaderMusicName:   db "Kanto Gym Leader@"
XYLegendaryMusicName:      db "Kanto Legendary @"
MewtwoMusicName:           db "Mewtwo Battle   @"
CynthiaMusicName:          db "Cynthia Battle  @"
OakBattleMusicName:        db "RBY Champion    @"
MegalovaniaMusicName:      db "Megalovania     @"
DanceTheatreMusicName:     db "Dance Theatre   @"
LakeOfRageMusicName:       db "Lake Of Rage    @"
DragonsDenMusicName:       db "Dragon's Den    @"
SSAquaMusicName:           db "S.S. Aqua       @"
AnthemMusicName:           db "Stadium 2 Anthem@"
MomsMusicName:             db "Mom             @"
CynthiaEncounterMusicName: db "Meet Cynthia    @"
EusineMusicName:           db "Eusine          @"
UnwaveringHeartMusicName:  db "Unwavering Heart@"
SurfMusicName:             db "Surf Theme      @"
ClairMusicName:            db "Clair           @"
UnownSignalMusicName:      db "Unown Signal    @"
BikeMusicName:             db "Bicycle         @"
ProfessorOakMusicName:     db "Professor Oak   @"
ClefairyDanceMusicName:    db "Clefairy Dance  @"
PokemonMarchMusicName:     db "#mon March   @"
BuenasPasswordMusicName:   db "Buena's Password@"

_TownMap:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]

	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a

	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a

	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call DisableLCD
	call Pokegear_LoadGFX
	farcall ClearSpriteAnims
	ld a, 8
	call SkipMusic
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	call TownMap_GetCurrentLandmark
	ld [wTownMapPlayerIconLandmark], a
	ld [wTownMapCursorLandmark], a
	xor a
	ldh [hBGMapMode], a
	call .InitTilemap
	call WaitBGMap2
	ld a, [wTownMapPlayerIconLandmark]
	call PokegearMap_InitPlayerIcon
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_InitCursor
	ld a, c
	ld [wTownMapCursorObjectPointer], a
	ld a, b
	ld [wTownMapCursorObjectPointer + 1], a
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
	ldh a, [hCGB]
	and a
	jr z, .dmg
	ld a, %11100100
	call DmgToCgbObjPal0
	call DelayFrame

.dmg
	ld a, [wTownMapPlayerIconLandmark]
	cp SEVII_LANDMARK
	jr nc, .sevii
	cp KANTO_LANDMARK
	jr nc, .kanto
	ld d, SILVER_CAVE
	ld e, BLACKTHORN_CITY
	jr .resume

.kanto
	call TownMap_GetKantoLandmarkLimits
	jr .resume

.sevii
	call TownMap_GetSeviiLandmarkLimits
.resume
	call .loop
	pop af
	ld [wVramState], a
	pop af
	ldh [hInMenu], a
	pop af
	ld [wOptions], a
	call ClearBGPalettes
	ret

.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	ret nz

	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .pressed_up

	ld a, [hl]
	and D_DOWN
	jr nz, .pressed_down
.loop2
	push de
	farcall PlaySpriteAnimations
	pop de
	call DelayFrame
	jr .loop

.pressed_up
	ld hl, wTownMapCursorLandmark
	ld a, [hl]
	cp d
	jr c, .okay
	ld a, e
	dec a
	ld [hl], a

.okay
	inc [hl]
	jr .next

.pressed_down
	ld hl, wTownMapCursorLandmark
	ld a, [hl]
	cp e
	jr nz, .okay2
	ld a, d
	inc a
	ld [hl], a

.okay2
	dec [hl]

.next
	push de
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName
	ld a, [wTownMapCursorObjectPointer]
	ld c, a
	ld a, [wTownMapCursorObjectPointer + 1]
	ld b, a
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_UpdateCursorPosition
	pop de
	jr .loop2

.InitTilemap:
	ld a, [wTownMapPlayerIconLandmark]
	cp SEVII_LANDMARK
	jr nc, .sevii2
	cp KANTO_LANDMARK
	jr nc, .kanto2
	ld e, JOHTO_REGION
	jr .okay_tilemap

.kanto2
	ld e, KANTO_REGION
	jr .okay_tilemap
.sevii2
	ld e, SEVII_ISLANDS
.okay_tilemap
	farcall PokegearMap
	ld a, [wTownMapCursorLandmark]
	call PokegearMap_UpdateLandmarkName
	farcall TownMapPals
	ret

PlayRadio:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call .PlayStation
	ld c, 100
	call DelayFrames
.loop
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and A_BUTTON | B_BUTTON
	jr nz, .stop
	ld a, [wPokegearRadioChannelAddr]
	ld l, a
	ld a, [wPokegearRadioChannelAddr + 1]
	ld h, a
	ld a, [wPokegearRadioChannelBank]
	and a
	jr z, .zero
	rst FarCall
.zero
	call DelayFrame
	jr .loop

.stop
	pop af
	ld [wOptions], a
	call ExitPokegearRadio_HandleMusic
	ret

.PlayStation:
	ld a, ENTER_MAP_MUSIC
	ld [wPokegearRadioMusicPlaying], a
	ld hl, .StationPointers
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .jump_return
	push de
	jp hl

.jump_return
	push de
	hlcoord 0, 12
	lb bc, 4, 18
	call Textbox
	hlcoord 1, 14
	ld [hl], "“"
	pop de
	hlcoord 2, 14
	call PlaceString
	ld h, b
	ld l, c
	ld [hl], "”"
	call WaitBGMap
	ret

.StationPointers:
; entries correspond to MAPRADIO_* constants
	dw .OakOrPnP
	dw LoadStation_CherrygroveCityMusic
	dw LoadStation_VioletCityMusic
	dw LoadStation_AzaleaTown
	dw LoadStation_LuckyChannel
	dw LoadStation_UnownRadio
	dw LoadStation_PlacesAndPeople
	dw LoadStation_LetsAllSing
	dw LoadStation_RocketRadio
;	dw LoadStation_AnthemMusic

.OakOrPnP:
	jp LoadStation_NewBarkTownMusic

PokegearMap:
	ld a, e
	cp 2
	jr z, .sevii
	cp 1
	jr z, .kanto
	call LoadTownMapGFX
	call FillJohtoMap
	ret

.kanto
	call LoadTownMapGFX
	call FillKantoMap
	ret

.sevii
	call LoadTownMapGFX
	call FillSeviiMap
	ret

_FlyMap:
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], $1
	xor a
	ldh [hBGMapMode], a
	farcall ClearSpriteAnims
	call LoadTownMapGFX2
	ld de, FlyMapLabelBorderGFX
	ld hl, vTiles2 tile $30
	lb bc, BANK(FlyMapLabelBorderGFX), 6
	call Request1bpp
	call FlyMap
	call ret_91c8f
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .pressedB
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressedA
	call FlyMapScroll
	call GetMapCursorCoordinates
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .loop

.pressedB
	ld a, -1
	jr .exit

.pressedA
	ld a, [wTownMapPlayerIconLandmark]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld a, [hl]
.exit
	ld [wTownMapPlayerIconLandmark], a
	pop af
	ldh [hInMenu], a
	call ClearBGPalettes
	ld a, $90
	ldh [hWY], a
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	ld a, [wTownMapPlayerIconLandmark]
	ld e, a
	ret

FlyMapScroll:
	ld a, [wStartFlypoint]
	ld e, a
	ld a, [wEndFlypoint]
	ld d, a
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .ScrollNext
	ld a, [hl]
	and D_DOWN
	jr nz, .ScrollPrev
	push hl
	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp SEVII_LANDMARK
	jr nc, .sevii
	pop hl
	ld a, [hl]
	and D_LEFT
	jp nz, .JohtoMap
	ld a, [hl]
	and D_RIGHT
	jr nz, .KantoMap
	ret

.sevii:
	pop hl
	ret

.ScrollNext:
	ld hl, wTownMapPlayerIconLandmark
	ld a, [hl]
	cp d
	jr nz, .NotAtEndYet
	ld a, e
	dec a
	ld [hl], a
.NotAtEndYet:
	inc [hl]
	call CheckIfVisitedFlypoint
	jr z, .ScrollNext
	jr .Finally

.ScrollPrev:
	ld hl, wTownMapPlayerIconLandmark
	ld a, [hl]
	cp e
	jr nz, .NotAtStartYet
	ld a, d
	inc a
	ld [hl], a
.NotAtStartYet:
	dec [hl]
	call CheckIfVisitedFlypoint
	jr z, .ScrollPrev
.Finally:
	call TownMapBubble
	call WaitBGMap
	xor a
	ldh [hBGMapMode], a
	ret

.KantoMap:
	ldh a, [hWY]
	and a
	ret z
	ld c, SPAWN_INDIGO
	call HasVisitedSpawn
	and a
	ret z
	ld a, FLY_PALLET
	ld [wStartFlypoint], a
; ...and end at Indigo Plateau
	ld a, FLY_INDIGO
	ld [wEndFlypoint], a
; Because Indigo Plateau is the first flypoint the player
; visits, it's made the default flypoint.
	ld [wTownMapPlayerIconLandmark], a
	call FillKantoMap
	call ClearSprites
	call TownMapMon
	xor a
	ld b, $9c
	ldh [hWY], a
	ld a, b
	ldh [hBGMapAddress + 1], a
	call TownMapBubble
	call WaitBGMap
	xor a
	ldh [hBGMapMode], a
	ret

.JohtoMap:
	ldh a, [hWY]
	cp $90
	ret z
	ld c, SPAWN_INDIGO
	call HasVisitedSpawn
	and a
	ret z
	ld a, FLY_BLACKTHORN
	ld [wTownMapPlayerIconLandmark], a
; Flypoints begin at New Bark Town...
	ld [wStartFlypoint], a
; ..and end at Silver Cave.
	ld a, FLY_MT_SILVER
	ld [wEndFlypoint], a
	call FillJohtoMap
	call ClearSprites
	call TownMapMon
	ld a, $90
	ld b, $98
	ldh [hWY], a
	ld a, b
	ldh [hBGMapAddress + 1], a
	call TownMapBubble
	call WaitBGMap
	xor a
	ldh [hBGMapMode], a
	ret

TownMapBubble:
; Draw the bubble containing the location text in the town map HUD

; Top-left corner
	hlcoord 0, 0
	ld a, $30
	ld [hli], a
; Top row
	ld bc, 18
	ld a, " "
	call ByteFill
; Top-right corner
	ld a, $31
	ld [hli], a

; Bottom-left corner
	ld a, $32
	ld [hli], a
; Bottom row
	ld bc, 18
	ld a, " "
	call ByteFill
; Bottom-right corner
	ld a, $33
	ld [hl], a

; Print "Where?"
	hlcoord 1, 0
	ld de, .Where
	call PlaceString
; Print the name of the default flypoint
	call .Name
; Up/down arrows
	hlcoord 18, 1
	ld [hl], $34
	ret

.Where:
	db "Where?@"

.Name:
; We need the map location of the default flypoint
	ld a, [wTownMapPlayerIconLandmark]
	ld l, a
	ld h, 0
	add hl, hl ; two bytes per flypoint
	ld de, Flypoints
	add hl, de
	ld e, [hl]
	farcall GetLandmarkName
	hlcoord 2, 1
	ld de, wStringBuffer1
	call PlaceString
	ret

GetMapCursorCoordinates:
	ld a, [wTownMapPlayerIconLandmark]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Flypoints
	add hl, de
	ld e, [hl]
	farcall GetLandmarkCoords
	ld a, [wTownMapCursorCoordinates]
	ld c, a
	ld a, [wTownMapCursorCoordinates + 1]
	ld b, a
	ld hl, 4
	add hl, bc
	ld [hl], e
	ld hl, 5
	add hl, bc
	ld [hl], d
	ret

CheckIfVisitedFlypoint:
; Check if the flypoint loaded in [hl] has been visited yet.
	push bc
	push de
	push hl
	ld l, [hl]
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld c, [hl]
	call HasVisitedSpawn
	pop hl
	pop de
	pop bc
	and a
	ret

HasVisitedSpawn:
; Check if spawn point c has been visited.
	ld hl, wVisitedSpawns
	ld b, CHECK_FLAG
	ld d, 0
	predef SmallFarFlagAction
	ld a, c
	ret

INCLUDE "data/maps/flypoints.asm"

ret_91c8f:
	ret

FlyMap:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
; If we're not in a valid location, i.e. Pokecenter floor 2F,
; the backup map information is used.
	cp SPECIAL_MAP
	jr nz, .CheckRegion
	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	call GetWorldMapLocation
.CheckRegion:
; The first 46 locations are part of Johto. The rest are in Kanto.
	cp SEVII_LANDMARK
	jp nc, .seviiislandsmap
	cp KANTO_LANDMARK
	jr nc, .NoKanto
.JohtoFlyMap:
; Note that .NoKanto should be modified in tandem with this branch
	push af
; Start from New Bark Town
	ld a, FLY_BLACKTHORN
	ld [wTownMapPlayerIconLandmark], a
; Flypoints begin at New Bark Town...
	ld [wStartFlypoint], a
; ..and end at Silver Cave.
	ld a, FLY_MT_SILVER
	ld [wEndFlypoint], a
; Fill out the map
	call FillKantoMap
	call TownMapBubble
	call TownMapPals
	hlbgcoord 0, 0, vBGMap1
	call TownMapBGUpdate
	call FillJohtoMap
	call .MapHud
	pop af
;	call TownMapPlayerIcon
	ret

.KantoFlyMap:
; The event that there are no flypoints enabled in a map is not
; accounted for. As a result, if you attempt to select a flypoint
; when there are none enabled, the game will crash. Additionally,
; the flypoint selection has a default starting point that
; can be flown to even if none are enabled.
; To prevent both of these things from happening when the player
; enters Kanto, fly access is restricted until Indigo Plateau is
; visited and its flypoint enabled.
	push af
	ld c, SPAWN_INDIGO
	call HasVisitedSpawn
	and a
	jr z, .NoKanto
; Kanto's map is only loaded if we've visited Indigo Plateau

; Flypoints begin at Pallet Town...
	ld a, FLY_PALLET
	ld [wStartFlypoint], a
; ...and end at Indigo Plateau
	ld a, FLY_INDIGO
	ld [wEndFlypoint], a
; Because Indigo Plateau is the first flypoint the player
; visits, it's made the default flypoint.
	ld [wTownMapPlayerIconLandmark], a
; Fill out the map
	call FillJohtoMap
	call TownMapBubble
	call TownMapPals
	hlbgcoord 0, 0, vBGMap1
	call TownMapBGUpdate
	call FillKantoMap
	call .MapHud
	pop af
	call TownMapPlayerIcon
	ret

.NoKanto:
; If Indigo Plateau hasn't been visited, we use Johto's map instead

	push af
; Start from New Bark Town
	ld a, FLY_BLACKTHORN
	ld [wTownMapPlayerIconLandmark], a
; Flypoints begin at New Bark Town...
	ld [wStartFlypoint], a
; ..and end at Silver Cave
	ld a, FLY_MT_SILVER
	ld [wEndFlypoint], a
	call FillKantoMap
	call TownMapBubble
	call TownMapPals
	hlbgcoord 0, 0, vBGMap1
	call TownMapBGUpdate
	call FillJohtoMap
	pop af
.MapHud:
	call TownMapBubble
	call TownMapPals
	hlbgcoord 0, 0 ; BG Map 0
.FinishHud:
	call TownMapBGUpdate
	call TownMapMon
	ld a, c
	ld [wTownMapCursorCoordinates], a
	ld a, b
	ld [wTownMapCursorCoordinates + 1], a
	ret

.seviiislandsmap:
	push af
; Start from New Bark Town
	ld a, FLY_ONE_ISLAND
	ld [wTownMapPlayerIconLandmark], a
; Flypoints begin at New Bark Town...
	ld [wStartFlypoint], a
; ..and end at Silver Cave.
	ld a, FLY_ONE_ISLAND
	ld [wEndFlypoint], a
; Fill out the map
	call FillSeviiMap
	call .MapHud
	pop af
	call TownMapPlayerIcon
	ret

Pokedex_GetArea:
; e: Current landmark
	ld a, [wTownMapPlayerIconLandmark]
	push af
	ld a, [wTownMapCursorLandmark]
	push af
	ld a, e
	ld [wTownMapPlayerIconLandmark], a
	call ClearSprites
	xor a
	ldh [hBGMapMode], a
	ld a, $1
	ldh [hInMenu], a
	ld de, PokedexNestIconGFX
	ld hl, vTiles0 tile $7f
	lb bc, BANK(PokedexNestIconGFX), 1
	call Request2bpp
	call .GetPlayerOrFastShipIcon
	ld hl, vTiles0 tile $78
	ld c, 4
	call Request2bpp
	call LoadTownMapGFX2
	call FillKantoMap
	call .PlaceString_MonsNest
	call TownMapPals
	hlbgcoord 0, 0, vBGMap1
	call TownMapBGUpdate
	call FillJohtoMap
	call .PlaceString_MonsNest
	call TownMapPals
	hlbgcoord 0, 0
	call TownMapBGUpdate
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
	xor a
	ldh [hBGMapMode], a
	xor a ; JOHTO_REGION
	call .GetAndPlaceNest
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .a_b
	ldh a, [hJoypadDown]
	and SELECT
	jr nz, .select
	call .LeftRightInput
	call .BlinkNestIcons
	jr .next

.select
	call .HideNestsShowPlayer
.next
	call DelayFrame
	jr .loop

.a_b
	call ClearSprites
	pop af
	ld [wTownMapCursorLandmark], a
	pop af
	ld [wTownMapPlayerIconLandmark], a
	ret

.LeftRightInput:
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ret

.left
	ldh a, [hWY]
	cp $90
	ret z
	call ClearSprites
	ld a, $90
	ldh [hWY], a
	xor a ; JOHTO_REGION
	call .GetAndPlaceNest
	ret

.right
	ld a, [wStatusFlags]
	bit STATUSFLAGS_HALL_OF_FAME_F, a
	ret z
	ldh a, [hWY]
	and a
	ret z
	call ClearSprites
	xor a
	ldh [hWY], a
	ld a, KANTO_REGION
	call .GetAndPlaceNest
	ret

.BlinkNestIcons:
	ldh a, [hVBlankCounter]
	ld e, a
	and $f
	ret nz
	ld a, e
	and $10
	jr nz, .copy_sprites
	call ClearSprites
	ret

.copy_sprites
	hlcoord 0, 0
	ld de, wVirtualOAM
	ld bc, wVirtualOAMEnd - wVirtualOAM
	call CopyBytes
	ret

.PlaceString_MonsNest:
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call GetPokemonName
	hlcoord 2, 0
	call PlaceString
	ld h, b
	ld l, c
	ld de, .String_SNest
	call PlaceString
	ret

.String_SNest:
	db "'s Nest@"

.GetAndPlaceNest:
	ld [wTownMapCursorLandmark], a
	ld e, a
	farcall FindNest ; load nest landmarks into wTileMap[0,0]
	decoord 0, 0
	ld hl, wVirtualOAMSprite00
.nestloop
	ld a, [de]
	and a
	jr z, .done_nest
	push de
	ld e, a
	push hl
	farcall GetLandmarkCoords
	pop hl
	; load into OAM
	ld a, d
	sub 4
	ld [hli], a ; y
	ld a, e
	sub 4
	ld [hli], a ; x
	ld a, $7f ; nest icon
	ld [hli], a ; tile id
	xor a
	ld [hli], a ; attributes
	; next
	pop de
	inc de
	jr .nestloop

.done_nest
	ld hl, wVirtualOAM
	decoord 0, 0
	ld bc, wVirtualOAMEnd - wVirtualOAM
	call CopyBytes
	ret

.HideNestsShowPlayer:
	call .CheckPlayerLocation
	ret c
	ld a, [wTownMapPlayerIconLandmark]
	ld e, a
	farcall GetLandmarkCoords
	ld c, e
	ld b, d
	ld de, .PlayerOAM
	ld hl, wVirtualOAMSprite00
.ShowPlayerLoop:
	ld a, [de]
	cp $80
	jr z, .clear_oam
	add b
	ld [hli], a ; y
	inc de
	ld a, [de]
	add c
	ld [hli], a ; x
	inc de
	ld a, [de]
	add $78 ; where the player's sprite is loaded
	ld [hli], a ; tile id
	inc de
	push bc
	ld c, PAL_OW_BLUE
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .male
	ld c, PAL_OW_RED
.male
	ld a, c
	ld [hli], a ; attributes
	pop bc
	jr .ShowPlayerLoop

.clear_oam
	ld hl, wVirtualOAMSprite04
	ld bc, wVirtualOAMEnd - wVirtualOAMSprite04
	xor a
	call ByteFill
	ret

.PlayerOAM:
	; y pxl, x pxl, tile offset
	db -1 * 8, -1 * 8, 0 ; top left
	db -1 * 8,  0 * 8, 1 ; top right
	db  0 * 8, -1 * 8, 2 ; bottom left
	db  0 * 8,  0 * 8, 3 ; bottom right
	db $80 ; terminator

.CheckPlayerLocation:
; Don't show the player's sprite if you're
; not in the same region as what's currently
; on the screen.
	ld a, [wTownMapPlayerIconLandmark]
	cp KANTO_LANDMARK
	jr c, .johto
.kanto
	ld a, [wTownMapCursorLandmark]
	and a
	jr z, .clear
	jr .ok

.johto
	ld a, [wTownMapCursorLandmark]
	and a
	jr nz, .clear
.ok
	and a
	ret

.clear
	call ClearSprites
	scf
	ret

.GetPlayerOrFastShipIcon:
	ld a, [wTownMapPlayerIconLandmark]
	farcall GetPlayerIcon
	ret

.FastShip:
	ld de, FastShipGFX
	ld b, BANK(FastShipGFX)
	ret

TownMapBGUpdate:
; Update BG Map tiles and attributes

; BG Map address
	ld a, l
	ldh [hBGMapAddress], a
	ld a, h
	ldh [hBGMapAddress + 1], a
; Only update palettes on CGB
	ldh a, [hCGB]
	and a
	jr z, .tiles
; BG Map mode 2 (palettes)
	ld a, 2
	ldh [hBGMapMode], a
; The BG Map is updated in thirds, so we wait

; 3 frames to update the whole screen's palettes.
	ld c, 3
	call DelayFrames
.tiles
; Update BG Map tiles
	call WaitBGMap
; Turn off BG Map update
	xor a
	ldh [hBGMapMode], a
	ret

FillJohtoMap:
	ld de, JohtoMap
	jr FillTownMap

FillKantoMap:
	ld de, KantoMap
	jr FillTownMap

FillSeviiMap:
	ld de, SeviiMap
FillTownMap:
	hlcoord 0, 0
.loop
	ld a, [de]
	cp -1
	ret z
	ld a, [de]
	ld [hli], a
	inc de
	jr .loop

TownMapPals:
; Assign palettes based on tile ids
	hlcoord 0, 0
	decoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
.loop
; Current tile
	ld a, [hli]
	push hl
; The palette map covers tiles $00 to $7e; $7f and above use palette 0
	cp $7f
	jr nc, .pal0

; The palette data is condensed to nybbles, least-significant first.
	ld hl, .PalMap
	srl a
	jr c, .odd
; Even-numbered tile ids take the bottom nybble...
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	and PALETTE_MASK
	jr .update

.odd
; ...and odd ids take the top.
	add l
	ld l, a
	ld a, h
	adc 0
	ld h, a
	ld a, [hl]
	swap a
	and PALETTE_MASK
	jr .update

.pal0
	xor a
.update
	pop hl
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

.PalMap:
INCLUDE "gfx/pokegear/town_map_palette_map.asm"

TownMapMon:
; Draw the FlyMon icon at town map location

; Get FlyMon species

; Get FlyMon icon
	ld e, $08 ; starting tile in VRAM
	farcall FlyFunction_GetMonIcon
; Animation/palette
	depixel 0, 0
	ld a, SPRITE_ANIM_INDEX_PARTY_MON
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $08
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld [hl], SPRITE_ANIM_SEQ_NULL
	ret

TownMapPlayerIcon:
; Draw the player icon at town map location in a
	push af
	farcall GetPlayerIcon
; Standing icon
	ld hl, vTiles0 tile $10
	ld c, 4 ; # tiles
	call Request2bpp
; Walking icon
	ld hl, $c0
	add hl, de
	ld d, h
	ld e, l
	ld hl, vTiles0 tile $14
	ld c, 4 ; # tiles
	ld a, BANK(ChrisSpriteGFX) ; does nothing
	call Request2bpp
; Animation/palette
	depixel 0, 0
	ld b, SPRITE_ANIM_INDEX_BLUE_WALK ; Male
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .got_gender
	ld b, SPRITE_ANIM_INDEX_RED_WALK ; Female
.got_gender
	ld a, b
	call _InitSpriteAnimStruct
	ld hl, SPRITEANIMSTRUCT_TILE_ID
	add hl, bc
	ld [hl], $10
	pop af
	ld e, a
	push bc
	farcall GetLandmarkCoords
	pop bc
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], e
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld [hl], d
	ret

LoadTownMapGFX:
	ld hl, TownMapGFX
	ld de, vTiles2
	lb bc, BANK(TownMapGFX), 50
	call DecompressRequest2bpp
	ret

LoadTownMapGFX2:
	ld hl, TownMapGFX
	ld de, vTiles2
	lb bc, BANK(TownMapGFX), 96
	call DecompressRequest2bpp
	ret

JohtoMap:
INCBIN "gfx/pokegear/johto.bin"

KantoMap:
INCBIN "gfx/pokegear/kanto.bin"

SeviiMap:
INCBIN "gfx/pokegear/sevii_islands.bin"

PokedexNestIconGFX:
INCBIN "gfx/pokegear/dexmap_nest_icon.2bpp"
FlyMapLabelBorderGFX:
INCBIN "gfx/pokegear/flymap_label_border.1bpp"

EntireFlyMap:
	xor a
	ld [wTownMapPlayerIconLandmark], a
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], $1
	xor a
	ldh [hBGMapMode], a
	farcall ClearSpriteAnims
	call LoadTownMapGFX
	ld de, FlyMapLabelBorderGFX
	ld hl, vTiles2 tile $30
	lb bc, BANK(FlyMapLabelBorderGFX), 6
	call Request1bpp
	call FillKantoMap
	call TownMapBubble
	call TownMapPals
	hlbgcoord 0, 0, vBGMap1
	call TownMapBGUpdate
	call FillJohtoMap
	call TownMapBubble
	call TownMapPals
	hlbgcoord 0, 0
	call TownMapBGUpdate
	call TownMapMon
	ld a, c
	ld [wTownMapCursorCoordinates], a
	ld a, b
	ld [wTownMapCursorCoordinates + 1], a
	ld b, SCGB_POKEGEAR_PALS
	call GetSGBLayout
	call SetPalettes
.loop
	call JoyTextDelay
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .pressedB
	ld a, [hl]
	and A_BUTTON
	jr nz, .pressedA
	call .HandleDPad
	call GetMapCursorCoordinates
	farcall PlaySpriteAnimations
	call DelayFrame
	jr .loop

.pressedB
	ld a, -1
	jr .finished_a_b

.pressedA
	ld a, [wTownMapPlayerIconLandmark]
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Flypoints + 1
	add hl, de
	ld a, [hl]
.finished_a_b
	ld [wTownMapPlayerIconLandmark], a
	pop af
	ldh [hInMenu], a
	call ClearBGPalettes
	ld a, $90
	ldh [hWY], a
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	ld a, [wTownMapPlayerIconLandmark]
	ld e, a
	ret

.HandleDPad:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP | D_RIGHT
	jr nz, .down_right
	ld a, [hl]
	and D_DOWN | D_LEFT
	jr nz, .up_left
	ret

.down_right
	ld hl, wTownMapPlayerIconLandmark
	ld a, [hl]
	cp FLY_INDIGO
	jr c, .okay_dr
	ld [hl], -1
.okay_dr
	inc [hl]
	jr .continue

.up_left
	ld hl, wTownMapPlayerIconLandmark
	ld a, [hl]
	and a
	jr nz, .okay_ul
	ld [hl], FLY_INDIGO + 1
.okay_ul
	dec [hl]
.continue
	ld a, [wTownMapPlayerIconLandmark]
	cp KANTO_FLYPOINT
	jr c, .johto
	call FillKantoMap
	call ClearSprites
	call TownMapMon
	xor a
	ld b, $9c
	jr .finish

.johto
	call FillJohtoMap
	call ClearSprites
	call TownMapMon
	ld a, $90
	ld b, $98
.finish
	ldh [hWY], a
	ld a, b
	ldh [hBGMapAddress + 1], a
	call TownMapBubble
	call WaitBGMap
	xor a
	ldh [hBGMapMode], a
	ret
