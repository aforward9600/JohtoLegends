	object_const_def ; object_event constants

CapeBrink_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CapeBrink_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11,  3, CAPE_BRINK_HOUSE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	