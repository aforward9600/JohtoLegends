	object_const_def ; object_event constants
	const WILDAREA7_LASS

WildArea7_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildArea7Lass:
	jumptextfaceplayer WildArea7LassText

WildArea7Sign:
	jumptext WildArea7SignText

WildArea7LassText:
	text "There are #mon"
	line "from all over the"
	cont "world here."

	para "They say they are"
	line "invasive."
	done

WildArea7SignText:
	text "Area 7"

	para "Invasive species"
	line "are contained"
	cont "here."
	done

WildArea7_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8,  4, BGEVENT_READ, WildArea7Sign

	db 1 ; object events
	object_event  1,  4, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildArea7Lass, -1
