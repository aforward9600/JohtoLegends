	object_const_def ; object_event constants

DottedHoleB4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DottedHoleB4FRock:
	opentext
	writetext DottedHoleRockText4
	setval UNOWNWORDS_DOWN
	special DisplayUnownWords
	closetext
	end

DottedHoleRockText4:
	text "There are some"
	line "dots here."
	done

DottedHoleB4F_MapEvents:
	db 5 ; warp events
	warp_event  3,  6, DOTTED_HOLE_B3F, 5
	warp_event  4,  2, DOTTED_HOLE_ENTRANCE, 4 ; up
	warp_event  2,  4, DOTTED_HOLE_ENTRANCE, 4 ; left
	warp_event  5,  7, REGISTEEL_PUZZLE_CHAMBER, 3 ; down
	warp_event  7,  5, DOTTED_HOLE_ENTRANCE, 4 ; right

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  5, BGEVENT_READ, DottedHoleB4FRock

	db 0 ; object events
	