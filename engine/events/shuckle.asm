MANIA_OT_ID EQU 00518

GiveShuckle:
; Adding to the party.
	xor a
	ld [wMonType], a

; Level 15 Shuckle.
	ld hl, GIBLE
	call GetPokemonIDFromIndex
	ld [wCurPartySpecies], a
	ld a, 15
	ld [wCurPartyLevel], a

	predef TryAddMonToParty
	jp nc, .NotGiven

; Caught data.
	farcall SetGiftPartyMonCaughtData
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtGender
	call AddNTimes
	ld a, CAUGHT_BY_UNKNOWN
	ld [hl], a

; Holding a Berry.
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wPartyCount]
	dec a
	push af
	push bc
	ld hl, wPartyMon1Item
	call AddNTimes
	ld [hl], ORAN_BERRY
;	call PopPushbcaf
;	ld hl, wPartyMon1CaughtLocation
;	call AddNTimes
;	and CAUGHT_LOCATION_MASK
;	ld [hl], $fd
;	call PopPushbcaf
;	ld hl, wPartyMon1CaughtLevel
;	call AddNTimes
;	ld [hl], 15
;	call PopPushbcaf
;	ld hl, wPartyMon1CaughtTime
;	call AddNTimes
;	ld a, [wTimeOfDay]
;	ld [hl], a
	pop bc
	pop af

; OT ID.
	ld hl, wPartyMon1ID
	call AddNTimes
	ld a, HIGH(MANIA_OT_ID)
	ld [hli], a
	ld [hl], LOW(MANIA_OT_ID)

; Nickname.
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonNicknames
	call SkipNames
	ld de, SpecialShuckleNick
	call CopyName2

; OT.
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonOT
	call SkipNames
	ld de, SpecialShuckleOT
	call CopyName2

; Engine flag for this event.
	ld hl, wDailyFlags1
	set DAILYFLAGS1_GOT_SHUCKIE_TODAY_F, [hl]
	ld a, 1
	ld [wScriptVar], a
	ret

.TryBox:
	ld a, [wCurPartySpecies]
	ld [wTempEnemyMonSpecies], a
	ld a, 1
	ld [wBattleMode], a
	callfar LoadEnemyMon
	farcall SendMonIntoBox
	jr nc, .NotGiven
	farcall SetGiftMonCaughtData

; Holding a Berry.
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	dec a
	push af
	push bc
	ld hl, wCurItem
	call AddNTimes
	ld [hl], ORAN_BERRY
	pop bc
	pop af

; OT ID.
	ld hl, wPartyMon1ID
	call AddNTimes
	ld a, HIGH(MANIA_OT_ID)
	ld [hli], a
	ld [hl], LOW(MANIA_OT_ID)

; Nickname.
	ld a, [wCurPartyMon]
	dec a
	ld hl, wPartyMonNicknames
	call SkipNames
	ld de, SpecialShuckleNick
	call CopyName2

; OT.
	ld a, [wCurPartyMon]
	dec a
	ld hl, wPartyMonOT
	call SkipNames
	ld de, SpecialShuckleOT
	call CopyName2

; Engine flag for this event.
	ld hl, wDailyFlags1
	set DAILYFLAGS1_GOT_SHUCKIE_TODAY_F, [hl]
	ld a, 1
	ld [wScriptVar], a
	ret

.NotGiven:
	xor a
	ld [wScriptVar], a
	ret

SpecialShuckleOT:
	db "Cynthia@"

SpecialShuckleNick:
	db "Gibbie@"

ReturnShuckle:
	farcall SelectMonFromParty
	jr c, .refused

;	ld a, [wCurPartySpecies]
;	call GetPokemonIndexFromID
;	ld a, l
;	sub LOW(GIBLE)
;	if HIGH(GIBLE) == 0
;		or h
;	else
;		jr nz, .DontReturn
;		if HIGH(GIBLE) == 1
;			dec h
;		else
;			ld a, h
;			cp HIGH(GIBLE)
;		endc
;	endc
;	jr nz, .CheckGabite
;
;.ReturnAfterChecking:
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes

; OT ID
	ld a, [hli]
	cp HIGH(MANIA_OT_ID)
	jr nz, .DontReturn
	ld a, [hl]
	cp LOW(MANIA_OT_ID)
	jr nz, .DontReturn

; OT
	ld a, [wCurPartyMon]
	ld hl, wPartyMonOT
	call SkipNames
	ld de, SpecialShuckleOT
.CheckOT:
	ld a, [de]
	cp [hl]
	jr nz, .DontReturn
	cp "@"
	jr z, .done
	inc de
	inc hl
	jr .CheckOT

.done
	farcall CheckCurPartyMonFainted
	jr c, .fainted
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	cp 150
	ld a, SHUCKIE_HAPPY
	jr nc, .HappyToStayWithYou
	ld a, SHUCKIE_RETURNED
.HappyToStayWithYou:
	ld [wScriptVar], a
	ret

.refused
	ld a, SHUCKIE_REFUSED
	ld [wScriptVar], a
	ret

.DontReturn:
	xor a ; SHUCKIE_WRONG_MON
	ld [wScriptVar], a
	ret

.fainted
	ld a, SHUCKIE_FAINTED
	ld [wScriptVar], a
	ret

.CheckGabite:
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(GABITE)
	if HIGH(GABITE) == 0
		or h
	else
		jr nz, .DontReturn
		if HIGH(GABITE) == 1
			dec h
		else
			ld a, h
			cp HIGH(GABITE)
		endc
	endc
	jr nz, .CheckGarchomp
;	jr z, .ReturnAfterChecking

.CheckGarchomp:
	ld a, [wCurPartySpecies]
	call GetPokemonIndexFromID
	ld a, l
	sub LOW(GARCHOMP)
	if HIGH(GARCHOMP) == 0
		or h
	else
		jr nz, .DontReturn
		if HIGH(GARCHOMP) == 1
			dec h
		else
			ld a, h
			cp HIGH(GARCHOMP)
		endc
	endc
	jr nz, .DontReturn
;	jr z, .ReturnAfterChecking

PopPushbcaf:
	pop bc
	pop af
	push af
	push bc
	ret
