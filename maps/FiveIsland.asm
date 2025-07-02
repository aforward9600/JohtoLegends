	object_const_def ; object_event constants

FiveIsland_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FiveIslandSign:
	jumptext FiveIslandSignText

FiveIslandSignText:
	text "Five Island"

	para "Chrono Island:"
	line "Where time goes"
	done

FiveIsland_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7, 17, FIVE_ISLAND_PORT, 1
	warp_event  8, 17, FIVE_ISLAND_PORT, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8,  8, BGEVENT_READ, FiveIslandSign

	db 0 ; object events
	