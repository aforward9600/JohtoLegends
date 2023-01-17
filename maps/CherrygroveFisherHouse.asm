	object_const_def ; object_event constants
	const CHERRYGROVEFISHERHOUSE_POKEFAN_F

CherrygroveFisherHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CherrygroveFisherWifeScript:
	jumptextfaceplayer CherrygroveFisherWifeText

CherrygroveFisherHouseBookshelf:
	jumpstd magazinebookshelf

CherrygroveFisherWifeText:
	text "I love my husband,"
	line "I really do, but"
	cont "I don't want to"
	cont "live on this"
	cont "island anymore!"

	para "I'll leave, and if"
	line "he doesn't come"
	cont "with me, fine!"
	done

CherrygroveFisherHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 6
	warp_event  3,  7, CHERRYGROVE_CITY, 6

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CherrygroveFisherHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CherrygroveFisherHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveFisherWifeScript, -1
