	object_const_def ; object_event constants
	const TWOISLAND_GRAMPS

TwoIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_TWO_ISLAND
	return

TwoIslandGramps:
	jumptextfaceplayer TwoIslandGrampsText

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

TwoIslandGrampsText:
	text "The boy in the"
	line "eastern house"
	cont "tends to get lost"
	cont "a lot."
	done

TwoIsland_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  5,  9, TWO_ISLAND_PORT, 1
	warp_event  6,  9, TWO_ISLAND_PORT, 2
	warp_event 15,  9, TWO_ISLAND_POKECENTER, 1
	warp_event 25,  9, TWO_ISLAND_HOUSE, 1
	warp_event 29,  9, TWO_ISLAND_GAME_HOUSE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  6, BGEVENT_READ, TwoIslandSign
	bg_event 22,  8, BGEVENT_READ, CapeBrinkSign

	db 1 ; object events
	object_event 22, 10, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TwoIslandGramps, -1
	