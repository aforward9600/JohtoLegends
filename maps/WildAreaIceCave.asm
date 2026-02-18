	object_const_def ; object_event constants
	const WILDAREAICECAVE_SKIER

WildAreaIceCave_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildAreaIceCaveSkier:
	jumptextfaceplayer WildAreaIceCaveSkierText

WildAreaIceCaveSign:
	jumptext WildAreaIceCaveSignText

WildAreaIceCaveSkierText:
	text "The Sneasel here"
	line "look different"
	cont "depending on the"

	para "time of day."
	done

WildAreaIceCaveSignText:
	text "Wild Area Ice Cave"

	para "Cold all year"
	line "round for Ice"
	cont "types."
	done

WildAreaIceCave_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 11, WILD_AREA_CAVE, 3
	warp_event  2,  6, WILD_AREA_6, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 6, 7, BGEVENT_READ, WildAreaIceCaveSign

	db 1 ; object events
	object_event  9,  6, SPRITE_SKIER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildAreaIceCaveSkier, -1
