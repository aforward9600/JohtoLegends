	object_const_def ; object_event constants

SeafoamIslandB3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SeafoamIslandB3F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  5, 11, SEAFOAM_ISLAND_B2F, 4
	warp_event 25,  1, SEAFOAM_ISLAND_B2F, 5
	warp_event 25, 13, SEAFOAM_ISLAND_B2F, 6
	warp_event  9,  7, SEAFOAM_ISLAND_B4F, 1
	warp_event 25,  3, SEAFOAM_ISLAND_B4F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
