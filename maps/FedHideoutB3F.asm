	object_const_def ; object_event constants

FedHideoutB3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FedHideoutB3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17,  2, FED_HIDEOUT_B2F, 5
	warp_event 11, 14, FED_HIDEOUT_B4F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
