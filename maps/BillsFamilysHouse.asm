	object_const_def ; object_event constants
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_M
	const BILLSFAMILYSHOUSE_KID

BillsFamilysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_BILL_GIVES_YOU_SPRINTMAN
	iftrue .GaveSprintman
	writetext GiveSprintmanText
	buttonsound
	waitsfx
	writetext GotMusicPlayerText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_RADIO_CARD
	setevent EVENT_BILL_GIVES_YOU_SPRINTMAN
	writetext GaveSprintmanText
	waitbutton
	closetext
	end

.GaveSprintman:
	writetext BillText
	waitbutton
	closetext
	end

BillsDadScript:
	faceplayer
	opentext
	writetext BillsPopText
	waitbutton
	closetext
	end

BillsBrotherHouseScript:
	faceplayer
	opentext
	writetext BillsSecretText
	waitbutton
	closetext
	end

BillsHouseBookshelf1:
	jumpstd picturebookshelf

BillsHouseBookshelf2:
	jumpstd magazinebookshelf

GoldenrodBillsTelevision:
	jumpstd televisionscript

BillsFamilyComputer:
	opentext
	readvar VAR_FACING
	ifequal RIGHT, .CantReadComputer
	writetext BillsFamilyComputerText
	waitbutton
	closetext
	end

.CantReadComputer:
	writetext CantReadComputerText
	waitbutton
	closetext
	end

GiveSprintmanText:
	text "Howdy! My name is"
	line "Bill!"

	para "I'm great with"
	line "technology!"

	para "I recently made a"
	line "new upgrade for"
	cont "watches that lets"
	cont "you listen to"
	cont "music!"

	para "Let me see your"
	line "watch for a bit!"

	para "………Just need to"
	line "put that there……"

	para "……Solder that part"
	line "to here………"

	para "…Almost done! I"
	line "just have to load"
	cont "in the cassette"

	para "tape aaaaaaand……"
	line "done!"

	para "Here you go!"
	done

GotMusicPlayerText:
	text "Your watch now"
	line "can play music!"
	done

GaveSprintmanText:
	text "Bill: I call it"
	line "the Sprintman!"

	para "That cassette"
	line "tape comes loaded"
	cont "with 81 songs!"

	para "There's some great"
	line "ones in there, if"
	cont "I do say so!"

	para "Just press right"
	line "on the map screen"
	cont "and press up or"
	cont "down to find the"
	cont "song you like."

	para "Press A and the"
	line "music starts up!"

	para "Pretty neat, huh?"
	done

BillText:
	text "Bill: My grandpa"
	line "runs the Abra"
	cont "Delivery System!"

	para "It's pretty con-"
	line "venient, but I"
	cont "think I've come up"
	cont "with an even"
	cont "better idea!"

	para "A computer that"
	line "stores #mon and"
	cont "items!"

	para "Sounds ingenious,"
	line "don't you think?"

	para "I plan on making"
	line "that dream a"
	cont "reality someday!"

	para "I think I should"
	line "get Prof. Oak on"
	cont "board with this."

	para "It would help with"
	line "his research!"
	done

BillsPopText:
	text "My father seems to"
	line "be the only one in"
	cont "Kanto making money"
	cont "during this"
	cont "embargo."

	para "Just don't ask me"
	line "where he gets his"
	cont "money from."

	para "Oh, and I guess"
	line "Silph too."
	done

BillsSecretText:
	text "Wanna know a"
	line "secret?"

	para "My brother Bill"
	line "has a crush on"
	cont "the girl in the"
	cont "house with all the"
	cont "flowers!"

	para "Don't tell him I"
	line "told you!"
	done

CantReadComputerText:
	text "You can't read the"
	line "screen from here!"
	done

BillsFamilyComputerText:
	text "Personal computers"
	line "are pretty rare"
	cont "right now."

	para "What's on the"
	line "screen?"

	para "#mon Digital"
	line "Storage System"

	para "Looks like it's"
	line "pretty early in"
	cont "development."
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  1,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  2,  1, BGEVENT_READ, GoldenrodBillsTelevision
	bg_event  7,  1, BGEVENT_READ, BillsFamilyComputer

	db 3 ; object events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, -1
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsDadScript, -1
	object_event  5,  4, SPRITE_KID, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsBrotherHouseScript, -1
