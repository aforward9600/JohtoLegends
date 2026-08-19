NUM_OPTIONS EQU 7

_Option::
	call ClearJoypad
	ld hl, hInMenu
	ld a, [hl]
	push af
	ld [hl], $1
	call ClearBGPalettes
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call Textbox
	hlcoord 2, 2
	ld de, StringOptions1
	call PlaceString
	xor a
	ld [wCurOptionsPage], a

	call OptionsMenu_LoadOptions

	xor a
	ld [wJumptableIndex], a
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes

.joypad_loop
	call JoyTextDelay
	ldh a, [hJoyPressed]
	and START | B_BUTTON
	jr nz, .ExitOptions
	call OptionsControl
	jr c, .dpad
	call GetOptionPointer
	jr c, .ExitOptions

.dpad
	call Options_UpdateCursorPosition
	ld c, 3
	call DelayFrames
	jr .joypad_loop

.ExitOptions:
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	pop af
	ldh [hInMenu], a
	ret

OptionsMenu_LoadOptions:
	xor a
	ld [wJumptableIndex], a
	ldh [hJoyPressed], a
	ld c, $7
.print_text_loop
	push bc
	xor a
	ldh [hJoyLast], a
	call GetOptionPointer
	pop bc
	ld hl, wJumptableIndex
	inc [hl]
	dec c
	jr nz, .print_text_loop
	ld a, [wCurOptionsPage]
	and a
	call z, UpdateFrame
	ld a, 1
	ldh [hBGMapMode], a
	ret

StringOptions1:
	db "Text Speed<LF>"
	db "        :<LF>"
	db "Battle Scene<LF>"
	db "        :<LF>"
	db "Battle Style<LF>"
	db "        :<LF>"
	db "Sound<LF>"
	db "        :<LF>"
	db "Abilities<LF>"
	db "        :<LF>"
	db "Frame<LF>"
	db "        :Type<LF>"
	db "Next<LF>"
	db "         <LF>"
	db "Cancel@"

StringOptions2:
	db "Physical/Special<LF>"
	db "        :<LF>"
	db "Level Caps<LF>"
	db "        :<LF>"
	db "Running Shoes<LF>"
	db "        :<LF>"
	db "Quick Healing<LF>"
	db "        :<LF>"
	db "<LF>"
	db "<LF>"
	db "<LF>"
	db "<LF>"
	db "Back<LF>"
	db "         <LF>"
	db "Cancel@"

StackJumpTable::
	pop hl
	push de
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	pop de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

GetOptionPointer:
	ld a, [wCurOptionsPage] ; load the cursor position to a
	and a
	ld a, [wJumptableIndex]
	jr z, .page1
	add NUM_OPTIONS + 1
.page1
	call StackJumpTable

.Pointers:
	dw Options_TextSpeed
	dw Options_BattleScene
	dw Options_BattleStyle
	dw Options_Sound
	dw Options_Print
	dw Options_Frame
	dw Options_NextPrevious
	dw Options_Cancel

	dw Options_Phys_Spec
	dw Options_LevelCaps
	dw Options_RunningShoes
	dw Options_Fast_Nurse
	dw Options_Cancel
	dw Options_Cancel
	dw Options_NextPrevious
	dw Options_Cancel

	const_def
	const OPT_TEXT_SPEED_FAST ; 0
	const OPT_TEXT_SPEED_MED  ; 1
	const OPT_TEXT_SPEED_SLOW ; 2
	const OPT_TEXT_SPEED_NONE ; 3

Options_TextSpeed:
	call GetTextSpeed
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	ld a, c ; right pressed
	cp OPT_TEXT_SPEED_NONE
	jr c, .Increase
	ld c, OPT_TEXT_SPEED_FAST + -1

.Increase:
	inc c
	ld a, e
	jr .Save

.LeftPressed:
	ld a, c
	and a
	jr nz, .Decrease
	ld c, OPT_TEXT_SPEED_NONE + 1

.Decrease:
	dec c
	ld a, d

.Save:
	ld b, a
	ld a, [wOptions]
	and $f0
	or b
	ld [wOptions], a

.NonePressed:
	ld b, 0
	ld hl, .Strings
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 11, 3
	call PlaceString
	and a
	ret

.Strings:
; entries correspond to OPT_TEXT_SPEED_* constants
	dw .Fast
	dw .Mid
	dw .Slow
	dw .None

.Fast: db "Fast@"
.Mid:  db "Mid @"
.Slow: db "Slow@"
.None: db "None@"

