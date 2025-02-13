	object_const_def ; object_event constants
	const SILVERCAVEITEMROOMS_POKE_BALL1
	const SILVERCAVEITEMROOMS_POKE_BALL2

SilverCaveItemRooms_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SilverCaveItemRoomsMaxRevive:
	itemball MAX_REVIVE

SilverCaveItemRoomsFullRestore:
	itemball FULL_RESTORE

SilverCaveItemRooms_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  3, SILVER_CAVE_ROOM_2, 2
	warp_event  7, 15, SILVER_CAVE_ROOM_2, 4
	warp_event 13,  3, SILVER_CAVE_SUMMIT_OUTSIDE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 15, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SilverCaveItemRoomsFullRestore, EVENT_SILVER_CAVE_ITEM_ROOMS_FULL_RESTORE
