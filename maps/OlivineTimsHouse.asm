	object_const_def ; object_event constants
	const OLIVINETIMSHOUSE_TIM
	const OLIVINETIMSHOUSE_TIMSMOM

OlivineTimsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Tim:
	faceplayer
	opentext
	trade NPC_TRADE_TIM
	waitbutton
	closetext
	end

TimsMomScript:
	jumptextfaceplayer TimsMomText

TimsHouseBookshelf:
	jumpstd magazinebookshelf

TimsHouseTelevision:
	jumpstd televisionscript

TimsMomText:
	text "My son Tim loves"
	line "the #mon he got"
	cont "from the Gym"
	cont "Leader, but now he"
	cont "just wants to"
	cont "trade it away!"

	para "He hopes to have"
	line "a Voltorb to trade"
	cont "someday."
	done

OlivineTimsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 3
	warp_event  3,  7, OLIVINE_CITY, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, TimsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, TimsHouseBookshelf
	bg_event  2,  1, BGEVENT_READ, TimsHouseTelevision

	db 2 ; object events
	object_event  5,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Tim, -1
	object_event  5,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TimsMomScript, -1
