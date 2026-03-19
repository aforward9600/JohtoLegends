BankOfMom:
	ret

DSTChecks:
; check the time; avoid changing DST if doing so would change the current day
	ld a, [wDST]
	bit 7, a
	ldh a, [hHours]
	jr z, .NotDST
	and a ; within one hour of 00:00?
	jr z, .LostBooklet
	jr .loop

.NotDST:
	cp 23 ; within one hour of 23:00?
	jr nz, .loop
	; fallthrough

.LostBooklet:
	call .ClearBox
	bccoord 1, 14
	ld hl, .Text_AdjustClock
	call PlaceHLTextAtBC
	call YesNoBox
	ret c
	call .ClearBox
	bccoord 1, 14
	ld hl, .Text_LostInstructionBooklet
	jp PlaceHLTextAtBC

.loop
	call .ClearBox
	bccoord 1, 14
	ld a, [wDST]
	bit 7, a
	jr z, .SetDST
	ld hl, .Text_IsDSTOver
	call PlaceHLTextAtBC
	call YesNoBox
	ret c
	ld a, [wDST]
	res 7, a
	ld [wDST], a
	call .SetClockBack
	call .ClearBox
	bccoord 1, 14
	ld hl, .Text_SetClockBack
	jp PlaceHLTextAtBC

.SetDST:
	ld hl, .Text_SwitchToDST
	call PlaceHLTextAtBC
	call YesNoBox
	ret c
	ld a, [wDST]
	set 7, a
	ld [wDST], a
	call .SetClockForward
	call .ClearBox
	bccoord 1, 14
	ld hl, .Text_SetClockForward
	jp PlaceHLTextAtBC

.SetClockForward:
	ld a, [wStartHour]
	add 1
	sub 24
	jr nc, .DontLoopHourForward
	add 24
.DontLoopHourForward:
	ld [wStartHour], a
	ccf
	ld a, [wStartDay]
	adc 0
	ld [wStartDay], a
	ret

.SetClockBack:
	ld a, [wStartHour]
	sub 1
	jr nc, .DontLoopHourBack
	add 24
.DontLoopHourBack:
	ld [wStartHour], a
	ld a, [wStartDay]
	sbc 0
	jr nc, .DontLoopDayBack
	add 7
.DontLoopDayBack:
	ld [wStartDay], a
	ret

.ClearBox:
	hlcoord 1, 14
	lb bc, 3, 18
	jp ClearBox

.Text_AdjustClock:
	; Do you want to adjust your clock for Daylight Saving Time?
	text_far UnknownText_0x1c6095
	text_end

.Text_LostInstructionBooklet:
	; I lost the instruction booklet for the POKéGEAR.
	; Come back again in a while.
	text_far UnknownText_0x1c60d1
	text_end

.Text_SwitchToDST:
	; Do you want to switch to Daylight Saving Time?
	text_far UnknownText_0x1c6000
	text_end

.Text_SetClockForward:
	; I set the clock forward by one hour.
	text_far UnknownText_0x1c6030
	text_end

.Text_IsDSTOver:
	; Is Daylight Saving Time over?
	text_far UnknownText_0x1c6056
	text_end

.Text_SetClockBack:
	; I put the clock back one hour.
	text_far UnknownText_0x1c6075
	text_end

Mom_SetUpWithdrawMenu:

Mom_SetUpDepositMenu:
Mom_ContinueMenuSetup:

Mom_Wait10Frames:

Mom_WithdrawDepositMenuJoypad:
	ret

UnknownText_0x16649:
	; Wow, that's a cute #MON. Where did you get it? … So, you're leaving on an adventure… OK! I'll help too. But what can I do for you? I know! I'll save money for you. On a long journey, money's important. Do you want me to save your money?
	text_far _MomLeavingText1
	text_end

UnknownText_0x1664e:
	; OK, I'll take care of your money.
	text_far _MomLeavingText2
	text_end

UnknownText_0x16653:
	; Be careful. #MON are your friends. You need to work as a team. Now, go on!
	text_far _MomLeavingText3
	text_end

UnknownText_0x16658:
	; Hi! Welcome home! You're trying very hard, I see. I've kept your room tidy. Or is this about your money?
	text_far _MomVisitingText1
	text_end

UnknownText_0x1665d:
	; What do you want to do?
	text_far _MomVisitingText2
	text_end

UnknownText_0x16662:
	; How much do you want to save?
	text_far _MomVisitingText3
	text_end

UnknownText_0x16667:
	; How much do you want to take?
	text_far _MomVisitingText4
	text_end

UnknownText_0x1666c:
	; Do you want to save some money?
	text_far _MomVisitingText5
	text_end

UnknownText_0x16671:
	; You haven't saved that much.
	text_far _MomVisitingText6
	text_end

UnknownText_0x16676:
	; You can't take that much.
	text_far _MomVisitingText7
	text_end

UnknownText_0x1667b:
	; You don't have that much.
	text_far _MomVisitingText8
	text_end

UnknownText_0x16680:
	; You can't save that much.
	text_far _MomVisitingText9
	text_end

UnknownText_0x16685:
	; OK, I'll save your money. Trust me! , stick with it!
	text_far _MomVisitingText10
	text_end

UnknownText_0x1668a:
	; Your money's safe here! Get going!
	text_far _MomVisitingText11
	text_end

UnknownText_0x1668f:
	; , don't give up!
	text_far _MomVisitingText12
	text_end

UnknownText_0x16694:
	; Just do what you can.
	text_far _MomVisitingText13
	text_end

Mom_SavedString:
	db "Saved@"

Mon_WithdrawString:
	db "Withdraw@"

Mom_DepositString:
	db "Deposit@"

Mom_HeldString:
	db "Held@"

MenuHeader_0x166b5:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, 10
	dw MenuData_0x166bd
	db 1 ; default option

MenuData_0x166bd:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Get@"
	db "Save@"
	db "Change@"
	db "Cancel@"
