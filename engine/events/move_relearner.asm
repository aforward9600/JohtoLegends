	const_def
	const MOVERELEARNER_OK
	const MOVERELEARNER_CANCEL
	const MOVERELEARNER_NO_MOVES
	const MOVERELEARNER_EGG

MoveRelearnerScript::
	writetext .which_mon_text
	refreshscreen
	partyselect
	iffalse MoveRelearnerCancel
	callasm MoveRelearnerLoad
	ifequal MOVERELEARNER_NO_MOVES, .no_moves
	ifequal MOVERELEARNER_EGG, .egg
	writetext .what_move_text
	callasm MoveRelearner
	opentext
	ifequal MOVERELEARNER_CANCEL, MoveRelearnerCancel
	writetext .done_text
	waitbutton
	closetext
	setval TRUE
	end

.which_mon_text
	text "So, which #mon"
	line "should I make"
	cont "remember a move?"
	prompt

.what_move_text
	text "What move should I"
	line "teach?"
	prompt

.done_text
	text "Come again if your"
	line "#mon need to"
	para "remember any other"
	line "moves!"
	done

.no_moves
	writetext .no_moves_text
	sjump MoveRelearnerCancel.exit_failure

.no_moves_text
	text "This #mon knows"
	line "every move it can"
	para "learn! There's"
	line "nothing for me to"
	cont "do here!"
	done

.egg
	writetext .egg_text
	sjump MoveRelearnerCancel.exit_failure

.egg_text
	text "Eggs don't learn"
	line "moves! How could I"
	para "make an Egg"
	line "remember a move?"
	done

MoveRelearnerCancel::
	writetext .cancel_text
.exit_failure
	waitbutton
	closetext
	setval FALSE
	end

.cancel_text
	text "That's too bad."
	line "Come back later if"
	para "you need my"
	line "services again."
	done

MoveRelearnerLoad:
	ld a, [wScriptVar]
	dec a
	ld [wCurPartyMon], a
	add a, LOW(wPartySpecies)
	ld l, a
	adc HIGH(wPartySpecies)
	sub l
	ld h, a
	ld a, [hl]
	cp EGG
	jr nz, .no_egg
	ld a, MOVERELEARNER_EGG
	ld [wScriptVar], a
	ret

