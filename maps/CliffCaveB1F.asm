	object_const_def ; object_event constants

CliffCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MakeBridgesPriorityScene

.MakeBridgesPriorityScene:
	setmapscene ROUTE_47, SCENE_FINISHED
	return

CliffCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  3, CLIFF_CAVE, 5
	warp_event  5,  9, ROUTE_47, 4

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
