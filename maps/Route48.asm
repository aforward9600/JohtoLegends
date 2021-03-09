	object_const_def ; object_event constants

Route48_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route48Sign:
	jumptext Route48SignText

Route48SignText:
	text "Route 48"
	line "Route 47 -"
	cont "Wild Area"
	done

Route48_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 20,  8, BGEVENT_READ, Route48Sign

	db 0 ; object events
