	object_const_def ; object_event constants

ScufibChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ScufibChamber_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 11, TANOBI_RUINS, 5
	warp_event  9, 11, TANOBI_RUINS, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	