	object_const_def ; object_event constants
	const CERULEANCAVE1F_POKEBALL1
	const CERULEANCAVE1F_POKEBALL2

CeruleanCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanCave1FMaxElixer:
	itemball MAX_ELIXER

CeruleanCave1FNugget:
	itemball NUGGET

CeruleanCave1FHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CERULEAN_CAVE_HIDDEN_RARE_CANDY

CeruleanCave1F_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 27, 19, ROUTE_4, 2
	warp_event  2,  8, CERULEAN_CAVE_B1F, 1
	warp_event  3,  5, CERULEAN_CAVE_2F, 1
	warp_event  9,  3, CERULEAN_CAVE_2F, 2
	warp_event  5, 13, CERULEAN_CAVE_2F, 3
	warp_event 19, 11, CERULEAN_CAVE_2F, 4
	warp_event 25,  9, CERULEAN_CAVE_2F, 5
	warp_event 29,  3, CERULEAN_CAVE_2F, 6

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  6, BGEVENT_ITEM, CeruleanCave1FHiddenRareCandy

	db 2 ; object events
	object_event 15, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FNugget, EVENT_CERULEAN_CAVE_1F_NUGGET
	object_event  7, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCave1FMaxElixer, EVENT_CERULEAN_CAVE_1F_MAX_ELIXER

