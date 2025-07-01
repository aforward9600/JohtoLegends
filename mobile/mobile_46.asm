SECTION "Mobile 46 ASCII", ROMX

SECTION "Mobile 46", ROMX

BattleTowerRoomMenu_DoNothing:
	ret

Function119e2b:
Function1719c8:
Function11b920:
Function11b5e8:
	ret

_BattleTowerRoomMenu:
	xor a
	ld [wcd38], a
Function118125:
	call BattleTowerRoomMenu_InitRAM
	ld a, $3
	ld [wcd33], a
	ld a, $d
	ld [wcd34], a
	ld a, $4
	ld [wc3f0], a
	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a
.loop
	call JoyTextDelay
	call Function118473
	ld a, [wcf66]
	cp $f
	jr c, .skip
	ld a, [wcd34]
	ld [wcf66], a
.skip
	call BattleTowerRoomMenu_Jumptable
	call BattleTowerRoomMenu_WriteMessage
	farcall Function115dd3
	farcall Function11619d
	call DelayFrame
	ld a, [wcf66]
	ld hl, wcd33
	cp [hl]
	jr nz, .loop
	xor a
	ld [w3_d000], a
	pop af
	ldh [rSVBK], a
	call BattleTowerRoomMenu_Cleanup
	call Function118180
	jp ReturnToMapFromSubmenu

Function118180:
	ld a, [wScriptVar]
	and a
	ret nz
	ld a, [wcd38]
	and a
	ret z
	ld a, $5
	call GetSRAMBank
	ld hl, wcd69
	ld de, $a89c
	ld bc, $0016
	call CopyBytes

	ldh a, [rSVBK]
	push af
	ld a, $3
	ldh [rSVBK], a

	ld de, w3_d202
	ld c, $96
	farcall CheckStringForErrors_IgnoreTerminator
	jr c, .return_d3

	ld de, w3_d202
	lb bc, 1, $96
	farcall CheckStringContainsLessThanBNextCharacters
	jr c, .return_d3

	ld hl, w3_d202
	ld de, $a8b2
	ld bc, $0096
	call CopyBytes
.reset_banks
	pop af
	ldh [rSVBK], a
	jp CloseSRAM

.return_d3
	ld a, $d3
	ld [wc300], a
	ld [wScriptVar], a
	jr .reset_banks

BattleTowerRoomMenu_InitRAM:
	di
	ldh a, [rIE]
	ld [wcd32], a
	call DoubleSpeed
	xor a
	ldh [rIF], a
	ld [wc300], a
	ld [wc301], a
	ld [wc302], a
	ld [wcd80], a
	ld [wcd65], a
	ld [wcd66], a
	ld [wcd67], a
	ld [wcd68], a
	ld [$c31a], a
	ld [wcd89], a
	ld [wcd8a], a
	ld [wcd8b], a
	ld [wc3ec], a
	ld [wc3ed], a
	ld [wc3ee], a
	ld [wc3ef], a
	ld hl, wVramState
	ld a, [hl]
	ld [wcd7f], a
	set 1, [hl]
	ld a, (1 << SERIAL) | (1 << TIMER) | (1 << LCD_STAT) | (1 << VBLANK)
	ldh [rIE], a
	ld a, $1
	ldh [hMobileReceive], a
	ldh [hMobile], a
	ei
	farcall Function106464
	farcall Function115d99
	farcall Function11615a
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$bfff], a
	call CloseSRAM
	ret

BattleTowerRoomMenu_Cleanup:
	di
	xor a
	ldh [hMobileReceive], a
	ldh [hMobile], a
	ldh [hVBlank], a
	call NormalSpeed
	xor a
	ldh [rIF], a
	ld a, [wcd32]
	ldh [rIE], a
	ei
	ld a, [wcd7f]
	ld [wVramState], a
	ld a, [wc300]
	ld [wScriptVar], a
	ret

Function118473:
	ld a, [wcd65]
	and a
	ret z
	ld a, [wcd66]
	inc a
	ld [wcd66], a
	cp 60
	ret nz
	xor a
	ld [wcd66], a
	ld a, [wcd67]
	inc a
	ld [wcd67], a
	cp 60
	ret nz
	ld a, [wcd68]
	inc a
	ld [wcd68], a
	cp 99
	jr z, .ninety_nine
	xor a
	ld [wcd67], a
	ret

.ninety_nine
	xor a
	ld [wcd65], a
	ret

BattleTowerRoomMenu_Jumptable:
	jumptable .Jumptable, wcf66

.Jumptable:
	dw BattleTowerRoomMenu_PickLevelMessage
	dw BattleTowerRoomMenu_PlacePickLevelMenu
	dw BattleTowerRoomMenu_UpdatePickLevelMenu
	dw BattleTowerRoomMenu_DoNothing
	dw BattleTowerRoomMenu_PartyMonTopsThisLevelMessage
	dw BattleTowerRoomMenu_WaitForMessage
	dw BattleTowerRoomMenu_DelayRestartMenu
	dw BattleTowerRoomMenu_QuitMessage
	dw BattleTowerRoomMenu_PlaceYesNoMenu
	dw BattleTowerRoomMenu_UpdateYesNoMenu
	dw BattleTowerRoomMenu_UberRestrictionMessage
	dw BattleTowerRoomMenu_WaitForMessage
	dw BattleTowerRoomMenu_DelayRestartMenu
	dw Function118e76 ; mobile
	dw BattleTowerRoomMenu_CallRoomMenu2 ; mobile
	dw Function118e76 ; mobile

Function118805:
	ld [wc300], a
	xor a
	ld [wc301], a
	ld [wc302], a
	ld a, $a
	call Function3e32
	ld a, [wc3f0]
	ld [$c319], a
	ld a, [wcd34]
	ld [wcf66], a
	ret

BattleTowerRoomMenu_PickLevelMessage:
	ld a, [wcd38]
	and a
	jr nz, .asm_11892d
	ld hl, Text_WhatLevelDoYouWantToChallenge
	jr .asm_118930

.asm_11892d
	ld hl, Text_CheckBattleRoomListByMaxLevel

.asm_118930
	call BattleTowerRoomMenu_SetMessage
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_PlacePickLevelMenu:
	ld a, [$c31a]
	and a
	ret nz
	ld hl, MenuHeader_119cf7
	call LoadMenuHeader
	call MenuBox
	call MenuBoxCoord2Tile
	call ApplyTilemap
	hlcoord 16, 8, wAttrMap
	ld a, $40
	or [hl]
	ld [hl], a
	call WaitBGMap2
	ld a, $1
	ld [wcd4f], a
	ld a, $1
	ldh [rSVBK], a
	ld a, [wStatusFlags]
	bit STATUSFLAGS_HALL_OF_FAME_F, a
	jr nz, .asm_11896b
	ld hl, Strings_Ll0ToL40 ; Address to list of strings with the choosable levels
	ld a, 5                 ; 4 levels to choose from, including 'Cancel'-option
	jr .asm_118970

.asm_11896b
	ld hl, Strings_L10ToL100 ; Address to list of strings with the choosable levels
	ld a, 11                 ; 10 levels to choose from, including 'Cancel'-option

.asm_118970
	ld [wcd4a], a
	ld a, l
	ld [wcd4b], a
	ld a, h
	ld [wcd4c], a
	ld a, $3
	ldh [rSVBK], a
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_UpdatePickLevelMenu:
	hlcoord 13, 8
	ld de, String_119d07
	call PlaceString
	hlcoord 13, 10
	ld de, String_119d07
	call PlaceString
	ld a, [wcd4b]
	ld l, a
	ld a, [wcd4c]
	ld h, a
	ld d, $0
	ld a, [wcd4f]
	dec a
	rlca
	rlca
	rlca
	ld e, a
	add hl, de
	ld a, l
	ld e, a
	ld a, h
	ld d, a
	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a
	ld bc, wStringBuffer3
.asm_1189b5
	ld a, [hli]
	cp $50
	jr z, .asm_1189c4
	cp $7f
	jr z, .asm_1189c2
	ld [bc], a
	inc bc
	jr .asm_1189b5

.asm_1189c2
	ld a, $50

.asm_1189c4
	ld [bc], a
	pop af
	ldh [rSVBK], a
	hlcoord 13, 9
	call PlaceString
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
	ld a, [hl]
	and D_UP
	jr nz, .d_up
.asm_1189e5
	ret

.d_down
	ld hl, wcd4f
	dec [hl]
	jr nz, .asm_1189e5
	ld a, [wcd4a]
	ld [hl], a
	jr .asm_1189e5

.d_up
	ld a, [wcd4a]
	ld hl, wcd4f
	inc [hl]
	cp [hl]
	jr nc, .asm_1189e5
	ld a, $1
	ld [hl], a
	jr .asm_1189e5

.a_button
	call PlayClickSFX
	ld a, [wcd4f]
	ld hl, wcd4a
	cp [hl]
	jr z, .asm_118a3c
	dec a
	and $fe
	srl a
	ld [wcf65], a
	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a
	call CloseWindow
	pop af
	ldh [rSVBK], a
	ld a, [wcd38]
	and a
	jr nz, .asm_118a30
	call BattleTower_LevelCheck
	ret c
	call BattleTower_UbersCheck
	ret c

.asm_118a30
	ld a, [wcd4f]
	ld [w3_d800], a
	jp BattleTowerRoomMenu_IncrementJumptable

.b_button
	call PlayClickSFX

.asm_118a3c
	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a
	call CloseWindow
	pop af
	ldh [rSVBK], a
	ld a, $7
	ld [wcf66], a
	ld a, $0
	ld [wMobileInactivityTimerFrames], a
	ret

Function118b9a:
	ld a, h
	cp $e0
	ret c
	ld a, $d3
	call Function118805
	and a
	ret

Function118e39:
	ld a, [hli]
	and a
	jr nz, Function118e39
	dec hl

