GFX_49c0c:
INCBIN "gfx/unknown/049c0c.2bpp"

MainMenu:
	xor a
	ld [wDisableTextAcceleration], a
	call Function49ed0
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ld hl, wGameTimerPause
	res GAMETIMERPAUSE_TIMER_PAUSED_F, [hl]
	call MainMenu_GetWhichMenu
	ld [wWhichIndexSet], a
	call MainMenu_PrintCurrentTimeAndDay
	ld hl, .MenuHeader
	call LoadMenuHeader
	call MainMenuJoypadLoop
	call CloseWindow
	jr c, .quit
	call ClearTileMap
	ld a, [wMenuSelection]
	ld hl, .Jumptable
	rst JumpTable
	jr MainMenu

.quit
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 16, 7
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 0 ; items
	dw MainMenuItems
	dw PlaceMenuStrings
	dw .Strings

if DEF(_FRENCH)
.Strings:
	db "Continuer@"
	db "Nouveau Jeu@"
	db "Options@"
else
.Strings:
	db "Continue@"
	db "New Game@"
	db "Option@"
endc

.Jumptable:
	dw MainMenu_Continue
	dw MainMenu_NewGame
	dw MainMenu_Options

CONTINUE       EQU 0
NEW_GAME       EQU 1
OPTION         EQU 2

MainMenuItems:

NewGameMenu:
	db 2
	db NEW_GAME
	db OPTION
	db -1

ContinueMenu:
	db 3
	db CONTINUE
	db NEW_GAME
	db OPTION
	db -1

MainMenu_GetWhichMenu:
	nop
	nop
	nop
	ld a, [wSaveFileExists]
	and a
	jr nz, .next
	ld a, $0 ; New Game
	ret

.next
	ld a, $1 ; Continue
	ret

MainMenuJoypadLoop:
	call SetUpMenu
.loop
	call MainMenu_PrintCurrentTimeAndDay
	ld a, [w2DMenuFlags1]
	set 5, a
	ld [w2DMenuFlags1], a
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b_button
	cp A_BUTTON
	jr z, .a_button
	ld de, .build_string
	hlcoord 1, 12
	call PlaceString
	jr .loop

.a_button
	call PlayClickSFX
	and a
	ret

.b_button
	scf
	ret

.build_string:
if DEF(_CHALLENGEFRENCH)
	db "V0.7.0.6 Défi@"
elif DEF(_CHALLENGE)
	db "V0.7.0.6 Challenge@"
elif DEF(_FAITHFULFRENCH)
	db "V0.7.0.6 Fidèle@"
elif DEF(_FAITHFUL)
	db "V0.7.0.6 Faithful@"
elif DEF(_NOPSS)
	db "V0.7.0.6 No PSS@"
elif DEF(_FRENCH)
	db "V0.7.0.6 Originale@"
elif DEF(_NORMAL)
	db "V0.7.0.6 Original@"
endc

MainMenu_PrintCurrentTimeAndDay:
	ld a, [wSaveFileExists]
	and a
	ret z
	xor a
	ldh [hBGMapMode], a
	call .PlaceBox
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call .PlaceTime
	pop af
	ld [wOptions], a
	ld a, $1
	ldh [hBGMapMode], a
	ret

.PlaceBox:
	call CheckRTCStatus
	and $80
	jp nz, SpeechTextbox
	hlcoord 0, 14
	ld b, 2
	ld c, 18
	jp Textbox

.PlaceTime:
	ld a, [wSaveFileExists]
	and a
	ret z
	call CheckRTCStatus
	and $80
	jp nz, .PrintTimeNotSet
	call UpdateTime
	call GetWeekday
	ld b, a
	decoord 1, 15
	call .PlaceCurrentDay
	decoord 4, 16
	ldh a, [hHours]
	ld c, a
	farcall PrintHour
	ld [hl], ":"
	inc hl
	ld de, hMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

.PrintTimeNotSet:
	hlcoord 1, 14
	ld de, .TimeNotSet
	jp PlaceString

if DEF(_FRENCH)
.TimeNotSet:
	db "Regler Horloge@"
else
.TimeNotSet:
	db "Time Not Set@"
endc

.PlaceCurrentDay:
	push de
	ld hl, .Days
	ld a, b
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ld h, b
	ld l, c
	ld de, .Day
	jp PlaceString

if DEF(_FRENCH)
.Days:
	db "Dimanche@"
	db "Lundi@"
	db "Mardi@"
	db "Mercredi@"
	db "Jeudi@"
	db "Vendredi@"
	db "Samedi@"
.Day:
	db "@"
else
.Days:
	db "Sun@"
	db "Mon@"
	db "Tues@"
	db "Wednes@"
	db "Thurs@"
	db "Fri@"
	db "Satur@"
.Day:
	db "day@"
endc

Function49ed0:
	xor a
	ldh [hMapAnims], a
	call ClearTileMap
	call LoadFontsExtra
	call LoadStandardFont
	jp ClearWindowData

MainMenu_NewGame:
	farcall NewGame
	ret

MainMenu_Options:
	farcall OptionsMenu
	ret

MainMenu_Continue:
	farcall Continue
	ret

MainMenu_MysteryGift:
	farcall MysteryGift
	ret
