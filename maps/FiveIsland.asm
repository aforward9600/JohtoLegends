	object_const_def ; object_event constants
	const FIVEISLAND_GRAMPS

FiveIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_FIVE_ISLAND
	return

FiveIslandGrampsScript:
	jumptextfaceplayer FiveIslandGrampsText

FiveIslandSign:
	jumptext FiveIslandSignText

FiveIslandGrampsText:
	text "Welcome to Five"
	line "Island."

	para "They say that time"
	line "goes here on this"
	cont "island."

	para "That's true in my"
	line "case!"
	done

FiveIslandSignText:
	text "Five Island"

	para "Chrono Island:"
	line "Where time goes"
	done

FiveIsland_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  7, 17, FIVE_ISLAND_PORT, 1
	warp_event  8, 17, FIVE_ISLAND_PORT, 2
	warp_event 13,  7, FIVE_ISLAND_POKECENTER, 1
	warp_event  9,  7, FIVE_ISLAND_HOUSE_1, 1
	warp_event 17,  9, FIVE_ISLAND_HOUSE_2, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8,  8, BGEVENT_READ, FiveIslandSign

	db 1 ; object events
	object_event 12, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FiveIslandGrampsScript, -1
	