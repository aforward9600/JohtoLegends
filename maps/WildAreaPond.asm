	object_const_def ; object_event constants
	const WILDAREAPOND_FISHER

WildAreaPond_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildArea23FisherScript:
	jumptextfaceplayer WildArea23FisherText

WildArea3Sign:
	jumptext WildArea3SignText

WildArea23FisherText:
	text "There's no tall"
	line "grass here, but"
	cont "enough water to"

	para "fill up a tackle"
	line "box with #mon!"
	done

WildArea3SignText:
	text "Area 3"

	para "Surf and fish to"
	line "your heart's"
	cont "content."
	done

WildAreaPond_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11, 7, WILD_AREA_CAVE, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  7, BGEVENT_READ, WildArea3Sign

	db 1 ; object events
	object_event  8,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildArea23FisherScript, -1
