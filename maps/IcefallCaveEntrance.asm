	object_const_def ; object_event constants

IcefallCaveEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IcefallCaveEntrance_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 10, 21, FOUR_ISLAND, 3
	warp_event  6, 13, ICEFALL_CAVE_1F, 1
	warp_event  5,  3, ICEFALL_CAVE_1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	