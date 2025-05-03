	object_const_def ; object_event constants
	const WILDAREA23_COOLTRAINER_F
	const WILDAREA23_FISHER

WildArea23_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildArea23CooltrainerScript:
	jumptextfaceplayer WildArea23CooltrainerText

WildArea23FisherScript:
	jumptextfaceplayer WildArea23FisherText

WildArea2Sign:
	jumptext WildArea2SignText

WildArea3Sign:
	jumptext WildArea3SignText

WildArea23CooltrainerText:
	text "The #mon here"
	line "are quite cute,"
	cont "don't you think?"
	done

WildArea23FisherText:
	text "There's no tall"
	line "grass here, but"
	cont "enough water to"

	para "fill up a tackle"
	line "box with #mon!"
	done

WildArea2SignText:
	text "Area 2"

	para "Home of the field"
	line "#mon that were"
	cont "kicked out of Area"
	cont "1."
	done

WildArea3SignText:
	text "Area 3"

	para "Surf and fish to"
	line "your heart's"
	cont "content."
	done

WildArea23_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 14, 18, WILD_AREA_1, 3
	warp_event 14, 19, WILD_AREA_1, 4
	warp_event  6, 11, WILD_AREA_1, 5
	warp_event  7, 11, WILD_AREA_1, 6
	warp_event 20, 13, WILD_AREA_CAVE, 1
	warp_event 13,  3, WILD_AREA_CAVE, 2
	warp_event  0,  4, WILD_AREA_5, 1
	warp_event  0,  5, WILD_AREA_5, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 18, 14, BGEVENT_READ, WildArea2Sign
	bg_event  5,  5, BGEVENT_READ, WildArea3Sign

	db 2 ; object events
	object_event 21, 20, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildArea23CooltrainerScript, -1
	object_event  9,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildArea23FisherScript, -1
