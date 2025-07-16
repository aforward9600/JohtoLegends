	object_const_def ; object_event constants
	const SEVENISLANDPORT_SAILOR

SevenIslandPort_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SevenIslandPortSailorScript:
	jumptextfaceplayer SevenIslandPortSailorText

SevenIslandPortSailorText:
	text "Boat not running."
	done

SevenIslandPort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  0, SEVEN_ISLAND, 1
	warp_event  5,  0, SEVEN_ISLAND, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SevenIslandPortSailorScript, -1
	