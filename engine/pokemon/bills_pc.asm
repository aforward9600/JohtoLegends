_DepositPKMN:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
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
	call BillsPC_InitRAM
	xor a
	ld [wBillsPC_LoadedBox], a
	call DelayFrame
.loop
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call .RunJumptable
	call DelayFrame
	jr .loop
.done
	call ClearSprites
	pop af
	ldh [hInMenu], a
	pop af
	ld [wVramState], a
	pop af
	ld [wOptions], a
	ret

.RunJumptable:
	ld a, [wJumptableIndex]
	ld hl, .Jumptable
	call BillsPC_Jumptable
	jp hl

.Jumptable:
	dw .Init
	dw .HandleJoypad
	dw .WhatsUp
	dw .Submenu
	dw BillsPC_EndJumptableLoop

.Init:
	xor a
	ldh [hBGMapMode], a
	call ClearSprites
	call CopyBoxmonSpecies
	call BillsPC_BoxName
	ld de, PCString_ChooseaPKMN
	call BillsPC_PlaceString
	ld a, $5
	ld [wBillsPC_NumMonsOnScreen], a
	call BillsPC_RefreshTextboxes
	call PCMonInfo
	ld a, $ff
	ld [wCurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	call WaitBGMap
	call BillsPC_UpdateSelectionCursor
	call BillsPC_IncrementJumptableIndex
	ret

.HandleJoypad:
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button
	call Withdraw_UpDown
	and a
	ret z
	call BillsPC_UpdateSelectionCursor
	xor a
	ldh [hBGMapMode], a
	call BillsPC_RefreshTextboxes
	call PCMonInfo
	ld a, $1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ret

.a_button
	call BillsPC_GetSelectedPokemonSpecies
	and a
	ret z
	cp -1
	jr z, .b_button
	ld a, $2
	ld [wJumptableIndex], a
	ret

.go_back
	ld hl, wJumptableIndex
	dec [hl]
	ret

.b_button
	ld a, $4
	ld [wJumptableIndex], a
	ret

.WhatsUp:
	xor a
	ldh [hBGMapMode], a
	call ClearSprites
	call BillsPC_GetSelectedPokemonSpecies
	ld [wCurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	ld de, PCString_WhatsUp
	call BillsPC_PlaceString
	ld a, $1
	ld [wMenuCursorY], a
	call BillsPC_IncrementJumptableIndex
	ret

.Submenu:
	ld hl, BillsPCDepositMenuHeader
	call CopyMenuHeader
	ld a, [wMenuCursorY]
	call StoreTo_wMenuCursorBuffer
	call VerticalMenu
	jp c, BillsPCDepositFuncCancel
	ld a, [wMenuCursorY]
	dec a
	and %11
	ld e, a
	ld d, 0
	ld hl, BillsPCDepositJumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

BillsPCDepositJumptable:
	dw BillsPCDepositFuncDeposit ; Deposit Pokemon
	dw BillsPCDepositFuncStats ; Pokemon Stats
	dw BillsPCDepositFuncRelease ; Release Pokemon
	dw BillsPCDepositFuncCancel ; Cancel

BillsPCDepositFuncDeposit:
	call BillsPC_CheckMail_PreventBlackout
	jp c, BillsPCDepositFuncCancel
	call DepositPokemon
	jr c, .box_full
	ld a, $0
	ld [wJumptableIndex], a
	xor a
	ld [wBillsPC_CursorPosition], a
	ld [wBillsPC_ScrollPosition], a
	ret

.box_full
	ld de, PCString_WhatsUp
	call BillsPC_PlaceString
	ret

BillsPCDepositFuncStats:
	call LoadStandardMenuHeader
	call BillsPC_StatsScreen
	call ExitMenu
	call PCMonInfo
	call BillsPC_GetSelectedPokemonSpecies
	ld [wCurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	ret

BillsPCDepositFuncRelease:
	call BillsPC_CheckMail_PreventBlackout
	jr c, BillsPCDepositFuncCancel
	call BillsPC_IsMonAnEgg
	jr c, BillsPCDepositFuncCancel
	ld a, [wMenuCursorY]
	push af
	ld de, PCString_ReleasePKMN
	call BillsPC_PlaceString
	call LoadStandardMenuHeader
	lb bc, 14, 11
	call PlaceYesNoBox
	ld a, [wMenuCursorY]
	dec a
	call ExitMenu
	and a
	jr nz, .failed_release
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld [wCurPartyMon], a
	xor a ; REMOVE_PARTY
	ld [wPokemonWithdrawDepositParameter], a
	farcall RemoveMonFromPartyOrBox
	call ReleasePKMN_ByePKMN
	ld a, $0
	ld [wJumptableIndex], a
	xor a
	ld [wBillsPC_CursorPosition], a
	ld [wBillsPC_ScrollPosition], a
	pop af
	ret

.failed_release
	ld de, PCString_WhatsUp
	call BillsPC_PlaceString
	pop af
	ld [wMenuCursorY], a
	ret

BillsPCDepositFuncCancel:
	ld a, $0
	ld [wJumptableIndex], a
	ret

BillsPCDepositMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 4, SCREEN_WIDTH - 1, 13
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Deposit@"
	db "Stats@"
	db "Release@"
	db "Cancel@"

_WithdrawPKMN:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
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
	call BillsPC_InitRAM
	ld a, NUM_BOXES + 1
	ld [wBillsPC_LoadedBox], a
	call DelayFrame
.loop
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call .RunJumptable
	call DelayFrame
	jr .loop
.done
	call ClearSprites
	pop af
	ldh [hInMenu], a
	pop af
	ld [wVramState], a
	pop af
	ld [wOptions], a
	ret

.RunJumptable:
	ld a, [wJumptableIndex]
	ld hl, .Jumptable
	call BillsPC_Jumptable
	jp hl

.Jumptable:
	dw .Init
	dw .Joypad
	dw .PrepSubmenu
	dw BillsPC_Withdraw
	dw BillsPC_EndJumptableLoop

.Init:
	ld a, NUM_BOXES + 1
	ld [wBillsPC_LoadedBox], a
	xor a
	ldh [hBGMapMode], a
	call ClearSprites
	call CopyBoxmonSpecies
	call BillsPC_BoxName
	ld de, PCString_ChooseaPKMN
	call BillsPC_PlaceString
	ld a, $5
	ld [wBillsPC_NumMonsOnScreen], a
	call BillsPC_RefreshTextboxes
	call PCMonInfo
	ld a, $ff
	ld [wCurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	call WaitBGMap
	call BillsPC_UpdateSelectionCursor
	call BillsPC_IncrementJumptableIndex
	ret

.Joypad:
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button
	call Withdraw_UpDown
	and a
	ret z
	call BillsPC_UpdateSelectionCursor
	xor a
	ldh [hBGMapMode], a
	call BillsPC_RefreshTextboxes
	call PCMonInfo
	ld a, $1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ret
.a_button
	call BillsPC_GetSelectedPokemonSpecies
	and a
	ret z
	cp -1
	jr z, .b_button
	ld a, $2
	ld [wJumptableIndex], a
	ret

.b_button
	ld a, $4
	ld [wJumptableIndex], a
	ret

.PrepSubmenu:
	xor a
	ldh [hBGMapMode], a
	call ClearSprites
	call BillsPC_GetSelectedPokemonSpecies
	ld [wCurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	ld de, PCString_WhatsUp
	call BillsPC_PlaceString
	ld a, $1
	ld [wMenuCursorY], a
	call BillsPC_IncrementJumptableIndex
	ret

BillsPC_Withdraw:
	ld hl, .MenuHeader
	call CopyMenuHeader
	ld a, [wMenuCursorY]
	call StoreTo_wMenuCursorBuffer
	call VerticalMenu
	jp c, .cancel
	ld a, [wMenuCursorY]
	dec a
	and %11
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
	dw .withdraw ; Withdraw
	dw .stats ; Stats
	dw .release ; Release
	dw .cancel ; Cancel

.withdraw
	call BillsPC_CheckMail_PreventBlackout
	jp c, .cancel
	call TryWithdrawPokemon
	jr c, .FailedWithdraw
	ld a, $0
	ld [wJumptableIndex], a
	xor a
	ld [wBillsPC_CursorPosition], a
	ld [wBillsPC_ScrollPosition], a
	ret
.FailedWithdraw:
	ld de, PCString_WhatsUp
	call BillsPC_PlaceString
	ret

.stats
	call LoadStandardMenuHeader
	call BillsPC_StatsScreen
	call ExitMenu
	call PCMonInfo
	call BillsPC_GetSelectedPokemonSpecies
	ld [wCurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	ret

.release
	ld a, [wMenuCursorY]
	push af
	call BillsPC_IsMonAnEgg
	jr c, .FailedRelease
	ld de, PCString_ReleasePKMN
	call BillsPC_PlaceString
	call LoadStandardMenuHeader
	lb bc, 14, 11
	call PlaceYesNoBox
	ld a, [wMenuCursorY]
	dec a
	call ExitMenu
	and a
	jr nz, .FailedRelease
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld [wCurPartyMon], a
	ld a, REMOVE_BOX
	ld [wPokemonWithdrawDepositParameter], a
	farcall RemoveMonFromPartyOrBox
	call ReleasePKMN_ByePKMN
	ld a, $0
	ld [wJumptableIndex], a
	xor a
	ld [wBillsPC_CursorPosition], a
	ld [wBillsPC_ScrollPosition], a
	pop af
	ret
.FailedRelease:
	ld de, PCString_WhatsUp
	call BillsPC_PlaceString
	pop af
	ld [wMenuCursorY], a
	ret

.cancel
	ld a, $0
	ld [wJumptableIndex], a
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 4, SCREEN_WIDTH - 1, 13
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Withdraw@"
	db "Stats@"
	db "Release@"
	db "Cancel@"

_MovePKMNWithoutMail:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
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
	call BillsPC_InitRAM
	ld a, [wCurBox]
	and $f
	inc a
	ld [wBillsPC_LoadedBox], a
	call DelayFrame
.asm_e2781
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_e2793
	call .RunJumptable
	call DelayFrame
	jr .asm_e2781

.asm_e2793
	call ClearSprites
	pop af
	ldh [hInMenu], a
	pop af
	ld [wVramState], a
	pop af
	ld [wOptions], a
	ret

.RunJumptable:
	ld a, [wJumptableIndex]
	ld hl, .Jumptable
	call BillsPC_Jumptable
	jp hl

.Jumptable:
	dw .Init
	dw .Joypad
	dw .PrepSubmenu
	dw .MoveMonWOMailSubmenu
	dw .PrepInsertCursor
	dw .Joypad2
	dw BillsPC_EndJumptableLoop

.Init:
	xor a
	ldh [hBGMapMode], a
	call ClearSprites
	call CopyBoxmonSpecies
	ld de, PCString_ChooseaPKMN
	call BillsPC_PlaceString
	ld a, 5
	ld [wBillsPC_NumMonsOnScreen], a
	call BillsPC_RefreshTextboxes
	call BillsPC_MoveMonWOMail_BoxNameAndArrows
	call PCMonInfo
	ld a, $ff
	ld [wCurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	call WaitBGMap
	call BillsPC_UpdateSelectionCursor
	call BillsPC_IncrementJumptableIndex
	ret

.Joypad:
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button
	call MoveMonWithoutMail_DPad
	jr c, .d_pad
	and a
	ret z
	call BillsPC_UpdateSelectionCursor
	xor a
	ldh [hBGMapMode], a
	call BillsPC_RefreshTextboxes
	call PCMonInfo
	ld a, $1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ret

.d_pad
	xor a
	ld [wBillsPC_CursorPosition], a
	ld [wBillsPC_ScrollPosition], a
	ld a, $0
	ld [wJumptableIndex], a
	ret

.a_button
	call BillsPC_GetSelectedPokemonSpecies
	and a
	ret z
	cp -1
	jr z, .b_button
	ld a, $2
	ld [wJumptableIndex], a
	ret

.b_button
	ld a, $6
	ld [wJumptableIndex], a
	ret

.PrepSubmenu:
	xor a
	ldh [hBGMapMode], a
	call ClearSprites
	call BillsPC_GetSelectedPokemonSpecies
	ld [wCurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	ld de, PCString_WhatsUp
	call BillsPC_PlaceString
	ld a, $1
	ld [wMenuCursorY], a
	call BillsPC_IncrementJumptableIndex
	ret

.MoveMonWOMailSubmenu:
	ld hl, .MenuHeader
	call CopyMenuHeader
	ld a, [wMenuCursorY]
	call StoreTo_wMenuCursorBuffer
	call VerticalMenu
	jp c, .Cancel
	ld a, [wMenuCursorY]
	dec a
	and %11
	ld e, a
	ld d, 0
	ld hl, .Jumptable2
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable2:
	dw .Move
	dw .Stats
	dw .Cancel

.Move:
	call BillsPC_CheckMail_PreventBlackout
	jp c, .Cancel
	ld a, [wBillsPC_ScrollPosition]
	ld [wBillsPC_BackupScrollPosition], a
	ld a, [wBillsPC_CursorPosition]
	ld [wBillsPC_BackupCursorPosition], a
	ld a, [wBillsPC_LoadedBox]
	ld [wBillsPC_BackupLoadedBox], a
	ld a, $4
	ld [wJumptableIndex], a
	ret

.Stats:
	call LoadStandardMenuHeader
	call BillsPC_StatsScreen
	call ExitMenu
	call PCMonInfo
	call BillsPC_GetSelectedPokemonSpecies
	ld [wCurPartySpecies], a
	ld a, SCGB_BILLS_PC
	call BillsPC_ApplyPalettes
	ret

.Cancel:
	ld a, $0
	ld [wJumptableIndex], a
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 4, SCREEN_WIDTH - 1, 13
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db "Move@"
	db "Stats@"
	db "Cancel@"

.PrepInsertCursor:
	xor a
	ldh [hBGMapMode], a
	call CopyBoxmonSpecies
	ld de, PCString_MoveToWhere
	call BillsPC_PlaceString
	ld a, $5
	ld [wBillsPC_NumMonsOnScreen], a
	call BillsPC_RefreshTextboxes
	call BillsPC_MoveMonWOMail_BoxNameAndArrows
	call ClearSprites
	call BillsPC_UpdateInsertCursor
	call WaitBGMap
	call BillsPC_IncrementJumptableIndex
	ret

.Joypad2:
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button_2
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button_2
	call MoveMonWithoutMail_DPad_2
	jr c, .dpad_2
	and a
	ret z
	call BillsPC_UpdateInsertCursor
	xor a
	ldh [hBGMapMode], a
	call BillsPC_RefreshTextboxes
	ld a, $1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ret

.dpad_2
	xor a
	ld [wBillsPC_CursorPosition], a
	ld [wBillsPC_ScrollPosition], a
	ld a, $4
	ld [wJumptableIndex], a
	ret

.a_button_2
	call BillsPC_CheckSpaceInDestination
	jr c, .no_space
	call MovePKMNWitoutMail_InsertMon
	ld a, $0
	ld [wJumptableIndex], a
	ret

.no_space
	ld hl, wJumptableIndex
	dec [hl]
	ret

.b_button_2
	ld a, [wBillsPC_BackupScrollPosition]
	ld [wBillsPC_ScrollPosition], a
	ld a, [wBillsPC_BackupCursorPosition]
	ld [wBillsPC_CursorPosition], a
	ld a, [wBillsPC_BackupLoadedBox]
	ld [wBillsPC_LoadedBox], a
	ld a, $0
	ld [wJumptableIndex], a
	ret

BillsPC_InitRAM:
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call BillsPC_InitGFX
	ld hl, wBillsPCData
	ld bc, wBillsPCDataEnd - wBillsPCData
	xor a
	call ByteFill
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [wBillsPC_CursorPosition], a
	ld [wBillsPC_ScrollPosition], a
	ret

BillsPC_IncrementJumptableIndex:
	ld hl, wJumptableIndex
	inc [hl]
	ret

BillsPC_EndJumptableLoop:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

_StatsScreenDPad:
	ld a, [wBillsPC_NumMonsOnScreen]
	ld d, a
	ld a, [wBillsPC_NumMonsInBox]
	and a
	jr z, .empty
	dec a
	cp $1
	jr z, .empty
	ld e, a
	ld a, [hl]
	and D_UP
	jr nz, BillsPC_PressUp
	ld a, [hl]
	and D_DOWN
	jr nz, BillsPC_PressDown
.empty
	jp BillsPC_JoypadDidNothing

Withdraw_UpDown:
	ld hl, hJoyLast
	ld a, [wBillsPC_NumMonsOnScreen]
	ld d, a
	ld a, [wBillsPC_NumMonsInBox]
	ld e, a
	and a
	jr z, .empty
	ld a, [hl]
	and D_UP
	jr nz, BillsPC_PressUp
	ld a, [hl]
	and D_DOWN
	jr nz, BillsPC_PressDown
.empty
	jp BillsPC_JoypadDidNothing

MoveMonWithoutMail_DPad:
	ld hl, hJoyLast
	ld a, [wBillsPC_NumMonsOnScreen]
	ld d, a
	ld a, [wBillsPC_NumMonsInBox]
	ld e, a
	and a
	jr z, .check_left_right
	ld a, [hl]
	and D_UP
	jr nz, BillsPC_PressUp
	ld a, [hl]
	and D_DOWN
	jr nz, BillsPC_PressDown

.check_left_right
	ld a, [hl]
	and D_LEFT
	jr nz, BillsPC_PressLeft
	ld a, [hl]
	and D_RIGHT
	jr nz, BillsPC_PressRight
	jr BillsPC_JoypadDidNothing

MoveMonWithoutMail_DPad_2:
	ld hl, hJoyLast
	ld a, [wBillsPC_NumMonsOnScreen]
	ld d, a
	ld a, [wBillsPC_NumMonsInBox]
	ld e, a
	and a
	jr z, .check_left_right

	ld a, [hl]
	and D_UP
	jr nz, BillsPC_PressUp
	ld a, [hl]
	and D_DOWN
	jr nz, BillsPC_PressDown

.check_left_right
	ld a, [hl]
	and D_LEFT
	jr nz, BillsPC_PressLeft
	ld a, [hl]
	and D_RIGHT
	jr nz, BillsPC_PressRight
	jr BillsPC_JoypadDidNothing

BillsPC_PressUp:
	ld hl, wBillsPC_CursorPosition
	ld a, [hl]
	and a
	jr z, .top
	dec [hl]
	jr BillsPC_UpDownDidSomething

.top
	ld hl, wBillsPC_ScrollPosition
	ld a, [hl]
	and a
	jr z, BillsPC_JoypadDidNothing
	dec [hl]
	jr BillsPC_UpDownDidSomething

BillsPC_PressDown:
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	inc a
	cp e
	jr nc, BillsPC_JoypadDidNothing

	ld hl, wBillsPC_CursorPosition
	ld a, [hl]
	inc a
	cp d
	jr nc, .not_bottom
	inc [hl]
	jr BillsPC_UpDownDidSomething

.not_bottom
	ld hl, wBillsPC_ScrollPosition
	inc [hl]
	jr BillsPC_UpDownDidSomething

BillsPC_PressLeft:
	ld hl, wBillsPC_LoadedBox
	ld a, [hl]
	and a
	jr z, .wrap_around
	dec [hl]
	jr BillsPC_LeftRightDidSomething

.wrap_around
	ld [hl], NUM_BOXES
	jr BillsPC_LeftRightDidSomething

BillsPC_PressRight:
	ld hl, wBillsPC_LoadedBox
	ld a, [hl]
	cp NUM_BOXES
	jr z, .wrap_around
	inc [hl]
	jr BillsPC_LeftRightDidSomething

.wrap_around
	ld [hl], 0
	jr BillsPC_LeftRightDidSomething

BillsPC_JoypadDidNothing:
	xor a
	and a
	ret

BillsPC_UpDownDidSomething:
	ld a, TRUE
	and a
	ret

BillsPC_LeftRightDidSomething:
	scf
	ret

BillsPC_PlaceString:
	push de
	hlcoord 0, 15
	lb bc, 1, 18
	call Textbox
	pop de
	hlcoord 1, 16
	call PlaceString
	ret

BillsPC_MoveMonWOMail_BoxNameAndArrows:
	call BillsPC_BoxName
	hlcoord 8, 1
	ld [hl], $5f
	hlcoord 19, 1
	ld [hl], $5e
	ret

BillsPC_BoxName:
	hlcoord 8, 0
	lb bc, 1, 10
	call Textbox

	ld a, [wBillsPC_LoadedBox]
	and a
	jr z, .party

	cp NUM_BOXES + 1
	jr nz, .gotbox

	ld a, [wCurBox]
	inc a
.gotbox
	dec a
	ld hl, wBoxNames
	ld bc, BOX_NAME_LENGTH
	call AddNTimes
	ld e, l
	ld d, h
	jr .print

.party
	ld de, .PartyPKMN
.print
	hlcoord 10, 1
	call PlaceString
	ret

.PartyPKMN:
	db "Party <PK><MN>@"

PCMonInfo:
; Display a monster's pic and
; attributes when highlighting
; it in a PC menu.

; Includes the neat cascading
; effect when showing the pic.

; Example: Species, level, gender,
; whether it's holding an item.

	hlcoord 0, 0
	lb bc, 15, 8
	call ClearBox

	hlcoord 8, 14
	lb bc, 1, 3
	call ClearBox

	call BillsPC_GetSelectedPokemonSpecies
	and a
	ret z
	cp -1
	ret z

	ld [wTempSpecies], a
	hlcoord 1, 4
	xor a
	ld b, 7
.row
	ld c, 7
	push af
	push hl
.col
	ld [hli], a
	add 7
	dec c
	jr nz, .col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop af
	inc a
	dec b
	jr nz, .row

	call BillsPC_LoadMonStats
	ld a, [wTempSpecies]
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	ld hl, wTempMonDVs
	predef GetUnownLetter
	call GetBaseData
	ld de, vTiles2 tile $00
	predef GetMonFrontpic
	xor a
	ld [wBillsPC_MonHasMail], a
	ld a, [wCurPartySpecies]
	ld [wTempSpecies], a
	cp EGG
	ret z

	call GetBasePokemonName
	hlcoord 1, 14
	call PlaceString

	hlcoord 1, 12
	call PrintLevel

	ld a, $3
	ld [wMonType], a
	farcall GetGender
	jr c, .skip_gender
	ld a, "♂"
	jr nz, .printgender
	ld a, "♀"
.printgender
	hlcoord 5, 12
	ld [hl], a
.skip_gender

	ld a, [wTempMonItem]
	and a
	ret z

	ld d, a
	callfar ItemIsMail
	jr c, .mail
	ld a, $5d ; item icon
	jr .printitem
.mail
	ld a, $1
	ld [wBillsPC_MonHasMail], a
	ld a, $5c ; mail icon
.printitem
	hlcoord 7, 12
	ld [hl], a
	ret

BillsPC_LoadMonStats:
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld e, a
	add a, a
	add a, a
	ld c, a
	ld b, 0
	ld hl, wBillsPCPokemonList + 2 ; box number
	add hl, bc
	ld a, [hl]
	and a
	jr z, .party
	cp NUM_BOXES + 1
	jr z, .sBox
	ld b, a
	call GetBoxPointer
	ld a, b
	call GetSRAMBank
	push hl
	ld bc, sBoxMon1Level - sBox
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld a, [hl]
	ld [wTempMonLevel], a
	pop hl
	push hl
	ld bc, sBoxMon1Item - sBox
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld a, [hl]
	ld [wTempMonItem], a
	pop hl
	ld bc, sBoxMon1DVs - sBox
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld de, wTempMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	call CloseSRAM
	ret

.party
	ld hl, wPartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld a, [hl]
	ld [wTempMonLevel], a
	ld hl, wPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld a, [hl]
	ld [wTempMonItem], a
	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld de, wTempMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

.sBox
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, sBoxMon1Level
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld a, [hl]
	ld [wTempMonLevel], a

	ld hl, sBoxMon1Item
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld a, [hl]
	ld [wTempMonItem], a

	ld hl, sBoxMon1DVs
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld de, wTempMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a

	call CloseSRAM
	ret

BillsPC_RefreshTextboxes:
	hlcoord 8, 2
	lb bc, 10, 10
	call Textbox

	hlcoord 8, 2
	ld [hl], "└"
	hlcoord 19, 2
	ld [hl], "┘"

	ld a, [wBillsPC_ScrollPosition]
	add a, a
	add a, a
	ld e, a
	ld d, 0
	ld hl, wBillsPCPokemonList
	add hl, de
	ld e, l
	ld d, h
	hlcoord 9, 4
	ld a, [wBillsPC_NumMonsOnScreen]
.loop
	push af
	push de
	push hl
	call .PlaceNickname
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop de
	inc de
	inc de
	inc de
	inc de
	pop af
	dec a
	jr nz, .loop
	ret

.CancelString:
	db "Cancel@"

.PlaceNickname:
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	cp b
	; both $0000 and $FFFF have two identical bytes, so this check works
	jr nz, .get_nickname
	and a
	ret z
	cp -1
	jr nz, .get_nickname
	ld de, .CancelString
	call PlaceString
	ret

.get_nickname
	inc de
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld e, a
	ld a, b
	and a
	jr z, .party
	cp NUM_BOXES + 1
	jr z, .sBox
	push hl
	call GetBoxPointer
	ld a, b
	call GetSRAMBank
	push hl
	ld bc, sBoxMons - sBox
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, e
	call AddNTimes
	ld a, [hl]
	pop hl
	and a
	jr z, .boxfail
	ld bc, sBoxMonNicknames - sBox
	add hl, bc
	ld bc, MON_NAME_LENGTH
	ld a, e
	call AddNTimes
	ld de, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	call CloseSRAM
	pop hl
	ld de, wStringBuffer1
	call PlaceString
	ret

.boxfail
	call CloseSRAM
	pop hl
	jr .placeholder_string

.party
	push hl
	ld hl, wPartySpecies
	ld d, $0
	add hl, de
	ld a, [hl]
	and a
	jr z, .partyfail
	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	ld a, e
	call AddNTimes
	ld de, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop hl
	ld de, wStringBuffer1
	call PlaceString
	ret

.partyfail
	pop hl
	jr .placeholder_string

.sBox
	push hl
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, sBoxSpecies
	ld d, $0
	add hl, de
	ld a, [hl]
	and a
	jr z, .sBoxFail
	ld hl, sBoxMonNicknames
	ld bc, MON_NAME_LENGTH
	ld a, e
	call AddNTimes
	ld de, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	call CloseSRAM
	pop hl
	ld de, wStringBuffer1
	call PlaceString
	ret

.sBoxFail
	call CloseSRAM
	pop hl
.placeholder_string
	ld de, .Placeholder
	call PlaceString
	ret

.Placeholder:
	db "-----@"

CopyBoxmonSpecies:
	xor a
	ld hl, wBillsPCPokemonList
	ld bc, 4 * 30
	push hl
	call ByteFill
	pop hl
	ld a, [wBillsPC_LoadedBox]
	ld b, a
	ld c, 0
	and a
	jr z, .party
	cp NUM_BOXES + 1
	jr z, .sBox

	push bc
	push hl
	call GetBoxPointer
	ld a, b
	call GetSRAMBank
	inc hl
	ld d, h
	ld e, l
	pop hl
	pop bc
.box_loop
	ld a, [de]
	inc de
	cp -1
	jr z, .box_done
	push hl
	ld hl, EGG
	cp l
	call nz, BillsPC_GetSpeciesIndexForBoxSlot
	ld a, h
	ldh [hTemp], a
	ld a, l
	pop hl
	ld [hli], a
	ldh a, [hTemp]
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	inc c
	jr .box_loop

.box_done
	call CloseSRAM ;preserves af
.list_done
	; expects a = $FF
	ld [hli], a
	ld [hl], a
	ld a, c
	inc a
	ld [wBillsPC_NumMonsInBox], a
	ret

.sBox
	ld a, BANK(sBox)
	call GetSRAMBank
	ld de, sBoxSpecies
	call .load_list
	jp CloseSRAM

.party
	ld de, wPartySpecies
.load_list
	ld a, [de]
	cp -1
	jr z, .list_done
	inc de
	push hl
	call GetPokemonIndexFromID
	ld a, h
	ldh [hTemp], a
	ld a, l
	pop hl
	ld [hli], a
	ldh a, [hTemp]
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	inc c
	jr .load_list

BillsPC_GetSpeciesIndexForBoxSlot:
	; in: b: box, c: slot
	; out: hl: species
	; preserves bc, de
	push bc
	push de
	dec b
	ld a, c
	ld c, b
	ld b, a
	farcall GetBoxMonPokemonIndexPointer
	ldh a, [hSRAMBank]
	ld c, a
	ld a, b
	call GetSRAMBank
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	call GetSRAMBank
	pop de
	pop bc
	ret

BillsPC_GetSelectedPokemonSpecies:
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	add a, a
	add a, a
	ld e, a
	ld d, $0
	ld hl, wBillsPCPokemonList
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp GetPokemonIDFromIndex

BillsPC_UpdateSelectionCursor:
	ld a, [wBillsPC_NumMonsInBox]
	and a
	jr nz, .place_cursor
	call ClearSprites
	ret

.place_cursor
	ld hl, .OAM
	ld de, wVirtualOAMSprite00
.loop
	ld a, [hl]
	cp -1
	ret z
	ld a, [wBillsPC_CursorPosition]
	and $7
	swap a
	add [hl]
	inc hl
	ld [de], a ; y
	inc de
rept SPRITEOAMSTRUCT_LENGTH + -1
	ld a, [hli]
	ld [de], a
	inc de
endr
	jr .loop

.OAM:
	dsprite 4, 6, 10, 0, $00, 0
	dsprite 4, 6, 11, 0, $00, 0
	dsprite 4, 6, 12, 0, $00, 0
	dsprite 4, 6, 13, 0, $00, 0
	dsprite 4, 6, 14, 0, $00, 0
	dsprite 4, 6, 15, 0, $00, 0
	dsprite 4, 6, 16, 0, $00, 0
	dsprite 4, 6, 17, 0, $00, 0
	dsprite 4, 6, 18, 0, $00, 0
	dsprite 4, 6, 18, 7, $00, 0
	dsprite 7, 1, 10, 0, $00, 0 | Y_FLIP
	dsprite 7, 1, 11, 0, $00, 0 | Y_FLIP
	dsprite 7, 1, 12, 0, $00, 0 | Y_FLIP
	dsprite 7, 1, 13, 0, $00, 0 | Y_FLIP
	dsprite 7, 1, 14, 0, $00, 0 | Y_FLIP
	dsprite 7, 1, 15, 0, $00, 0 | Y_FLIP
	dsprite 7, 1, 16, 0, $00, 0 | Y_FLIP
	dsprite 7, 1, 17, 0, $00, 0 | Y_FLIP
	dsprite 7, 1, 18, 0, $00, 0 | Y_FLIP
	dsprite 7, 1, 18, 7, $00, 0 | Y_FLIP
	dsprite 5, 6,  9, 6, $01, 0
	dsprite 6, 1,  9, 6, $01, 0 | Y_FLIP
	dsprite 5, 6, 19, 1, $01, 0 | X_FLIP
	dsprite 6, 1, 19, 1, $01, 0 | X_FLIP | Y_FLIP
	db -1

BillsPC_UpdateInsertCursor:
	ld hl, .OAM
	ld de, wVirtualOAMSprite00
.loop
	ld a, [hl]
	cp -1
	ret z
	ld a, [wBillsPC_CursorPosition]
	and $7
	swap a
	add [hl]
	inc hl
	ld [de], a ; y
	inc de
rept SPRITEOAMSTRUCT_LENGTH + -1
	ld a, [hli]
	ld [de], a
	inc de
endr
	jr .loop

.OAM:
	dsprite 4, 7, 10, 0, $06, 0
	dsprite 5, 3, 11, 0, $00, 0 | Y_FLIP
	dsprite 5, 3, 12, 0, $00, 0 | Y_FLIP
	dsprite 5, 3, 13, 0, $00, 0 | Y_FLIP
	dsprite 5, 3, 14, 0, $00, 0 | Y_FLIP
	dsprite 5, 3, 15, 0, $00, 0 | Y_FLIP
	dsprite 5, 3, 16, 0, $00, 0 | Y_FLIP
	dsprite 5, 3, 17, 0, $00, 0 | Y_FLIP
	dsprite 5, 3, 18, 0, $00, 0 | Y_FLIP
	dsprite 4, 7, 19, 0, $07, 0
	db -1

BillsPC_CheckSpaceInDestination:
; If moving within a box, no need to be here.
	ld hl, wBillsPC_LoadedBox
	ld a, [wBillsPC_BackupLoadedBox]
	cp [hl]
	jr z, .same_box

; Exceeding box or party capacity is a big no-no.
	ld a, [wBillsPC_LoadedBox]
	and a
	jr z, .party
	ld e, MONS_PER_BOX + 1
	jr .compare

.party
	ld e, PARTY_LENGTH + 1
.compare
	ld a, [wBillsPC_NumMonsInBox]
	cp e
	jr nc, .no_room
.same_box
	and a
	ret

.no_room
	ld de, PCString_TheresNoRoom
	call BillsPC_PlaceString
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret

BillsPC_CheckMail_PreventBlackout:
	ld a, [wBillsPC_LoadedBox]
	and a
	jr nz, .Okay
	ld a, [wBillsPC_NumMonsInBox]
	cp $3
	jr c, .ItsYourLastPokemon
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld [wCurPartyMon], a
	farcall CheckCurPartyMonFainted
	jr c, .AllOthersFainted
	ld a, [wBillsPC_MonHasMail]
	and a
	jr nz, .HasMail
.Okay:
	and a
	ret

.HasMail:
	ld de, PCString_RemoveMail
	jr .NotOkay

.AllOthersFainted:
	ld de, PCString_NoMoreUsablePKMN
	jr .NotOkay

.ItsYourLastPokemon:
	ld de, PCString_ItsYourLastPKMN
.NotOkay:
	call BillsPC_PlaceString
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret

BillsPC_IsMonAnEgg:
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .egg
	and a
	ret

.egg
	ld de, PCString_NoReleasingEGGS
	call BillsPC_PlaceString
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret

BillsPC_StatsScreen:
	call LowVolume
	call BillsPC_CopyMon
	ld a, $3
	ld [wMonType], a
	predef StatsScreenInit
	call BillsPC_InitGFX
	call MaxVolume
	ret

StatsScreenDPad:
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON | B_BUTTON | D_RIGHT | D_LEFT
	ld [wMenuJoypad], a
	jr nz, .pressed_a_b_right_left
	ld a, [hl]
	and D_DOWN | D_UP
	ld [wMenuJoypad], a
	jr nz, .pressed_down_up
	jr .pressed_a_b_right_left

.pressed_down_up
	call _StatsScreenDPad
	and a
	jr z, .did_nothing
	call BillsPC_GetSelectedPokemonSpecies
	ld [wTempSpecies], a
	call BillsPC_LoadMonStats
	ld a, [wTempSpecies]
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	ld hl, wTempMonDVs
	predef GetUnownLetter
	call GetBaseData
	call BillsPC_CopyMon
.pressed_a_b_right_left
	ret

.did_nothing
	xor a
	ld [wMenuJoypad], a
	ret

BillsPC_CopyMon:
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld [wCurPartyMon], a
	ld a, [wBillsPC_LoadedBox]
	and a
	jr z, .party
	cp NUM_BOXES + 1
	jr nz, .box
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, sBoxSpecies
	call CopySpeciesToTemp
	ld hl, sBoxMonNicknames
	call CopyNicknameToTemp
	ld hl, sBoxMonOT
	call CopyOTNameToTemp
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld de, wBufferMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	call CloseSRAM
	farcall CalcBufferMonStats
	ret

.party
	ld hl, wPartySpecies
	call CopySpeciesToTemp
	ld hl, wPartyMonNicknames
	call CopyNicknameToTemp
	ld hl, wPartyMonOT
	call CopyOTNameToTemp
	ld hl, wPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld de, wBufferMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ret

.box
	ld b, a
	ld a, [wCurPartyMon]
	ld c, a
	call BillsPC_GetSpeciesIndexForBoxSlot
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	ld l, LOCKED_MON_ID_CURRENT_MENU
	call LockPokemonID
	call GetBoxPointer
	ld a, b
	call GetSRAMBank
	push hl
	ld bc, sBoxMonNicknames - sBox
	add hl, bc
	call CopyNicknameToTemp
	pop hl
	push hl
	ld bc, sBoxMonOT - sBox
	add hl, bc
	call CopyOTNameToTemp
	pop hl
	ld bc, sBoxMons - sBox
	add hl, bc
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyMonToTemp
	call CloseSRAM
	ld a, LOCKED_MON_ID_CURRENT_MENU
	call GetLockedPokemonID
	ld [wBufferMonSpecies], a
	ld hl, wBufferMon
	call BillsPC_ConvertBoxMonToPartyMon
	farcall CalcBufferMonStats
	ret

DepositPokemon:
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld [wCurPartyMon], a
	ld hl, wPartyMonNicknames
	ld a, [wCurPartyMon]
	call GetNick
	ld a, PC_DEPOSIT
	ld [wPokemonWithdrawDepositParameter], a
	predef SendGetMonIntoFromBox
	jr c, .asm_boxisfull
	xor a ; REMOVE_PARTY
	ld [wPokemonWithdrawDepositParameter], a
	farcall RemoveMonFromPartyOrBox
	ld a, [wCurPartySpecies]
	call PlayMonCry
	hlcoord 0, 0
	lb bc, 15, 8
	call ClearBox
	hlcoord 8, 14
	lb bc, 1, 3
	call ClearBox
	hlcoord 0, 15
	lb bc, 1, 18
	call Textbox
	call WaitBGMap
	hlcoord 1, 16
	ld de, PCString_Stored
	call PlaceString
	ld l, c
	ld h, b
	ld de, wStringBuffer1
	call PlaceString
	ld a, "!"
	ld [bc], a
	ld c, 50
	call DelayFrames
	and a
	ret

.asm_boxisfull
	ld de, PCString_BoxFull
	call BillsPC_PlaceString
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret

TryWithdrawPokemon:
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld [wCurPartyMon], a
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	ld a, [wCurPartyMon]
	ld hl, sBoxMonNicknames
	call GetNick
	call CloseSRAM
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	predef SendGetMonIntoFromBox
	jr c, .PartyFull
	ld a, REMOVE_BOX
	ld [wPokemonWithdrawDepositParameter], a
	farcall RemoveMonFromPartyOrBox
	ld a, [wCurPartySpecies]
	call PlayMonCry
	hlcoord 0, 0
	lb bc, 15, 8
	call ClearBox
	hlcoord 8, 14
	lb bc, 1, 3
	call ClearBox
	hlcoord 0, 15
	lb bc, 1, 18
	call Textbox
	call WaitBGMap
	hlcoord 1, 16
	ld de, PCString_Got
	call PlaceString
	ld l, c
	ld h, b
	ld de, wStringBuffer1
	call PlaceString
	ld a, "!"
	ld [bc], a
	ld c, 50
	call DelayFrames
	and a
	ret

.PartyFull:
	ld de, PCString_PartyFull
	call BillsPC_PlaceString
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	scf
	ret

ReleasePKMN_ByePKMN:
	hlcoord 0, 0
	lb bc, 15, 8
	call ClearBox
	hlcoord 8, 14
	lb bc, 1, 3
	call ClearBox
	hlcoord 0, 15
	lb bc, 1, 18
	call Textbox

	call WaitBGMap
	ld a, [wCurPartySpecies]
	call GetCryIndex
	jr c, .skip_cry
	ld e, c
	ld d, b
	call PlayCry
.skip_cry

	ld a, [wCurPartySpecies]
	ld [wTempSpecies], a
	call GetPokemonName
	hlcoord 1, 16
	ld de, PCString_ReleasedPKMN
	call PlaceString
	ld c, 80
	call DelayFrames
	hlcoord 0, 15
	lb bc, 1, 18
	call Textbox
	hlcoord 1, 16
	ld de, PCString_Bye
	call PlaceString
	ld l, c
	ld h, b
	inc hl
	ld de, wStringBuffer1
	call PlaceString
	ld l, c
	ld h, b
	ld [hl], "!"
	ld c, 50
	call DelayFrames
	ret

MovePKMNWitoutMail_InsertMon:
	push hl
	push de
	push bc
	push af
	hlcoord 0, 15
	lb bc, 1, 18
	call Textbox
	hlcoord 1, 16
	ld de, .Saving_LeaveOn
	call PlaceString
	pop af
	pop bc
	pop de
	pop hl
	ld a, [wCurBox]
	push af
	ld bc, 0
	ld a, [wBillsPC_BackupLoadedBox]
	and a
	jr nz, .moving_from_box
	set 0, c

.moving_from_box
	ld a, [wBillsPC_LoadedBox]
	and a
	jr nz, .moving_to_box
	set 1, c

.moving_to_box
	ld hl, .Jumptable
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .dw_return
	push de
	jp hl

.dw_return
	pop af
	ld e, a
	farcall MoveMonWOMail_InsertMon_SaveGame
	ret

.Saving_LeaveOn:
	db "Saving… Leave On!@"

.Jumptable:
	dw .BoxToBox
	dw .PartyToBox
	dw .BoxToParty
	dw .PartyToParty

.BoxToBox:
	ld hl, wBillsPC_BackupLoadedBox
	ld a, [wBillsPC_LoadedBox]
	cp [hl]
	jr z, .same_box
	call .CopyFromBox
	call .CopyToBox
	ret

.same_box
	call .CopyFromBox
	call .CheckTrivialMove
	call .CopyToBox
	ret

.PartyToBox:
	call .CopyFromParty
	ld a, $1
	ld [wGameLogicPaused], a
	farcall SaveGameData
	xor a
	ld [wGameLogicPaused], a
	call .CopyToBox
	ret

.BoxToParty:
	call .CopyFromBox
	call .CopyToParty
	ret

.PartyToParty:
	call .CopyFromParty
	call .CheckTrivialMove
	call .CopyToParty
	ret

.CheckTrivialMove:
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld e, a
	ld a, [wBillsPC_BackupCursorPosition]
	ld hl, wBillsPC_BackupScrollPosition
	add [hl]
	cp e
	ret nc
	ld hl, wBillsPC_CursorPosition
	ld a, [hl]
	and a
	jr z, .top_of_screen
	dec [hl]
	ret

.top_of_screen
	ld hl, wBillsPC_ScrollPosition
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret

.CopyFromBox:
	ld a, [wBillsPC_BackupLoadedBox]
	dec a
	ld e, a
	farcall MoveMonWOMail_SaveGame
	ld a, [wBillsPC_BackupCursorPosition]
	ld hl, wBillsPC_BackupScrollPosition
	add [hl]
	ld [wCurPartyMon], a
	ld a, BANK(sBox)
	call GetSRAMBank
	ld hl, sBoxSpecies
	call CopySpeciesToTemp
	ld hl, sBoxMonNicknames
	call CopyNicknameToTemp
	ld hl, sBoxMonOT
	call CopyOTNameToTemp
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyMonToTemp
	call CloseSRAM
	farcall CalcBufferMonStats
	ld a, REMOVE_BOX
	ld [wPokemonWithdrawDepositParameter], a
	farcall RemoveMonFromPartyOrBox
	ret

.CopyToBox:
	ld a, [wBillsPC_LoadedBox]
	dec a
	ld e, a
	farcall MoveMonWOMail_SaveGame
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld [wCurPartyMon], a
	farcall InsertPokemonIntoBox
	ret

.CopyFromParty:
	ld a, [wBillsPC_BackupCursorPosition]
	ld hl, wBillsPC_BackupScrollPosition
	add [hl]
	ld [wCurPartyMon], a
	ld hl, wPartySpecies
	call CopySpeciesToTemp
	ld hl, wPartyMonNicknames
	call CopyNicknameToTemp
	ld hl, wPartyMonOT
	call CopyOTNameToTemp
	ld hl, wPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyMonToTemp
	xor a ; REMOVE_PARTY
	ld [wPokemonWithdrawDepositParameter], a
	farcall RemoveMonFromPartyOrBox
	ret

.CopyToParty:
	ld a, [wBillsPC_CursorPosition]
	ld hl, wBillsPC_ScrollPosition
	add [hl]
	ld [wCurPartyMon], a
	farcall InsertPokemonIntoParty
	ret

CopySpeciesToTemp:
	ld a, [wCurPartyMon]
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [wCurPartySpecies], a
	ld l, LOCKED_MON_ID_CURRENT_MENU
	jp LockPokemonID

CopyNicknameToTemp:
	ld bc, MON_NAME_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld de, wBufferMonNick
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	ret

CopyOTNameToTemp:
	ld bc, NAME_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld de, wBufferMonOT
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

CopyMonToTemp:
	ld a, [wCurPartyMon]
	call AddNTimes
	ld de, wBufferMon
	call CopyBytes
	ret

GetBoxPointer:
	dec b
	ld c, b
	ld b, 0
	ld hl, .boxes
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.boxes
	;  bank, address
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14
	dba sBox15
	dba sBox16
;	dba sBox17

BillsPC_ApplyPalettes:
	ld b, a
	call GetSGBLayout
	ld a, %11100100
	call DmgToCgbBGPals
	ld a, %11111100
	call DmgToCgbObjPal0
	ret

BillsPC_Jumptable:
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

BillsPC_InitGFX:
	call DisableLCD
	ld hl, vTiles2 tile $00
	ld bc, $31 tiles
	xor a
	call ByteFill
	call LoadStandardFont
	call LoadFontsBattleExtra
	ld hl, PCMailGFX
	ld de, vTiles2 tile $5c
	ld bc, 4 tiles
	call CopyBytes
	ld hl, PCSelectLZ
	ld de, vTiles0 tile $00
	call Decompress
	ld a, 6
	call SkipMusic
	call EnableLCD
	ret

PCSelectLZ: INCBIN "gfx/pc/pc.2bpp.lz"
PCMailGFX:  INCBIN "gfx/pc/pc_mail.2bpp"

PCString_ChooseaPKMN: db "Choose a <PK><MN>.@"
PCString_WhatsUp: db "What's up?@"
PCString_ReleasePKMN: db "Release <PK><MN>?@"
PCString_MoveToWhere: db "Move to where?@"
PCString_ItsYourLastPKMN: db "It's your last <PK><MN>!@"
PCString_TheresNoRoom: db "There's no room!@"
PCString_NoMoreUsablePKMN: db "No more usable <PK><MN>!@"
PCString_RemoveMail: db "Remove Mail.@"
PCString_ReleasedPKMN: db "Released <PK><MN>.@"
PCString_Bye: db "Bye,@"
PCString_Stored: db "Stored @"
PCString_Got: db "Got @"
PCString_Non: db "Non.@"
PCString_BoxFull: db "The Box is full.@"
PCString_PartyFull: db "The party's full!@"
PCString_NoReleasingEGGS: db "No releasing Eggs!@"

_ChangeBox:
	call LoadStandardMenuHeader
	call BillsPC_ClearTilemap
.loop
	xor a
	ldh [hBGMapMode], a
	call BillsPC_PrintBoxName
	call BillsPC_PlaceChooseABoxString
	ld hl, _ChangeBox_MenuHeader
	call CopyMenuHeader
	xor a
	ld [wMenuScrollPosition], a
	hlcoord 0, 4
	lb bc, 8, 9
	call Textbox
	call ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .done
	call BillsPC_PlaceWhatsUpString
	call BillsPC_ChangeBoxSubmenu
	jr .loop
.done
	call CloseWindow
	ret

BillsPC_ClearTilemap:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	ret

_ChangeBox_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 5, 9, 12
	dw .MenuData
	db 1 ; default option

.MenuData
	db SCROLLINGMENU_CALL_FUNCTION3_NO_SWITCH | SCROLLINGMENU_ENABLE_FUNCTION3 ; flags
	db 4, 0 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dba .boxes
	dba .boxnames
	dba NULL
	dba BillsPC_PrintBoxCountAndCapacity

.boxes
	db NUM_BOXES
x = 1
rept NUM_BOXES
	db x
x = x + 1
endr
	db -1

.boxnames
	push de
	ld a, [wMenuSelection]
	dec a
	call GetBoxName
	pop hl
	call PlaceString
	ret

GetBoxName:
	ld bc, BOX_NAME_LENGTH
	ld hl, wBoxNames
	call AddNTimes
	ld d, h
	ld e, l
	ret

BillsPC_PrintBoxCountAndCapacity:
	hlcoord 11, 7
	lb bc, 5, 7
	call Textbox
	ld a, [wMenuSelection]
	cp -1
	ret z
	hlcoord 12, 9
	ld de, .Pokemon
	call PlaceString
	call GetBoxCount
	ld [wDeciramBuffer], a
	hlcoord 13, 11
	ld de, wDeciramBuffer
	lb bc, 1, 2
	call PrintNum
	ld de, .out_of_20
	call PlaceString
	ret

.Pokemon:
	db "#mon@"

.out_of_20
	; db "/20@"
	db "/"
	db "0" + MONS_PER_BOX / 10 ; "2"
	db "0" + MONS_PER_BOX % 10 ; "0"
	db "@"

GetBoxCount:
	ld a, [wCurBox]
	ld c, a
	ld a, [wMenuSelection]
	dec a
	cp c
	jr z, .activebox
	ld c, a
	ld b, 0
	ld hl, .boxbanks
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld b, a
	call GetSRAMBank
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	call CloseSRAM
	ld c, a
	ld a, [wSavedAtLeastOnce]
	and a
	jr z, .newfile
	ld a, c
	ret

.newfile
	xor a
	ret

.activebox
	ld a, BANK(sBoxCount)
	ld b, a
	call GetSRAMBank
	ld hl, sBoxCount
	ld a, [hl]
	call CloseSRAM
	ret

.boxbanks
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14
	dba sBox15
	dba sBox16
;	dba sBox17

BillsPC_PrintBoxName:
	hlcoord 0, 0
	ld b, 2
	ld c, 18
	call Textbox
	hlcoord 1, 2
	ld de, .Current
	call PlaceString
	ld a, [wCurBox]
	and $f
	call GetBoxName
	hlcoord 11, 2
	call PlaceString
	ret

.Current:
	db "Current@"

BillsPC_ChangeBoxSubmenu:
	ld hl, .MenuHeader
	call LoadMenuHeader
	call VerticalMenu
	call ExitMenu
	ret c
	ld a, [wMenuCursorY]
	cp $1
	jr z, .Switch
	cp $2
	jr z, .Name
	cp $3
	jr z, .Print
	and a
	ret

.Print:
	call GetBoxCount
	and a
	jr z, .EmptyBox
	ld e, l
	ld d, h
	ld a, [wMenuSelection]
	dec a
	ld c, a
	farcall PrintPCBox
	call BillsPC_ClearTilemap
	and a
	ret

.EmptyBox:
	call BillsPC_PlaceEmptyBoxString_SFX
	and a
	ret

.Switch:
	ld a, [wMenuSelection]
	dec a
	ld e, a
	ld a, [wCurBox]
	cp e
	ret z
	farcall ChangeBoxSaveGame
	ret

.Name:
	ld b, NAME_BOX
	ld de, wd002
	farcall NamingScreen
	call ClearTileMap
	call LoadStandardFont
	call LoadFontsBattleExtra
	ld a, [wMenuSelection]
	dec a
	call GetBoxName
	ld e, l
	ld d, h
	ld hl, wd002
	ld c, BOX_NAME_LENGTH - 1
	call InitString
	ld a, [wMenuSelection]
	dec a
	call GetBoxName
	ld de, wd002
	call CopyName2
	ret

	hlcoord 11, 7 ; unused

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 4, SCREEN_WIDTH - 1, 13
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Switch@"
	db "Name@"
	db "Print@"
	db "Quit@"

BillsPC_PlaceChooseABoxString:
	ld de, .ChooseABox
	jr BillsPC_PlaceChangeBoxString

.ChooseABox:
	db "Choose a Box.@"

BillsPC_PlaceWhatsUpString:
	ld de, .WhatsUp
	jr BillsPC_PlaceChangeBoxString

.WhatsUp:
	db "What's up?@"

BillsPC_PlaceEmptyBoxString_SFX:
	ld de, .NoMonString
	call BillsPC_PlaceChangeBoxString
	ld de, SFX_WRONG
	call WaitPlaySFX
	call WaitSFX
	ld c, 50
	call DelayFrames
	ret

.NoMonString:
	db "There's no #mon.@"

BillsPC_PlaceChangeBoxString:
	push de
	hlcoord 0, 14
	lb bc, 2, 18
	call Textbox
	pop de
	hlcoord 1, 16
	call PlaceString
	ld a, $1
	ldh [hBGMapMode], a
	ret

BillsPC_ConvertBoxData::
	; converts data in an entire box of mons from party to box or vice-versa
	; in: b:de: box address (SRAM), c: conversion direction (0: party to box, 1: box to party)
	; out: all clobbered
	ld a, b
	call GetSRAMBank
	ld a, [de]
	and a
	jr z, .done
	cp MONS_PER_BOX + 1
	jr nc, .done ;don't corrupt the data any further
	ld b, a
	ld hl, MONS_PER_BOX + 2
	add hl, de
	ld de, BOXMON_STRUCT_LENGTH
.loop
	bit 0, c
	call .convert
	add hl, de
	dec b
	jr nz, .loop
.done
	jp CloseSRAM

.convert
	jr nz, BillsPC_ConvertBoxMonToPartyMon
	; fallthrough

BillsPC_ConvertPartyMonToBoxMon:
	; converts 8-bit IDs in the party mon struct's moves into 14-bit indexes, storing the overflow bits in the PP count
	; in: hl: struct pointer
	; out: hl, bc, de: preserved
	push hl
	push de
	push bc
	call BillsPC_SetUpMoveAndPPPointers
.loop
	ld a, [bc]
	call GetMoveIndexFromID
	ld a, l
	ld [bc], a
	inc bc
	ld a, [de]
	and $c0
	or h
	ld [de], a
	inc de
	ld hl, hTemp
	dec [hl]
	jr nz, .loop
	pop bc
	pop de
	pop hl
	ret

BillsPC_ConvertBoxMonToPartyMon:
	; undoes the conversion from the previous function and fully restores the PP of the mon
	push hl
	push de
	push bc
	call BillsPC_SetUpMoveAndPPPointers
.loop
	ld a, [bc]
	ld l, a
	ld a, [de]
	and $3f
	ld h, a
	cp $3f
	jr nz, .ok
	ld h, $ff
.ok
	call GetMoveIDFromIndex
	ld [bc], a
	inc bc
	and a
	jr z, .got_PP
	ld l, a
	ld a, MOVE_PP
	call GetMoveAttribute
	; max PP = base PP + min(7, base PP / 5) * PP Ups
	ld h, a
	ld l, -1
.pp_up_size_loop
	inc l
	sub 5
	jr nc, .pp_up_size_loop
	ld a, l
	cp 8
	jr c, .pp_up_size_OK
	ld l, 7
.pp_up_size_OK
	ld a, [de]
	and $c0
	or h
	ld h, a
	bit 6, h
	jr z, .skip_add_one
	add a, l
.skip_add_one
	add hl, hl ; if the top bit is set, it sets carry; it will also double l
	jr nc, .got_PP
	add a, l
.got_PP
	ld [de], a
	inc de
	ld hl, hTemp
	dec [hl]
	jr nz, .loop
	pop bc
	pop de
	pop hl
	ret

BillsPC_SetUpMoveAndPPPointers:
	ld de, MON_MOVES
	add hl, de
	ld b, h
	ld c, l
	ld e, MON_PP - MON_MOVES
	add hl, de
	ld d, h
	ld e, l
	ld a, NUM_MOVES
	ldh [hTemp], a
	ret
