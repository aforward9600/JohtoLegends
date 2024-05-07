	object_const_def ; object_event constants
	const PEWTERSNOOZESPEECHHOUSE_GRAMPS

PewterSnoozeSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PewterSnoozeSpeechHouseGrampsScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .PewterSnoozeSpeechHouseGramps2
	jumptextfaceplayer PewterSnoozeSpeechHouseGrampsText

.PewterSnoozeSpeechHouseGramps2:
	jumptextfaceplayer PewterSnoozeSpeechHouseGrampsText2

PewterSnoozeSpeechHouseBookshelf:
	jumpstd picturebookshelf

PewterSnoozeSpeechHouseGrampsText:
	text "My husband spends"
	line "too much time out-"
	cont "side these days."

	para "Normally, that"
	line "wouldn't be a"
	cont "problem,"

	para "but recently it's"
	line "too dangerous."
	done

PewterSnoozeSpeechHouseGrampsText2:
	text "I suppose it's good"
	line "for my husband to"
	cont "be outside."

	para "It will help him"
	line "stay in shape."
	done

PewterSnoozeSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PEWTER_CITY, 5
	warp_event  3,  7, PEWTER_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, PewterSnoozeSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, PewterSnoozeSpeechHouseBookshelf

	db 1 ; object events
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterSnoozeSpeechHouseGrampsScript, -1
