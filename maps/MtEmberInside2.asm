	object_const_def ; object_event constants

MtEmberInside2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MtEmberInside2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 21, MT_EMBER_INSIDE_1, 2
	warp_event 23,  3, MT_EMBER_INSIDE_3, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	