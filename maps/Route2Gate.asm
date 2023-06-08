	object_const_def ; object_event constants
	const ROUTE2GATE_SCIENTIST

Route2Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route2GateScientistScript:
	jumptextfaceplayer Route2GateScientistText

Route2GateScientistText:
	text "Ah, you must be"
	line "<PLAYER>, correct?"

	para "I work as Prof."
	line "Oak's aide."

	para "I'm supposed to be"
	line "out observing, but"
	cont "I'm taking a break."

	para "Diglett's Cave is"
	line "full of Diglett"
	cont "not not much else."
	done

Route2Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_2, 3
	warp_event  5,  0, ROUTE_2, 4
	warp_event  4,  7, ROUTE_2, 2
	warp_event  5,  7, ROUTE_2, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2GateScientistScript, -1
