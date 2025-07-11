	object_const_def ; object_event constants

RuinValley_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RuinValley_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 20, 17, DOTTED_HOLE_ENTRANCE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	