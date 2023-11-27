	object_const_def ; object_event constants

EmbeddedTower_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
		callback MAPCALLBACK_OBJECTS, .MakeBridgesPriorityTower

.MakeBridgesPriorityTower:
	setmapscene ROUTE_47, SCENE_FINISHED
	return

EmbeddedTower_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 23, ROUTE_47, 5
	warp_event 11, 23, ROUTE_47, 5

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
