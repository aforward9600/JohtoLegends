	object_const_def ; object_event constants
	const VIRIDIANMART_CLERK
	const VIRIDIANMART_LASS
	const VIRIDIANMART_COOLTRAINER_M

ViridianMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VIRIDIAN
	closetext
	end

ViridianMartLassScript:
	jumptextfaceplayer ViridianMartLassText

ViridianMartCooltrainerMScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .ViridianMartCooltrainerMScript2
	jumptextfaceplayer ViridianMartCooltrainerMText

.ViridianMartCooltrainerMScript2:
	jumptextfaceplayer ViridianMartCooltrainerMText2

ViridianMartLassText:
	text "Hope there's"
	line "enough medicine"
	cont "to go around."

	para "#mon Centers"
	line "are free, but you"
	cont "can't be too"
	cont "careful."
	done

ViridianMartCooltrainerMText:
	text "Even Cooltrainers"
	line "like me need items"
	cont "to keep our"
	cont "#mon healthy."

	para "Ya never know when"
	line "one of those goons"
	cont "will jump you."
	done

ViridianMartCooltrainerMText2:
	text "With the Feds all"
	line "gone, I don't need"
	cont "to buy items!"

	para "Eh, on second"
	line "thought, I probably"
	cont "should anyway."
	done

ViridianMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VIRIDIAN_CITY, 4
	warp_event  3,  7, VIRIDIAN_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartClerkScript, -1
	object_event  9,  2, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartLassScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianMartCooltrainerMScript, -1
