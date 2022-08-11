	object_const_def ; object_event constants
	const ROUTE43MAHOGANYGATE_OFFICER

Route43MahoganyGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route43MahoganyGateOfficer:
	faceplayer
	opentext
	writetext Route43MahoganyGateOfficerText
	waitbutton
	closetext
	end

Route43MahoganyGateOfficerText:
	text "The snow at the"
	line "Lake of Rage has"
	cont "melted already."

	para "Doesn't make much"
	line "sense to me, since"

	para "lakes tend to be"
	line "cold, but I'm not"

	para "a meteorologist,"
	line "so what do I"
	cont "know?"
	done

Route43MahoganyGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_43, 1
	warp_event  5,  0, ROUTE_43, 2
	warp_event  4,  7, MAHOGANY_TOWN, 5
	warp_event  5,  7, MAHOGANY_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route43MahoganyGateOfficer, -1
