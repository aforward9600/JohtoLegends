	object_const_def ; object_event constants
	const SOOTHEBELLHOUSE_LASS
	const SOOTHEBELLHOUSE_POKEFAN_F
	const SOOTHEBELLHOUSE_CLEFAIRY

SootheBellHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SootheBellHouseBlackBeltScript:
	jumptextfaceplayer SootheBellHouseBlackBeltText

SootheBellHouseTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SOOTHE_BELL
	iftrue .AlreadyGotSootheBell
	writetext SootheBellIntroText
	buttonsound
	verbosegiveitem SOOTHE_BELL
	iffalse .BagFull
	setevent EVENT_GOT_SOOTHE_BELL
.AlreadyGotSootheBell:
	writetext SootheBellDoneText
	waitbutton
.BagFull:
	closetext
	end

SootheBellHouseClefairyScript:
	refreshscreen
	pokepic CLEFAIRY
	cry CLEFAIRY
	waitbutton
	closepokepic
	opentext
	writetext SootheBellHouseClefairyText
	waitbutton
	closetext
	end

SootheBellBookshelf1:
; unused
	jumpstd picturebookshelf

SootheBellBookshelf2:
; unused
	jumpstd magazinebookshelf

SootheBellTelevision:
	jumpstd televisionscript

SootheBellHouseBlackBeltText:
	text "My Cleffa evolved"
	line "after I gave it a"
	cont "Soothe Bell and"
	cont "walked around!"
	done

SootheBellIntroText:
	text "Would you like"
	line "your #mon to"
	cont "trust you more?"

	para "Take this bell"
	line "then."
	done

SootheBellDoneText:
	text "That Soothe Bell"
	line "will make your"
	cont "#mon more"
	cont "friendly the more"
	cont "you walk!"
	done

SootheBellHouseTeacherText_RocketsInRadioTower:
	text "I've been hearing"
	line "laughter on the"

	para "radio…"
	line "It's creepy."
	done

SootheBellHouseClefairyText:
	text "Clefairy: Clef-"
	line "clef!"
	done

SootheBellHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAKE_OF_RAGE, 6
	warp_event  3,  7, LAKE_OF_RAGE, 6

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, SootheBellTelevision

	db 3 ; object events
	object_event  2,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SootheBellHouseBlackBeltScript, -1
	object_event  6,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SootheBellHouseTeacherScript, -1
	object_event  1,  3, SPRITE_CLEFAIRY_P, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SootheBellHouseClefairyScript, -1
	