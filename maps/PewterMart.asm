	object_const_def ; object_event constants
	const PEWTERMART_CLERK
	const PEWTERMART_YOUNGSTER
	const PEWTERMART_SUPER_NERD

PewterMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PewterMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_PEWTER
	closetext
	end

PewterMartYoungsterScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .PewterMartYoungster2
	jumptextfaceplayer PewterMartYoungsterText

.PewterMartYoungster2:
	jumptextfaceplayer PewterMartYoungsterText2

PewterMartSuperNerdScript:
	jumptextfaceplayer PewterMartSuperNerdText

PewterMartYoungsterText:
	text "The Feds generally"
	line "don't mess with"
	cont "the Marts."

	para "They usually just"
	line "extort them."
	done

PewterMartYoungsterText2:
	text "Looks like the"
	line "Marts won't be"
	cont "extorted any more."
	done

PewterMartSuperNerdText:
	text "Those Feds hurt"
	line "my #mon!"

	para "I need some items"
	line "to heal them!"
	done

PewterMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PEWTER_CITY, 3
	warp_event  3,  7, PEWTER_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMartClerkScript, -1
	object_event  9,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterMartYoungsterScript, -1
	object_event  6,  6, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterMartSuperNerdScript, -1
