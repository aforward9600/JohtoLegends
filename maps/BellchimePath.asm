	object_const_def
	const BELLCHIMEPATH_ENOKI_WALK
	const BELLCHIMEPATH_ENOKI_PANIC

BellchimePath_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .EnokiThursday

.EnokiThursday:
	checkevent EVENT_BELLCHIME_PATH_ENOKI_PANIC
	iftrue .EnokiCanAppear
	disappear BELLCHIMEPATH_ENOKI_WALK
	return

.EnokiCanAppear:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .IsItThursday
	disappear BELLCHIMEPATH_ENOKI_WALK
	return

.IsItThursday:
	 readvar VAR_WEEKDAY
	 ifequal THURSDAY, .EnokiAppears
	 disappear BELLCHIMEPATH_ENOKI_WALK
	 return

.EnokiAppears:
	appear BELLCHIMEPATH_ENOKI_WALK
	return

BellchimePathEnokiWalkScript:
	jumptextfaceplayer EnokiWalkText

BellchimePathEnokiPanicScript:
	jumptextfaceplayer EnokiPanicText

BellchimePathSign:
	jumptext BellchimePathSignText

BellchimePathSignText:
	text "Bell Tower"

	para "A legendary #-"
	line "mon is said to"
	cont "roost here."
	done

EnokiWalkText:
	text "Good to see you,"
	line "<PLAYER>."

	para "I am simply enjoy-"
	line "ing a nice walk."

	para "It's good to get"
	line "exercise when you"
	cont "get to be my age!"
	done

EnokiPanicText:
	text "Urgh…"

	para "Thank goodness"
	line "you're here."

	para "Those people in"
	line "black have"
	cont "returned…"

	para "I was no match for"
	line "their numbers…"

	para "Please help us…"
	done

BellchimePath_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  8,  2, WISE_TRIOS_ROOM, 1
	warp_event  8,  3, WISE_TRIOS_ROOM, 2
	warp_event 25,  7, TIN_TOWER_1F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 26, 10, BGEVENT_READ, BellchimePathSign

	db 2 ; object events
	object_event 22,  7, SPRITE_ENOKI, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BellchimePathEnokiWalkScript, EVENT_BELLCHIME_PATH_ENOKI_WALK
	object_event 23,  7, SPRITE_ENOKI, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BellchimePathEnokiPanicScript, EVENT_BELLCHIME_PATH_ENOKI_PANIC
