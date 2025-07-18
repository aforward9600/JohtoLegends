	object_const_def ; object_event constants
	const MRPSYCHICSHOUSE_FISHING_GURU

MrPsychicsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MrPsychic:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM29_PSYCHIC
	iftrue .AlreadyGivenItem
	checktmhm TM_PSYCHIC_M
	iftrue .AlreadyGotItem
	writetext MrPsychicText1
	buttonsound
	verbosegiveitem TM_PSYCHIC_M
	setevent EVENT_GOT_TM29_PSYCHIC
.AlreadyGivenItem:
	writetext MrPsychicText2
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext MrPsychicText3
	waitbutton
	closetext
	setevent EVENT_GOT_TM29_PSYCHIC
	end

MrPsychicsHouseBookshelf:
	jumpstd genericsink

MrPsychicText1:
	text "…"

	para "…"

	para "…"

	para "…I got it!"

	para "You wanted this!"
	done

MrPsychicText2:
	text "TM29 is Psychic."

	para "It may lower the"
	line "target's Spcl.Def."
	done

MrPsychicText3:
	text "What!"

	para "You already have"
	line "this TM?"

	para "Why didn't I know"
	line "that?"
	done

MrPsychicsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SAFFRON_CITY, 5
	warp_event  5,  7, SAFFRON_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, MrPsychicsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MrPsychicsHouseBookshelf

	db 1 ; object events
	object_event  6,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrPsychic, -1
