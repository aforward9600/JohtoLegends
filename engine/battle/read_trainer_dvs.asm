GetTrainerDVs:
; Return the DVs of wOtherTrainerClass in bc

	push hl
	ld a, [wOtherTrainerClass]
	dec a
	ld c, a
	ld b, 0

	ld hl, TrainerClassDVs
	add hl, bc
	add hl, bc

	ld a, [hli]
	ld b, a
	ld c, [hl]

	pop hl
	ret

INCLUDE "data/trainers/dvs.asm"

GetTrainerGender:
	ld hl, FemalePokemonTrainers
	ld a, [wOtherTrainerClass]
	ld de, 1
	call IsInArray
	jr z, .FemalePokemonTrainers
	scf
	ret

.FemalePokemonTrainers:
	xor a
	ret

INCLUDE "data/trainers/gendered_pokemon.asm"
