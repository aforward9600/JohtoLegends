	object_const_def ; object_event constants
	const SIXISLAND_GRAMPS
	const SIXISLAND_LASS

SixIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SIX_ISLAND
	return

SixIslandGrampsScript:
	jumptextfaceplayer SixIslandGrampsText

SixIslandLassScript:
	jumptextfaceplayer SixIslandLassText

SixIslandSign:
	jumptext SixIslandSignText

SixIslandGrampsText:
	text "The valley to the"
	line "south used to be a"
	cont "sacred place to"
	cont "the ancient"
	cont "people of this"
	cont "island."

	para "Now scientists are"
	line "the only ones who"
	cont "go there."
	done

SixIslandLassText:
	text "I have friends up"
	line "in Green Path."

	para "It's quite the"
	line "journey to get"
	cont "there."
	done

SixIslandSignText:
	text "Six Island"

	para "Fortune Island of"
	line "Aged Wisdom"
	done

SixIsland_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  7, 19, SIX_ISLAND_PORT, 1
	warp_event  8, 19, SIX_ISLAND_PORT, 2
	warp_event  9,  5, SIX_ISLAND_POKECENTER, 1
	warp_event 15,  5, SIX_ISLAND_MART, 1
	warp_event 13, 11, SIX_ISLAND_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6, 10, BGEVENT_READ, SixIslandSign

	db 2 ; object events
	object_event  3, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SixIslandGrampsScript, -1
	object_event  6,  6, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SixIslandLassScript, -1
	