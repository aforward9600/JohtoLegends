UNOWNSTAMP_BOLD_A EQU "♂" ; $ef
UNOWNSTAMP_BOLD_B EQU "♀" ; $f5

AlphRuinsStampString:
	db " ALPH RUINS STAMP@"

UnownDexDoWhatString:
	db "Do what?@"

UnownDexMenuString:
	db   UNOWNSTAMP_BOLD_A, " PRINT"
	next UNOWNSTAMP_BOLD_B, " CANCEL"
	next "← PREVIOUS"
	next "→ NEXT"
	db   "@"

UnownDexVacantString:
	db "VACANT@"

UnownDexATile:
INCBIN "gfx/printer/bold_a.1bpp"
UnownDexBTile:
INCBIN "gfx/printer/bold_b.1bpp"

PlaceUnownPrinterFrontpic:
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	hlcoord 7, 11
	ld a, $31
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	ret
