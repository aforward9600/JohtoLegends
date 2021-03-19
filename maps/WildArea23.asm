	object_const_def ; object_event constants

WildArea23_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildArea23_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 14, 20, WILD_AREA_1, 3
	warp_event 14, 21, WILD_AREA_1, 4
	warp_event  6, 13, WILD_AREA_1, 5
	warp_event  7, 13, WILD_AREA_1, 6
	warp_event 21, 15, WILD_AREA_CAVE, 1
	warp_event 13,  5, WILD_AREA_CAVE, 2
	warp_event  0,  6, WILD_AREA_5, 1
	warp_event  0,  7, WILD_AREA_5, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
