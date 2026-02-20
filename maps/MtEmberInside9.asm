	object_const_def ; object_event constants

MtEmberInside9_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MtEmberInside9_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  7, MT_EMBER_INSIDE_8, 2
	warp_event  5,  1, REGIDRAGO_PUZZLE_CHAMBER, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	