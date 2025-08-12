	object_const_def ; object_event constants

OneIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_ONE_ISLAND
	return

OneIslandSign:
	jumptext OneIslandSignText

OneIslandSignText:
	text "One Island"

	para "Friends gather at"
	line "Knot Island!"
	done

OneIsland_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 11, 19, ONE_ISLAND_PORT, 1
	warp_event 12, 19, ONE_ISLAND_PORT, 2
	warp_event 11,  7, ONE_ISLAND_POKECENTER, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 14, 14, BGEVENT_READ, OneIslandSign

	db 0 ; object events
	