	object_const_def ; object_event constants
	const ROUTE16FUCHSIASPEECHHOUSE_SUPER_NERD

Route16FuchsiaSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route16FuchsiaSpeechHouseSuperNerdScript:
	jumptextfaceplayer Route16FuchsiaSpeechHouseSuperNerdText

Route16FuchsiaSpeechHouseBookshelf:
	jumpstd picturebookshelf

Route16FuchsiaSpeechHouseSuperNerdText:
	text "What did you just"
	line "do?!"

	para "You cut down that"
	line "tree!"

	para "That was my only"
	line "protection against"
	cont "the Federation!"
	done

Route16FuchsiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_16, 1
	warp_event  3,  7, ROUTE_16, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, Route16FuchsiaSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, Route16FuchsiaSpeechHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route16FuchsiaSpeechHouseSuperNerdScript, -1
