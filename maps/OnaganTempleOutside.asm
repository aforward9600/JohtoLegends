	object_const_def ; object_event constants
	const ONAGANTEMPLEOUTSIDE_SCIENTIST

OnaganTempleOutside_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OnaganTempleOutsideScientistScript:
	jumptextfaceplayer OnaganTempleOutsideScientistText

OnaganTempleOutsideScientistText:
	text "These flowers were"
	line "planted like this"
	cont "deliberately."

	para "They appear to be"
	line "based on a deity"
	cont "revered by the"
	cont "native islanders."
	done

OnaganTempleOutside_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11,  5, ONAGAN_TEMPLE_INSIDE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  8, 11, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OnaganTempleOutsideScientistScript, -1
	