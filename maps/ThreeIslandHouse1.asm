	object_const_def ; object_event constants
	const THREEISLANDHOUSE1_GRAMPS
	const THREEISLANDHOUSE1_GRANNY

ThreeIslandHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ThreeIslandHouse1GrampsScript:
	jumptextfaceplayer ThreeIslandHouse1GrampsText

ThreeIslandHouse1GrannyScript:
	jumptextfaceplayer ThreeIslandHouse1GrannyText

ThreeIslandHouse1GrampsText:
	text "Our son lives in"
	line "Kanto and plans on"
	cont "heading back to"
	cont "mine for more"
	cont "Nuggets."

	para "He claims he'll"
	line "restore his"
	cont "fortune."
	done

ThreeIslandHouse1GrannyText:
	text "When I was young,"
	line "there used to be a"
	cont "cave by the coast."

	para "Time buried it."
	done

ThreeIslandHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, THREE_ISLAND, 5
	warp_event  5,  7, THREE_ISLAND, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThreeIslandHouse1GrampsScript, -1
	object_event  6,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThreeIslandHouse1GrannyScript, -1
