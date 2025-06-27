	object_const_def ; object_event constants

BerryForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BerryForest_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 26, 37, BOND_BRIDGE, 1
	warp_event 27, 37, BOND_BRIDGE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	