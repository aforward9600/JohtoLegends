	object_const_def ; object_event constants
	const ICEFALLCAVEBACKCAVE_REGICE

IcefallCaveBackCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IcefallCaveBackCave_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 12, 21, ICEFALL_CAVE_1F, 3
	warp_event 10,  3, REGICE_PUZZLE_CHAMBER, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
