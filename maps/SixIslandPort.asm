	object_const_def ; object_event constants
	const SIXISLANDPORT_SAILOR

SixIslandPort_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SixIslandPortSailorScript:
	jumptextfaceplayer SixIslandPortSailorText

SixIslandPortSailorText:
	text "Boat not running."
	done

SixIslandPort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  0, SIX_ISLAND, 1
	warp_event  5,  0, SIX_ISLAND, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SixIslandPortSailorScript, -1
	