	object_const_def ; object_event constants
	const FOURISLANDHOUSE2_HIKER

FourIslandHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FourIslandHouse2HikerScript:
	jumptextfaceplayer FourIslandHouse2HikerText

FourIslandHouse2HikerText:
	text "Icefall Cave is"
	line "cold, as the name"
	cont "implies."
	done

FourIslandHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FOUR_ISLAND, 7
	warp_event  5,  7, FOUR_ISLAND, 7

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  3, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FourIslandHouse2HikerScript, -1
