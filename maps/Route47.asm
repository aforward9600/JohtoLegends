	object_const_def ; object_event constants

Route47_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route47_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 46, 17, CLIFFS_EDGE_GATE, 4
	warp_event 37, 18, CLIFF_CAVE, 1
	warp_event 37, 14, CLIFF_CAVE, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
