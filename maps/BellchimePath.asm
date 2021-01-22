BellchimePath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BellchimePathSign:
	jumptext BellchimePathSignText

BellchimePathSignText:
	text "Bell Tower"

	para "A legendary #-"
	line "mon is said to"
	cont "roost here."
	done

BellchimePath_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  8,  2, WISE_TRIOS_ROOM, 1
	warp_event  8,  3, WISE_TRIOS_ROOM, 2
	warp_event 25,  7, TIN_TOWER_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 26, 10, BGEVENT_READ, BellchimePathSign

	db 0 ; object events
