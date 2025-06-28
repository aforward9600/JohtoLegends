	object_const_def ; object_event constants

IcefallCaveBackCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IcefallCaveBackCave_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 10, 19, ICEFALL_CAVE_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	