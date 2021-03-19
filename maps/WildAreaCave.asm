	object_const_def ; object_event constants

WildAreaCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildAreaCave_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7, 11, WILD_AREA_2_3, 5
	warp_event  3,  5, WILD_AREA_2_3, 6

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
