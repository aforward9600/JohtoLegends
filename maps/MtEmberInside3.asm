	object_const_def ; object_event constants

MtEmberInside3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MtEmberInside3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  3, MT_EMBER_INSIDE_2, 2
	warp_event 11,  7, MT_EMBER_OUTSIDE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	