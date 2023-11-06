	object_const_def ; object_event constants

FedHideoutB4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FedHideoutB4F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 11, 10, FED_HIDEOUT_B3F, 2
	warp_event 16, 15, FED_HIDEOUT_ELEVATOR, 1
	warp_event 17, 15, FED_HIDEOUT_ELEVATOR, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
