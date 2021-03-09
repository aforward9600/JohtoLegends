	object_const_def ; object_event constants

CliffCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CliffCave_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 15, ROUTE_47, 2
	warp_event  3, 13, CLIFF_CAVE, 3
	warp_event 13,  3, CLIFF_CAVE, 2
	warp_event 15,  7, ROUTE_47, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
