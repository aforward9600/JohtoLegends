	object_const_def ; object_event constants
	const BILLSBROTHERSHOUSE_POKEFAN_F
	const BILLSBROTHERSHOUSE_YOUNGSTER

BillsBrothersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillsBrothersHousePokefanFScript:
	checkevent EVENT_BEAT_KOGA
	iftrue .BillsBrothersHousePokefanF2
	jumptextfaceplayer BillsBrothersHousePokefanFText

.BillsBrothersHousePokefanF2:
	jumptextfaceplayer BillsBrothersHousePokefanFText2

BillsBrothersHouseLassScript:
	jumptextfaceplayer BillsBrothersHouseLassText

BillsBrothersHousePokefanFText:
	text "I really wish the"
	line "ninjas could have"
	cont "done more during"
	cont "the Feds invasion."
	done

BillsBrothersHousePokefanFText2:
	text "Looks like the"
	line "ninjas will play"
	cont "a bigger part in"
	cont "protecting the"
	cont "town."

	para "That's all we could"
	line "ask of them, in"
	cont "all honesty."
	done

BillsBrothersHouseLassText:
	text "I wanna go"
	line "swimming on Route"
	cont "19!"
	done

BillsBrothersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, FUCHSIA_CITY, 4
	warp_event  3,  7, FUCHSIA_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BillsBrothersHousePokefanFScript, -1
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsBrothersHouseLassScript, -1
