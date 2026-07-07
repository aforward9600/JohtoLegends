AnimateDexSearchSlowpoke:
	ld hl, .FrameIDs
	ld b, 25
.loop
	ld a, [hli]

	; Wrap around
	cp $fe
	jr nz, .ok
	ld hl, .FrameIDs
	ld a, [hli]
.ok

	ld [wDexSearchSlowpokeFrame], a
	ld a, [hli]
	ld c, a
	push bc
	push hl
	call DoDexSearchSlowpokeFrame
	pop hl
	pop bc
	call DelayFrames
	dec b
	jr nz, .loop
	xor a
	ld [wDexSearchSlowpokeFrame], a
	call DoDexSearchSlowpokeFrame
	ld c, 32
	jp DelayFrames

.FrameIDs:
	; frame ID, duration
	db 0, 7
	db 1, 7
	db 2, 7
	db 3, 7
	db 4, 7
	db -2

DoDexSearchSlowpokeFrame:
	ld a, [wDexSearchSlowpokeFrame]
	ld hl, .SlowpokeSpriteData
	ld de, wVirtualOAMSprite00
.loop
	ld a, [hli]
	cp -1
	ret z
	ld [de], a ; y
	inc de
	ld a, [hli]
	ld [de], a ; x
	inc de
	ld a, [wDexSearchSlowpokeFrame]
	ld b, a
	add a
	add b
	add [hl]
	inc hl
	ld [de], a ; tile id
	inc de
	ld a, [hli]
	ld [de], a ; attributes
	inc de
	jr .loop

.SlowpokeSpriteData:
	dsprite 11, 0,  9, 0, $00, 0
	dsprite 11, 0, 10, 0, $01, 0
	dsprite 11, 0, 11, 0, $02, 0
	dsprite 12, 0,  9, 0, $10, 0
	dsprite 12, 0, 10, 0, $11, 0
	dsprite 12, 0, 11, 0, $12, 0
	dsprite 13, 0,  9, 0, $20, 0
	dsprite 13, 0, 10, 0, $21, 0
	dsprite 13, 0, 11, 0, $22, 0
	db -1

DisplayDexStats:
	ld a, 1 ; page 1
	ld [wPokedexStatus], a
	ld a, [wPokedexInfoStatus]
	or a
	ret nz
;	jp nz, .SecondPage
	ld a, 1 ; page 1
	ld [wPokedexInfoStatus], a
	hlcoord 1, 3
	lb bc, 13, SCREEN_WIDTH - 1
	call ClearBox
;	farcall ChangePokedexColors
	farcall Pokedex_PlaceFrontpicTopLeftCorner
;	call GetPokemonName
;	hlcoord 9, 3
;	call PlaceString
	hlcoord 12, 1
	ld de, .DexType
	call PlaceString
	ld a, [wTempSpecies]
	ld [wCurSpecies], a
	hlcoord 8, 2
	predef PrintMonTypes
	call PrintDexAbilities
	hlcoord 6, 10
	ld de, .BaseStatsText4
	call PlaceString
	hlcoord 1, 12
	ld de, .BaseStatsText1
	call PlaceString
	hlcoord 1, 13
	ld de, .BaseStatsText2
	call PlaceString
	hlcoord 1, 14
	ld de, .BaseStatsText3
	call PlaceString
	hlcoord 6, 12
	ld de, wBaseHP
	lb bc, 1, 3
	call PrintNum
	hlcoord 15, 12
	ld de, wBaseSpeed
	lb bc, 1, 3
	call PrintNum
	hlcoord 6, 13
	ld de, wBaseAttack
	lb bc, 1, 3
	call PrintNum
	hlcoord 15, 13
	ld de, wBaseDefense
	lb bc, 1, 3
	call PrintNum
	hlcoord 6, 14
	ld de, wBaseSpecialAttack
	lb bc, 1, 3
	call PrintNum
	hlcoord 15, 14
	ld de, wBaseSpecialDefense
	lb bc, 1, 3
	jp PrintNum

.BaseStatsText1:
	db "  HP      Spe     @"
.BaseStatsText2:
	db " Atk      Def     @"
.BaseStatsText3:
	db " SpA      SpD     @"
.BaseStatsText4:
	db "Base Stats@"
.DexType:
	db "Type/@"

.SecondPage:
	xor a
	ld [wPokedexInfoStatus], a
	call DisableSpriteUpdates
	farcall ClearSpriteAnims2
	farcall Pokedex_GetSelectedMon
	hlcoord 1, 1
	lb bc, 15, SCREEN_WIDTH - 1
	call ClearBox
;	hlcoord 1, 1
;	lb bc, 15, SCREEN_WIDTH - 1
;	call ClearBox
	farcall Pokedex_PlaceFrontpicTopLeftCorner
	ld a, [wTempSpecies]
	ld [wTempMonSpecies], a
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
;	farcall Pokedex_InitOptionScreen
	call GetPokemonIndexFromID
	ld b, h
	ld c, l
	ld hl, EvosAttacksPointers
	ld a, BANK(EvosAttacksPointers)
	call LoadDoubleIndirectPointer
	ldh [hTemp], a
.loop
	call GetNextEvoAttackByte2
	and a
	ret z

	ld b, a

	cp EVOLVE_LEVEL
	jr z, .Level
	hlcoord 15, 2
	ld de, .DexArrow
	call PlaceString
	ret

