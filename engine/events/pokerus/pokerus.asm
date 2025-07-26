GivePokerusAndConvertBerries:
	call ConvertBerriesToBerryJuice
	call CheckPickup
	ld hl, wPartyMon1PokerusStatus
	ld a, [wPartyCount]
	ld b, a
	ld de, PARTYMON_STRUCT_LENGTH
; Check to see if any of your Pokemon already has Pokerus.
; If so, sample its spread through your party.
; This means that you cannot get Pokerus de novo while
; a party member has an active infection.
.loopMons
	ld a, [hl]
	and $f
	jr nz, .TrySpreadPokerus
	add hl, de
	dec b
	jr nz, .loopMons

	call Random
	ldh a, [hRandomAdd]
	and a
	ret nz
	ldh a, [hRandomSub]
	cp $3
	ret nc                 ; 3/65536 chance (00 00, 00 01 or 00 02)
	ld a, [wPartyCount]
	ld b, a
.randomMonSelectLoop
	call Random
	and $7
	cp b
	jr nc, .randomMonSelectLoop
	ld hl, wPartyMon1PokerusStatus
	call GetPartyLocation  ; get pokerus byte of random mon
	ld a, [hl]
	and $f0
	ret nz                 ; if it already has pokerus, do nothing
.randomPokerusLoop         ; Simultaneously sample the strain and duration
	call Random
	and a
	jr z, .randomPokerusLoop
	ld b, a
	and $f0
	jr z, .load_pkrs
	ld a, b
	and $7
	inc a
.load_pkrs
	ld b, a ; this should come before the label
	swap b
	and $3
	inc a
	add b
	ld [hl], a
	ret

.TrySpreadPokerus:
	call Random
	cp 33 percent + 1
	ret nc              ; 1/3 chance

	ld a, [wPartyCount]
	cp 1
	ret z               ; only one mon, nothing to do

	ld c, [hl]
	ld a, b
	cp 2
	jr c, .checkPreviousMonsLoop    ; no more mons after this one, go backwards

	call Random
	cp 50 percent + 1
	jr c, .checkPreviousMonsLoop    ; 1/2 chance, go backwards
.checkFollowingMonsLoop
	add hl, de
	ld a, [hl]
	and a
	jr z, .infectMon
	ld c, a
	and $3
	ret z               ; if mon has cured pokerus, stop searching
	dec b               ; go on to next mon
	ld a, b
	cp 1
	jr nz, .checkFollowingMonsLoop ; no more mons left
	ret

.checkPreviousMonsLoop
	ld a, [wPartyCount]
	cp b
	ret z               ; no more mons
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	ld a, [hl]
	and a
	jr z, .infectMon
	ld c, a
	and $3
	ret z               ; if mon has cured pokerus, stop searching
	inc b               ; go on to next mon
	jr .checkPreviousMonsLoop

.infectMon
	ld a, c
	and $f0
	ld b, a
	ld a, c
	swap a
	and $3
	inc a
	add b
	ld [hl], a
	ret

ConvertBerriesToBerryJuice:
	call Random
	cp 6 percent + 1 ; 1/16 chance
	ret nc
	ld hl, SHUCKLE
	call GetPokemonIDFromIndex
	ld [wTempSpecies], a
	ld hl, wPartyMons
	ld a, [wPartyCount]
.partyMonLoop
	push af
	push hl
	ld a, [wTempSpecies]
	cp [hl]
	jr nz, .loopMon
	ld bc, MON_ITEM
	add hl, bc
	ld a, [hl]
	cp ORAN_BERRY
	jr z, .convertToJuice

.loopMon
	pop hl
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop af
	dec a
	jr nz, .partyMonLoop
.done
	xor a
	ld [wTempSpecies], a
	ret

.convertToJuice
	ld a, BERRY_JUICE
	ld [hl], a
	pop hl
	pop af
	jr .done

