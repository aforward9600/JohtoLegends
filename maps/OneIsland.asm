	object_const_def ; object_event constants
	const ONEISLAND_GRAMPS

OneIsland_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OneIslandGramps:
	jumptextfaceplayer OneIslandGrampsText

OneIslandSign:
	jumptext OneIslandSignText

OneIslandSignText:
	text "One Island"

	para "Friends gather at"
	line "Knot Island!"
	done

OneIslandGrampsText:
	text "Oh, a fresh face!"

	para "The embargo must"
	line "finally be lifted!"

	para "I can finally buy"
	line "my Moomoo milk!"
	done

OneIsland_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 11, 19, ONE_ISLAND_PORT, 1
	warp_event 12, 19, ONE_ISLAND_PORT, 2
	warp_event 11,  7, ONE_ISLAND_POKECENTER, 1
	warp_event  7, 13, CELIOS_HOUSE, 1
	warp_event 19, 11, ONE_ISLAND_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 14, 14, BGEVENT_READ, OneIslandSign

	db 1 ; object events
	object_event 14, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OneIslandGramps, -1
	