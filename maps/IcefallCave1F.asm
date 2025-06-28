	object_const_def ; object_event constants

IcefallCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IcefallCave1F_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event  4, 15, ICEFALL_CAVE_ENTRANCE, 2
	warp_event  3,  7, ICEFALL_CAVE_ENTRANCE, 3
	warp_event  3,  5, ICEFALL_CAVE_BACK_CAVE, 1
	warp_event  8,  2, ICEFALL_CAVE_2F, 1
	warp_event 10,  4, ICEFALL_CAVE_2F, 2
	warp_event 15,  3, ICEFALL_CAVE_2F, 3
	warp_event 17,  4, ICEFALL_CAVE_2F, 4
	warp_event 16,  7, ICEFALL_CAVE_2F, 5
	warp_event 13, 11, ICEFALL_CAVE_2F, 6
	warp_event 15, 15, ICEFALL_CAVE_2F, 7

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	