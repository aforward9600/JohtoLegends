	object_const_def ; object_event constants
	const TWOISLANDHOUSE_POKEFAN_M
	const TWOISLANDHOUSE_SCHOOLBOY

TwoIslandHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TwoIslandHousePokefanMScript:
	jumptextfaceplayer TwoIslandHousePokefanMText

TwoIslandHouseSchoolboyScript:
	jumptextfaceplayer TwoIslandHouseSchoolboyText

TwoIslandHousePokefanMText:
	text "That lady on the"
	line "cape is crazy!"

	para "Saying she'll"
	line "someday teach"
	cont "strong moves."

	para "Preposterous!"
	done

TwoIslandHouseSchoolboyText:
	text "Nothing exciting"
	line "ever happens here!"
	cont "predicting things."
	done

TwoIslandHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TWO_ISLAND, 4
	warp_event  5,  7, TWO_ISLAND, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TwoIslandHousePokefanMScript, -1
	object_event  7,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TwoIslandHouseSchoolboyScript, -1
