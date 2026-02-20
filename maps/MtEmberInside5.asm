	object_const_def ; object_event constants

MtEmberInside5_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MtEmberInside5_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9, 21, MT_EMBER_INSIDE_4, 2
	warp_event  7,  3, MT_EMBER_INSIDE_7, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	