	object_const_def ; object_event constants

LostCaveEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LostCaveEntrance_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  7, RESORT_GORGEOUS, 2
	warp_event  5,  5, LOST_CAVE_ROOM_1, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	