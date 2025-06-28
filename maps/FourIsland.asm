	object_const_def ; object_event constants

FourIsland_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FourIslandSign:
	jumptext FourIslandSignText

FourIslandSignText:
	text "Four Island"

	para "The Warm, Blue,"
	line "Floe Island"
	done

FourIsland_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  7, 23, FOUR_ISLAND_PORT, 1
	warp_event  8, 23, FOUR_ISLAND_PORT, 2
	warp_event 40,  9, ICEFALL_CAVE_ENTRANCE, 1
	warp_event 17, 15, FOUR_ISLAND_POKECENTER, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 12, 14, BGEVENT_READ, FourIslandSign

	db 0 ; object events
	