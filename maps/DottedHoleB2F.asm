	object_const_def ; object_event constants

DottedHoleB2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DottedHoleB2FRock:
	opentext
	writetext DottedHoleRockText
	setval UNOWNWORDS_LEFT
	special DisplayUnownWords
	closetext
	end

DottedHoleB2F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3,  6, DOTTED_HOLE_B1F, 2
	warp_event  4,  2, DOTTED_HOLE_ENTRANCE, 4 ; up
	warp_event  2,  4, DOTTED_HOLE_B3F, 1 ; left
	warp_event  5,  7, DOTTED_HOLE_ENTRANCE, 4 ; down
	warp_event  7,  5, DOTTED_HOLE_ENTRANCE, 4 ; right

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  5, BGEVENT_READ, DottedHoleB2FRock

	db 0 ; object events
	