asm_118e3e:
	ld a, [hld]
	cp $2f
	jr nz, asm_118e3e
	inc hl
	inc hl
	ld de, wcd85
	ld c, $4
.asm_118e4a
	ld a, [hli]
	cp $2e
	jr z, .asm_118e63
	cp $30
	jr c, .asm_118e67
	cp $3a
	jr nc, .asm_118e67
	sub $30
	add $f6
	ld [de], a
	inc de
	dec c
	jr nz, .asm_118e4a
	ld de, wcd85
.asm_118e63
	ld a, $50
	ld [de], a
	ret
.asm_118e67
	ld a, $f3
	ld [de], a
	inc de
	jr .asm_118e63

Function118e6d:
	xor a
	ld [wcd65], a
	ld a, $a
	jp Function119e2b

Function118e76:
	; Call $c in BattleTowerRoomMenu2
	ld a, $c
	ld [wcd3c], a
	ld b,b
	jp BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_CallRoomMenu2:
	call BattleTowerRoomMenu2
	ret c
	ld a, [wcd33]
	ld [wcf66], a
	ret

BattleTowerRoomMenu_UberRestrictionMessage:
	ld hl, Text_UberRestriction
	call BattleTowerRoomMenu_SetMessage
	call BattleTowerRoomMenu_IncrementJumptable
	jr BattleTowerRoomMenu_WaitForMessage

BattleTowerRoomMenu_PartyMonTopsThisLevelMessage:
	ld hl, Text_PartyMonTopsThisLevel
	call BattleTowerRoomMenu_SetMessage
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_WaitForMessage:
	ld a, [$c31a]
	and a
	ret nz
	ld a, $80
	ld [wcd50], a
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_DelayRestartMenu:
	; Loops while (--[wcd50] != 0),
	;   to create some sort of "delay" after the message is written on the screen,
	;   before starting the menu again.
	ld hl, wcd50
	dec [hl]
	ret nz
	ld a, $0
	ld [wcf66], a
	ret

BattleTowerRoomMenu_QuitMessage:
	ld a, [wcd38]
	and a
	jr z, .asm_119cd1
	dec a
	jr z, .asm_119cd6
	ld hl, Text_QuitReadingNews
	jr .asm_119cd9

.asm_119cd1
	ld hl, Text_CancelBattleRoomChallenge
	jr .asm_119cd9

.asm_119cd6
	ld hl, Text_ExitGymLeaderHonorRoll

.asm_119cd9
	call BattleTowerRoomMenu_SetMessage
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_PlaceYesNoMenu:
	ld a, [$c31a]
	and a
	ret nz
	ld a, $f
	ld [wcd3c], a
	call BattleTowerRoomMenu_IncrementJumptable

BattleTowerRoomMenu_UpdateYesNoMenu:
	; Only ever called when [wcd3c] is $10
	call BattleTowerRoomMenu2
	ret c
	ld a, [wMobileInactivityTimerFrames]
	ld [wcf66], a
	ret

MenuHeader_119cf7:
	db MENU_BACKUP_TILES ; flags
	menu_coords 12, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw NULL
	db 0 ; default option

MenuData_119cff:
	db MENU_BACKUP_TILES ; flags
	menu_coords 15, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw NULL
	db 0 ; default option

String_119d07:
	db "   ▼@"

Strings_L10ToL100:
	db " L:10 @@"
	db " L:20 @@"
	db " L:30 @@"
	db " L:40 @@"
	db " L:50 @@"
	db " L:60 @@"
	db " L:70 @@"
	db " L:80 @@"
	db " L:90 @@"
	db " L:100@@"
	db "Cancel@@"

Strings_Ll0ToL40:
	db " L:10 @@"
	db " L:20 @@"
	db " L:30 @@"
	db " L:40 @@"
	db "Cancel@@"

String_119d8c:
	db "Cancel@"

BattleTower_LevelCheck:
	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a
	ld a, [wcd4f]
	ld c, 10
	call SimpleMultiply
	ld hl, wcd50
	ld [hl], a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, wPartyMon1Level
	ld a, [wPartyCount]
.party_loop
	push af
	ld a, [de]
	push hl
	push de
	pop hl
	add hl, bc
	push hl
	pop de
	pop hl
	cp [hl]
	jr z, .equal
	jr nc, .exceeds
.equal
	pop af
	dec a
	jr nz, .party_loop
	pop af
	ldh [rSVBK], a
	and a
	ret

.exceeds
	pop af
	ld a, $4
	ld [wcf66], a
	pop af
	ldh [rSVBK], a
	scf
	ret

BattleTower_UbersCheck:
	ldh a, [rSVBK]
	push af
	ld a, [wcd4f]
	cp 70 / 10
	jr nc, .level_70_or_more
	ld a, $1
	ldh [rSVBK], a
	ld hl, wPartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, wPartySpecies
	ld a, [wPartyCount]
.loop
	push af
	push bc
	push de
	push hl
	ld a, [de]
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, .ubers
	ld de, 2
	call IsInHalfwordArray
	pop hl
	pop de
	pop bc
	jr nc, .next
.uber
	ld a, [hl]
	cp 70
	jr c, .uber_under_70
.next
	add hl, bc
	inc de
	pop af
	dec a
	jr nz, .loop
.level_70_or_more
	pop af
	ldh [rSVBK], a
	and a
	ret

.ubers
	dw MEWTWO
	dw MEW
	dw LUGIA
	dw HO_OH
	dw CELEBI
	dw -1

.uber_under_70
	pop af
	ld a, [de]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wcd49
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	ld a, $a
	ld [wcf66], a
	pop af
	ldh [rSVBK], a
	scf
	ret

BattleTowerRoomMenu_IncrementJumptable:
	ld hl, wcf66
	inc [hl]
	ret

BattleTowerRoomMenu2:
	ldh a, [rSVBK]
	ld [wcd8c], a
	ld a, $1
	ldh [rSVBK], a

	call .RunJumptable

	ld a, [wcd8c]
	ldh [rSVBK], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

.RunJumptable:
	jumptable .Jumptable, wcd3c

.Jumptable:
	dw Function119f3f
	dw Function119f45
	dw Function119f56
	dw Function119f76
	dw Function119f98
	dw Function11a113
	dw Function11a129
	dw Function11a131
	dw Function11a13d
	dw Function11a14b
	dw Function11a16d
	dw Function11a192
	dw Function11a2e6
	dw Function11a302
	dw Function11a33a
	dw BattleTowerRoomMenu2_PlaceYesNoMenu
	dw BattleTowerRoomMenu2_UpdateYesNoMenu
	dw Function11a357
	dw Function11a36b
	dw Function11a38d
	dw Function11a3c5
	dw Function11a3d9
	dw Function11a3f9
	dw Function11a41b
	dw Function11a452
	dw Function11a47a
	dw Function11a488
	dw Function11a49e
	dw Function11a4db
	dw Function11a4e8
	dw Function11a4fe
	dw Function11a466
	dw Function11a47a

Function119f3f:
	call Function11a5b9
	jp BattleTowerRoomMenu2_IncrementJumptable

Function119f45:
	hlcoord 4, 2
	ld de, String_11a661
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function119f56:
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_119f62
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_119f62
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6aa
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function119f76:
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_119f82
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_119f82
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a679
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function119f98:
	ret

Function11a113:
	ret

Function11a129:
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a131:
	ld hl, wMobileInactivityTimerMinutes
	dec [hl]
	ret nz
	ld a, [wcd3c]
	inc a
	ld [wcd3c], a

Function11a13d:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

Function11a14b:
	ld hl, wcd85
	ld a, [hl]
	cp $f3
	jr nz, .asm_11a155
	and a
	ret

.asm_11a155
	call Function11a1d6
	ret c
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6f1
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a16d:
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a179
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a179
	call Function11a63c
	call Function11a1e6
	hlcoord 4, 2
	ld de, $c346
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a192:
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a1b6
	call ExitMenu
	farcall ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a1b6
	call ExitMenu
	farcall ReloadMapPart
	ld a, [wMobileInactivityTimerSeconds]
	ld [wcf66], a
	ld [wcd80], a
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	scf
	ret

Function11a1d6:
	ld a, [wcd85]
	cp $50
	jr nz, .asm_11a1e4
	ld a, $d3
	call Function118805
	scf
	ret

.asm_11a1e4
	and a
	ret

Function11a1e6:
	ld hl, String_11a706
	ld de, $c346
	call Function11a1ff
	ld hl, wcd85
	call Function11a1ff
	ld hl, String_11a70b
	call Function11a1ff
	ld a, $50
	ld [de], a
	ret

Function11a1ff:
.asm_11a1ff
	ld a, [hli]
	cp $50
	ret z
	ld [de], a
	inc de
	jr .asm_11a1ff

BattleTowerRoomMenu2_PlaceYesNoMenu:
	ld hl, MenuHeader_11a2de
	call LoadMenuHeader
	call MenuBox
	call MenuBoxCoord2Tile
	call ApplyTilemap
	hlcoord 16, 8
	ld de, String_11a2cf
	call PlaceString
	hlcoord 16, 10
	ld de, String_11a2d3
	call PlaceString
	hlcoord 15, 8
	ld a, $ed
	ld [hl], a
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

BattleTowerRoomMenu2_UpdateYesNoMenu:
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button
	ld a, [hl]
	and D_UP
	jr nz, .d_up
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
.asm_11a24c
	call Function11a9f0
	scf
	ret

.d_up
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a24c
	xor a
	ld [wMobileInactivityTimerMinutes], a
	hlcoord 15, 8
	ld a, $ed
	ld [hl], a
	hlcoord 15, 10
	ld a, $7f
	ld [hl], a
	jr .asm_11a24c

