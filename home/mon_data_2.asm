GetPartyParamLocation::
; Get the location of parameter a from wCurPartyMon in hl
	push bc
	ld hl, wPartyMons
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wCurPartyMon]
	call GetPartyLocation
	pop bc
	ret

GetPartyMonForm::
;	ld hl, wBattleMonForm
;	ld a, [wPlayerSubStatus5]
;	bit SUBSTATUS_TRANSFORMED, a
;	ret z
	ld a, [wCurBattleMon]
	ld hl, wPartyMon1CaughtTime
GetPartyLocation::
; Add the length of a PartyMon struct to hl a times.
	ld bc, PARTYMON_STRUCT_LENGTH
	jp AddNTimes

FarSkipEvolutions::
; Calls SkipEvolutions from another bank. It can't be a farcall because it uses hl.
	ldh a, [hROMBank]
	push af
	ld a, BANK(SkipEvolutions)
	rst Bankswitch
	call SkipEvolutions
	pop af
	rst Bankswitch
	ret

GetTaurosForm2::
	homecall _GetTaurosForm
	ret
;	ld a, [wBufferMonForm]
;	ld b,b
;	ld a, [bc]
;	and CAUGHT_FORM_1_MASK
;	jr z, .TrySecond
;	ld a, 1
;	jr .Finish
;	ld [wUnownLetter], a
;	ret

;.TrySecond
;	ld a, [wBufferMonForm]
;	ld a, [bc]
;	and CAUGHT_FORM_2_MASK
;	jr z, .PlainTauros
;	ld a, 2
;	jr .Finish
;	ld [wUnownLetter], a
;	ret
;.PlainTauros
;	ld a, 0
;.Finish
;	ld [wUnownLetter], a
;	ret
