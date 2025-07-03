	object_const_def ; object_event constants

ResortGorgeous_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ResortGorgeousSign:
	jumptext ResortGorgeousSignText

ResortGorgeousSignText:
	text "Selphy's house"
	done

ResortGorgeous_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 25,  9, SELPHYS_HOUSE, 1
	warp_event 42,  9, LOST_CAVE_ENTRANCE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 26, 10, BGEVENT_READ, ResortGorgeousSign

	db 0 ; object events
	