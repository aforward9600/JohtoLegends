	object_const_def
	const HOOHLUGIAROOM_EIN
	const HOOHLUGIAROOM_HO_OH
	const HOOHLUGIAROOM_LUGIA

HoOhLugiaRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EinScript:
	jumptextfaceplayer EinText

HoOhTank:
	refreshscreen
	pokepic HO_OH
	cry HO_OH
	waitbutton
	closepokepic
	opentext
	writetext HoOhIsInPainText
	waitbutton
	closetext
	end

LugiaTank:
	refreshscreen
	pokepic LUGIA
	cry LUGIA
	waitbutton
	closepokepic
	opentext
	writetext LugiaIsInPainText
	waitbutton
	closetext
	end

HoOhIsInPainText:
	text "Ho-Oh looks like"
	line "it's in pain…"
	done

LugiaIsInPainText:
	text "Lugia looks like"
	line "it's in pain…"
	done

EinText:
	text "Testing."
	done

HoOhLugiaRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 11, WISE_TRIOS_ROOM, 1
	warp_event  6, 11, WISE_TRIOS_ROOM, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  2, BGEVENT_READ, HoOhTank
	bg_event  8,  2, BGEVENT_READ, LugiaTank

	db 3 ; object events
	object_event  5,  7, SPRITE_EIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EinScript, EVENT_HIDEOUT_EIN
	object_event  4,  1, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_HO_OH
	object_event  8,  1, SPRITE_LUGIA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_LUGIA