GetTextSpeed:
; converts TEXT_DELAY_* value in a to OPT_TEXT_SPEED_* value in c,
; with previous/next TEXT_DELAY_* values in d/e
	ld a, [wOptions]
	and TEXT_DELAY_MASK
	cp TEXT_DELAY_SLOW
	jr z, .slow
	cp TEXT_DELAY_FAST
	jr z, .fast
	cp TEXT_DELAY_NONE
	jr z, .none
	; none of the above
	ld c, OPT_TEXT_SPEED_MED
	lb de, TEXT_DELAY_FAST, TEXT_DELAY_SLOW
	ret

.slow
	ld c, OPT_TEXT_SPEED_SLOW
	lb de, TEXT_DELAY_MED, TEXT_DELAY_NONE
	ret

.fast
	ld c, OPT_TEXT_SPEED_FAST
	lb de, TEXT_DELAY_NONE, TEXT_DELAY_MED
	ret

.none
	ld c, OPT_TEXT_SPEED_NONE
	lb de, TEXT_DELAY_SLOW, TEXT_DELAY_FAST
	ret

Options_BattleScene:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit BATTLE_SCENE, [hl]
	jr nz, .ToggleOn
	jr .ToggleOff

.LeftPressed:
	bit BATTLE_SCENE, [hl]
	jr z, .ToggleOff
	jr .ToggleOn

.NonePressed:
	bit BATTLE_SCENE, [hl]
	jr z, .ToggleOn
	jr .ToggleOff

.ToggleOn:
	res BATTLE_SCENE, [hl]
	ld de, .On
	jr .Display

.ToggleOff:
	set BATTLE_SCENE, [hl]
	ld de, .Off

.Display:
	hlcoord 11, 5
	call PlaceString
	and a
	ret

.On:  db "On @"
.Off: db "Off@"

Options_BattleStyle:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
if DEF(_CHALLENGE)
	jr nz, .NonePressed
endc
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit BATTLE_SHIFT, [hl]
	jr nz, .ToggleShift
	jr .ToggleSet

.LeftPressed:
	bit BATTLE_SHIFT, [hl]
	jr z, .ToggleSet
	jr .ToggleShift

.NonePressed:
	bit BATTLE_SHIFT, [hl]
	jr nz, .ToggleSet

.ToggleShift:
	res BATTLE_SHIFT, [hl]
	ld de, .Shift
	jr .Display

.ToggleSet:
	set BATTLE_SHIFT, [hl]
	ld de, .Set

.Display:
	hlcoord 11, 7
	call PlaceString
	and a
	ret

if DEF(_CHALLENGE)
.Shift: db "Set  @"
.Set:   db "@"
else
.Shift: db "Shift@"
.Set:   db "Set  @"
endc

Options_Sound:
	ld hl, wOptions
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit STEREO, [hl]
	jr nz, .SetMono
	jr .SetStereo

.LeftPressed:
	bit STEREO, [hl]
	jr z, .SetStereo
	jr .SetMono

.NonePressed:
	bit STEREO, [hl]
	jr nz, .ToggleStereo
	jr .ToggleMono

.SetMono:
	res STEREO, [hl]
	call RestartMapMusic

.ToggleMono:
	ld de, .Mono
	jr .Display

.SetStereo:
	set STEREO, [hl]
	call RestartMapMusic

.ToggleStereo:
	ld de, .Stereo

.Display:
	hlcoord 11, 9
	call PlaceString
	and a
	ret

.Mono:   db "Mono  @"
.Stereo: db "Stereo@"

	const_def
	const OPT_PRINT_LIGHTEST ; 0
	const OPT_PRINT_LIGHTER  ; 1
	const OPT_PRINT_NORMAL   ; 2
	const OPT_PRINT_DARKER   ; 3
	const OPT_PRINT_DARKEST  ; 4

Set100:
	ld a, 100
	ld [wLevelCap], a
	ret

SetLevelCap:
	ld de, EVENT_BEAT_BIKER_BOSS
	call Options_CheckEvent
	jr z, Set100

	ld de, EVENT_GOT_RIVALS_MESSAGE
	call Options_CheckEvent
	jr z, .Set80

	ld de, EVENT_BEAT_MADAME_BOSS
	call Options_CheckEvent
	jr z, .Set68

	ld hl, wJohtoBadges

	bit RISINGBADGE, [hl]
	ld a, 60
	jr nz, .getlevel

	bit ZEPHYRBADGE, [hl]
	ld a, 55
	jr nz, .getlevel

	bit HIVEBADGE, [hl]
	ld a, 51
	jr nz, .getlevel

	bit PLAINBADGE, [hl]
	ld a, 44
	jr nz, .getlevel

	bit MINERALBADGE, [hl]
	ld a, 34
	jr nz, .getlevel

	bit STORMBADGE, [hl]
	ld a, 31
	jr nz, .getlevel

	bit FOGBADGE, [hl]
	ld a, 28
	jr nz, .getlevel

	bit GLACIERBADGE, [hl]
	ld a, 22
	jr nz, .getlevel

	ld a, 15

