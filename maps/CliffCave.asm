	object_const_def ; object_event constants
	const CLIFFCAVE_SUPERNERD

CliffCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CliffCaveSuperNerdScript:
	jumptextfaceplayer CliffCaveSuperNerdText

CliffCaveSuperNerdText:
	text "Someday, I plan on"
	line "digging on down."

	para "There's said to be"
	line "a tower around"
	cont "here, but the way"
	cont "to it has been"
	cont "lost."

	para "I plan on finding"
	line "where it is!"
	done

CliffCave_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 15, ROUTE_47, 2
	warp_event  3, 13, CLIFF_CAVE, 3
	warp_event 13,  3, CLIFF_CAVE, 2
	warp_event 15,  7, ROUTE_47, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CliffCaveSuperNerdScript, -1
