	object_const_def ; object_event constants

SixIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SIX_ISLAND
	return

SixIslandSign:
	jumptext SixIslandSignText

SixIslandSignText:
	text "Six Island"

	para "Fortune Island of"
	line "Aged Wisdom"
	done

SixIsland_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7, 19, SIX_ISLAND_PORT, 1
	warp_event  8, 19, SIX_ISLAND_PORT, 2
	warp_event  9,  5, SIX_ISLAND_POKECENTER, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6, 10, BGEVENT_READ, SixIslandSign

	db 0 ; object events
	