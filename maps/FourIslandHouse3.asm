	object_const_def ; object_event constants
	const FOURISLANDHOUSE3_SCIENTIST

FourIslandHouse3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FourIslandHouse3ScientistScript:
	jumptextfaceplayer FourIslandHouse3ScientistText

FourIslandHouse3ScientistText:
	text "At the back of"
	line "Icefall Cave,"

	para "there is a small"
	line "cave with strange"
	cont "writing."

	para "This writing has"
	line "been found across"
	cont "the Sevii Islands."

	para "They must be"
	line "connected…"
	done

FourIslandHouse3_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FOUR_ISLAND, 8
	warp_event  5,  7, FOUR_ISLAND, 8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  5, SPRITE_SCIENTIST_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FourIslandHouse3ScientistScript, -1
