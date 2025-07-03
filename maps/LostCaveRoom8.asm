	object_const_def ; object_event constants

LostCaveRoom8_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LostCaveRoom8_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  7,  5, LOST_CAVE_ROOM_9, 3 ; right to left
	warp_event  5,  7, LOST_CAVE_ROOM_1, 4 ; down to up
	warp_event  2,  4, LOST_CAVE_ROOM_1, 1 ; left to right
	warp_event  4,  1, LOST_CAVE_ROOM_1, 2 ; up to down

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	