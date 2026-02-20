	object_const_def ; object_event constants
	const MTEMBERINSIDE7_BOULDER1
	const MTEMBERINSIDE7_BOULDER2
	const MTEMBERINSIDE7_BOULDER3

MtEmberInside7_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MtEmberBoulder:
	jumpstd strengthboulder

MtEmberInside7_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 11, MT_EMBER_INSIDE_6, 2
	warp_event 13, 11, MT_EMBER_INSIDE_8, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  8,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtEmberBoulder, -1
	object_event 12,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtEmberBoulder, -1
	object_event 11,  4, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtEmberBoulder, -1