.d_down
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a24c
	inc a
	ld [wMobileInactivityTimerMinutes], a
	hlcoord 15, 8
	ld a, $7f
	ld [hl], a
	hlcoord 15, 10
	ld a, $ed
	ld [hl], a
	jr .asm_11a24c

.a_button
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .exit_no_carry
	call ExitMenu
	farcall ReloadMapPart
	ld a, [wMobileInactivityTimerFrames]
	cp $0
	jr z, .asm_11a2b4
	ld a, [wcd47]
	jr .exit_carry

.asm_11a2b4
	ld a, [wcd33]

.exit_carry
	ld [wcf66], a
	ld a, $a
	ld [wc300], a
	scf
	ret

.b_button
	call PlayClickSFX

.exit_no_carry
	call ExitMenu
	farcall ReloadMapPart
	and a
	ret

String_11a2cf:
	db "YES@"

String_11a2d3:
	db "NO@"

MenuHeader_11a2d6:
	db MENU_BACKUP_TILES ; flags
	menu_coords 14, 6, SCREEN_WIDTH - 1, 10
	dw NULL
	db 0 ; default option

MenuHeader_11a2de:
	db MENU_BACKUP_TILES ; flags
	menu_coords 14, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw NULL
	db 0 ; default option

Function11a2e6:
	call Function11a63c
	ld c, $2
	farcall Function115e18
	hlcoord 4, 2
	ld de, String_11a71e
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a302:
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a30e
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a30e
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a72a
	call PlaceString
	hlcoord 9, 4
	ld de, wcd68
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	hlcoord 14, 4
	ld de, wcd67
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a33a:
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a346
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a346
	call ExitMenu
	farcall ReloadMapPart
	farcall Function115dc3
	and a
	ret

Function11a357:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a743
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a36b:
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a377
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a377
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a755
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a38d:
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a3b1
	call ExitMenu
	farcall ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a3b1
	call ExitMenu
	farcall ReloadMapPart
	ld a, [wMobileInactivityTimerSeconds]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret

Function11a3c5:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a762
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a3d9:
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a3e5
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a3e5
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a779
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a3f9:
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a405
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a405
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a755
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a41b:
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a43f
	call ExitMenu
	farcall ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a43f
	call ExitMenu
	farcall ReloadMapPart
	ld a, $1c
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret

Function11a452:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a791
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a466:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7c1
	call PlaceString
	ld a, $80
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a47a:
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a486
	dec a
	ld [wMobileInactivityTimerMinutes], a
	scf
	ret

.asm_11a486
	and a
	ret

Function11a488:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7ac
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a49e:
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a4c7
	call ExitMenu
	farcall ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	ld a, $14
	ld [wcf66], a
	and a
	ret

.asm_11a4c7
	call ExitMenu
	farcall ReloadMapPart
	ld a, [wMobileInactivityTimerFrames]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret

Function11a4db:
	call Function11a63c
	ld de, String_11a6db
	hlcoord 4, 2
	call PlaceString
	ret

Function11a4e8:
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a7d7
	call PlaceString
	call Function11a5f5
	xor a
	ld [wMobileInactivityTimerMinutes], a
	jp BattleTowerRoomMenu2_IncrementJumptable

Function11a4fe:
	call Function11a536
	ret c
	call PlayClickSFX
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a522
	call ExitMenu
	farcall ReloadMapPart
	call Function11a63c
	hlcoord 4, 2
	ld de, String_11a6d2
	call PlaceString
	and a
	ret

.asm_11a522
	call ExitMenu
	farcall ReloadMapPart
	ld a, [wMobileInactivityTimerSeconds]
	ld [wcf66], a
	ld [wcd80], a
	scf
	ret

Function11a536:
	ld hl, hJoyPressed
	ld a, [hl]
	and $1
	jr nz, .asm_11a5a7
	ld a, [hl]
	and $2
	jr nz, .asm_11a5a2
	ld a, [hl]
	and $40
	jr nz, .asm_11a564
	ld a, [hl]
	and $80
	jr nz, .asm_11a583
.asm_11a54d
	ld a, [wcd3c]
	cp $4
	jr z, .asm_11a562
	call Function11a9f0
	jr nz, .asm_11a562
	call ExitMenu
	farcall ReloadMapPart

.asm_11a562
	scf
	ret

.asm_11a564
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr z, .asm_11a54d
	xor a
	ld [wMobileInactivityTimerMinutes], a
	hlcoord 15, 7
	ld a, $ed
	ld [hl], a
	hlcoord 15, 9
	ld a, $7f
	ld [hl], a
	jr .asm_11a54d

.asm_11a583
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	ld a, [wMobileInactivityTimerMinutes]
	and a
	jr nz, .asm_11a54d
	inc a
	ld [wMobileInactivityTimerMinutes], a
	hlcoord 15, 7
	ld a, $7f
	ld [hl], a
	hlcoord 15, 9
	ld a, $ed
	ld [hl], a
	jr .asm_11a54d

.asm_11a5a2
	ld a, $1
	ld [wMobileInactivityTimerMinutes], a

.asm_11a5a7
	xor a
	ld [wcd8a], a
	ld [wcd8b], a
	and a
	ret

BattleTowerRoomMenu2_IncrementJumptable:
	ld a, [wcd3c]
	inc a
	ld [wcd3c], a
	scf
	ret

Function11a5b9:
	xor a
	ld [wMenuBorderLeftCoord], a
	ld [wMenuBorderTopCoord], a
	ld a, $13
	ld [wMenuBorderRightCoord], a
	ld a, $5
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	hlcoord 0, 0, wAttrMap
	ld b, $6
	ld c, $14
	hlcoord 0, 0
	ld b, $4
	ld c, $12
	call Function3eea
	farcall ReloadMapPart
	call UpdateSprites
	ld c, $0
	farcall Function115e18
	ld a, $1
	ld [wc305], a
	ret

Function11a5f5:
	ld a, $e
	ld [wMenuBorderLeftCoord], a
	ld a, $13
	ld [wMenuBorderRightCoord], a
	ld a, $6
	ld [wMenuBorderTopCoord], a
	ld a, $a
	ld [wMenuBorderBottomCoord], a
	call PushWindow
	hlcoord 14, 6, wAttrMap
	ld b, $5
	ld c, $6
	hlcoord 14, 6
	ld b, $3
	ld c, $4
	call Function3eea
	hlcoord 16, 7
	ld de, String_11a2cf
	call PlaceString
	hlcoord 16, 9
	ld de, String_11a2d3
	call PlaceString
	hlcoord 15, 7
	ld a, $ed
	ld [hl], a
	farcall ReloadMapPart
	ret

Function11a63c:
	hlcoord 4, 1
	ld de, String_11a7f4
	call PlaceString
	hlcoord 4, 2
	ld de, String_11a7f4
	call PlaceString
	hlcoord 4, 3
	ld de, String_11a7f4
	call PlaceString
	hlcoord 4, 4
	ld de, String_11a7f4
	call PlaceString
	ret

String_11a661:
	db   "これから　モバイルセンターに"
	next "でんわ<WO>かけます@"

String_11a679:
	db   "モバイルアダプタ<NO>じゅんびは"
	next "できて　いますか？@"

String_11a692:
	db   "でんわ<WO>かけています"
	next "しばらく　おまちください@"

String_11a6aa:
	db   "でんわをかけると　つうわりょう"
	next "せつぞくりょう<GA>かかります@"

String_11a6c8:
	db   "せつぞく　しました@"

String_11a6d2:
	db   "つうしん　ちゅう@"

String_11a6db:
	db   "つうしん　ちゅう"
	next "セレクト　エーでちゅうし@"

String_11a6f1:
	db   "この　サービスには"
	next "つうわりょう<NO>ほかに@"

String_11a706:
	db   "おかね<GA>@"

String_11a70b:
	db   "えん"
	next "かかります　よろしい　ですか？@"

String_11a71e:
	db   "つうしん　しゅうりょう@"

String_11a72a:
	db   "つないだ　じかん"
	next "　　やく　　　ふん　　　びょう@"

String_11a743:
	db   "もっていない　データが"
	next "あります！@"

String_11a755:
	db   "データ<WO>よみこみますか？@"

String_11a762:
	db   "おなじ　データ<WO>よみこんだ"
	next "こと<GA>ありますが@"

String_11a779:
	db   "そのデータ<WA>なくなっているか"
	next "こわれて　います@"

String_11a791:
	db   "もっている　データと"
	next "おなじデータしか　ありません！@"

String_11a7ac:
	db   "データ<NO>よみこみを"
	next "ちゅうし　しますか？@"

String_11a7c1:
	db   "あたらしい　ニュースは"
	next "ありません　でした@"

String_11a7d7:
	db   "あたらしいニュース<GA>あります"
	next "ニュース<WO>よみこみますか？@"

String_11a7f4:
	db   "　　　　　　　　　　　　　　　@"

MenuHeader_11a804:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, SCREEN_WIDTH - 1, 5
	dw NULL
	db 0 ; default option

Function11a80c:
	ld de, hDivisor
	ld bc, hDividend
	ld hl, Unknown_11a89a
	call Function11a88c
	ld bc, hQuotient + 1
	ld hl, Unknown_11a8ba
	call Function11a88c
	ld bc, hPrintNumBuffer + 2
	ld hl, Unknown_11a8da
	call Function11a88c
	xor a
	ld b, a
	ldh a, [hDivisor]
	and $f
	ld e, a
	ldh a, [hPrintNumBuffer + 6]
	and $f
	call Function11a884
	ld e, a
	ldh a, [hPrintNumBuffer + 8]
	and $f
	call Function11a884
	ld [wcd62], a
	ld e, b
	xor a
	ld b, a
	ldh a, [hDivisor]
	and $f0
	swap a
	call Function11a884
	ld e, a
	ldh a, [hPrintNumBuffer + 6]
	and $f0
	swap a
	call Function11a884
	ld e, a
	ldh a, [hPrintNumBuffer + 8]
	and $f0
	swap a
	call Function11a884
	ld [wcd63], a
	ld e, b
	xor a
	ld b, a
	ldh a, [hMathBuffer]
	and $f
	call Function11a884
	ld e, a
	ldh a, [hPrintNumBuffer + 7]
	and $f
	call Function11a884
	ld e, a
	ldh a, [hPrintNumBuffer + 9]
	and $f
	call Function11a884
	ld [wcd64], a
	ret

