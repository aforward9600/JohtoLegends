	object_const_def ; object_event constants
	const TWOISLANDGAMEHOUSE_POKEFAN_F
	const TWOISLANDGAMEHOUSE_YOUNGSTER

TwoIslandGameHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TwoIslandGameHousePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_LIECHI_BERRY_ON_TWO_ISLAND
	iftrue .TwoIslandGameHousePokefanF3
	checkevent EVENT_LOST_BOY_BERRY_FOREST
	iftrue .TwoIslandGameHousePokefanF2
	writetext TwoIslandGameHousePokefanFText
	waitbutton
	closetext
	end

.TwoIslandGameHousePokefanF2:
	writetext TwoIslandGameHousePokefanFText2
	buttonsound
	verbosegiveitem LIECHI_BERRY
	setevent EVENT_GOT_LIECHI_BERRY_ON_TWO_ISLAND
.TwoIslandGameHousePokefanF3:
	writetext TwoIslandGameHousePokefanFText3
	waitbutton
	closetext
	end

TwoIslandGameHouseYoungsterScript:
	jumptextfaceplayer TwoIslandGameHouseYoungsterText

TwoIslandGameHousePokefanFText:
	text "I sent my son to"
	line "Berry Forest on"
	cont "Three Island to"
	cont "pick berries,"

	para "but he's still not"
	line "back!"

	para "Can you find him"
	line "for me?"

	para "He gets easily"
	line "lost."
	done

TwoIslandGameHousePokefanFText2:
	text "Thank you for"
	line "finding him."

	para "Take this berry he"
	line "picked. It's the"
	cont "least I can do."
	done

TwoIslandGameHousePokefanFText3:
	text "I truly hope any"
	line "children he has in"
	cont "the future won't"
	cont "get as lost as he"
	cont "does."
	done

TwoIslandGameHouseYoungsterText:
	text "Thanks again!"

	para "I plan on making a"
	line "berry-picking game"
	cont "here someday!"
	done

TwoIslandGameHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, TWO_ISLAND, 5
	warp_event  5,  7, TWO_ISLAND, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  6,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TwoIslandGameHousePokefanFScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TwoIslandGameHouseYoungsterScript, EVENT_LOST_BOY_TWO_ISLAND
