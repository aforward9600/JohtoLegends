	object_const_def ; object_event constants

WildArea5_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildArea5_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 13,  6, WILD_AREA_2_3, 7
	warp_event 13,  7, WILD_AREA_2_3, 8
	warp_event  6, 13, WILD_AREA_4, 3
	warp_event  7, 13, WILD_AREA_4, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
