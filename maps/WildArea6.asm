	object_const_def ; object_event constants
	const WILDAREA6_CAMPER

WildArea6_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildArea6CamperScript:
	jumptextfaceplayer WildArea6CamperText

WildArea6Sign:
	jumptext WildArea6SignText

WildArea6CamperText:
	text "It's too wet here"
	line "to camp!"

	para "Plus these weird-"
	line "looking Wooper"
	cont "keep poisoning"
	cont "my #mon!"
	done

WildArea6SignText:
	text "Area 6"

	para "Wetlands for"
	line "wetland #mon."
	done

WildArea6_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11,  5, WILD_AREA_ICE_CAVE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 4,  8, BGEVENT_READ, WildArea6Sign

	db 1 ; object events
	object_event  6,  3, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildArea6CamperScript, -1
