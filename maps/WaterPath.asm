	object_const_def ; object_event constants

WaterPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WaterPathSign:
	jumptext WaterPathSignText

WaterPathSignText:
	text "Water Path"

	para "North to Green"
	line "Path"

	para "South to Ruin"
	line "Valley"
	done

WaterPath_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8, 22, BGEVENT_READ, WaterPathSign

	db 0 ; object events
	