Function11a884:
	add e
	cp $a
	ret c
	sub $a
	inc b
	ret

Function11a88c:
	ld a, [bc]
	sla a
	ld c, a
	xor a
	ld b, a
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ret

Unknown_11a89a:
x = 0
rept 16
	bcd x % 100, x / 100
x = x + 1
endr

Unknown_11a8ba:
x = 0
rept 16
	bcd x % 100, x / 100
x = x + 16
endr

Unknown_11a8da:
x = 0
rept 16
	bcd x % 100, x / 100
x = x + 256
endr

BattleTowerRoomMenu_WriteMessage:
	jumptable .Jumptable, $c31a

.Jumptable:
	dw BattleTowerRoomMenu_WriteMessage_DoNothing
	dw Function11a90f
	dw Function11a971

Function11a90f:
	ld a, $1
	ldh [rSVBK], a
	call SpeechTextbox
	ld a, $50
	ld hl, $c320
	ld bc, $008c
	call ByteFill
	ld a, [$c31b]
	ld l, a
	ld a, [$c31c]
	ld h, a
	ld de, $c320
.asm_11a92c
	ld a, [hli]
	cp $57
	jr z, .asm_11a94f
	cp $0
	jr z, .asm_11a92c
	cp $50
	jr z, .asm_11a92c
	cp $1
	jr z, .asm_11a941
	ld [de], a
	inc de
	jr .asm_11a92c

.asm_11a941
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
.asm_11a945
	ld a, [bc]
	inc bc
	cp $50
	jr z, .asm_11a92c
	ld [de], a
	inc de
	jr .asm_11a945

.asm_11a94f
	xor a
	ld [$c31f], a
	ld a, LOW($c320)
	ld [$c31b], a
	ld a, HIGH($c320)
	ld [$c31c], a
	hlcoord 1, 14
	ld a, l
	ld [$c31d], a
	ld a, h
	ld [$c31e], a
	ld hl, $c31a
	inc [hl]
	ld a, $3
	ldh [rSVBK], a

BattleTowerRoomMenu_WriteMessage_DoNothing:
	ret

Function11a971:
	ld hl, $c31f
	ldh a, [hJoyDown]
	and a
	jr nz, .asm_11a97f
	ld a, [hl]
	and a
	jr z, .asm_11a97f
	dec [hl]
	ret

.asm_11a97f
	ld a, [wOptions]
	and $7
	ld [hl], a
	ld hl, wcd8d
	ld a, [$c31b]
	ld e, a
	ld a, [$c31c]
	ld d, a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, e
	ld [$c31b], a
	ld a, d
	ld [$c31c], a
	ld a, $50
	ld [hl], a
	ld a, [$c31d]
	ld l, a
	ld a, [$c31e]
	ld h, a
	ld de, wcd8d
	call PlaceString
	ld a, c
	ld [$c31d], a
	ld a, b
	ld [$c31e], a
	ld a, [wcd8d]
	cp $50
	jr nz, .asm_11a9bf
	xor a
	ld [$c31a], a

.asm_11a9bf
	ret

BattleTowerRoomMenu_SetMessage:
	ld a, l
	ld [$c31b], a
	ld a, h
	ld [$c31c], a
	ld a, $1
	ld [$c31a], a
	ret

Function11a9ce:
	call ClearBGPalettes
	call ReloadTilesetAndPalettes
	call ExitMenu
	farcall Function106464
	farcall FinishExitMenu
	call UpdateSprites
	ret

Function11a9f0:
	ld a, $1
	and a
	ret

Function11a9f4:
	ld a, [wcd8a]
	ld l, a
	ld a, [wcd8b]
	ld h, a
	inc hl
	ld a, l
	ld [wcd8a], a
	ld a, h
	ld [wcd8b], a
	ld de, $d5d0
	add hl, de
	bit 7, h
	ret nz
	ld a, $d6
	call Function118805
	and a
	ret

Text_SaveFileWillBeSent:
	text "SAVE FILE will be"
	line "sent."
	done

Text_SentSaveFileReadingNews:
	text "Sent SAVE FILE."
	line "Reading NEWS…"
	done

Text_ReadingNews:
	text "Reading NEWS…"
	done

Text_ReceivedNews:
	text "Received NEWS!"
	done

Text_QuitReadingNews:
	text "Quit reading NEWS?"
	done

Text_CanceledSendingSaveFile:
	text "Canceled sending"
	line "SAVE FILE."
	done

Text_ReceivedOddEgg:
	text "ODD EGG"
	line "was received!"
	done

Text_RegisteringRecord:
	text "Registering your"
	line "record…"
	done

Text_BattleRoomVisitLimit:
	text "One visit per day"
	line "per BATTLE ROOM!"
	done

Text_PartyMonTopsThisLevel:
	text "A party #MON"
	line "tops this level."
	done

Text_UberRestriction:
	text_ram wcd49
	text " may go"
	line "only to BATTLE"

	para "ROOMS that are"
	line "Lv.70 or higher."
	done

Text_CancelBattleRoomChallenge:
	text "Cancel your BATTLE"
	line "ROOM challenge?"
	done

Text_ExitGymLeaderHonorRoll:
	text "Exit GYM LEADER"
	line "HONOR ROLL?"
	done

Text_LinkingWithCenter:
	text "Linking with the"
	line "CENTER…"
	done

Text_WhatLevelDoYouWantToChallenge:
	text "What level do you"
	line "want to challenge?"
	done

Text_CheckBattleRoomListByMaxLevel:
	text "Check BATTLE ROOM"
	line "list by max level?"
	done

Text_EnterWhichBattleRoom:
	text "Enter which"
	line "BATTLE ROOM?"
	done

Text_WhichBattleRoom:
	text "Which BATTLE ROOM?"
	done

Text_ThisBattleRoomPleaseWait:
	text_ram wStringBuffer3
	text "'s ROOM"
	line "@"
	text_ram wStringBuffer4
	text "?"
	cont "Please wait…"
	done

Function11ac3e:
	call SpeechTextbox
	call FadeToMenu
	callfar ClearSpriteAnims2
	call Function11ac51
	call CloseSubmenu
	ret

Function11ac51:
	xor a
	ldh [hBGMapMode], a
	ld hl, wOptions
	ld a, [hl]
	push af
	set 4, [hl]
	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	xor a
	ldh [hMapAnims], a
	ld [wcd49], a
	ld [wcd4a], a
	ld [wcd4c], a
	ld [wcd4d], a
	ld [wcd4e], a
	call Function11ad1b
	call DelayFrame
.loop
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_11aca8
	call Function11b314
	call Function11acb7
	call Function11ad6e
	ld a, 30 * SPRITEOAMSTRUCT_LENGTH
	ld [wCurSpriteOAMAddr], a
	farcall DoNextFrameForAllSprites
	farcall ReloadMapPart
	jr .loop

.asm_11aca8
	call ClearSprites
	pop af
	ldh [hInMenu], a
	pop af
	ld [wVramState], a
	pop af
	ld [wOptions], a
	ret

Function11acb7:
	ld hl, TilemapPack_11ba44
	ld a, [wcd49]
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	decoord 6, 6
	ld a, [hli]
	ld [de], a
	decoord 0, 7
	ld bc, 7
	call CopyBytes
	ld a, [wcd49]
	inc a
	ld [wcd49], a
	ld a, [hl]
	cp $ff
	jr nz, .get_the_other
	xor a
	ld [wcd49], a
.get_the_other
	ld hl, TilemapPack_11bb7d
	ld a, [wcd4a]
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	decoord 3, 9
	ld bc, 7
	call CopyBytes
	ld a, [wcd4a]
	inc a
	ld [wcd4a], a
	inc hl
	ld a, [hl]
	cp $ff
	ret nz
	xor a
	ld [wcd4a], a
	ret

Function11ad1b:
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	farcall Function17c000
	ld a, [wMenuCursorY]
	ld [wcd82], a
	dec a
	ldh [hObjectStructIndexBuffer], a
	ld a, $10
	ld [wCurIconTile], a
	ld hl, LoadMenuMonIcon
	ld a, BANK(LoadMenuMonIcon)
	ld e, MONICON_MOBILE1
	rst FarCall
	ld hl, LoadMenuMonIcon
	ld a, BANK(LoadMenuMonIcon)
	ld e, MONICON_MOBILE2
	rst FarCall
	ld hl, $c6d0
	ld bc, $0115
	xor a
	call ByteFill
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [wcd30], a
	ld a, $2
	ld [wc7d4], a
	farcall Pokedex_OrderMonsByMode
	ret

Function11ad6e:
	ld a, [wJumptableIndex]
	ld hl, Jumptable_11ad78
	call Function11b239
	jp hl

Jumptable_11ad78:
	dw Function11b082
	dw Function11b0ff
	dw Function11ad95
	dw Function11adc4
	dw Function11ae4e
	dw Function11ae98
	dw Function11ad8f
	dw Function11af04
	dw Function11af4e

Function11ad8a:
	ld hl, wJumptableIndex
	inc [hl]
	ret

Function11ad8f:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Function11ad95:
	ld hl, MenuHeader_11ae38
	call LoadMenuHeader
	call MenuBox
	hlcoord 12, 12
	ld de, String_11ae40
	call PlaceString
	hlcoord 10, 10, wAttrMap
	lb bc, 8, 8
	call Function11afd6
	farcall ReloadMapPart
	call Function11ad8a
	ld a, $1
	ld [wMenuCursorY], a
	ld hl, Unknown_11afcc
	call Function11afb7

