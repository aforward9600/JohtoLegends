CheckWarpCollision::
; Is this tile a warp?
	ld a, [wPlayerStandingTile]
	cp COLL_PIT
	jr z, .warp
	cp COLL_SILENT_WARP
	jr z, .warp
	and $f0
	cp HI_NYBBLE_WARPS
	jr z, .warp
	and a
	ret

.warp
	scf
	ret

CheckDirectionalWarp::
; If this is a directional warp, clear carry (press the designated button to warp).
; Else, set carry (immediate warp).
	ld a, [wPlayerStandingTile]
	cp COLL_WARP_CARPET_DOWN
	jr z, .directional
	cp COLL_WARP_CARPET_DOWN_SLIDING
	jr z, .directional
	cp COLL_WARP_CARPET_LEFT
	jr z, .directional
	cp COLL_WARP_CARPET_UP
	jr z, .directional
	cp COLL_WARP_CARPET_RIGHT
	jr z, .directional
	scf
	ret

.directional
	xor a
	ret

CheckWarpFacingDown:
	ld de, 1
	ld hl, .blocks
	ld a, [wPlayerStandingTile]
	jp IsInArray

.blocks
	db COLL_DOOR
	db COLL_SLIDING_DOOR
	db COLL_DOOR_79
	db COLL_STAIRCASE
	db COLL_CAVE
	db COLL_WARP_PANEL
	db COLL_DOOR_75
	db COLL_DOOR_7D
	db -1

CheckGrassCollision::
	ld a, [wPlayerStandingTile]
	ld hl, .blocks
	ld de, 1
	jp IsInArray

.blocks
	db COLL_SAND
	db COLL_TALL_GRASS
	db COLL_LONG_GRASS
	db COLL_CUT_28
	db COLL_WATER
	db COLL_GRASS_48
	db COLL_GRASS_49
	db COLL_GRASS_4A
	db COLL_GRASS_4B
	db COLL_GRASS_4C
	db -1

CheckCutCollision:
	ld a, c
	ld hl, .blocks
	ld de, 1
	jp IsInArray

.blocks
	db COLL_CUT_TREE
	db COLL_TALL_GRASS
	db COLL_LONG_GRASS
	db COLL_LONG_GRASS_1C
	db -1

GetWarpSFX::
	ld a, [wPlayerStandingTile]
	ld de, SFX_ENTER_DOOR
	cp COLL_DOOR
	ret z
	ld de, SFX_WARP_TO
	cp COLL_WARP_PANEL
	ret z
	ld de, SFX_CURSE
	cp COLL_SLIDING_DOOR
	ret z
	cp COLL_WARP_CARPET_DOWN_SLIDING
	ret z
	ld de, SFX_EXIT_BUILDING
	ret
