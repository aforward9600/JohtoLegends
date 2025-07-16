	object_const_def ; object_event constants

MtEmber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MtEmber_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4, 17, KINDLE_ROAD, 1
	warp_event  5, 17, KINDLE_ROAD, 2
	warp_event  5,  1, REGIDRAGO_PUZZLE_CHAMBER, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	