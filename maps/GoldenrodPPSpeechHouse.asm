	object_const_def ; object_event constants
	const GOLDENRODPPSPEECHHOUSE_YOUNGSTER
	const GOLDENRODPPSPEECHHOUSE_LASS

GoldenrodPPSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodPPSpeechHouseYoungsterScript:
	jumptextfaceplayer GoldenrodPPSpeechHouseYoungsterText

GoldenrodPPSpeechHouseGrampsScript:
	faceplayer
	opentext
	writetext GoldenrodPPSpeechHouseGrampsDrainPunchText
	checkmoney YOUR_MONEY, 1800
	ifequal HAVE_LESS, .TutorRefused
	yesorno
	iffalse .TutorRefused
	loadmoveindex DRAIN_PUNCH
	writetext GoldenrodPPSpeechHouseGrampsDrainPunchClear
	special MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext GoldenrodPPSpeechHouseGrampsDrainPunchRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext GoldenrodPPSpeechHouseGrampsDrainPunchTaught
	takemoney YOUR_MONEY, 1800
	waitbutton
	closetext
	end

GoldenrodPPSpeechHouseBookshelf2:
	jumpstd difficultbookshelf

GoldenrodPPSpeechHouseBookshelf1:
	jumpstd magazinebookshelf

GoldenrodPPSpeechHouseRadio:
	jumpstd televisionscript

GoldenrodPPSpeechHouseYoungsterText:
	text "See those trees"
	line "outside?"

	para "Grandpa says that"
	line "they probably"

	para "won't be there in"
	line "a few years, since"
	cont "the city is mod-"
	cont "ernizing."
	done

GoldenrodPPSpeechHouseGrampsDrainPunchText:
	text "There is a"
	line "punching move that"

	para "heals the user."

	para "Would you like me"
	line "to teach a #-"
	cont "mon Drain Punch?"

	para "It's only ¥1,800."
	done

GoldenrodPPSpeechHouseGrampsDrainPunchClear:
	text ""
	done

GoldenrodPPSpeechHouseGrampsDrainPunchRefused:
	text "Alrighty then."

	para "Come back later."
	done

GoldenrodPPSpeechHouseGrampsDrainPunchTaught:
	text "Now you're playing"
	line "with power!"
	done

GoldenrodPPSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 7
	warp_event  3,  7, GOLDENROD_CITY, 7

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, GoldenrodPPSpeechHouseBookshelf1
	bg_event  1,  1, BGEVENT_READ, GoldenrodPPSpeechHouseBookshelf2
	bg_event  7,  1, BGEVENT_READ, GoldenrodPPSpeechHouseRadio

	db 2 ; object events
	object_event  2,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodPPSpeechHouseYoungsterScript, -1
	object_event  5,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPPSpeechHouseGrampsScript, -1
