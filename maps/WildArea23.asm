	object_const_def ; object_event constants
	const WILDAREA23_COOLTRAINER_F

WildArea23_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildArea23CooltrainerScript:
	jumptextfaceplayer WildArea23CooltrainerText

WildArea2Sign:
	jumptext WildArea2SignText

WildArea23CooltrainerText:
	text "The #mon here"
	line "are quite cute,"
	cont "don't you think?"
	done

WildArea2SignText:
	text "Area 2"

	para "Home of the field"
	line "#mon that were"
	cont "kicked out of Area"
	cont "1."
	done

WildArea23_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6,  5, WILD_AREA_CAVE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  6, BGEVENT_READ, WildArea2Sign

	db 1 ; object events
	object_event  7, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildArea23CooltrainerScript, -1
