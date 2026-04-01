	object_const_def ; object_event constants

TanobiRuinsInside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TanobiRuinsInside_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  8, 27, TANOBI_RUINS, 1
	warp_event  9, 27, TANOBI_RUINS, 1
	warp_event  8, 11, TANOBI_RUINS, 2
	warp_event  9, 11, TANOBI_RUINS, 2
	warp_event 32, 11, TANOBI_RUINS, 3
	warp_event 33, 11, TANOBI_RUINS, 3
	warp_event 32, 27, TANOBI_RUINS, 4
	warp_event 33, 27, TANOBI_RUINS, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	