BattleCommand_KnockOffPower:
; Doubles power if opponent has an (usable) item
	call CheckKnockOff
	ret nz

	ld a, BATTLE_VARS_MOVE_POWER
	call GetBattleVarAddr
	sla [hl]
	ret

BattleCommand_KnockOff:
; knock off opponent's item
	call CheckKnockOff
	ret nz

	ldh a, [hBattleTurn]
	and a
	ld hl, wPlayerKnockOff
	ld a, [wCurBattleMon]
	jr nz, .got_knock_off
	ld hl, wEnemyKnockOff
	ld a, [wCurOTMon]
.got_knock_off
	ld e, a
	ld d, 0
	ld b, SET_FLAG
	call FlagAction

	farcall GetOpponentItem
	ld a, [hl]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName

	ld hl, KnockedOffItemText
	jp StdBattleTextbox

CheckKnockOff:
; Returns z if we can knock off the opponent

	; Does opponent have an item in first place?
	farcall GetOpponentItem
	ld a, [hl]
	and a
	jr z, .ret_nz

	; Ignore Mail
	ld d, a
	farcall ItemIsMail
	; Check if we've already knocked the item off.
	jp nc, IsOpponentItemUsable

.ret_nz
	or 1
	ret
