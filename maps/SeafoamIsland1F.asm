	object_const_def ; object_event constants

SeafoamIsland1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeafoamIsland1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 28, 17, ROUTE_20, 1
	warp_event  6, 17, ROUTE_20, 3
	warp_event  9,  7, SEAFOAM_ISLAND_B1F, 1
	warp_event 27,  5, SEAFOAM_ISLAND_B1F, 2
	warp_event 25, 17, SEAFOAM_ISLAND_B1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
