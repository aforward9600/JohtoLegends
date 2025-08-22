	object_const_def ; object_event constants
	const SEVENISLANDMASTERSHOUSE_MASTER

SevenIslandMastersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SevenIslandMasterScript:
	faceplayer
	opentext
	checkevent EVENT_SPOKE_TO_SEVEN_ISLAND_MASTER
	iftrue .SevenIslandMaster2
	writetext SevenIslandMasterText
	waitbutton
	closetext
	setevent EVENT_SPOKE_TO_SEVEN_ISLAND_MASTER
	end

.SevenIslandMaster2:
	writetext SevenIslandMasterText2
	waitbutton
	closetext
	end

SevenIslandMasterText:
	text "Welcome, <PLAYER>."

	para "Your Master wrote"
	line "to me about you."

	para "Although our two"
	line "tribes have not"
	cont "spoken in a long"
	cont "time, the two of"
	cont "us have tried to"
	cont "mend the ancient"
	cont "bonds."

	para "Long ago, those"
	line "who cherished"
	cont "Tyranitar were"
	cont "cast out by those"
	cont "who cherished"
	cont "Dragonite."

	para "Our ancestors left"
	line "Blackthorn, and"
	cont "sailed here,"

	para "along with our"
	line "#mon."

	para "They introduced"
	line "Larvitar to this"
	cont "area and communed"
	cont "with the natives."

	para "The Master reached"
	line "out to me after"
	cont "his journey in"
	cont "Hoenn."

	para "I think that was"
	line "a turning point"
	cont "in his life."

	para "Feel free to come"
	line "back and chat"
	cont "anytime."
	done

SevenIslandMasterText2:
	text "The ruins to the"
	line "north are from the"
	cont "the natives of"
	cont "this land."

	para "Their language has"
	line "been lost to time,"
	cont "but it was likely"
	cont "a place of"
	cont "worship."
	done

SevenIslandMastersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  9, SEVEN_ISLAND, 3
	warp_event  5,  9, SEVEN_ISLAND, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SevenIslandMasterScript, -1
