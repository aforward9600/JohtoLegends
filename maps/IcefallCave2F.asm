	object_const_def ; object_event constants

IcefallCave2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IcefallCave2FNevermeltice:
	itemball NEVERMELTICE

IcefallCave2FFullRestore:
	itemball FULL_RESTORE

IcefallCave2F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  4,  4, ICEFALL_CAVE_1F, 4
	warp_event  5,  7, ICEFALL_CAVE_1F, 5
	warp_event  6,  4, ICEFALL_CAVE_1F, 6
	warp_event 12,  5, ICEFALL_CAVE_1F, 7
	warp_event  9,  7, ICEFALL_CAVE_1F, 8
	warp_event  5, 13, ICEFALL_CAVE_1F, 9
	warp_event  9, 19, ICEFALL_CAVE_1F, 10

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 15,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcefallCave2FNevermeltice, EVENT_ICEFALL_CAVE_2F_NEVERMELTICE
	object_event  6, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcefallCave2FFullRestore, EVENT_ICEFALL_CAVE_2F_FULL_RESTORE
	