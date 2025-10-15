	object_const_def ; object_event constants

OnaganTempleOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OnaganTempleOutside_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11,  5, ONAGAN_TEMPLE_INSIDE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	