CheckPickup:
	ld hl, wPartyMon1Item
	ld a, [hl]
	cp NO_ITEM
	jr nz, .SecondPickup
	ld a, [wPartyMon1Species]
	call IsAPokemon
	jr c, .SecondPickup
	ld hl, wPartyMon1CaughtAbility
	ld c, a
	call GetAbility
	cp PICKUP
	jp z, .convertToItem1
.SecondPickup
	ld hl, wPartyMon2Item
	ld a, [hl]
	cp NO_ITEM
	jr nz, .ThirdPickup
	ld a, [wPartyMon2Species]
	call IsAPokemon
	jr c, .ThirdPickup
	ld hl, wPartyMon2CaughtAbility
	ld c, a
	call GetAbility
	cp PICKUP
	jp z, .convertToItem2
.ThirdPickup
	ld hl, wPartyMon3Item
	ld a, [hl]
	cp NO_ITEM
	jr nz, .FourthPickup
	ld a, [wPartyMon3Species]
	call IsAPokemon
	jr c, .FourthPickup
	ld hl, wPartyMon3CaughtAbility
	ld c, a
	call GetAbility
	cp PICKUP
	jr z, .convertToItem3
.FourthPickup
	ld hl, wPartyMon4Item
	ld a, [hl]
	cp NO_ITEM
	jr nz, .FifthPickup
	ld a, [wPartyMon4Species]
	call IsAPokemon
	jr c, .FifthPickup
	ld hl, wPartyMon4CaughtAbility
	ld c, a
	call GetAbility
	cp PICKUP
	jr z, .convertToItem4
.FifthPickup
	ld hl, wPartyMon5Item
	ld a, [hl]
	cp NO_ITEM
	jr nz, .SixthPickup
	ld a, [wPartyMon5Species]
	call IsAPokemon
	jr c, .SixthPickup
	ld hl, wPartyMon5CaughtAbility
	ld c, a
	call GetAbility
	cp PICKUP
	jr z, .convertToItem5
.SixthPickup
	ld hl, wPartyMon6Item
	ld a, [hl]
	cp NO_ITEM
	ret nz
	ld a, [wPartyMon6Species]
	call IsAPokemon
	ret c
	ld hl, wPartyMon5CaughtAbility
	ld c, a
	call GetAbility
	cp PICKUP
	ret nz
	call Random
	cp 10 percent
	ret nc
	call PickupItems
	ld [wPartyMon6Item], a
	ret

.convertToItem1
	call Random
	cp 10 percent
	jp nc, .SecondPickup
	call PickupItems
	ld [wPartyMon1Item], a
	jp .SecondPickup

.convertToItem2
	call Random
	cp 10 percent
	jp nc, .ThirdPickup
	call PickupItems
	ld [wPartyMon2Item], a
	jp .ThirdPickup

.convertToItem3
	call Random
	cp 10 percent
	jp nc, .FourthPickup
	call PickupItems
	ld [wPartyMon3Item], a
	jp .FourthPickup

.convertToItem4
	call Random
	cp 10 percent
	jr nc, .FifthPickup
	call PickupItems
	ld [wPartyMon4Item], a
	jp .FifthPickup

.convertToItem5
	call Random
	cp 10 percent
	jr nc, .SixthPickup
	call PickupItems
	ld [wPartyMon5Item], a
	jr .SixthPickup

PickupItems:
	ld hl, .PickupItemsList
	call Random
.loop
	sub [hl]
	jr c, .ok
	inc hl
	inc hl
	jr .loop

.ok
	ld a, [hli]
	inc a
	jr z, .done
	ld a, [hli]
.done
	ret

.PickupItemsList:
	db 3, KINGS_ROCK
	db 11, PP_UP
	db 13, PROTEIN
	db 26, RARE_CANDY
	db 26, REVIVE
	db 26, NUGGET
	db 26, FULL_HEAL
	db 26, FULL_RESTORE
	db 26, ULTRA_BALL
	db 73, SUPER_POTION
	db 0
