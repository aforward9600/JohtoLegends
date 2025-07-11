	object_const_def ; object_event constants

AlteringCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AlteringCave_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13, 21, OUTCAST_ISLAND, 1
	warp_event  5,  1, REGIROCK_PUZZLE_CHAMBER, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	