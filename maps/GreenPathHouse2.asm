	object_const_def ; object_event constants
	const GREENPATHHOUSE2_BUG_CATCHER
	const GREENPATHHOUSE2_LASS

GreenPathHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GreenPathHouse2BugCatcherScript:
	jumptextfaceplayer GreenPathHouse2BugCatcherText

GreenPathHouse2LassScript:
	jumptextfaceplayer GreenPathHouse2LassText

GreenPathHouse2BugCatcherText:
	text "Apparently the"
	line "woods to the west"
	cont "will be overgrown"
	cont "and full of Bug"
	cont "#mon someday."

	para "I can't wait!"
	done

GreenPathHouse2LassText:
	text "I love Bug"
	line "#mon like"
	cont "Heracross!"
	done

GreenPathHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, GREEN_PATH, 2
	warp_event  5,  7, GREEN_PATH, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  6,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GreenPathHouse2BugCatcherScript, -1
	object_event  3,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GreenPathHouse2LassScript, -1
