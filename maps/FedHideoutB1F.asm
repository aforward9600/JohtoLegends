	object_const_def ; object_event constants

FedHideoutB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FedHideoutB1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13,  2, FED_HIDEOUT_1F, 3
	warp_event 15,  2, FED_HIDEOUT_B2F, 1
	warp_event 16, 19, FED_HIDEOUT_ELEVATOR, 1
	warp_event 17, 19, FED_HIDEOUT_ELEVATOR, 2
	warp_event 13, 24, FED_HIDEOUT_B2F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