Function11adc4:
	ld hl, hJoyPressed
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	and $40
	jr nz, .asm_11ade6
	ld a, [hl]
	and $80
	jr nz, .asm_11aded
	ld a, [hl]
	and $1
	jr nz, .asm_11ae06
	ld a, [hl]
	and $2
	ret z
	call PlayClickSFX
	xor a
	ld [wJumptableIndex], a
	jr .asm_11ae2e

.asm_11ade6
	ld a, [wMenuCursorY]
	dec a
	ret z
	jr .asm_11adf4

.asm_11aded
	ld a, [wMenuCursorY]
	inc a
	cp $4
	ret z

.asm_11adf4
	push af
	ld hl, Unknown_11afcc
	call Function11afbb
	pop af
	ld [wMenuCursorY], a
	ld hl, Unknown_11afcc
	call Function11afb7
	ret

.asm_11ae06
	call PlayClickSFX
	ld a, [wMenuCursorY]
	dec a
	ld hl, wcd30
	ld [hl], a
	and a
	jr z, .asm_11ae28
	hlcoord 2, 14
	ld a, [wMenuCursorY]
	cp $2
	jr z, .asm_11ae23
	call Function11b272
	jr .asm_11ae2b

.asm_11ae23
	call Function11b267
	jr .asm_11ae2b

.asm_11ae28
	ld a, $3
	ld [hl], a

.asm_11ae2b
	call Function11ad8a

.asm_11ae2e
	call ExitMenu
	farcall ReloadMapPart
	ret

MenuHeader_11ae38:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 10, 17, SCREEN_HEIGHT - 1
	dw NULL
	db 0 ; default option

String_11ae40:
	db   "どちらでも"
	next "♂オス"
	next "♀メス"
	db   "@"

Function11ae4e:
	ld hl, MenuHeader_11afe8
	call LoadMenuHeader
	call MenuBox
	hlcoord 10, 14
	ld de, String_11aff0
	call PlaceString
	ld hl, MenuHeader_11b013
	call LoadMenuHeader
	call MenuBox
	hlcoord 16, 8
	ld de, String_11b01b
	call PlaceString
	hlcoord 14, 7, wAttrMap
	lb bc, 5, 6
	call Function11afd6
	hlcoord 9, 12, wAttrMap
	lb bc, 6, 11
	call Function11afd6
	farcall ReloadMapPart
	call Function11ad8a
	ld a, $1
	ld [wMenuCursorY], a
	ld hl, Unknown_11afd2
	call Function11afb7

Function11ae98:
	ld hl, hJoyPressed
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	and D_UP
	jr nz, .asm_11aec1
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_11aec8
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_11aee1
	ld a, [hl]
	and B_BUTTON
	ret z
	call PlayClickSFX
.asm_11aeb4
	hlcoord 2, 14
	ld a, $7f
	ld [hl], a
	ld a, $1
	ld [wJumptableIndex], a
	jr .asm_11aef7

.asm_11aec1
	ld a, [wMenuCursorY]
	dec a
	ret z
	jr .asm_11aecf

.asm_11aec8
	ld a, [wMenuCursorY]
	inc a
	cp $3
	ret z

.asm_11aecf
	push af
	ld hl, Unknown_11afd2
	call Function11afbb
	pop af
	ld [wMenuCursorY], a
	ld hl, Unknown_11afd2
	call Function11afb7
	ret

.asm_11aee1
	call PlayClickSFX
	ld a, [wMenuCursorY]
	cp $2
	jr z, .asm_11aeb4
	ld a, [wcd4b]
	ld [wScriptVar], a
	call Function11b022
	call Function11ad8a

.asm_11aef7
	call ExitMenu
	call ExitMenu
	farcall ReloadMapPart
	ret

Function11af04:
	ld hl, MenuHeader_11afe8
	call LoadMenuHeader
	call MenuBox
	hlcoord 10, 14
	ld de, String_11b003
	call PlaceString
	ld hl, MenuHeader_11b013
	call LoadMenuHeader
	call MenuBox
	hlcoord 16, 8
	ld de, String_11b01b
	call PlaceString
	hlcoord 14, 7, wAttrMap
	lb bc, 5, 6
	call Function11afd6
	hlcoord 9, 12, wAttrMap
	lb bc, 6, 11
	call Function11afd6
	farcall ReloadMapPart
	call Function11ad8a
	ld a, $2
	ld [wMenuCursorY], a
	ld hl, Unknown_11afd2
	call Function11afb7

Function11af4e:
	ld hl, hJoyPressed
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	and D_UP
	jr nz, .asm_11af77
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_11af7e
	ld a, [hl]
	and A_BUTTON
	jr nz, .asm_11af97
	ld a, [hl]
	and B_BUTTON
	ret z
	call PlayClickSFX
.asm_11af6a
	hlcoord 2, 14
	ld a, $7f
	ld [hl], a
	ld a, $1
	ld [wJumptableIndex], a
	jr .asm_11afaa

.asm_11af77
	ld a, [wMenuCursorY]
	dec a
	ret z
	jr .asm_11af85

.asm_11af7e
	ld a, [wMenuCursorY]
	inc a
	cp $3
	ret z

.asm_11af85
	push af
	ld hl, Unknown_11afd2
	call Function11afbb
	pop af
	ld [wMenuCursorY], a
	ld hl, Unknown_11afd2
	call Function11afb7
	ret

.asm_11af97
	call PlayClickSFX
	ld a, [wMenuCursorY]
	cp $2
	jr z, .asm_11af6a
	ld a, $6
	ld [wJumptableIndex], a
	xor a
	ld [wScriptVar], a

.asm_11afaa
	call ExitMenu
	call ExitMenu
	farcall ReloadMapPart
	ret

Function11afb7:
	ld e, $ed
	jr asm_11afbd

Function11afbb:
	ld e, $7f

asm_11afbd:
	ld a, [wMenuCursorY]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, e
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld [de], a
	ret

Unknown_11afcc:
	dwcoord 11, 12
	dwcoord 11, 14
	dwcoord 11, 16

Unknown_11afd2:
	dwcoord 15,  8
	dwcoord 15, 10

Function11afd6:
	ld de, SCREEN_WIDTH
	ld a, $3
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	add hl, de
	pop bc
	dec b
	jr nz, .row
	ret

MenuHeader_11afe8:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw NULL
	db 0 ; default option

String_11aff0:
	db   "この　じょうけんで"
	next "よろしいですか?@"

String_11b003:
	db   "こうかんを"
	next "ちゅうししますか？@"

MenuHeader_11b013:
	db MENU_BACKUP_TILES ; flags
	menu_coords 14, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw NULL
	db 1 ; default option

String_11b01b:
	db   "はい"
	next "いいえ@"

Function11b022:
	ld a, [wcd2e]
	and a
	jr z, .asm_11b02e
	ld hl, wStringBuffer3
	call Function11b03d

.asm_11b02e
	ld a, [wcd30]
	and a
	ret z
	cp $3
	ret z
	ld hl, wStringBuffer4
	call Function11b03d
	ret

Function11b03d:
	push hl
	push af
	ld c, $1
.loop
	ld a, [hli]
	cp "♂"
	jr z, .gender
	cp "♀"
	jr z, .gender
	cp "@"
	jr z, .done
	inc c
	jr .loop

.gender
	dec hl
	ld a, "@"
	ld [hli], a

.done
	dec hl
	push hl
	ld e, 4
	ld d, 0
	add hl, de
	ld e, l
	ld d, h
	pop hl
.loop2
	ld a, [hld]
	ld [de], a
	dec de
	dec c
	jr nz, .loop2
	pop af
	pop de
	cp $1
	jr nz, .female
	ld hl, .MaleString
	jr .got_string

.female
	ld hl, .FemaleString

.got_string
	ld bc, 4 ; string length
	call CopyBytes
	ret

.MaleString: db "オスの　"
.FemaleString: db "メスの　"

Function11b082:
	call Function11b242
	ld a, $7
	ld [wc7d3], a
	call Function11b099
	call Function11b295
	call Function11b275
	call SetPalettes
	jp Function11ad8a

Function11b099:
	ld c, $6
	hlcoord 11, 1
	ld a, [wc7d3]
	add a
	ld b, a
	xor a
	call Function11b236
	ld a, [wc7d0]
	ld e, a
	ld d, $0
	ld hl, wc6d0
	add hl, de
	ld e, l
	ld d, h
	hlcoord 11, 2
	ld a, [wc7d3]
.loop
	push af
	ld a, [de]
	ld [wTempSpecies], a
	push de
	push hl
	call .PlaceMonNameOrPlaceholderString
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop de
	inc de
	pop af
	dec a
	jr nz, .loop
	ret

.PlaceMonNameOrPlaceholderString:
	and a
	ret z

	call .CheckSeenFlag
	ret c

	call .SetCaughtFlag
	push hl
	call GetPokemonName
	pop hl
	call PlaceString
	ret

.SetCaughtFlag:
	call CheckCaughtMemMon
	jr nz, .okay
	inc hl
	ret

.okay
	ld a, $1
	ld [hli], a
	ret

.CheckSeenFlag:
	call CheckSeenMemMon
	ret nz

	inc hl
	ld de, .EmptySlot
	call PlaceString
	scf
	ret

.EmptySlot:
	db "ーーーーー@"

Function11b0ff:
	ld hl, hJoyPressed
	ld a, [hl]
	and $2
	jr nz, .asm_11b141
	ld a, [hl]
	and $1
	jr nz, .asm_11b131
	call Function11b175
	jr nc, .asm_11b125
	ld a, [wcd4c]
	inc a
	and $3
	ld [wcd4c], a
	xor a
	ldh [hBGMapMode], a
	call Function11b099
	ld a, $1
	ldh [hBGMapMode], a
	ret

