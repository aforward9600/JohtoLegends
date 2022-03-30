	object_const_def ; object_event constants
	const WILDAREA4_YOUNGSTER

WildArea4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildArea4Youngster:
	jumptextfaceplayer DontLikeSandText

WildArea4Sign:
	jumptext WildArea4SignText

DontLikeSandText:
	text "I don't like sand."

	para "It's coarse and"
	line "and rough and"
	cont "irritating and"
	cont "it gets every-"
	cont "where."

	para "So why am I"
	line "here?"

	para "I want a Cacnea."
	done

WildArea4SignText:
	text "Area 4"

	para "A man-made desert"
	line "for #mon to"
	cont "enjoy."
	done

WildArea4_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 13,  6, WILD_AREA_1, 7
	warp_event 13,  7, WILD_AREA_1, 8
	warp_event  6,  0, WILD_AREA_5, 3
	warp_event  7,  0, WILD_AREA_5, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 9, 2, BGEVENT_READ, WildArea4Sign

	db 1 ; object events
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, WildArea4Youngster, -1
