UserPartyAttr::
	push af
	ldh a, [hBattleTurn]
	and a
	jr nz, .ot
	pop af
	jr BattlePartyAttr
.ot
	pop af
	jr OTPartyAttr

BattlePartyAttr::
; Get attribute a from the party struct of the active battle mon. 
	push bc
	ld c, a
	ld b, 0
	ld hl, wPartyMons
	add hl, bc
	ld a, [wCurBattleMon]
	call GetPartyLocation
	pop bc
	ret

OTPartyAttr::
; Get attribute a from the party struct of the active enemy mon.
	push bc
	ld c, a
	ld b, 0
	ld hl, wOTPartyMon1Species
	add hl, bc
	ld a, [wCurOTMon]
	call GetPartyLocation
	pop bc
	ret

ResetDamage::
	xor a
	ld [wCurDamage], a
	ld [wCurDamage + 1], a
	ret

SetPlayerTurn::
	xor a
	ldh [hBattleTurn], a
	ret

SetEnemyTurn::
	ld a, 1
	ldh [hBattleTurn], a
	ret

UpdateOpponentInParty::
	ldh a, [hBattleTurn]
	and a
	jr z, UpdateEnemyMonInParty
	jr UpdateBattleMonInParty

UpdateUserInParty::
	ldh a, [hBattleTurn]
	and a
	jr z, UpdateBattleMonInParty
	jr UpdateEnemyMonInParty

UpdateBattleMonInParty::
; Update level, status, current HP

	ld a, [wCurBattleMon]

UpdateBattleMon::
	ld hl, wPartyMon1Level
	call GetPartyLocation

	ld d, h
	ld e, l
	ld hl, wBattleMonLevel
	ld bc, wBattleMonMaxHP - wBattleMonLevel
	jp CopyBytes

UpdateEnemyMonInParty::
; Update level, status, current HP

; No wildmons.
	ld a, [wBattleMode]
	dec a
	ret z

	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Level
	call GetPartyLocation

	ld d, h
	ld e, l
	ld hl, wEnemyMonLevel
	ld bc, wEnemyMonMaxHP - wEnemyMonLevel
	jp CopyBytes

RefreshBattleHuds::
	call UpdateBattleHuds
	call Delay2
	jp WaitBGMap

UpdateBattleHuds::
	farcall UpdatePlayerHUD
	farcall UpdateEnemyHUD
	ret

INCLUDE "home/battle_vars.asm"

FarCopyRadioText::
	inc hl
	ldh a, [hROMBank]
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	rst Bankswitch
	ld a, e
	ld l, a
	ld a, d
	ld h, a
	ld de, wRadioText
	ld bc, 2 * SCREEN_WIDTH
	call CopyBytes
	pop af
	rst Bankswitch
	ret

MobileTextBorder::
	; For mobile link battles only.
	ld a, [wLinkMode]
	cp LINK_MOBILE
	ret c

	; Draw a cell phone icon at the
	; top right corner of the border.
	hlcoord 19, 12
	ld [hl], $5e ; top
	hlcoord 19, 13
	ld [hl], $5f ; bottom
	ret

BattleTextbox::
; Open a textbox and print text at hl.
	push hl
	call SpeechTextbox
	call MobileTextBorder
	call UpdateSprites
	call ApplyTilemap
	pop hl
	call PrintTextboxText
	ret

StdBattleTextbox::
; Open a textbox and print battle text at 20:hl.

	ldh a, [hROMBank]
	push af

	ld a, BANK(BattleText)
	rst Bankswitch

	call BattleTextbox

	pop af
	rst Bankswitch
	ret

GetBattleAnimPointer::
	ld a, BANK(BattleAnimations)
	rst Bankswitch

	ld a, [hli]
	ld [wBattleAnimAddress], a
	ld a, [hl]
	ld [wBattleAnimAddress + 1], a

	; ClearBattleAnims is the only function that calls this...
	ld a, BANK(ClearBattleAnims)
	rst Bankswitch

	ret

