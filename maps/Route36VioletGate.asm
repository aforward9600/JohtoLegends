	object_const_def ; object_event constants
	const ROUTE36VIOLETGATE_OFFICER

Route36VioletGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route36VioletGateOfficerScript:
	jumptextfaceplayer Route36VioletGateOfficerText

Route36VioletGateOfficerText:
	text "Make sure you"
	line "visit Sprout"
	cont "Tower."

	para "The elder gives a"
	line "call out to anyone"
	cont "that can defeat"
	cont "him."
	done

Route36VioletGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  9,  4, VIOLET_CITY, 10
	warp_event  9,  5, VIOLET_CITY, 11
	warp_event  0,  4, ROUTE_36, 5
	warp_event  0,  5, ROUTE_36, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route36VioletGateOfficerScript, -1
