	object_const_def ; object_event constants

DottedHoleEntrance_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DottedHoleEntrance_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5,  9, RUIN_VALLEY, 1
	warp_event  5,  5, DOTTED_HOLE_B1F, 1
	warp_event 11,  5, REGISTEEL_PUZZLE_CHAMBER, 1
	warp_event  5,  7, DOTTED_HOLE_B1F, 2 ; return

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	