IsUserItemUsable::
; Returns nz if user's held item is unusable (knocked off).
	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerKnockOff
	ld a, [wCurBattleMon]
	jr z, .got_knock_off
	ld hl, wEnemyKnockOff
	ld a, [wCurOTMon]
.got_knock_off
	push de
	push bc
	ld e, a
	ld d, 0
	ld b, CHECK_FLAG
	call FlagAction
	pop bc
	pop de
	ret

IsOpponentItemUsable::
; Returns nz if opponent's held item is unusable (knocked off)
	call SwitchTurn
	call IsUserItemUsable
	; fallthrough
SwitchTurn::
; preserves registers
	push af
	ldh a, [hBattleTurn]
	xor 1
	ldh [hBattleTurn], a
	pop af
	ret

GetBattleAnimByte::
	push hl
	push de

	ld hl, wBattleAnimAddress
	ld e, [hl]
	inc hl
	ld d, [hl]

	ld a, BANK(BattleAnimations)
	rst Bankswitch

	ld a, [de]
	ld [wBattleAnimByte], a
	inc de

	ld a, BANK(BattleAnimCommands)
	rst Bankswitch

	ld [hl], d
	dec hl
	ld [hl], e

	pop de
	pop hl

	ld a, [wBattleAnimByte]
	ret

GetTargetAbility::
	ldh a, [hBattleTurn]
	and a
	jr z, .CheckTargetEnemyAbility
	ld a, [wPlayerAbility]
	ret

.CheckTargetEnemyAbility
	ld a, [wEnemyAbility]
	ret

GetUserAbility::
	ldh a, [hBattleTurn]
	and a
	jr z, .CheckUserPlayerAbility
	ld a, [wEnemyAbility]
	ret

.CheckUserPlayerAbility
	ld a, [wPlayerAbility]
	ret

CheckTargetNeutralGasMoldBreaker::
	ldh a, [hBattleTurn]
	and a
	jr z, .CheckTargetEnemyAbility
	ld a, [wPlayerAbility]
	cp NEUTRAL_GAS
	ret z
	cp MOLD_BREAKER
	ret

.CheckTargetEnemyAbility:
	ld a, [wEnemyAbility]
	cp NEUTRAL_GAS
	ret z
	cp MOLD_BREAKER
	ret

CheckUserNeutralGasMoldBreaker::
	ldh a, [hBattleTurn]
	and a
	jr z, .CheckUserPlayerAbility
	ld a, [wEnemyAbility]
	cp NEUTRAL_GAS
	ret z
	cp MOLD_BREAKER
	ret

.CheckUserPlayerAbility:
	ld a, [wPlayerAbility]
	cp NEUTRAL_GAS
	ret z
	cp MOLD_BREAKER
	ret

CompareMove::
	; checks if the move ID in a matches the move in bc
	push hl
	call GetMoveIndexFromID
	ld a, h
	cp b
	ld a, l
	pop hl
	ret nz
	cp c
	ret

CheckNeutralGas::
	ld a, [wEnemyAbility]
	cp NEUTRAL_GAS
	ret z
	ld a, [wPlayerAbility]
	cp NEUTRAL_GAS
	ret

BattleJumptable::
; hl = jumptable, a = target. Returns z if no jump was made, nz otherwise
	; Maybe make this a common function? Maybe one exist?
	push bc
	ld b, a
.loop
	ld a, [hli]
	cp -1
	jr z, .end
	cp b
	jr z, .got_target
	inc hl
	inc hl
	jr .loop
.got_target
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call _hl_
	or 1
.end
	pop bc
	ret

CheckCloudNine::
	ld a, [wEnemyAbility]
	cp CLOUD_NINE
	ret z
	ld a, [wPlayerAbility]
	cp CLOUD_NINE
	ret

UnawareCheck::
	homecall _UnawarePlayer
	ret
