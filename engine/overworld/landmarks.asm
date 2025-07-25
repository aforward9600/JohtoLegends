GetLandmarkCoords:
; Return coordinates (d, e) of landmark e.
	push hl
	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, Landmarks
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	ret

GetLandmarkName::
; Copy the name of landmark e to wStringBuffer1.
	push hl
	push de
	push bc

	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, Landmarks + 2
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld de, wStringBuffer1
	ld c, 18
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy

	pop bc
	pop de
	pop hl
	ret

if DEF(_FRENCH)
INCLUDE "data/maps/landmarks_french.asm"
else
INCLUDE "data/maps/landmarks.asm"
endc

RegionCheck:
; Checks if the player is in Kanto or Johto.
; If in Johto, returns 0 in e.
; If in Kanto, returns 1 in e.
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp SPECIAL_MAP
	jr nz, .checkagain

; In a special map, get the backup map group / map id
	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.checkagain
	cp SEVII_LANDMARK
	jr nc, .sevii

	cp KANTO_LANDMARK
	jr nc, .kanto

.johto
	ld e, JOHTO_REGION
	ret
.kanto
; Victory Road area is considered to be Johto.
	cp VICTORY_ROAD
	jr nc, .johto
	ld e, KANTO_REGION
	ret
.sevii
	ld e, SEVII_ISLANDS
	ret