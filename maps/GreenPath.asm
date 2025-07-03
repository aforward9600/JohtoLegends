	object_const_def ; object_event constants

GreenPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GreenPathSign:
	jumptext GreenPathSignText

GreenPathSignText:
	text "Green Path"

	para "South to Water"
	line "Path"

	para "West to Outcast"
	line "Island"
	done

GreenPath_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 58,  8, BGEVENT_READ, GreenPathSign

	db 0 ; object events
	