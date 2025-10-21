	object_const_def ; object_event constants
	const GREENPATHHOUSE1_PSYCHIC
	const GREENPATHHOUSE1_BLACK_BELT

GreenPathHouse1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GreenPathHouse1PsychicScript:
	jumptextfaceplayer GreenPathHouse1PsychicText

GreenPathHouse1BlackBeltScript:
	jumptextfaceplayer GreenPathHouse1BlackBeltText

GreenPathHouse1PsychicText:
	text "The cave to the"
	line "north has an eerie"
	cont "to it."
	done

GreenPathHouse1BlackBeltText:
	text "I'm not afraid of"
	line "some little cave!"

	para "My fists will"
	line "protect me!"
	done

GreenPathHouse1_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, GREEN_PATH, 1
	warp_event  5,  7, GREEN_PATH, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  4, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GreenPathHouse1PsychicScript, -1
	object_event  6,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GreenPathHouse1BlackBeltScript, -1
