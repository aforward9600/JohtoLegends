	object_const_def ; object_event constants
	const TWOISLANDPORT_SAILOR

TwoIslandPort_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TwoIslandPortSailorScript:
	jumptextfaceplayer TwoIslandPortSailorText

TwoIslandPortSailorText:
	text "Boat not running."
	done

TwoIslandPort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  0, TWO_ISLAND, 1
	warp_event  5,  0, TWO_ISLAND, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TwoIslandPortSailorScript, -1
	