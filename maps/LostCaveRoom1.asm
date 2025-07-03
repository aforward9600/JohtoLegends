	object_const_def ; object_event constants

LostCaveRoom1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LostCaveRoom1_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  7,  5, LOST_CAVE_ROOM_2, 3 ; right
	warp_event  5,  7, LOST_CAVE_ROOM_1, 4 ; down
	warp_event  2,  4, LOST_CAVE_ROOM_1, 1 ; left
	warp_event  4,  1, LOST_CAVE_ROOM_1, 2 ; up
	warp_event  7,  3, LOST_CAVE_ENTRANCE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	