.getlevel
	ld [wLevelCap], a
	ret

.Set80
	ld a, 80
	jr .getlevel

.Set68
	ld a, 68
	jr .getlevel

Options_CheckEvent:
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	ret

Options_Fast_Nurse:
	ld hl, wOptions2
 	ldh a, [hJoyPressed]
 	bit D_LEFT_F, a
 	jr nz, .LeftPressed
 	bit D_RIGHT_F, a
 	jr z, .NonePressed
 	bit NURSE_HEAL, [hl]
 	jr nz, .ToggleOn
 	jr .ToggleOff
 
 .LeftPressed:
 	bit NURSE_HEAL, [hl]
 	jr z, .ToggleOn
 	jr .ToggleOn
 
 .NonePressed:
 	bit NURSE_HEAL, [hl]
 	jr nz, .ToggleOff
 
 .ToggleOn:
 	res NURSE_HEAL, [hl]
	ld de, EVENT_FAST_NURSE
	ld b, RESET_FLAG
	call EventFlagAction
 	ld de, .On
 	jr .Display
 
 .ToggleOff:
 	set NURSE_HEAL, [hl]
	ld de, EVENT_FAST_NURSE
	ld b, SET_FLAG
	call EventFlagAction
 	ld de, .Off
 
.Display:
	hlcoord 11, 9
	call PlaceString
	and a
	ret

.On:  db "Normal@"
.Off: db "Quick @"

Options_Print:
	ld a, [wGBPrinterBrightness]
	ld c, a
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	ld a, c
	cp OPT_PRINT_LIGHTEST
	jr z, .Increase
	ld a, OPT_PRINT_LIGHTEST
	jr .Save

.Increase:
	ld a, OPT_PRINT_LIGHTER
	jr .Save

.LeftPressed:
	ld a, c
	cp OPT_PRINT_LIGHTEST
	jr z, .Increase
	ld a, OPT_PRINT_LIGHTEST

.Save:
	ld b, a
	ld [wGBPrinterBrightness], a

.NonePressed:
	ld b, $0
	ld hl, .Strings
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 11, 11
	call PlaceString
	and a
	ret

.Strings:
; entries correspond to OPT_PRINT_* constants
	dw .Lightest
	dw .Lighter
	dw .Normal
	dw .Darker
	dw .Darkest

.Lightest: db "On @"
.Lighter:  db "Off@"
.Normal:   db "Normal  @"
.Darker:   db "Darker  @"
.Darkest:  db "Darkest @"

Options_RunningShoes:
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit RUNNING_SHOES, [hl]
	jr nz, .ToggleOff
	jr .ToggleOn

.LeftPressed:
	bit RUNNING_SHOES, [hl]
	jr z, .ToggleOn
	jr .ToggleOff

.NonePressed:
	bit RUNNING_SHOES, [hl]
	jr nz, .ToggleOn

.ToggleOff:
	res RUNNING_SHOES, [hl]
	ld de, .Off
	jr .Display

.ToggleOn:
	set RUNNING_SHOES, [hl]
	ld de, .On

.Display:
	hlcoord 11, 7
	call PlaceString
	and a
	ret

.Off: db "Hold@"
.On:  db "Auto@"

Options_LevelCaps:
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit LEVEL_CAPS, [hl]
	jr nz, .ToggleOff
	jr .ToggleOn

.LeftPressed:
	bit LEVEL_CAPS, [hl]
	jr z, .ToggleOn
	jr .ToggleOff

.NonePressed:
	bit LEVEL_CAPS, [hl]
	jr nz, .ToggleOn

.ToggleOff:
	res LEVEL_CAPS, [hl]
	call Set100
	ld de, .No
	jr .Display

.ToggleOn:
	set LEVEL_CAPS, [hl]
	call SetLevelCap
	ld de, .Yes

.Display:
	hlcoord 11, 5
	call PlaceString
	and a
	ret

.No:  db "No @"
.Yes: db "Yes@"

