	object_const_def ; object_event constants
	const MTEMBERINSIDE8_BOULDER1
	const MTEMBERINSIDE8_BOULDER2
	const MTEMBERINSIDE8_BOULDER3
	const MTEMBERINSIDE8_BOULDER4

MtEmberInside8_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MtEmberInside8_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  5, MT_EMBER_INSIDE_7, 2
	warp_event  5, 17, MT_EMBER_INSIDE_9, 1
	warp_event 19, 21, MT_EMBER_INSIDE_7_2, 2
	

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 10,  5, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtEmberBoulder, -1
	object_event 13, 12, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtEmberBoulder, -1
	object_event 28,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtEmberBoulder, -1
	object_event 26, 12, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MtEmberBoulder, -1
	