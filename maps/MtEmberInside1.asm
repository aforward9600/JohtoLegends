	object_const_def ; object_event constants

MtEmberInside1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MtEmberInside1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 13, MT_EMBER_OUTSIDE, 1
	warp_event  9,  1, MT_EMBER_INSIDE_2, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	