BattleCommand_Sketch:
; sketch

	farcall ClearLastMove
; Don't sketch during a link battle
	ld a, [wLinkMode]
	and a
	jr z, .not_linked
	farcall AnimateFailedMove
	jp PrintNothingHappened

.not_linked
; If the opponent has a substitute up, fail.
	ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	jp nz, .fail
; If the user is transformed, fail.
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	bit SUBSTATUS_TRANSFORMED, [hl]
	jp nz, .fail
; Get the user's moveset in its party struct.
; This move replacement shall be permanent.
; Pointer will be in de.
	ld a, MON_MOVES
	call UserPartyAttr
	ld d, h
	ld e, l
; Get the battle move structs.
	ld hl, wBattleMonMoves
	ldh a, [hBattleTurn]
	and a
	jr z, .get_last_move
	ld hl, wEnemyMonMoves
.get_last_move
	ld a, BATTLE_VARS_LAST_COUNTER_MOVE_OPP
	call GetBattleVar
	ld [wNamedObjectIndexBuffer], a
	ld b, a
; Fail if move is invalid or is Struggle.
	and a
	jr z, .fail
	push bc
	ld bc, STRUGGLE
	call CompareMove
	pop bc
	jr z, .fail
; Fail if user already knows that move
	ld c, NUM_MOVES
.does_user_already_know_move
	ld a, [hli]
	cp b
	jr z, .fail
	dec c
	jr nz, .does_user_already_know_move
; Find Sketch in the user's moveset.
; Pointer in hl, and index in c.
	push hl
	ld hl, SKETCH
	call GetMoveIDFromIndex
	pop hl
	ld c, NUM_MOVES
.find_sketch
	dec c
	dec hl
	cp [hl]
	jr nz, .find_sketch
; The Sketched move is loaded to that slot.
	ld a, b
	ld [hl], a
; Copy the base PP from that move.
	push bc
	push hl
	ld l, a
	ld a, MOVE_PP
	call GetMoveAttribute
	pop hl
	ld bc, wBattleMonPP - wBattleMonMoves
	add hl, bc
	ld [hl], a
	pop bc

	ldh a, [hBattleTurn]
	and a
	jr z, .user_trainer
	ld a, [wBattleMode]
	dec a
	jr nz, .user_trainer
; wildmon
	ld a, [hl]
	push bc
	ld hl, wWildMonPP
	ld b, 0
	add hl, bc
	ld [hl], a
	ld hl, wWildMonMoves
	add hl, bc
	pop bc
	ld [hl], b
	jr .done_copy

.user_trainer
	ld a, [hl]
	push af
	ld l, c
	ld h, 0
	add hl, de
	ld a, b
	ld [hl], a
	pop af
	ld de, MON_PP - MON_MOVES
	add hl, de
	ld [hl], a
.done_copy
	call GetMoveName
	farcall AnimateCurrentMove

	ld hl, SketchedText
	jp StdBattleTextbox

.fail
	farcall AnimateFailedMove
	farcall PrintDidntAffect
	ret
