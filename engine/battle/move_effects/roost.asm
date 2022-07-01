BattleCommand_Roost:
; roost

	ld de, wBattleMonHP
	ld hl, wBattleMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld de, wEnemyMonHP
	ld hl, wEnemyMonMaxHP
.got_hp
	ld c, 2
	call CompareBytes
	jr z, .fail
	ld a, BATTLE_VARS_SUBSTATUS5
	call GetBattleVarAddr
	set SUBSTATUS_ROOSTING, [hl]
.fail
	; This will print the fail message.
	farcall BattleCommand_Heal
	ret

ChangeTypeForRoost:
; applies roost to enemy types in de and player types in bc
	ld a, [wPlayerSubStatus5]
	bit SUBSTATUS_ROOSTING, a
	call nz, SetRoostBC
	push bc
	ld b, d
	ld c, e
	ld a, [wEnemySubStatus5]
	bit SUBSTATUS_ROOSTING, a
	call nz, SetRoostBC
	ld d, b
	ld e, c
	pop bc
	ret

ChangeTypeForOpponentRoost:
; Removes flying type from opponent types in bc if roosting.
	ld a, BATTLE_VARS_SUBSTATUS5_OPP
	call GetBattleVar
	bit SUBSTATUS_ROOSTING, a
	ret z
	; fallthrough
SetRoostBC:
; Removes flying type from types in bc.
	ld a, b
	cp FLYING
	jr nz, .NotFly
	ld b, CURSE_T ;typeless
.NotFly
	ld a, c
	cp FLYING
	ret nz
	ld c, CURSE_T ;typeless
	ld a, c
	cp b
	ret nz
	ld b, NORMAL ;load in normal if would be typeless
	ret