.asm_11b125
	ld a, [wcd4c]
	and a
	ret z
	inc a
	and $3
	ld [wcd4c], a
	ret

.asm_11b131
	call Function11b20b
	call CheckSeenMemMon
	jr z, .asm_11b13d
	ld a, $1
	jr .asm_11b148

.asm_11b13d
	ld a, $2
	jr .asm_11b148

.asm_11b141
	ld hl, wJumptableIndex
	ld a, $7
	ld [hl], a
	ret

.asm_11b148
	call PlayClickSFX
	ld [wcd4b], a
	and a
	jr z, .asm_11b16c
	ld a, [wcf65]
	cp $0
	jr z, .asm_11b163
	cp $fe
	jr z, .asm_11b167
	cp $ff
	jr z, .asm_11b16b
	jp Function11ad8a

.asm_11b163
	ld a, $1
	jr .asm_11b16c

.asm_11b167
	ld a, $2
	jr .asm_11b16c

.asm_11b16b
	xor a

.asm_11b16c
	ld [wcd30], a
	ld a, $4
	ld [wJumptableIndex], a
	ret

Function11b175:
	ld a, [wc7d3]
	ld d, a
	ld a, [wc7d2]
	ld e, a
	ld hl, hJoyLast
	ld a, [hl]
	and $40
	jr nz, .asm_11b19a
	ld a, [hl]
	and $80
	jr nz, .asm_11b1ae
	ld a, d
	cp e
	jr nc, .asm_11b1ed
	ld a, [hl]
	and $20
	jr nz, .asm_11b1c6
	ld a, [hl]
	and $10
	jr nz, .asm_11b1d8
	jr .asm_11b1ed

.asm_11b19a
	ld hl, wc7d1
	ld a, [hl]
	and a
	jr z, .asm_11b1a4
	dec [hl]
	jr .asm_11b1ef

.asm_11b1a4
	ld hl, wc7d0
	ld a, [hl]
	and a
	jr z, .asm_11b1ed
	dec [hl]
	jr .asm_11b1ef

.asm_11b1ae
	ld hl, wc7d1
	ld a, [hl]
	inc a
	cp e
	jr nc, .asm_11b1ed
	cp d
	jr nc, .asm_11b1bc
	inc [hl]
	jr .asm_11b1ef

.asm_11b1bc
	ld hl, wc7d0
	add [hl]
	cp e
	jr nc, .asm_11b1ed
	inc [hl]
	jr .asm_11b1ef

.asm_11b1c6
	ld hl, wc7d0
	ld a, [hl]
	and a
	jr z, .asm_11b1ed
	cp d
	jr nc, .asm_11b1d4
	xor a
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1d4
	sub d
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1d8
	ld hl, wc7d0
	ld a, d
	add a
	add [hl]
	jr c, .asm_11b1e3
	cp e
	jr c, .asm_11b1e8

.asm_11b1e3
	ld a, e
	sub d
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1e8
	ld a, [hl]
	add d
	ld [hl], a
	jr .asm_11b1ef

.asm_11b1ed
	and a
	ret

.asm_11b1ef
	call Function11b295
	call Function11b275
	scf
	ret

Function11b1f7:
	hlcoord 0, 0
	ld a, $32
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	ret

Function11b203:
.asm_11b203
	ld a, [de]
	cp $ff
	ret z
	inc de
	ld [hli], a
	jr .asm_11b203

Function11b20b:
	ld a, [wc7d1]
	ld hl, wc7d0
	add [hl]
	ld e, a
	ld d, $0
	ld hl, $c6d0
	add hl, de
	ld a, [hl]
	ld [wTempSpecies], a
	ret

CheckCaughtMemMon:
	push de
	push hl
	ld a, [wTempSpecies]
	call CheckCaughtMon
	pop hl
	pop de
	ret

CheckSeenMemMon:
	push de
	push hl
	ld a, [wTempSpecies]
	call CheckSeenMon
	pop hl
	pop de
	ret

Function11b236:
	jp FillBoxWithByte

Function11b239:
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Function11b242:
	hlcoord 3, 4
	ld de, wStringBuffer3
	call PlaceString
	xor a
	ld [wMonType], a
	farcall GetGender
	hlcoord 1, 4
	ld a, [wCurPartySpecies]
	ld bc, wcd2f
	ld [bc], a
	dec bc
	jr c, asm_11b26a
	jr z, asm_11b26f
	ld a, $1
	ld [bc], a

Function11b267:
	ld [hl], $ef
	ret

asm_11b26a:
	xor a
	ld [bc], a
	ld [hl], $7f
	ret

asm_11b26f:
	ld a, $2
	ld [bc], a

Function11b272:
	ld [hl], $f5
	ret

Function11b275:
	call Function11b279
	ret

Function11b279:
	ld a, [wTempSpecies]
	ld [wCurSpecies], a
	call CheckSeenMemMon
	jr z, .asm_11b28f
	call GetBaseData
	ld a, [wBaseGender]
	ld [wcf65], a
	jr .asm_11b294

.asm_11b28f
	ld a, $ff
	ld [wcf65], a

.asm_11b294
	ret

Function11b295:
	hlcoord 4, 13
	ld de, String_11b308
	call PlaceString
	hlcoord 4, 14
	ld de, String_11b308
	call PlaceString
	call Function11b20b
	call CheckSeenMemMon
	jr z, .asm_11b2d1
	ld a, [$c608]
	ld c, a
	ld a, [$c608 + 1]
	ld b, a
	ld hl, $0007
	add hl, bc
	xor a
	ld [hl], a
	ld hl, $0003
	add hl, bc
	ld e, [hl]
	farcall FlyFunction_GetMonIcon
	hlcoord 4, 14
	push hl
	call GetPokemonName
	jr .asm_11b2e7

.asm_11b2d1
	ld a, [$c608]
	ld c, a
	ld a, [$c608 + 1]
	ld b, a
	ld hl, $0007
	add hl, bc
	ld a, $50
	ld [hl], a
	hlcoord 4, 13
	push hl
	ld de, String_11b30e

.asm_11b2e7
	ld a, $6
	ld bc, wStringBuffer4
.asm_11b2ec
	push af
	ld a, [de]
	ld [bc], a
	inc de
	inc bc
	pop af
	dec a
	and a
	jr nz, .asm_11b2ec
	pop hl
	ld de, wStringBuffer4
	call PlaceString
	ret

String_11b2fe:
	db "あげる#@"

String_11b303:
	db "ほしい#@"

String_11b308:
	db "　　　　　@"

String_11b30e:
	db "みはっけん@"

Function11b314:
	call Function11b31b
	call Function11b3d9
	ret

Function11b31b:
	ld hl, .Coords
	ld a, [wJumptableIndex]
	cp 2
	jr c, .tilemap_1
	ld a, [wc7d1]
	cp 4
	jr nc, .tilemap_3
	cp 3
	jr c, .tilemap_1
	ld a, [wJumptableIndex]
	cp 2
	jr z, .tilemap_1
	cp 3
	jr z, .tilemap_1
	cp 6
	jr z, .tilemap_1

	ld bc, .Tilemap2
	jr .load_sprites

.tilemap_3
	ld bc, .Tilemap3
	jr .load_sprites

.tilemap_1
	ld bc, .Tilemap1

.load_sprites
	call Function11b397
	ret

.Coords:
	dbpixel 3, 11, 2, 6 ;  0
	dbpixel 3, 12, 2, 6 ;  1
	dbpixel 3, 13, 2, 6 ;  2
	dbpixel 3, 14, 2, 6 ;  3
	dbpixel 3, 15, 2, 6 ;  4
	dbpixel 3, 16, 2, 6 ;  5
	dbpixel 3, 17, 2, 6 ;  6
	dbpixel 4, 11, 2, 6 ;  7
	dbpixel 4, 12, 2, 6 ;  8
	dbpixel 4, 13, 2, 6 ;  9
	dbpixel 4, 14, 2, 6 ; 10
	dbpixel 4, 15, 2, 6 ; 11
	dbpixel 4, 16, 2, 6 ; 12
	dbpixel 4, 17, 2, 6 ; 13
	db -1

.Tilemap1: ; vtiles
	db $30 ;  0
	db $31 ;  1
	db $31 ;  2
	db $31 ;  3
	db $31 ;  4
	db $31 ;  5
	db $32 ;  6
	db $40 ;  7
	db $41 ;  8
	db $41 ;  9
	db $41 ; 10
	db $41 ; 11
	db $41 ; 12
	db $42 ; 13

.Tilemap2: ; vtiles
	db $30 ;  0
	db $31 ;  1
	db $31 ;  2
	db $39 ;  3
	db $39 ;  4
	db $39 ;  5
	db $39 ;  6
	db $40 ;  7
	db $41 ;  8
	db $41 ;  9
	db $39 ; 10
	db $39 ; 11
	db $39 ; 12
	db $39 ; 13

.Tilemap3: ; vtiles
	db $39 ;  0
	db $39 ;  1
	db $39 ;  2
	db $39 ;  3
	db $39 ;  4
	db $39 ;  5
	db $39 ;  6
	db $39 ;  7
	db $39 ;  8
	db $39 ;  9
	db $39 ; 10
	db $39 ; 11
	db $39 ; 12
	db $39 ; 13

Function11b397:
	ld de, wVirtualOAMSprite00
.loop
	ld a, [hl]
	cp $ff
	ret z
	ld a, [wc7d1]
	and $7
	swap a
	add [hl]
	inc hl
	ld [de], a ; y
	inc de

	ld a, [hli]
	ld [de], a ; x
	inc de

	ld a, [bc]
	inc bc
	ld [de], a ; tile id
	inc de
	ld a, $5
	ld [de], a ; attributes
	inc de
	jr .loop

