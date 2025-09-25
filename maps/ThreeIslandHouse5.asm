	object_const_def ; object_event constants
	const THREEISLANDHOUSE5_BIRD_KEEPER

ThreeIslandHouse5_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ThreeIslandHouse5BirdKeeperScript:
	jumptextfaceplayer ThreeIslandHouse5BirdKeeperText

ThreeIslandHouse5BirdKeeperText:
	text "Bond Bridge has a"
	line "lot of birds near"
	cont "it."

	para "It's perfect for"
	line "me!"
	done

ThreeIslandHouse5_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, THREE_ISLAND, 9
	warp_event  5,  7, THREE_ISLAND, 9

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  4, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThreeIslandHouse5BirdKeeperScript, -1
