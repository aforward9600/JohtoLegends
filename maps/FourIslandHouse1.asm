	object_const_def ; object_event constants
	const FOURISLANDHOUSE1_GRAMPS
	const FOURISLANDHOUSE1_GRANNY

FourIslandHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FourIslandHouse1GrampsScript:
	jumptextfaceplayer FourIslandHouse1GrampsText

FourIslandHouse1GrannyScript:
	jumptextfaceplayer FourIslandHouse1GrannyText

FourIslandHouse1GrampsText:
	text "We've decided to"
	line "open up a #mon"
	cont "daycare here at"
	cont "our home."

	para "My friend on"
	line "Route 34 did so"
	cont "and he's doing"
	cont "quite well for"
	cont "himself."
	done

FourIslandHouse1GrannyText:
	text "A daycare for"
	line "#mon sounds"
	cont "lovely."

	para "We certainly have"
	line "the backyard for"
	cont "it."
	done

FourIslandHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FOUR_ISLAND, 6
	warp_event  5,  7, FOUR_ISLAND, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FourIslandHouse1GrampsScript, -1
	object_event  6,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FourIslandHouse1GrannyScript, -1
