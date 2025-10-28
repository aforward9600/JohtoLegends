	object_const_def ; object_event constants
	const SEVENISLAND_LASS
	const SEVENISLAND_GRAMPS

SevenIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SEVEN_ISLAND
	return

SevenIslandLassScript:
	jumptextfaceplayer SevenIslandLassText

SevenIslandGrampsScript:
	jumptextfaceplayer SevenIslandGrampsText

SevenIslandSign:
	jumptext SevenIslandSignText

OnaganTempleSign:
	jumptext OnaganTempleSignText

SevenIslandLassText:
	text "That temple across"
	line "the water has been"
	cont "around since long"
	cont "before I was born."

	para "Nobody really goes"
	line "there anymore."
	done

SevenIslandGrampsText:
	text "It might be"
	line "unbelievable, but"
	cont "the temple to the"
	cont "north isn't as old"
	cont "as the ruins to"
	cont "the south."

	para "Some scientists"
	line "confirmed it."
	done

SevenIslandSignText:
	text "Seven Island"

	para "Quest Island of"
	line "Eternity"
	done

OnaganTempleSignText:
	text "North to Onagan"
	line "Temple"

	para "South to Sevault"
	line "Canyon and"
	cont "Tanoby Ruins"
	done

SevenIsland_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 27, 29, SEVEN_ISLAND_PORT, 1
	warp_event 28, 29, SEVEN_ISLAND_PORT, 2
	warp_event 21, 23, SEVEN_ISLAND_MASTERS_HOUSE, 1
	warp_event 21, 17, SEVEN_ISLAND_POKECENTER, 1
	warp_event 13, 23, SEVEN_ISLAND_MART, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 28, 24, BGEVENT_READ, SevenIslandSign
	bg_event  9,  9, BGEVENT_READ, OnaganTempleSign

	db 2 ; object events
	object_event 18, 11, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SevenIslandLassScript, -1
	object_event 17, 25, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SevenIslandGrampsScript, -1
	