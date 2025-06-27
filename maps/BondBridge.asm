	object_const_def ; object_event constants

BondBridge_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BerryForestSign:
	jumptext BerryForestSignText

BondBridgeSign:
	jumptext BondBridgeSignText

BondBridgeSignText:
	text "Bond Bridge"

	para "Please be quiet"
	line "when crossing."
	done

BerryForestSignText:
	text "Berry Forest"
	line "ahead"
	done

BondBridge_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  4, BERRY_FOREST, 1
	warp_event  5,  4, BERRY_FOREST, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6,  6, BGEVENT_READ, BerryForestSign
	bg_event 74,  8, BGEVENT_READ, BondBridgeSign

	db 0 ; object events
	