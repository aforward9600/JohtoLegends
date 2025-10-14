	object_const_def ; object_event constants

DottedHoleB4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DottedHoleB4FRock:
	opentext
	writetext DottedHoleRockText
	setval UNOWNWORDS_DOWN
	special DisplayUnownWords
	closetext
	end

DottedHoleB4F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3,  3, DOTTED_HOLE_B3F, 5
	warp_event  5,  3, DOTTED_HOLE_ENTRANCE, 4 ; up
	warp_event  3,  5, DOTTED_HOLE_ENTRANCE, 4 ; left
	warp_event  5,  7, REGISTEEL_PUZZLE_CHAMBER, 3 ; down
	warp_event  7,  5, DOTTED_HOLE_ENTRANCE, 4 ; right

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  5, BGEVENT_READ, DottedHoleB4FRock

	db 0 ; object events
	