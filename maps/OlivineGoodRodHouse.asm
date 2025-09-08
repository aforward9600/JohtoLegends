	object_const_def ; object_event constants
	const OLIVINEGOODRODHOUSE_FISHING_GURU

OlivineGoodRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	buttonsound
	verbosegiveitem GOOD_ROD
	setevent EVENT_GOT_GOOD_ROD
	writetextend GaveGoodRodText

.DontWantIt:
	writetextend DontWantGoodRodText

.AlreadyGotItem:
	writetextend HaveGoodRodText

OfferGoodRodText:
	text "Olivine is on the"
	line "sea!"

	para "And if it's on the"
	line "sea, there are"
	cont "bound to be fish!"

	para "I've fished here"
	line "for 30 years."

	para "Would you like to"
	line "face the sea and"
	cont "fish?"
	done

GiveGoodRodText:
	text "Ah, hahah!"
	line "We have ourselves"
	cont "a new angler!"
	done

GaveGoodRodText:
	text "Fish aren't found"
	line "in the sea alone."

	para "They go wherever"
	line "there is water."
	done

DontWantGoodRodText:
	text "Whaaat? You don't"
	line "like to fish!?"
	cont "Incomprehensible!"
	done

HaveGoodRodText:
	text "How are things?"
	line "Land the big one?"
	done

OlivineGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, OLIVINE_CITY, 5
	warp_event  5,  7, OLIVINE_CITY, 5

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  1, BGEVENT_READ, TimsHouseTelevision

	db 1 ; object events
	object_event  3,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