GetPrinterSetting:
; converts GBPRINTER_* value in a to OPT_PRINT_* value in c,
; with previous/next GBPRINTER_* values in d/e
	ld a, [wGBPrinterBrightness]
	and a
	jr z, .IsLightest
	cp GBPRINTER_LIGHTER
	jr z, .IsLight
	cp GBPRINTER_DARKER
	jr z, .IsDark
	cp GBPRINTER_DARKEST
	jr z, .IsDarkest
	; none of the above
	ld c, OPT_PRINT_NORMAL
	lb de, GBPRINTER_LIGHTER, GBPRINTER_DARKER
	ret

.IsLightest:
	ld c, OPT_PRINT_LIGHTEST
	lb de, GBPRINTER_DARKEST, GBPRINTER_LIGHTER
	ret

.IsLight:
	ld c, OPT_PRINT_LIGHTER
	lb de, GBPRINTER_LIGHTEST, GBPRINTER_NORMAL
	ret

.IsDark:
	ld c, OPT_PRINT_DARKER
	lb de, GBPRINTER_NORMAL, GBPRINTER_DARKEST
	ret

.IsDarkest:
	ld c, OPT_PRINT_DARKEST
	lb de, GBPRINTER_DARKER, GBPRINTER_LIGHTEST
	ret

Options_Phys_Spec:
	ld hl, wOptions2
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr z, .NonePressed
	bit PHYS_SPEC_SPLIT, [hl]
	jr nz, .ToggleSplit
	jr .ToggleClassic

.LeftPressed:
	bit PHYS_SPEC_SPLIT, [hl]
	jr z, .ToggleClassic
	jr .ToggleSplit

.NonePressed:
	bit PHYS_SPEC_SPLIT, [hl]
	jr nz, .ToggleClassic

.ToggleSplit:
	res PHYS_SPEC_SPLIT, [hl]
	ld de, .Split
	jr .Display

.ToggleClassic:
	set PHYS_SPEC_SPLIT, [hl]
	ld de, .Classic

.Display:
	hlcoord 11, 3 ;7
	call PlaceString
	and a
	ret

.Split:   db "Split  @"
.Classic: db "Classic@"

Options_Frame:
	ld hl, wTextboxFrame
	ldh a, [hJoyPressed]
	bit D_LEFT_F, a
	jr nz, .LeftPressed
	bit D_RIGHT_F, a
	jr nz, .RightPressed
	and a
	ret

.RightPressed:
	ld a, [hl]
	inc a
	jr .Save

.LeftPressed:
	ld a, [hl]
	dec a

.Save:
	maskbits NUM_FRAMES
	ld [hl], a
UpdateFrame:
	ld a, [wTextboxFrame]
	hlcoord 16, 13 ; where on the screen the number is drawn
	add "1"
	ld [hl], a
	call LoadFontsExtra
	and a
	ret

Options_Cancel:
	ldh a, [hJoyPressed]
	and A_BUTTON
	jr nz, .Exit
	and a
	ret

.Exit:
	scf
	ret

OptionsControl:
	ld hl, wJumptableIndex
	ldh a, [hJoyLast]
	cp D_DOWN
	jr z, .DownPressed
	cp D_UP
	jr z, .UpPressed
	and a
	ret

.DownPressed:
	ld a, [hl] ; load the cursor position to a
	cp NUM_OPTIONS ; maximum number of items in option menu
	jr nz, .Increase
	ld [hl], -1
.Increase:
	inc [hl]
	scf
	ret

.UpPressed:
	ld a, [hl]
	and a
	jr nz, .Decrease
	ld [hl], NUM_OPTIONS + 1
.Decrease:
	dec [hl]
	scf
	ret

Options_UpdateCursorPosition:
	hlcoord 1, 1
	ld de, SCREEN_WIDTH
	ld c, $10
.loop
	ld [hl], " "
	add hl, de
	dec c
	jr nz, .loop
	hlcoord 1, 2
	ld bc, 2 * SCREEN_WIDTH
	ld a, [wJumptableIndex]
	call AddNTimes
	ld [hl], "▶"
	ret

Options_NextPrevious:
	ld hl, wCurOptionsPage
	ldh a, [hJoyPressed]
	and A_BUTTON | D_LEFT | D_RIGHT
	jr z, .NonePressed
	bit 0, [hl]
	jr z, .Page2
;.Page1:
	res 0, [hl]
	ld de, StringOptions1
	jr .Display
.Page2:
	set 0, [hl]
	ld de, StringOptions2
.Display:
	push de
	hlcoord 0, 0
	lb bc, 16, 18
	call Textbox
	pop de
	hlcoord 2, 2
	call PlaceString
	call OptionsMenu_LoadOptions
	ld a, $6
	ld [wJumptableIndex], a
.NonePressed:
	and a
	ret
