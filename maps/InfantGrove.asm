	object_const_def
	const INFANTGROVE_LASS

InfantGrove_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

InfantGroveLassScript:
	jumptextfaceplayer InfantGroveLassText

InfantGroveSign:
	jumptext InfantGroveSignText

InfantGroveSignText:
	text "Infant Grove"

	para "Baby #mon free"
	line "to a good home."
	done

InfantGroveLassText:
	text "Oh! Sorry, we don't"
	line "get many visitors."

	para "Abandoned #mon"
	line "live here, but I"
	cont "sense a kind heart"
	cont "in you."

	para "Please take good"
	line "care of any"
	cont "#mon you catch."
	done

InfantGrove_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  3, BGEVENT_READ, InfantGroveSign

	db 1 ; object events
	object_event  5,  6, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, InfantGroveLassScript, -1
