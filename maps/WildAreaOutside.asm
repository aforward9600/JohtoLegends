	object_const_def ; object_event constants

WildAreaOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.Flypoint:
	setflag ENGINE_FLYPOINT_WILD_AREA

WildAreaOutsideSign:
	jumptext WildAreaOutsideSignText

WildAreaOutsideSignText:
	text "Wild Area"

	para "Catch #mon to"
	line "your heart's"
	cont "content!"
	done

WildAreaOutside_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5, 13, WILD_AREA_POKECENTER, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7,  4, BGEVENT_READ, WildAreaOutsideSign

	db 0 ; object events
