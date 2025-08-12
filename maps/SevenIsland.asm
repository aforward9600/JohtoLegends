	object_const_def ; object_event constants

SevenIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SEVEN_ISLAND
	return

SevenIslandSign:
	jumptext SevenIslandSignText

OnaganTempleSign:
	jumptext OnaganTempleSignText

SevenIslandSignText:
	text "Seven Island"

	para "Quest Island of"
	line "Eternity"
	done

OnaganTempleSignText:
	text "North to Onagan"
	line "Temple"

	para "South to Sevault"
	line "Canyon and"
	cont "Tanobi Ruins"
	done

SevenIsland_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 27, 29, SEVEN_ISLAND_PORT, 1
	warp_event 28, 29, SEVEN_ISLAND_PORT, 2
;	warp_event  9,  5, SEVEB_ISLAND_POKECENTER, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 28, 24, BGEVENT_READ, SevenIslandSign
	bg_event  9,  9, BGEVENT_READ, OnaganTempleSign

	db 0 ; object events
	