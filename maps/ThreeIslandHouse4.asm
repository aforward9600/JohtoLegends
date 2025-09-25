	object_const_def ; object_event constants
	const THREEISLANDHOUSE4_FIREBREATHER
	const THREEISLANDHOUSE4_BUENA

ThreeIslandHouse4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ThreeIslandHouse4FirebreatherScript:
	jumptextfaceplayer ThreeIslandHouse4FirebreatherText

ThreeIslandHouse4BeautyScript:
	jumptextfaceplayer ThreeIslandHouse4BeautyText

ThreeIslandHouse4FirebreatherText:
	text "The kid from Two"
	line "Island tends to"
	cont "get lost in Berry"
	cont "Forest a lot."

	para "I don't know why"
	line "his mother keeps"
	cont "sending him in."
	done

ThreeIslandHouse4BeautyText:
	text "Watching the sea"
	line "in the evening"
	cont "is so calming."
	done

ThreeIslandHouse4_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, THREE_ISLAND, 8
	warp_event  5,  7, THREE_ISLAND, 8

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  3, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThreeIslandHouse4FirebreatherScript, -1
	object_event  7,  5, SPRITE_BUENA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThreeIslandHouse4BeautyScript, -1