.Level
	push hl
	hlcoord 8, 1
	ld de, .LevelText
	call PlaceString
	pop hl
	call GetNextEvoAttackByte2
	ld [wDeciramBuffer], a
	ld de, wDeciramBuffer
	inc hl
	hlcoord 8, 2
	lb bc, 1, 2
	call PrintNum
	ldh a, [hTemp]
	call GetFarHalfword
	call GetPokemonIDFromIndex
	ret

.DexArrow:
	db "→@"

.LevelText:
	db "Level@"

GetNextEvoAttackByte2:
	ldh a, [hTemp]
	call GetFarByte
	inc hl
	ret

PrintDexAbilities:
	hlcoord 9, 5
	ld de, .DexAbilityText
	call PlaceString
	ld a, [wBaseAbility1]
	ld b, a
	ld a, [wBaseAbility2]
	cp b
	jr z, .CheckHiddenSame
	farcall Load3Abilities
;	hlcoord 10, 5
;	call PlaceString
	ret

.CheckHiddenSame:
	ld a, [wBaseAbility3]
	cp b
	jr z, .SingleAbility
	farcall Load2Abilities
	ret

.SingleAbility:
	farcall Load1Ability
	ret

.DexAbilityText:
	db "Abilities/@"

DisplayDexEntry:
	call GetPokemonName
	hlcoord 9, 3
	call PlaceString ; mon species
	ld a, [wTempSpecies]
	ld b, a
	call GetDexEntryPointer
	ld a, b
	push af
	hlcoord 9, 5
	call FarString ; dex species
	ld h, b
	ld l, c
	push de
; Print dex number
	hlcoord 2, 8
	ld a, $5c ; No
	ld [hli], a
	ld a, $5d ; .
	ld [hli], a
	push hl
	ld a, [wTempSpecies]
	call GetPokemonIndexFromID
	ld b, l
	ld c, h
	ld hl, sp + 0
	ld d, h
	ld e, l
	pop hl
	push bc
	ld a, [wTempSpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonNumber
	hlcoord 4, 8
	call PlaceString
	pop bc
; Check to see if we caught it.  Get out of here if we haven't.
	ld a, [wTempSpecies]
	call CheckCaughtMon
	pop hl
	pop bc
	ret z
; Get the height of the Pokemon.
	ld a, [wCurPartySpecies]
	ld [wCurSpecies], a
	inc hl
	ld a, b
	push af
	push hl
	call GetFarHalfword
	ld d, l
	ld e, h
	pop hl
	inc hl
	inc hl
	ld a, d
	or e
	jr z, .skip_height
	push hl
	push de
; Print the height, with two of the four digits in front of the decimal point
	ld hl, sp+$0
	ld d, h
	ld e, l
	hlcoord 12, 7
	lb bc, 2, (2 << 4) | 4
	call PrintNum
; Replace the decimal point with a ft symbol
	hlcoord 14, 7
	ld [hl], $5e
	pop af
	pop hl

.skip_height
	pop af
	push af
	inc hl
	push hl
	dec hl
	call GetFarHalfword
	ld d, l
	ld e, h
	ld a, e
	or d
	jr z, .skip_weight
	push de
; Print the weight, with four of the five digits in front of the decimal point
	ld hl, sp+$0
	ld d, h
	ld e, l
	hlcoord 11, 9
	lb bc, 2, (4 << 4) | 5
	call PrintNum
	pop de

.skip_weight
; Page 1
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 2, 11
	call ClearBox
	hlcoord 1, 10
	ld bc, SCREEN_WIDTH - 1
	ld a, $61 ; horizontal divider
	call ByteFill
	; page number
	hlcoord 1, 9
	ld [hl], $55
	inc hl
	ld [hl], $55
	hlcoord 1, 10
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $57 ; 1
	pop de
	inc de
	pop af
	hlcoord 2, 11
	push af
	call FarString
	pop bc
	ld a, [wPokedexStatus]
	or a ; check for page 2
	ret z

; Page 2
	push bc
	push de
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 2, 11
	call ClearBox
	hlcoord 1, 10
	ld bc, SCREEN_WIDTH - 1
	ld a, $61
	call ByteFill
	; page number
	hlcoord 1, 9
	ld [hl], $55
	inc hl
	ld [hl], $55
	hlcoord 1, 10
	ld [hl], $56 ; P.
	inc hl
	ld [hl], $58 ; 2
	pop de
	inc de
	pop af
	hlcoord 2, 11
	jp FarString

GetDexEntryPointer:
; return dex entry pointer b:de
	push hl
	ld a, b
	call GetPokemonIndexFromID
	dec hl
	ld d, h
	ld e, l
	add hl, hl
	add hl, de
	ld de, PokedexDataPointerTable
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	ret

GetDexEntryPagePointer:
	call GetDexEntryPointer
	push hl
	ld h, d
	ld l, e
; skip species name
.loop1
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop1
; skip height and weight
rept 4
	inc hl
endr
; if c != 1: skip entry
	dec c
	jr z, .done
; skip entry
.loop2
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop2

.done
	ld d, h
	ld e, l
	pop hl
	ret

INCLUDE "data/pokemon/dex_entry_pointers.asm"
