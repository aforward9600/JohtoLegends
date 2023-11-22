	object_const_def ; object_event constants
	const CLIFFCAVE_SUPERNERD

CliffCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CliffCaveSuperNerdScript:
	jumptextfaceplayer CliffCaveSuperNerdText

CliffCaveSuperNerdText:
	text "I dug down through"
	line "the dirt, and now"
	cont "there's a way to"
	cont "the lower cliffs!"
	done

CliffCave_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event  5,  5, ROUTE_47, 2
	warp_event  3,  3, CLIFF_CAVE, 3
	warp_event 17,  3, CLIFF_CAVE, 2
	warp_event 19,  7, ROUTE_47, 3
	warp_event  6,  3, CLIFF_CAVE, 6
	warp_event 11, 13, CLIFF_CAVE, 5
	warp_event 11, 19, ROUTE_47_UNDERPASS, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CliffCaveSuperNerdScript, -1
