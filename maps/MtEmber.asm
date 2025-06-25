	object_const_def ; object_event constants

MtEmber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MtEmber_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 23, KINDLE_ROAD, 1
	warp_event  7, 23, KINDLE_ROAD, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	