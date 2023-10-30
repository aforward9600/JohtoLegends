	object_const_def ; object_event constants
	const ROUTE19FUCHSIAGATE_OFFICER

Route19FuchsiaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route19FuchsiaGateOfficerScript:
	faceplayer
	opentext
	writetext Route19FuchsiaGateOfficerText
	waitbutton
	closetext
	end

Route19FuchsiaGateOfficerText:
	text "The good thing"
	line "about the water"
	cont "routes?"

	para "The Feds don't"
	line "bother with them."

	para "Maybe they can't"
	line "swim?"
	done

Route19FuchsiaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, FUCHSIA_CITY, 10
	warp_event  5,  0, FUCHSIA_CITY, 11
	warp_event  4,  7, ROUTE_19, 1
	warp_event  5,  7, ROUTE_19, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19FuchsiaGateOfficerScript, -1
