	object_const_def ; object_event constants
	const ROUTE5SAFFRONGATE_OFFICER

Route5SaffronGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route5SaffronGateOfficerScript:
	jumptextfaceplayer Route5SaffronGateOfficerText

Route5SaffronGateOfficerText:
	text "Our city is safe"
	line "for now,"

	para "but only because"
	line "the Leader gave"
	cont "up."
	done

Route5SaffronGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_5, 2
	warp_event  5,  0, ROUTE_5, 3
	warp_event  4,  7, SAFFRON_CITY, 8
	warp_event  5,  7, SAFFRON_CITY, 8

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route5SaffronGateOfficerScript, -1
