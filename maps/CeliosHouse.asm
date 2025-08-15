	object_const_def ; object_event constants
	const CELIOSHOUSE_CELIO
	const CELIOSHOUSE_POKEFAN_M

CeliosHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CelioScript:
	jumptextfaceplayer CelioText

CeliosDadScript:
	jumptextfaceplayer CeliosDadText

CeliosHouseBookshelf:
	jumpstd genericsink

CeliosHouseTelevision:
	jumpstd televisionscript

CeliosHouseComputer:
	opentext
	readvar VAR_FACING
	ifequal RIGHT, .CantReadComputer
	writetext CeliosHouseComputerText
	waitbutton
	closetext
	end

.CantReadComputer:
	writetext CelioCantReadComputerText
	waitbutton
	closetext
	end

CelioText:
	text "Celio: You're the"
	line "Champion, right?"

	para "It's thanks to you"
	line "that I can visit"
	cont "Bill again and we"
	cont "can start working"
	cont "on the #mon"
	cont "Storage System!"

	para "Thank you!"
	done

CeliosDadText:
	text "My son has penpals"
	line "in Johto and Hoenn"
	cont "if you can believe"
	cont "it!"
	done

CelioCantReadComputerText:
	text "You can't read the"
	line "screen from here!"
	done

CeliosHouseComputerText:
	text "Dear Lanette,"

	para "Bill and I have"
	line "been talking"
	cont "about a new way"

	para "to store #mon!"

	para "It's still in the"
	line "early stages, but"
	cont "we'll need your"
	cont "help someday!"

	para "Sincerely,"
	line "Celio"
	done

CeliosHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ONE_ISLAND, 4
	warp_event  5,  7, ONE_ISLAND, 4

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, CeliosHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CeliosHouseBookshelf
	bg_event  4,  1, BGEVENT_READ, CeliosHouseTelevision
	bg_event  9,  1, BGEVENT_READ, CeliosHouseComputer

	db 2 ; object events
	object_event  3,  3, SPRITE_KID, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CelioScript, -1
	object_event  6,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeliosDadScript, -1
