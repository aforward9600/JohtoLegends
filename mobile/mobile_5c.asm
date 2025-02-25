INCLUDE "engine/events/battle_tower/battle_tower.asm"

Clears5_a89a:
	ld a, $5
	call GetSRAMBank
	ld hl, $a89a
	xor a
	ld [hli], a
	ld [hl], a
	call CloseSRAM
	ret

CheckBTMonMovesForErrors:
	ld c, BATTLETOWER_PARTY_LENGTH
	ld hl, wBT_OTTempMon1Moves
.loop
	push hl
	ld a, [hl]
	cp MOVE_TABLE_ENTRIES + 1
	jr c, .okay
	push hl
	ld hl, POUND
	call GetMoveIDFromIndex
	pop hl
	ld [hl], a

.okay
	inc hl
	ld b, NUM_MOVES - 1
.loop2
	ld a, [hl]
	and a
	jr z, .loop3
	cp MOVE_TABLE_ENTRIES + 1
	jr c, .next

.loop3
	xor a
	ld [hl], a
	inc hl
	dec b
	jr nz, .loop3
	jr .done

.next
	inc hl
	dec b
	jr nz, .loop2

.done
	pop hl
	ld de, NICKNAMED_MON_STRUCT_LENGTH
	add hl, de
	dec c
	jr nz, .loop
	ret
