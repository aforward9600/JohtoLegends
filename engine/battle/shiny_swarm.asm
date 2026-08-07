GenerateShinySwarm:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp DARK_CAVE
	jr z, .trynext
	cp ROUTE_39
	jr z, .trynext
	cp WILD_AREA_OUTSIDE
	jr z, .trynext
	cp ICE_PATH
	jr z, .trynext
	cp BURNED_TOWER
	jr z, .trynext
	cp NATIONAL_PARK
	jr z, .trynext
	cp ROUTE_38
	jr z, .trynext
	cp MT_MORTAR
	jr z, .trynext
	cp ROUTE_43
	jr z, .trynext
	cp LAKE_OF_RAGE
	jr z, .trynext
	cp ILEX_FOREST
	jr z, .trynext
	cp UNION_CAVE
	jr z, .trynext
	cp ROUTE_32
	jr z, .trynext
	cp ROUTE_37
	jr z, .trynext
	cp ROUTE_35
	jr z, .trynext
	cp ROUTE_44
	jr z, .trynext
	cp ROUTE_42
	jr z, .trynext
	cp ROUTE_47
	jr z, .trynext
	cp EMBEDDED_TOWER
	jr z, .trynext
	jr .skipshineswarm

.trynext:
	call Random
	cp 7
	jr nc, .trynext2
	ld hl, wEnemyMonForm
	ld a, [hl]
	or CAUGHT_SHINY_MASK
	ld [hl], a
	jr .UpdateDVsSwarm
.trynext2:
	call Random
	cp 7
	jr nc, .skipshineswarm
	ld hl, wEnemyMonForm
	ld a, [hl]
	or CAUGHT_SHINY_MASK
	ld [hl], a

.skipshineswarm:

.UpdateDVsSwarm:
; Input DVs in register bc
; 	Need to do gender next
	farcall SetEnemyAbility
	ret