Function11b3d9:
	ld de, wVirtualOAMSprite28
	push de
	ld a, [wc7d2]
	dec a
	ld e, a
	ld a, [wc7d1]
	ld hl, wc7d0
	add [hl]
	cp e
	jr z, .skip
	ld hl, 0
	ld bc, $70
	call AddNTimes
	ld e, l
	ld d, h
	ld b, 0
	ld a, d
	or e
	jr z, .load_sprites
	ld a, [wc7d2]
	ld c, a
.loop1
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc $0
	ld d, a
	jr c, .load_sprites
	inc b
	jr .loop1

.skip
	ld b, 14 * 8

.load_sprites
	ld a, 2 * 8 + 5
	add b
	pop hl
	ld [hli], a
	cp $41
	jr c, .version1
	ld a, [wJumptableIndex]
	cp 4
	jr z, .version2
	cp 5
	jr z, .version2
	cp 7
	jr z, .version2
	cp 8
	jr z, .version2

.version1
	ld a, 19 * 8 + 3
	ld [hli], a
	ld a, [wcd4c]
	add $3c
	ld [hli], a
	ld a, [wcd4c]
	add $1
	ld [hl], a
	ret

.version2
	ld a, 19 * 8 + 3
	ld [hli], a
	ld a, $39
	ld [hli], a
	xor a
	ld [hl], a
	ret

Function11b6b4:
	ld a, $5
	call GetSRAMBank
	ld a, [wcd30]
	ld [$c708], a
	ld a, [wcd31]
	ld [$c709], a

	ld a, LOW($c708) ; Species
	ld [wMobileMonSpeciesPointerBuffer], a
	ld a, HIGH($c708)
	ld [wMobileMonSpeciesPointerBuffer + 1], a

	ld a, LOW($c60d) ; Partymon Struct
	ld [wMobileMonStructurePointerBuffer], a
	ld a, HIGH($c60d)
	ld [wMobileMonStructurePointerBuffer + 1], a

	ld a, LOW($c63d) ; OT
	ld [wMobileMonOTNamePointerBuffer], a
	ld a, HIGH($c63d)
	ld [wMobileMonOTNamePointerBuffer + 1], a

	ld a, LOW($c642) ; Nickname
	ld [wMobileMonNicknamePointerBuffer], a
	ld a, HIGH($c642)
	ld [wMobileMonNicknamePointerBuffer + 1], a

	ld a, LOW($c647) ; Mail
	ld [wMobileMonMailPointerBuffer], a
	ld a, HIGH($c647)
	ld [wMobileMonMailPointerBuffer + 1], a

	ld a, $46
	ld [$c628], a

	ld de, $c63d
	ld c, 5
	farcall CheckStringForErrors
	jr nc, .length_check_OT
	farcall Mobile_CopyDefaultOTName

.length_check_OT
	ld de, $c63d
	lb bc, 1, 5
	farcall CheckStringContainsLessThanBNextCharacters
	jr nc, .error_check_nick
	farcall Mobile_CopyDefaultOTName

.error_check_nick
	ld de, $c642
	ld c, 5
	farcall CheckStringForErrors
	jr nc, .length_check_nick
	farcall Mobile_CopyDefaultNickname

.length_check_nick
	ld de, $c642
	lb bc, 1, 5
	farcall CheckStringContainsLessThanBNextCharacters
	jr nc, .error_check_mail
	farcall Mobile_CopyDefaultNickname

.error_check_mail
	ld de, $c647
	ld c, MAIL_MSG_LENGTH + 1
	farcall CheckStringForErrors
	jr nc, .length_check_mail
	farcall Mobile_CopyDefaultMail

.length_check_mail
	ld de, $c647
	lb bc, 2, MAIL_MSG_LENGTH + 1
	farcall CheckStringContainsLessThanBNextCharacters
	jr c, .fix_mail
	ld a, b
	cp $2
	jr nz, .mail_ok

.fix_mail
	farcall Mobile_CopyDefaultMail

.mail_ok
	ld de, $c668
	ld c, $5
	farcall CheckStringForErrors
	jr nc, .length_check_author
	farcall Mobile_CopyDefaultMailAuthor

.length_check_author
	ld de, $c668
	lb bc, 1, 5
	farcall CheckStringContainsLessThanBNextCharacters
	jr nc, .author_okay
	farcall Mobile_CopyDefaultMailAuthor

.author_okay
	ld a, [$c60e]
	cp -1
	jr nz, .item_okay
	xor a
	ld [$c60e], a

.item_okay
	ld a, [wcd31]
	ld [$c60d], a
	ld [wCurSpecies], a
	call GetBaseData

	ld hl, $c60d + MON_LEVEL
	ld a, [hl]
	cp MIN_LEVEL
	ld a, MIN_LEVEL
	jr c, .replace_level
	ld a, [hl]
	cp MAX_LEVEL
	jr c, .done_level
	ld a, MAX_LEVEL
.replace_level
	ld [hl], a
.done_level
	ld [wCurPartyLevel], a

	ld hl, $c60d + MON_EVS - 1
	ld de, $c60d + MON_MAXHP
	ld b, TRUE
	predef CalcMonStats
	ld de, $c60d + MON_MAXHP
	ld hl, $c60d + MON_HP
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	call AddMobileMonToParty
	ret

Function11b7e5:
	ld a, [$c60d] ; species
	ld [wOTTrademonSpecies], a
	ld [wCurPartySpecies], a
	ld a, [wcd81]
	ld [wc74e], a
	ld hl, $c63d ; OT
	ld de, wOTTrademonOTName
	ld bc, 5
	call CopyBytes
	ld a, "@"
	ld [de], a
	ld a, [$c60d + MON_ID] ; id
	ld [wOTTrademonID], a
	ld a, [$c60d + MON_ID + 1]
	ld [wOTTrademonID + 1], a
	ld hl, $c60d + MON_DVS ; dvs
	ld a, [hli]
	ld [wOTTrademonDVs], a
	ld a, [hl]
	ld [wOTTrademonDVs + 1], a
	ld bc, $c60d ; pokemon_data_start
	farcall GetCaughtGender
	ld a, c
	ld [wOTTrademonCaughtData], a
	call SpeechTextbox
	call FadeToMenu
	farcall Function17d1f1
	ld a, $1
	ld [wForceEvolution], a
	ld a, $2
	ld [wLinkMode], a
	farcall EvolvePokemon
	xor a
	ld [wLinkMode], a
	farcall SaveAfterLinkTrade
	ld a, $5
	call GetSRAMBank
	ld a, $5
	ld [$a800], a
	call CloseSRAM
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetMapSceneID
	ld a, d
	or e
	jr z, .asm_11b872
	ld a, $1
	ld [de], a

.asm_11b872
	call CloseSubmenu
	call RestartMapMusic
	ret

Function11b879:
	farcall BattleTower_CheckSaveFileExistsAndIsYours
	ld a, [wScriptVar]
	and a
	ret z
	ld a, $5
	call GetSRAMBank
	ld a, [$a800]
	ld [wScriptVar], a
	ld a, [$a890]
	ld [wcd49], a
	ld a, [$a891]
	ld [wcd4a], a
	ld a, [$a892]
	ld [wcd4b], a
	ld a, [$a893]
	ld [wcd4c], a
	call CloseSRAM
	ld a, [wScriptVar]
	and a
	ret z
	ld hl, wcd4c
	ldh a, [hRTCDayHi]
	cp [hl]
	ret nz
	dec hl
	ldh a, [hRTCDayLo]
	cp [hl]
	ret nz
	ld hl, wcd4a
	ldh a, [hRTCHours]
	cp [hl]
	jr nc, .asm_11b8d8
	ld a, $18
	sub [hl]
	ld hl, hRTCHours
	add [hl]
	ld [wcd4c], a
	ldh a, [hRTCMinutes]
	ld [wcd4b], a
	xor a
	ld [wcd4a], a
	jr .asm_11b8e2

.asm_11b8d8
	ldh a, [hRTCMinutes]
	ld [wcd4b], a
	ldh a, [hRTCHours]
	ld [wcd4c], a

.asm_11b8e2
	xor a
	ld l, a
	ld h, a
	ld b, a
	ld d, a
	ld a, [wcd4b]
	ld e, a
	ld a, [wcd4c]
	ld c, $3c
	call AddNTimes
	add hl, de
	push hl
	xor a
	ld l, a
	ld h, a
	ld b, a
	ld d, a
	ld a, [wcd49]
	ld e, a
	ld a, [wcd4a]
	ld c, $3c
	call AddNTimes
	add hl, de
	ld a, l
	cpl
	add $1
	ld e, a
	ld a, h
	cpl
	adc 0
	ld d, a
	pop hl
	add hl, de
	ld de, $ff88
	add hl, de
	bit 7, h
	ret z
	ld a, $2
	ld [wScriptVar], a
	ret

Function11b93b:
	ld a, $5
	call GetSRAMBank
	xor a
	ld [$a800], a
	ld hl, $a823
	ld de, $c608
	ld bc, $008f
	call CopyBytes
	call CloseSRAM

	ld a, LOW($c608)
	ld [wMobileMonSpeciesPointerBuffer], a
	ld a, HIGH($c608)
	ld [wMobileMonSpeciesPointerBuffer + 1], a

	ld a, LOW($c611)
	ld [wMobileMonStructurePointerBuffer], a
	ld a, HIGH($c611)
	ld [wMobileMonStructurePointerBuffer + 1], a

	ld a, LOW($c641)
	ld [wMobileMonOTNamePointerBuffer], a
	ld a, HIGH($c641)
	ld [wMobileMonOTNamePointerBuffer + 1], a

	ld a, LOW($c646)
	ld [wMobileMonNicknamePointerBuffer], a
	ld a, HIGH($c646)
	ld [wMobileMonNicknamePointerBuffer + 1], a

	ld a, LOW($c64b)
	ld [wMobileMonMailPointerBuffer], a
	ld a, HIGH($c64b)
	ld [wMobileMonMailPointerBuffer + 1], a
	call AddMobileMonToParty
	farcall SaveAfterLinkTrade
	ret

