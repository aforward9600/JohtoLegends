	object_const_def ; object_event constants

ThreeIsland_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ThreeIslandSign:
	jumptext ThreeIslandSignText

ThreeIslandSignText:
	text "Three Island"

	para "Kin Island of"
	line "Family Bonding"
	done

ThreeIsland_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13, 47, THREE_ISLAND_PORT, 1
	warp_event 14, 47, THREE_ISLAND_PORT, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 14, 30, BGEVENT_READ, ThreeIslandSign

	db 0 ; object events
	