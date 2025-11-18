CheckPartyFullAfterContest:
	ld a, [wContestMon]
	and a
	jp z, .DidntCatchAnything
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wPartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jp nc, .TryAddToBox
	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wContestMon]
	ld [hli], a
	ld [wCurSpecies], a
	ld a, -1
	ld [hl], a
	ld hl, wPartyMon1Species
	ld a, [wPartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wContestMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonOT
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wPlayerName
	call CopyBytes
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	ld de, wMonOrItemNameBuffer
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	call GiveANickname_YesNo
	jr c, .Party_SkipNickname
	ld a, [wPartyCount]
	dec a
	ld [wCurPartyMon], a
	xor a
	ld [wMonType], a
	ld de, wMonOrItemNameBuffer
	callfar InitNickname

.Party_SkipNickname:
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMonNicknames
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wMonOrItemNameBuffer
	call CopyBytes
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1Level
	call GetPartyLocation
	ld a, [hl]
	ld [wCurPartyLevel], a
	call SetCaughtData
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtLocation
	call GetPartyLocation
	ld a, [hl]
	and CAUGHT_GENDER_MASK
	ld b, NATIONAL_PARK
	or b
	ld [hl], a
	xor a
	ld [wContestMon], a
	and a ; BUGCONTEST_CAUGHT_MON
	ld [wScriptVar], a
	ret

.TryAddToBox:
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	ld a, [hl]
	cp MONS_PER_BOX
	call CloseSRAM
	jr nc, .BoxFull
	xor a
	ld [wCurPartyMon], a
	ld hl, wContestMon
	ld de, wBufferMon
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	ld hl, wPlayerName
	ld de, wBufferMonOT
	ld bc, NAME_LENGTH
	call CopyBytes
	callfar InsertPokemonIntoBox
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	call GiveANickname_YesNo
	ld hl, wStringBuffer1
	jr c, .Box_SkipNickname
	ld a, BOXMON
	ld [wMonType], a
	ld de, wMonOrItemNameBuffer
	callfar InitNickname
	ld hl, wMonOrItemNameBuffer

.Box_SkipNickname:
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	ld de, sBoxMonNicknames
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	call CloseSRAM

.BoxFull:
	ld a, BANK(sBoxMon1Level)
	call GetSRAMBank
	ld a, [sBoxMon1Level]
	ld [wCurPartyLevel], a
	call CloseSRAM
	call SetBoxMonCaughtData
	ld a, BANK(sBoxMon1CaughtLocation)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtLocation
	ld a, [hl]
	and CAUGHT_GENDER_MASK
	ld b, NATIONAL_PARK
	or b
	ld [hl], a
	call CloseSRAM
	xor a
	ld [wContestMon], a
	ld a, BUGCONTEST_BOXED_MON
	ld [wScriptVar], a
	ret

.DidntCatchAnything:
	ld a, BUGCONTEST_NO_CATCH
	ld [wScriptVar], a
	ret

GiveANickname_YesNo:
	ld hl, TextJump_GiveANickname
	call PrintText
	jp YesNoBox

TextJump_GiveANickname:
	; Give a nickname to the @  you received?
	text_far UnknownText_0x1c12fc
	text_end

SetCaughtData:
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtTime
	call GetPartyLocation
SetBoxmonOrEggmonCaughtData:
	ld a, [wTimeOfDay]
	inc a
	rrca
	rrca
	and CAUGHT_TIME_MASK
	or b
	ld [hl], a
	call SetGenderShininess
SetBoxmonOrEggmonCaughtData2:
	ld a, (wPartyMon1CaughtLevel - wPartyMon1CaughtTime)
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	ld a, [wCurPartyLevel]
	ld [hli], a
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	cp MAP_POKECENTER_2F
	jr nz, .NotPokecenter2F
	ld a, b
	cp GROUP_POKECENTER_2F
	jr nz, .NotPokecenter2F

	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a

.NotPokecenter2F:
	call GetWorldMapLocation
	ld b, a
	ld a, [wPlayerGender]
	rrca ; shift bit 0 (PLAYERGENDER_FEMALE_F) to bit 7 (CAUGHT_GENDER_MASK)
	or b
	ld [hl], a
	ret

SetBoxMonCaughtData:
	ld a, BANK(sBoxMon1CaughtTime)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtTime
	call SetBoxmonOrEggmonCaughtData
	jp CloseSRAM

SetGiftBoxMonCaughtData:
	push bc
	ld a, BANK(sBoxMon1CaughtTime)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtTime
	pop bc
	call SetGiftMonCaughtData
	jp CloseSRAM

SetGiftPartyMonCaughtData:
	ld a, [wPartyCount]
	dec a
	ld hl, wPartyMon1CaughtTime
	push bc
	call GetPartyLocation
	pop bc
SetGiftMonCaughtData:
	xor a
;	ld [hl], a
;	ld a, (wPartyMon1CaughtLevel - wPartyMon1CaughtTime)
;	add l
;	ld l, a
;	adc h
;	sub l
;	ld h, a
;	xor a
	ld [hli], a
	ld a, GIFT_LOCATION
	rrc b
	or b
	ld [hl], a
	ret

SetGiftMonBoxCaughtData:
	xor a
	ld [hl], a
	ld a, (wPartyMon1CaughtLevel - wPartyMon1CaughtTime)
	add l
	ld l, a
	adc h
	sub l
	ld h, a
	xor a
	ld [hli], a
	ld a, GIFT_LOCATION
	rrc b
	or b
	ld [hl], a
	ret

SetEggMonCaughtData:
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1CaughtTime
	call GetPartyLocation
	ld a, [hl]
	ld [de], a
	ld a, [wCurPartyLevel]
	push af
	ld a, CAUGHT_EGG_LEVEL
	ld [wCurPartyLevel], a
	ld a, [wTimeOfDay]
	inc a
	rrca
	rrca
	and CAUGHT_TIME_MASK
	or b
	ld [hl], a
	call SetGenderShininessEgg
	call SetBoxmonOrEggmonCaughtData2
	pop af
	ld [wCurPartyLevel], a
	ret

SetGenderShininess:
	push hl
	ld a, [wBattleMode]
	and a
	jr z, .Random
	pop hl
	ld a, [wEnemyForm]
	and CAUGHT_MON_GENDER_MASK
	jr z, .Male
	ld a, [hl]
	or CAUGHT_MON_GENDER_MASK
	ld [hl], a
.Male
	ld a, [wEnemyForm]
	and CAUGHT_SHINY_MASK
	jr z, .NotShiny
	ld a, [hl]
	or CAUGHT_SHINY_MASK
	ld [hl], a
.NotShiny
	ret

.Random
	farcall SetPokemonGender
	jr c, .MaleRandom
;	jr nz, .MaleRandom
	pop hl
	ld a, [hl]
	or CAUGHT_MON_GENDER_MASK
	ld [hl], a
	push hl
.MaleRandom
	ld de, ENGINE_SHINY_PASSWORD
	farcall CheckEngineFlag
	jr nc, .IsShiny
	call Random
	and a
	jr nz, .NotShinyRandom
	call Random
	cp SHINY_NUMERATOR
	jr nc, .NotShinyRandom

.IsShiny
	pop hl
	ld a, [hl]
	or CAUGHT_SHINY_MASK
	ld [hl], a
	ret
.NotShinyRandom
	pop hl
	ret

SetGenderShininessEgg:
	ld a, [de]
	and CAUGHT_GENDER_MASK
	jr z, .SkipGender
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1CaughtTime
	call GetPartyLocation
	ld a, [hl]
	or CAUGHT_MON_GENDER_MASK
	ld [hl], a
.SkipGender
	ld a, [de]
	and CAUGHT_SHINY_MASK
	ret z
	ld a, [wCurPartyMon]
	ld hl, wPartyMon1CaughtTime
	call GetPartyLocation
	ld a, [hl]
	or CAUGHT_SHINY_MASK
	ld [hl], a
	ret
