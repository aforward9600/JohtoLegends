	object_const_def ; object_event constants

DottedHoleB3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DottedHoleB3FRock:
	opentext
	writetext DottedHoleRockText
	setval UNOWNWORDS_RIGHT
	special DisplayUnownWords
	closetext
	end

DottedHoleB3F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3,  3, DOTTED_HOLE_B2F, 3
	warp_event  5,  3, DOTTED_HOLE_ENTRANCE, 4 ; up
	warp_event  3,  5, DOTTED_HOLE_ENTRANCE, 4 ; left
	warp_event  5,  7, DOTTED_HOLE_ENTRANCE, 4 ; down
	warp_event  7,  5, DOTTED_HOLE_B4F, 1 ; right

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  5, BGEVENT_READ, DottedHoleB3FRock

	db 0 ; object events
	