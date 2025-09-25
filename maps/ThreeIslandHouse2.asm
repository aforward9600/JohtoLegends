	object_const_def ; object_event constants
	const THREEISLANDHOUSE2_POKEFANF
	const THREEISLANDHOUSE2_SCIENTIST

ThreeIslandHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ThreeIslandHouse2PokefanFScript:
	jumptextfaceplayer ThreeIslandHouse2PokefanFText

ThreeIslandHouse2ScientistScript:
	jumptextfaceplayer ThreeIslandHouse2ScientistText

ThreeIslandHouse2PokefanFText:
	text "My husband is"
	line "obsessed with the"
	cont "berries in the"
	cont "forest."

	para "Ask him about"
	line "them."
	done

ThreeIslandHouse2ScientistText:
	text "The berries in"
	line "the forest to the"
	cont "west reappear each"
	cont "day."

	para "They likely fall"
	line "off of the trees."
	done

ThreeIslandHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, THREE_ISLAND, 6
	warp_event  5,  7, THREE_ISLAND, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThreeIslandHouse2PokefanFScript, -1
	object_event  7,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThreeIslandHouse2ScientistScript, -1
