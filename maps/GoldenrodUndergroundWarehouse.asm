	object_const_def ; object_event constants

GoldenrodUndergroundWarehouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodUndergroundWarehouse_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 2
	warp_event  3, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 3
	warp_event 17,  2, GOLDENROD_DEPT_STORE_B1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events