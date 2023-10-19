	object_const_def ; object_event constants

SeafoamIslandB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeafoamIslandB2F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  7,  5, SEAFOAM_ISLAND_B1F, 4
	warp_event 15,  9, SEAFOAM_ISLAND_B1F, 5
	warp_event 27, 13, SEAFOAM_ISLAND_B1F, 6
	warp_event  7, 15, SEAFOAM_ISLAND_B3F, 1
	warp_event 27,  5, SEAFOAM_ISLAND_B3F, 2
	warp_event 27, 15, SEAFOAM_ISLAND_B3F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
