IsInJohto::
; Return 0 if the player is in Johto, and 1 in Kanto.

	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation

	cp SPECIAL_MAP
	jr nz, .CheckRegion

	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.CheckRegion:
	cp SEVII_LANDMARK
	jr nc, .sevii

	cp KANTO_LANDMARK
	jr nc, .Kanto

.Johto:
	xor a
	ret

.Kanto:
	ld a, 1
	ret

.sevii:
	ld a, 2
	ret
