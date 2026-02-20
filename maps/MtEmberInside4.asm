	object_const_def ; object_event constants

MtEmberInside4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MtEmberInside4_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 15, 15, MT_EMBER_OUTSIDE, 3
	warp_event  3,  3, MT_EMBER_INSIDE_5, 1
	warp_event 17,  7, MT_EMBER_INSIDE_6, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	