	object_const_def ; object_event constants

FedHideoutB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FedHideoutB2F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 27,  2, FED_HIDEOUT_B1F, 2
	warp_event 21, 16, FED_HIDEOUT_B1F, 5
	warp_event 24, 13, FED_HIDEOUT_ELEVATOR, 1
	warp_event 25, 13, FED_HIDEOUT_ELEVATOR, 2
	warp_event 21,  2, FED_HIDEOUT_B3F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