AddMobileMonToParty:
	ld hl, wPartyCount
	ld a, [hl]
	ld e, a
	inc [hl]

	ld a, [wMobileMonSpeciesPointerBuffer]
	ld l, a
	ld a, [wMobileMonSpeciesPointerBuffer + 1]
	ld h, a
	inc hl
	ld bc, wPartySpecies
	ld d, e
.loop1
	inc bc
	dec d
	jr nz, .loop1
	ld a, e
	ld [wCurPartyMon], a
	ld a, [hl]
	ld [bc], a
	inc bc
	ld a, -1
	ld [bc], a

	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, e
	ld [wMobileMonSpeciesBuffer], a
.loop2
	add hl, bc
	dec a
	and a
	jr nz, .loop2
	ld e, l
	ld d, h
	ld a, [wMobileMonStructurePointerBuffer]
	ld l, a
	ld a, [wMobileMonStructurePointerBuffer + 1]
	ld h, a
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

	ld hl, wPartyMonOT
	ld bc, NAME_LENGTH
	ld a, [wMobileMonSpeciesBuffer]
.loop3
	add hl, bc
	dec a
	and a
	jr nz, .loop3
	ld e, l
	ld d, h
	ld a, [wMobileMonOTNamePointerBuffer]
	ld l, a
	ld a, [wMobileMonOTNamePointerBuffer + 1]
	ld h, a
	ld bc, MON_NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a

	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	ld a, [wMobileMonSpeciesBuffer]
.loop4
	add hl, bc
	dec a
	and a
	jr nz, .loop4
	ld e, l
	ld d, h
	ld a, [wMobileMonNicknamePointerBuffer]
	ld l, a
	ld a, [wMobileMonNicknamePointerBuffer + 1]
	ld h, a
	ld bc, MON_NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a

	ld hl, sPartyMail
	ld bc, MAIL_STRUCT_LENGTH
	ld a, [wMobileMonSpeciesBuffer]
.loop5
	add hl, bc
	dec a
	and a
	jr nz, .loop5
	ld a, BANK(sPartyMail)
	call GetSRAMBank
	ld e, l
	ld d, h
	ld a, [wMobileMonMailPointerBuffer]
	ld l, a
	ld a, [wMobileMonMailPointerBuffer + 1]
	ld h, a
	ld bc, MAIL_STRUCT_LENGTH
	call CopyBytes

	call CloseSRAM
	ret

Function11ba38:
	farcall CheckCurPartyMonFainted
	ret c
	xor a
	ld [wScriptVar], a
	ret

TilemapPack_11ba44:
	db $47, $30, $0a, $0a, $0a, $0a, $0a, $56 ; 00
	db $46, $2f, $0a, $0a, $0a, $0a, $0a, $55 ; 01
	db $45, $3d, $0a, $0a, $0a, $0a, $0a, $54 ; 02
	db $44, $30, $0a, $0a, $0a, $0a, $0a, $53 ; 03
	db $43, $2f, $0a, $0a, $0a, $0a, $0a, $52 ; 04
	db $4a, $3d, $0a, $0a, $0a, $0a, $0a, $51 ; 05
	db $4a, $30, $0a, $0a, $0a, $0a, $0a, $50 ; 06
	db $4a, $2f, $0a, $0a, $0a, $0a, $0a, $4f ; 07
	db $4a, $3d, $0a, $0a, $0a, $0a, $0a, $4e ; 08
	db $4a, $30, $0a, $0a, $0a, $0a, $4d, $42 ; 09
	db $4a, $2f, $0a, $0a, $0a, $0a, $6b, $58 ; 0a
	db $4a, $3d, $0a, $0a, $0a, $0a, $6a, $58 ; 0b
	db $4a, $30, $0a, $0a, $0a, $0a, $69, $58 ; 0c
	db $4a, $2f, $0a, $0a, $0a, $0a, $68, $58 ; 0d
	db $4a, $3d, $0a, $0a, $0a, $66, $67, $58 ; 0e
	db $4a, $30, $0a, $0a, $0a, $65, $0a, $58 ; 0f
	db $4a, $2f, $0a, $0a, $0a, $64, $0a, $58 ; 10
	db $4a, $3d, $0a, $0a, $0a, $63, $0a, $58 ; 11
	db $4a, $30, $0a, $0a, $61, $62, $0a, $58 ; 12
	db $4a, $2f, $0a, $0a, $5f, $60, $0a, $58 ; 13
	db $4a, $3d, $0a, $61, $62, $0a, $0a, $58 ; 14
	db $4a, $30, $0a, $63, $0a, $0a, $0a, $58 ; 15
	db $4a, $2f, $69, $0a, $0a, $0a, $0a, $58 ; 16
	db $4a, $3d, $81, $0a, $0a, $0a, $0a, $58 ; 17
	db $4a, $30, $80, $0a, $0a, $0a, $0a, $58 ; 18
	db $4a, $2f, $7f, $0a, $0a, $0a, $0a, $58 ; 19
	db $4a, $3d, $0a, $0a, $0a, $0a, $0a, $58 ; 1a
	db $4a, $30, $0a, $0a, $0a, $0a, $0a, $58 ; 1b
	db $4a, $2f, $68, $87, $88, $89, $0a, $58 ; 1c
	db $4a, $3d, $6e, $6f, $70, $75, $76, $58 ; 1d
	db $4a, $30, $75, $76, $5c, $5d, $5e, $58 ; 1e
	db $4a, $2f, $71, $72, $73, $74, $6d, $58 ; 1f
	db $4a, $3d, $75, $76, $77, $8a, $8b, $58 ; 20
	db $4a, $30, $66, $67, $65, $0a, $6a, $58 ; 21
	db $4a, $2f, $83, $84, $0a, $83, $84, $58 ; 22
	db $4a, $3d, $0a, $85, $82, $84, $0a, $58 ; 23
	db $4a, $30, $41, $80, $40, $0a, $0a, $58 ; 24
	db $4a, $2f, $83, $0a, $0a, $0a, $0a, $58 ; 25
	db $4a, $3d, $40, $0a, $0a, $0a, $0a, $58 ; 26
	db -1

TilemapPack_11bb7d:
	db $0a, $0a, $0a, $0a, $0a, $0a, $16, $00 ; 00
	db $78, $0a, $0a, $0a, $0a, $0a, $8c, $00 ; 01
	db $79, $0a, $0a, $0a, $0a, $0a, $8d, $00 ; 02
	db $7a, $0a, $0a, $0a, $0a, $0a, $8e, $00 ; 03
	db $7b, $0a, $0a, $0a, $0a, $0a, $8c, $00 ; 04
	db $7c, $0a, $0a, $0a, $0a, $0a, $8d, $00 ; 05
	db $7d, $0a, $0a, $0a, $0a, $0a, $8e, $00 ; 06
	db $2e, $7e, $0a, $0a, $0a, $0a, $8c, $00 ; 07
	db $2e, $80, $0a, $0a, $0a, $0a, $8d, $00 ; 08
	db $2e, $81, $0a, $0a, $0a, $0a, $8e, $00 ; 09
	db $2e, $82, $0a, $0a, $0a, $0a, $8c, $00 ; 0a
	db $2e, $69, $0a, $0a, $0a, $0a, $8d, $00 ; 0b
	db $2e, $6a, $0a, $0a, $0a, $0a, $8e, $00 ; 0c
	db $2e, $6b, $0a, $0a, $0a, $0a, $8c, $00 ; 0d
	db $2e, $0a, $68, $0a, $0a, $0a, $8d, $00 ; 0e
	db $2e, $0a, $69, $0a, $0a, $0a, $8e, $00 ; 0f
	db $2e, $0a, $0a, $6a, $0a, $0a, $8c, $00 ; 10
	db $2e, $0a, $0a, $6b, $0a, $0a, $8d, $00 ; 11
	db $2e, $0a, $0a, $0a, $80, $0a, $8e, $00 ; 12
	db $2e, $0a, $0a, $0a, $82, $0a, $8c, $00 ; 13
	db $2e, $0a, $0a, $0a, $6c, $0a, $8d, $00 ; 14
	db $2e, $0a, $0a, $0a, $0a, $83, $8e, $00 ; 15
	db $2e, $0a, $6b, $0a, $0a, $0a, $8c, $00 ; 16
	db $2e, $0a, $0a, $69, $0a, $0a, $8d, $00 ; 17
	db $2e, $0a, $0a, $6a, $0a, $0a, $8e, $00 ; 18
	db $2e, $0a, $0a, $0a, $68, $0a, $8c, $00 ; 19
	db $2e, $0a, $0a, $0a, $63, $0a, $8d, $00 ; 1a
	db $2e, $0a, $0a, $61, $62, $0a, $8e, $00 ; 1b
	db $2e, $0a, $0a, $0a, $5f, $60, $8c, $00 ; 1c
	db $2e, $0a, $0a, $0a, $63, $0a, $8d, $00 ; 1d
	db $2e, $0a, $0a, $0a, $0a, $69, $8c, $00 ; 1e
	db $2e, $0a, $0a, $0a, $0a, $6b, $8d, $00 ; 1f
	db $2e, $0a, $0a, $0a, $0a, $83, $8e, $00 ; 20
	db $2e, $0a, $0a, $0a, $0a, $86, $8c, $00 ; 21
	db $2e, $0a, $85, $0a, $0a, $0a, $8d, $00 ; 22
	db $2e, $0a, $0a, $84, $0a, $0a, $8e, $00 ; 23
	db -1
