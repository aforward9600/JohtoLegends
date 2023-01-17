	object_const_def ; object_event constants
	const ROUTE29ROUTE46GATE_OFFICER
	const ROUTE29ROUTE46GATE_YOUNGSTER

Route29Route46Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route29Route46GateOfficerScript:
	jumptextfaceplayer Route29Route46GateOfficerText

Route29Route46GateRockerScript:
	jumptextfaceplayer Route29Route46GateRockerText

Route29Route46GateOfficerText:
	text "Earthquakes are no"
	line "joke."

	para "They're the whole"
	line "reason the Routes"
	cont "ahead tend to be"
	cont "blocked off."
	done

Route29Route46GateRockerText:
	text "These rock slides"
	line "are ridiculous!"
	done

Route29Route46Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_46, 1
	warp_event  5,  0, ROUTE_46, 2
	warp_event  4,  7, ROUTE_29, 1
	warp_event  5,  7, ROUTE_29, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29Route46GateOfficerScript, -1
	object_event  6,  4, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route29Route46GateRockerScript, -1
