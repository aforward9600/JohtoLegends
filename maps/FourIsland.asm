	object_const_def ; object_event constants
	const FOURISLAND_GRAMPS
	const FOURISLAND_COOLTRAINER_M
	const FOURISLAND_SUPER_NERD
	const FOURISLAND_LASS

FourIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_FOUR_ISLAND
	return

FourIslandGrampsScript:
	jumptextfaceplayer FourIslandGrampsText

FourIslandCooltrainerMScript:
	jumptextfaceplayer FourIslandCooltrainerMText

FourIslandSuperNerdScript:
	jumptextfaceplayer FourIslandSuperNerdText

FourIslandLassScript:
	jumptextfaceplayer FourIslandLassText

FourIslandSign:
	jumptext FourIslandSignText

FourIslandGrampsText:
	text "Although this is"
	line "the warm, blue"
	cont "island,"

	para "it gets colder the"
	line "further east you"
	cont "go."
	done

FourIslandCooltrainerMText:
	text "The floors in the"
	line "eastern cave can"
	cont "be slippery."
	done

FourIslandSuperNerdText:
	text "That girl in that"
	line "house there likes"
	cont "dolls and Ice-"
	cont "type #mon."
	done

FourIslandLassText:
	text "This is such a"
	line "small island."
	done

FourIslandSignText:
	text "Four Island"

	para "The Warm, Blue,"
	line "Floe Island"
	done

FourIsland_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  7, 23, FOUR_ISLAND_PORT, 1
	warp_event  8, 23, FOUR_ISLAND_PORT, 2
	warp_event 39,  9, ICEFALL_CAVE_ENTRANCE, 1
	warp_event 17, 15, FOUR_ISLAND_POKECENTER, 1
	warp_event 21, 21, FOUR_ISLAND_MART, 1
	warp_event 11,  9, FOUR_ISLAND_HOUSE_1, 1
	warp_event 25, 21, FOUR_ISLAND_HOUSE_2, 1
	warp_event 27, 11, FOUR_ISLAND_HOUSE_3, 1
	warp_event 33, 19, FOUR_ISLAND_LORELEIS_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 12, 14, BGEVENT_READ, FourIslandSign

	db 4 ; object events
	object_event 10, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FourIslandGrampsScript, -1
	object_event 27, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FourIslandCooltrainerMScript, -1
	object_event 40, 20, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FourIslandSuperNerdScript, -1
	object_event 17, 20, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FourIslandLassScript, -1
	