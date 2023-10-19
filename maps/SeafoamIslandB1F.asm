	object_const_def ; object_event constants

SeafoamIslandB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeafoamIslandB1F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  9,  7, SEAFOAM_ISLAND_1F, 3
	warp_event 27,  5, SEAFOAM_ISLAND_1F, 4
	warp_event 25, 17, SEAFOAM_ISLAND_1F, 5
	warp_event  7,  5, SEAFOAM_ISLAND_B2F, 1
	warp_event 15,  9, SEAFOAM_ISLAND_B2F, 2
	warp_event 21, 17, SEAFOAM_ISLAND_B2F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
