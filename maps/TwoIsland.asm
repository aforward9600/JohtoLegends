	object_const_def ; object_event constants

TwoIsland_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TwoIslandSign:
	jumptext TwoIslandSignText

CapeBrinkSign:
	jumptext CapeBrinkSignText

TwoIslandSignText:
	text "Two Island"

	para "Boon Island for"
	line "two"
	done

CapeBrinkSignText:
	text "North to Cape"
	line "Brink"
	done

TwoIsland_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  9, TWO_ISLAND_PORT, 1
	warp_event  6,  9, TWO_ISLAND_PORT, 2
	warp_event 15,  9, TWO_ISLAND_POKECENTER, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  6, BGEVENT_READ, TwoIslandSign
	bg_event 22,  8, BGEVENT_READ, CapeBrinkSign

	db 0 ; object events
	