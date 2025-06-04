; Gets our ability for the stats screen
CalcAbility_StatsScreen:
	; Preserve HL and BC
	push hl
	push bc

;	ld de, ENGINE_ABILITIES_OFF
;	farcall CheckEngineFlag
;	jr nc, .NoAbility

	; Target the relevant mon.
	ld hl, wTempMonSpecies
	ld a, [hl]
	ld bc, wTempMonCaughtAbility - wTempMonSpecies
	add hl, bc
	ld c, a
	call GetAbility
	pop bc
	pop hl
	ret

.NoAbility:
	ld a, NO_ABILITY
	pop bc
	pop hl
	ret

; Prints the ability for our stats screen
; Blended mix of code from Delta, MAE, and PC
PrintAbility:
	ld de, .AbilityString1
	hlcoord 1, 8
	call PlaceString
	call CalcAbility_StatsScreen
	ld hl, AbilityNames
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 4, 9
	call PlaceString
	call CalcAbility_StatsScreen
	push bc
	ld bc, AbilityDescriptions
	ld l, a
	ld h, 0
	add hl, hl
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop bc
	hlcoord 1, 10
	jp PlaceString

.AbilityString1:
	db "Ability:@"
INCLUDE "data/abilities/names.asm"
INCLUDE "data/abilities/descriptions.asm"

Ability_LoadAbilityName:
    ld hl, AbilityNames
	call GetNthString
    ld d, h
    ld e, l
    ld hl, wStringBuffer1
.loop
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .loop
    ret
