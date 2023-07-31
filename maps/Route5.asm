	object_const_def ; object_event constants
	const ROUTE5_POKEFAN_M

Route5_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route5PokefanMScript:
	jumptextfaceplayer Route5PokefanMText

Route5UndergroundPathSign:
	jumptext Route5UndergroundPathSignText

Route5PokefanMText:
	text "Take this path to"
	line "avoid Saffron City"
	cont "if you'd like."
	done

Route5UndergroundPathSignText:
	text "Underground Path"

	para "Cerulean City -"
	line "Vermilion City"
	done

Route5_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 17, 15, ROUTE_5_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  8, 17, ROUTE_5_SAFFRON_GATE, 1
	warp_event  9, 17, ROUTE_5_SAFFRON_GATE, 2
	warp_event 10, 11, ROUTE_5_CLEANSE_TAG_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 17, 17, BGEVENT_READ, Route5UndergroundPathSign

	db 1 ; object events
	object_event 13, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route5PokefanMScript, -1
