	object_const_def ; object_event constants
	const ECRUTEAKITEMFINDERHOUSE_COOLTRAINER_M
	const ECRUTEAKITEMFINDERHOUSE_ROCKET
	const ECRUTEAKITEMFINDERHOUSE_POKEDEX

EcruteakItemfinderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakItemfinderGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .itemfinder
	writetext EcruteakItemfinderAdventureText
	buttonsound
	verbosegiveitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
.itemfinder:
	writetext ItemfinderExplanationText
	waitbutton
	closetext
	end

.no:
	writetext EcruteakItemfinderToEachHisOwnText
	waitbutton
	closetext
	end

EcruteakPorygonGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_PORYGON_R
	iftrue .GotPorygon
	writetext HereTakeItText
	buttonsound
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext GotPorygonText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke PORYGON, 15
	setevent EVENT_GOT_PORYGON_R
	clearevent EVENT_ITEMFINDER_GUY
	clearevent EVENT_JAILED_ROCKET
.GotPorygon:
	writetext QuitText
	waitbutton
	closetext
	end

.NoRoom:
	writetext EcruteakNoRoomText
	waitbutton
	closetext
	end

EcruteakHistoryBook:
	opentext
	writetext EcruteakHistoryBookText
	yesorno
	iftrue .ReadBook
	closetext
	end

.ReadBook:
	writetext EcruteakTwoTowersText
	yesorno
	iftrue .KeepReading
	closetext
	end

.KeepReading:
	writetext EcruteakThreeMonText
	waitbutton
	closetext
	end

ItemFinderHouseRadio:
	jumpstd televisionscript

EcruteakItemfinderAdventureText:
	text "I leave for a few"
	line "minutes, and I"
	cont "find my food gone,"

	para "my history book is"
	line "out, and this"
	cont "thing is on my"
	cont "table!"

	para "I don't want to"
	line "get the police"
	cont "involved, so here,"
	cont "take this."

	para "Why don't I want"
	line "the cops involved?"

	para "Don't worry about"
	line "it."
	done

ItemfinderExplanationText:
	text "I'm going to have"
	line "to restock my"

	para "cupboards."
	done

EcruteakItemfinderToEachHisOwnText:
	text "Oh… To each his"
	line "own, I suppose…"
	done

HereTakeItText:
	text "Hey, you're a"
	line "trainer, right?"

	para "Please, take this"
	line "#mon from me."

	para "It was given to"
	line "me, but I don't"
	cont "want it. I think"

	para "it was stolen."
	line "It's yours now."
	done

GotPorygonText:
	text "<PLAYER> received"
	line "Porygon!"
	done

QuitText:
	text "Thank you. I'm"
	line "glad I quit"
	cont "while I could."
	done

EcruteakNoRoomText:
	text "Hey! There's no"
	line "room for this!"
	done

EcruteakHistoryBookText:
	text "History Of"
	line "Ecruteak"

	para "Want to read it?"
	done

EcruteakTwoTowersText:
	text "In Ecruteak, there"
	line "were two towers."

	para "Each tower was the"
	line "roost of powerful"
	cont "flying #mon."

	para "But one of the"
	line "towers burned to"
	cont "the ground."

	para "The two #mon"
	line "haven't been seen"
	cont "since…"

	para "Keep reading?"
	done

EcruteakThreeMonText:
	text "Ecruteak was also"
	line "home to three"

	para "#mon that raced"
	line "around the town."

	para "They were said to"
	line "have been born of"

	para "water, lightning"
	line "and fire."

	para "But they could not"
	line "contain their"
	cont "excessive power."

	para "So they say the"
	line "three ran like the"

	para "wind off into the"
	line "grassland."
	done

EcruteakItemfinderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 11
	warp_event  4,  7, ECRUTEAK_CITY, 11

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, ItemFinderHouseRadio

	db 3 ; object events
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy, EVENT_ITEMFINDER_GUY
	object_event  5,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakPorygonGuy, EVENT_GOT_PORYGON_R
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, -1
