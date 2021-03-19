	object_const_def ; object_event constants

WildArea4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildArea4_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 13,  6, WILD_AREA_1, 7
	warp_event 13,  7, WILD_AREA_1, 8
	warp_event  6,  0, WILD_AREA_5, 3
	warp_event  7,  0, WILD_AREA_5, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
