	object_const_def ; object_event constants
	const ONEISLANDHOUSE_POKEFAN_F
	const ONEISLANDHOUSE_YOUNGSTER

OneIslandHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OneIslandHouseGrannyScript:
	checkevent EVENT_MT_EMBER_ERRUPTED
	iftrue .OneIslandHouseGranny2
	jumptextfaceplayer OneIslandHouseGrannyText

.OneIslandHouseGranny2:
	jumptextfaceplayer OneIslandHouseGrannyText2

OneIslandHouseLassScript:
	jumptextfaceplayer OneIslandHouseLassText

OneIslandHouseGrannyText:
	text "Mt. Ember is about"
	line "to errupt."

	para "I can feel it in"
	line "my bones."
	done

OneIslandHouseGrannyText2:
	text "I knew Mt. Ember"
	line "was going to"
	cont "erupt!"

	para "My bones never"
	line "lie!"
	done

OneIslandHouseLassText:
	text "My grandma is"
	line "pretty good at"
	cont "predicting things."

	para "She once predicted"
	line "my sandwich"
	cont "would be stolen by"
	cont "a Dodrio, and it"
	cont "happened!"
	done

OneIslandHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ONE_ISLAND, 5
	warp_event  5,  7, ONE_ISLAND, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OneIslandHouseGrannyScript, -1
	object_event  7,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OneIslandHouseLassScript, -1
