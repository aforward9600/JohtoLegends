	object_const_def ; object_event constants

ViapoisChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViapoisChamber_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  8, 11, TANOBI_RUINS, 7
	warp_event  9, 11, TANOBI_RUINS, 7

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	