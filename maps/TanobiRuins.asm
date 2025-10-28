	object_const_def ; object_event constants

TanobiRuins_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TanobiRuins_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  7, 15, MONEAN_CHAMBER, 1
	warp_event 17,  9, LIPTOO_CHAMBER, 1
	warp_event 27,  9, WEEPTH_CHAMBER, 1
	warp_event 37, 11, DILFORD_CHAMBER, 1
	warp_event 67,  9, SCUFIB_CHAMBER, 1
	warp_event 77, 11, RIXY_CHAMBER, 1
	warp_event 87, 15, VIAPOIS_CHAMBER, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	