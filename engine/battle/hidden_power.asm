HiddenPowerDamage:
; Override Hidden Power's type and power based on the user's DVs.

	ld bc, wBattleMonDVs
	ldh a, [hBattleTurn]
	and a
	jr z, .got_dvs
	ld bc, wEnemyMonDVs
.got_dvs

	call GetHiddenPowerType

; Overwrite the current move type.
	push af
	ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVarAddr
	pop af
	or SPECIAL
	ld [hl], a
	ret

GetHiddenPowerType::
; Type:

	; Def & 3
	ld a, [bc]
	and %0011
	ld d, a

	; + (Atk & 3) << 2
	ld a, [bc]
	and %0011 << 4
	swap a
	add a
	add a
	or d

; Skip Normal
	inc a

; Skip Bird
	cp BIRD
	jr c, .done
	inc a

; Skip unused types
	cp UNUSED_TYPES
	jr c, .done
	add UNUSED_TYPES_END - UNUSED_TYPES
.done
	ld e, a
	ret
