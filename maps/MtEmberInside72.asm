	object_const_def ; object_event constants

MtEmberInside72_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MtEmberInside72_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, MT_EMBER_INSIDE_6, 2
	warp_event  7,  3, MT_EMBER_INSIDE_8, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	