.no_egg
	ld d, a
	ld a, [wCurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1Level
	call AddNTimes
	ld e, [hl]
	ld bc, MON_MOVES - MON_LEVEL
	add hl, bc
	push de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld e, [hl]
	pop hl
	push de
	push bc
	ld a, BANK(wMoveRelearnerStaging)
	ldh [rSVBK], a
	ld a, l
	ld [wMoveRelearnerLevelStaging], a
	ld a, h
	call GetPokemonIndexFromID
	ld a, l
	ld [wMoveRelearnerSpeciesStaging], a
	ld a, h
	ld [wMoveRelearnerSpeciesStaging + 1], a
	ld hl, wMoveRelearnerTeachableMoves
	ld bc, (NUM_ATTACKS + 7) / 8
	xor a
	push bc
	call ByteFill
	pop bc
	ld hl, wMoveRelearnerRejectedMoves
	dec a
	call ByteFill
	rept 2
		pop de
		ld a, d
		call MoveRelearner_RejectMoveID
		ld a, e
		call MoveRelearner_RejectMoveID
	endr
	ld hl, wMoveRelearnerSpeciesStaging
	ld a, [hli]
	ld h, [hl]
	ld l, a
.move_list_loop
	ld b, h
	ld c, l
	push bc
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	call FarSkipEvolutions
	ld d, b
	call MoveRelearner_MarkToLevel
	call MoveRelearner_RejectAllMoves
	pop bc
	ld hl, PreviousEvolutionStage - 2
	add hl, bc
	add hl, bc
	ld a, BANK(PreviousEvolutionStage)
	call GetFarHalfword
	ld a, h
	or l
	jr nz, .move_list_loop

	ld hl, AlphabeticalMoveList
	ld de, wMoveRelearnerMoveListStaging
.load_moves_loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	or c
	jr z, .done_loading
	push bc
	call MoveRelearner_IsMoveTeachable
	pop bc
	jr z, .load_moves_loop
	ld a, c
	ld [de], a
	inc e
	ld a, b
	ld [de], a
	inc e
	jr nz, .load_moves_loop
.done_loading
	ld h, d
	ld l, e
	xor a
	sub e
	cp $100 - LOW(wMoveRelearnerMoveListStaging)
	ld d, MOVERELEARNER_NO_MOVES
	jr z, .done
	ld c, a
	xor a
	ld b, a
	ld d, a
	call ByteFill
	ld a, e
	sub LOW(wMoveRelearnerMoveListStaging)
	rrca
	ld [wMoveRelearnerMoveCountStaging], a
	ld a, BANK(wPokemonData)
	ldh [rSVBK], a
.done
	ld a, d
	ld [wScriptVar], a
	ret

MoveRelearner_MarkToLevel:
	; in: d:hl: move list
	; out: same list, pointing to the first move that goes above the level limit
	ld a, [wMoveRelearnerLevelStaging]
	ld c, a
	ld a, d
	call GetFarByte
	and a
	ret z
	dec a
	cp c
	ret nc
	inc hl
	push hl
	ld a, d
	call GetFarHalfword
	ld b, h
	ld c, l
	pop hl
	inc hl
	inc hl
	call MoveRelearner_MarkMove
	jr MoveRelearner_MarkToLevel

MoveRelearner_RejectAllMoves:
	; in: d:hl: move list
	ld a, d
	call GetFarByte
	and a
	ret z
	inc hl
	push hl
	ld a, d
	call GetFarHalfword
	ld b, h
	ld c, l
	pop hl
	inc hl
	inc hl
	call MoveRelearner_RejectIfNotMarked
	jr MoveRelearner_RejectAllMoves

MoveRelearner_IsMoveTeachable:
	push hl
	dec bc
	ld hl, wMoveRelearnerTeachableMoves
	call MoveRelearner_AdjustPointerByMoveIndex
	and [hl]
	inc h
	and [hl]
	pop hl
	ret

MoveRelearner_MarkMove:
	push hl
	dec bc
	ld hl, wMoveRelearnerTeachableMoves
	call MoveRelearner_AdjustPointerByMoveIndex
	or [hl]
	ld [hl], a
	pop hl
	ret

MoveRelearner_RejectIfNotMarked:
	push hl
	dec bc
	ld hl, wMoveRelearnerTeachableMoves
	call MoveRelearner_AdjustPointerByMoveIndex
	and [hl]
	inc h
	jr MoveRelearner_RejectMove.continue

MoveRelearner_RejectMoveID:
	and a
	ret z
	call GetMoveIndexFromID
	ld b, h
	ld c, l
MoveRelearner_RejectMove:
	push hl
	dec bc
	ld hl, wMoveRelearnerRejectedMoves
	call MoveRelearner_AdjustPointerByMoveIndex
.continue
	cpl
	and [hl]
	ld [hl], a
	pop hl
	ret

MoveRelearner_AdjustPointerByMoveIndex:
	ld a, c
	rept 3
		srl b
		rr c
	endr
	add hl, bc
	and 7
	jp ShiftLeftOne

INCLUDE "data/moves/alphabetical_order.asm"

MoveRelearner:
	call FadeToMenu
	ldh a, [hInMenu]
	push af
	ld a, 1
	ldh [hInMenu], a
	call ClearTileMap
	call ClearBGPalettes

	ldh a, [rSVBK]
	push af
	ld a, BANK(wMoveRelearnerStaging)
	ldh [rSVBK], a
	ld hl, wMoveRelearnerSpeciesStaging
	ld de, wMoveRelearnerSpecies
	ld bc, wMoveRelearnerMoveListTerminator - wMoveRelearnerSpecies
	call CopyBytes
	pop af
	ldh [rSVBK], a
	xor a
	ld [de], a
	inc de
	ld [de], a

	farcall StatsScreen_LoadFont
	call MoveRelearner_InitializeScreenLayout
	xor a
	ld [wScriptVar], a
	ld [wMoveRelearnerCursor], a
	ld [wMoveRelearnerScroll], a
	hlcoord 1, 2
	ld [hl], "▶"
	call MoveRelearner_DisplayMoveData
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes

.loop
	ld c, 3
	call DelayFrames
	call GetJoypad
	ldh a, [hJoyPressed]
	and a
	jr z, .loop
	call MoveRelearner_InterpretJoypad
	jr nc, .loop

	pop af
	ldh [hInMenu], a
	jp ExitAllMenus

MoveRelearner_InitializeScreenLayout:
	hlcoord 0, 1
	lb bc, 8, 18
	call Textbox
	hlcoord 0, 11
	lb bc, 5, 18
	call Textbox
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames
	ld bc, MON_NAME_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	hlcoord 3, 0
	call PlaceString
	ld a, [wMoveRelearnerLevel]
	ld [wTempMonLevel], a
	hlcoord 14, 0
	call PrintLevel
	ld de, .acc_string
	hlcoord 4, 12
	call PlaceString
	ld de, .atk_string
	hlcoord 12, 12
	jp PlaceString

.acc_string
	db "ACC/@"
.atk_string
	db "ATK/@"

MoveRelearner_DisplayMoveData:
	hlcoord 2, 2
	lb bc, 8, 17
	call ClearBox
	call MoveRelearner_ClearMoveInfoBox
	ld a, [wMoveRelearnerScroll]
	add a, a
	add a, LOW(wMoveRelearnerMoveList)
	ld e, a
	adc HIGH(wMoveRelearnerMoveList)
	sub e
	ld d, a
	hlcoord 2, 2
	xor a
.loop
	ld [wTempLoopCounter], a
	push hl
	ld a, [de]
	inc de
	ld l, a
	ld a, [de]
	inc de
	ld h, a
	or l
	jp z, .place_cancel
	call GetMoveIDFromIndex
	pop hl
	ld [wNamedObjectIndexBuffer], a
	push de
	call GetMoveName
	push hl
	call PlaceString
	ld a, [wNamedObjectIndexBuffer]
	call GetMoveAddress
	push af
	ld b, a
	ld a, [wTempLoopCounter]
	ld c, a
	ld a, [wMoveRelearnerCursor]
	cp c
	call z, MoveRelearner_DisplayMoveInfoBox
	ld d, h
	ld e, l
	pop af
	pop hl
	ld bc, 13
	add hl, bc
	ld b, a
	push hl
	ld hl, MOVE_TYPE - 1
	add hl, de
	call GetFarByte
	ld [wNamedObjectIndexBuffer], a
	assert (MOVE_PP - MOVE_TYPE) == 2
	inc hl
	inc hl
	ld a, b
	call GetFarByte
	pop hl
	ld c, 10
	call SimpleDivide
	ld c, a
	ld a, b
	and a
	jr z, .skip_tens
	add a, "0"
	ld [hl], a
.skip_tens
	inc hl
	ld a, c
	add a, "0"
	ld [hli], a
	ld a, $3e ; P from PP
	ld [hli], a
	ld [hli], a
	ld de, 4
	add hl, de
	ld de, .type_string
	call PlaceString
	ld de, 5
	add hl, de
	push hl
	predef GetTypeName
	pop hl
	ld de, wStringBuffer1
	call PlaceString
	ld de, 14
	add hl, de
	pop de
	ld a, [wTempLoopCounter]
	inc a
	cp 4
	jp nz, .loop
.place_arrows
	hlcoord 18, 1
	ld a, [wMoveRelearnerScroll]
	ld c, a
	and a
	ld [hl], $7a ; textbox horizontal border
	jr z, .got_top_arrow
	ld [hl], $70 ; arrow pointing up
.got_top_arrow
	hlcoord 18, 10
	ld [hl], $7a ; textbox horizontal border
	ld a, [wMoveRelearnerMoveCount]
	sub c
	cp 4
	ret c
	ld [hl], $ee ; arrow pointing down
	ret

.place_cancel
	pop hl
	ld de, .cancel_string
	call PlaceString
	jr .place_arrows

.cancel_string
	db "CANCEL@"

.type_string
	db "TYPE/@"

MoveRelearner_UpdateMoveInfoBox:
	call MoveRelearner_ClearMoveInfoBox
	call MoveRelearner_LoadCurrentMoveIndex
	ld a, h
	or l
	ret z
	call GetMoveIDFromIndex
	ld [wNamedObjectIndexBuffer], a
	call GetMoveAddress
	ld b, a
MoveRelearner_DisplayMoveInfoBox:
	; in: b:hl = move attributes, [wNamedObjectIndexBuffer] = move ID
	push hl
	inc hl
	ld a, b
	call GetFarByte
	push af
	inc hl
	inc hl
	ld a, b
	call GetFarByte
	ld bc, 100
	ld hl, $80
	call AddNTimes
	ld a, h
	hlcoord 8, 12
	call .print_value
	pop af
	hlcoord 16, 12
	call .print_value
	ld a, [wNamedObjectIndexBuffer]
	call GetMoveIndexFromID
	ld b, h
	ld c, l
	ld hl, MoveDescriptions
	ld a, BANK(MoveDescriptions)
	call LoadDoubleIndirectPointer
	ld d, h
	ld e, l
	hlcoord 1, 14
	call nz, FarPlaceString
	pop hl
	ret

.print_value
	ld de, .dashes
	cp 2
	jp c, PlaceString
	ld c, 100
	call SimpleDivide
	ld c, a
	ld a, b
	and a
	jr z, .skip_hundreds
	add a, "0"
	ld [hl], a
.skip_hundreds
	inc hl
	inc hl
	ld a, c
	ld c, 10
	call SimpleDivide
	add a, "0"
	ld [hld], a
	ld a, b
	add a, "0"
	ld [hl], a
	ret

.dashes
	db "---@"

MoveRelearner_ClearMoveInfoBox:
	hlcoord 1, 13
	lb bc, 4, 18
	call ClearBox
	hlcoord 8, 12
	ld de, .clear_numbers
	call PlaceString
	hlcoord 16, 12
	ld de, .clear_numbers
	jp PlaceString

.clear_numbers
	db "   @"

MoveRelearner_LoadCurrentMoveIndex:
	ld hl, wMoveRelearnerCursor
	assert wMoveRelearnerScroll == (wMoveRelearnerCursor + 1)
	ld a, [hli]
	add a, [hl]
	add a, a
	add a, LOW(wMoveRelearnerMoveList)
	ld l, a
	adc HIGH(wMoveRelearnerMoveList)
	sub l
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

MoveRelearner_InterpretJoypad:
	bit B_BUTTON_F, a
	jr nz, .cancel
	bit A_BUTTON_F, a
	jr nz, .confirm
	bit D_DOWN_F, a
	jr nz, .down
	and D_UP
	ret z

; up
	ld a, [wMoveRelearnerCursor]
	and a
	jr z, .scroll_up
	ld c, -1
.update_cursor
	ld a, [wMoveRelearnerCursor]
	ld b, a
	call .cursor_position
	ld [hl], " "
	ld a, b
	add a, c
	ld [wMoveRelearnerCursor], a
	call .cursor_position
	ld [hl], "▶"
	call MoveRelearner_UpdateMoveInfoBox
	and a
	ret

.scroll_up
	ld a, [wMoveRelearnerScroll]
	and a
	ret z
	dec a
	ld [wMoveRelearnerScroll], a
	call MoveRelearner_DisplayMoveData
	hlcoord 1, 2
	ld [hl], "▶"
	and a
	ret

.down
	ld a, [wMoveRelearnerMoveCount]
	ld d, a
	ld e, 0
	cp 4
	jr c, .got_scroll_limits
	sub 3
	ld e, a
	ld d, 3
.got_scroll_limits
	ld a, [wMoveRelearnerCursor]
	cp d
	jr nc, .scroll_down
	ld c, 1
	jr .update_cursor

.scroll_down
	ld a, [wMoveRelearnerScroll]
	cp e
	ret nc
	inc a
	ld [wMoveRelearnerScroll], a
	call MoveRelearner_DisplayMoveData
	hlcoord 1, 8
	ld [hl], "▶"
	and a
	ret

.cancel
	call PlayClickSFX
.exit
	ld a, MOVERELEARNER_CANCEL
	ld [wScriptVar], a
	scf
	ret

.confirm
	call PlayClickSFX
	call .current_cursor_position
	ld [hl], "▷"
	call MoveRelearner_LoadCurrentMoveIndex
	ld a, h
	or l
	jr z, .exit
	call GetMoveIDFromIndex
	ld [wPutativeTMHMMove], a
	ld [wNamedObjectIndexBuffer], a
	call GetMoveName
	call CopyName1
	predef LearnMove
	ld a, b
	add a, -1 ; carry if non-zero
	ret c
	xor a
	ldh [hBGMapMode], a
	call MoveRelearner_InitializeScreenLayout
	call MoveRelearner_DisplayMoveData
	call .current_cursor_position
	ld [hl], "▶"
	ld a, 1
	ldh [hBGMapMode], a
	and a
	ret

.current_cursor_position
	ld a, [wMoveRelearnerCursor]
.cursor_position
	push bc
	ld bc, 2 * SCREEN_WIDTH
	hlcoord 1, 2
	call AddNTimes
	pop bc
	ret
