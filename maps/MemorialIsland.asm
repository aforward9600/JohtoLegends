	object_const_def ; object_event constants

MemorialIsland_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MemorialIslandGrave:
	jumptext MemorialIslandGraveText

MemorialIslandGraveText:
	text "My dear friend"
	line "Rocky"

	para "6.23.11-6.10.25"
	done

MemorialIsland_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11, 24, BGEVENT_READ, MemorialIslandGrave

	db 0 ; object events
	