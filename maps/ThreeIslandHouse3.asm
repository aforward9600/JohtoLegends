	object_const_def ; object_event constants
	const THREEISLANDHOUSE3_COOLTRAINERM
	const THREEISLANDHOUSE3_TWIN

ThreeIslandHouse3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ThreeIslandHouse3CooltrainerMScript:
	jumptextfaceplayer ThreeIslandHouse3CooltrainerMText

ThreeIslandHouse3TwinScript:
	jumptextfaceplayer ThreeIslandHouse3TwinText

ThreeIslandHouse3CooltrainerMText:
	text "I wouldn't go into"
	line "Berry Forest if I"
	cont "were you."

	para "There have always"
	line "been stories about"
	cont "strange #mon"
	cont "kidnapping people."
	done

ThreeIslandHouse3TwinText:
	text "I was almost taken"
	line "by a #mon in"
	cont "the forest!"

	para "It was scary!"
	done

ThreeIslandHouse3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, THREE_ISLAND, 7
	warp_event  5,  7, THREE_ISLAND, 7

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  6,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThreeIslandHouse3CooltrainerMScript, -1
	object_event  2,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThreeIslandHouse3TwinScript, -1
