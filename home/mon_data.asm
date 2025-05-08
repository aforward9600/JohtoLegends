GetBaseData::
	push bc
	push de
	push hl
	ldh a, [hROMBank]
	push af

; Egg doesn't have BaseData
	ld a, [wCurSpecies]
	cp EGG
	jr z, .egg

; Get BaseData
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld a, BANK(BaseData)
	ld hl, BaseData
	call LoadIndirectPointer
	; jr z, <some error handler>
	rst Bankswitch
	ld de, wCurBaseData
	ld bc, BASE_DATA_SIZE
	call CopyBytes
	jr .end

.egg
; ????
	ld de, UnknownEggPic

; Sprite dimensions
	ld b, $55 ; 5x5
	ld hl, wBasePicSize
	ld [hl], b

	ld hl, wBaseAbility1
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld [hl], d

.end
; Replace Pokedex # with species
	ld a, [wCurSpecies]
	ld [wBaseSpecies], a

	pop af
	rst Bankswitch
	pop hl
	pop de
	pop bc
	ret

GetCurNick::
	ld a, [wCurPartyMon]
	ld hl, wPartyMonNicknames

GetNick::
; Get nickname a from list hl.

	push hl
	push bc

	call SkipNames
	ld de, wStringBuffer1

	push de
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	pop de

	callfar CorrectNickErrors

	pop bc
	pop hl
	ret

GetAbility::
; 'hl' contains the target personality to check (ability and form)
; 'c' contains the target species
; returns ability in a
; preserves curspecies and base data
	push bc
	push de
	push hl
	ld a, c
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	pop hl
	push hl
	ld a, [hl]

	; Assumes this returns z for ability 1.
	and CAUGHT_ABILITY_MASK
	ld de, BASE_ABILITY1
	jr z, .ability_1
	cp 2
	jr nc, .Ability3
	ld de, BASE_ABILITY2
	jr .ability_1
.Ability3
	ld de, BASE_ABILITY3
.ability_1

	ld a, BANK(BaseData)
	ld hl, BaseData
	call LoadIndirectPointer
	add hl, de
	call GetFarByte
	pop hl
	pop de
	pop bc
	ret
