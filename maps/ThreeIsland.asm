	object_const_def ; object_event constants
	const THREEISLAND_GRAMPS
	const THREEISLAND_LASS
	const THREEISLAND_FISHER

ThreeIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_THREE_ISLAND
	return

ThreeIslandGrampsScript:
	jumptextfaceplayer ThreeIslandGrampsText

ThreeIslandLassScript:
	jumptextfaceplayer ThreeIslandLassText

ThreeIslandFisherScript:
	jumptextfaceplayer ThreeIslandFisherText

ThreeIslandSign:
	jumptext ThreeIslandSignText

ThreeIslandGrampsText:
	text "There's not much to"
	line "our little island,"
	cont "but family is very"
	cont "important to us."
	done

ThreeIslandLassText:
	text "I think I'll go"
	line "berry picking in"
	cont "the forest today."
	done

ThreeIslandFisherText:
	text "Time to go"
	line "fishing, I"
	cont "suppose."
	done

ThreeIslandSignText:
	text "Three Island"

	para "Kin Island of"
	line "Family Bonding"
	done

ThreeIsland_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 13, 47, THREE_ISLAND_PORT, 1
	warp_event 14, 47, THREE_ISLAND_PORT, 2
	warp_event 15, 27, THREE_ISLAND_POKECENTER, 1
	warp_event 17, 11, THREE_ISLAND_MART, 1
	warp_event  7, 31, THREE_ISLAND_HOUSE_1, 1
	warp_event 15, 19, THREE_ISLAND_HOUSE_2, 1
	warp_event 13, 11, THREE_ISLAND_HOUSE_3, 1
	warp_event  7,  5, THREE_ISLAND_HOUSE_4, 1
	warp_event 13,  5, THREE_ISLAND_HOUSE_5, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 14, 30, BGEVENT_READ, ThreeIslandSign

	db 3 ; object events
	object_event 13, 42, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThreeIslandGrampsScript, -1
	object_event 12, 22, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThreeIslandLassScript, -1
	object_event  6,  8, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThreeIslandFisherScript, -1
