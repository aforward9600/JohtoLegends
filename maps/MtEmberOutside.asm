	object_const_def ; object_event constants
	const MTEMBEROUTSIDE_POKE_BALL

MtEmberOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MtEmberOutsideDragonFang:
	itemball DRAGON_FANG

MtEmberOutside_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7, 11, MT_EMBER_INSIDE_1, 1
	warp_event 24,  1, MT_EMBER_INSIDE_3, 2
	warp_event 27, 23, MT_EMBER_INSIDE_4, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 29, 7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MtEmberOutsideDragonFang, EVENT_MT_EMBER_DRAGON_FANG