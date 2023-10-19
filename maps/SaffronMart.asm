	object_const_def ; object_event constants
	const SAFFRONMART_CLERK
	const SAFFRONMART_COOLTRAINER_M
	const SAFFRONMART_COOLTRAINER_F

SaffronMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SaffronMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_SAFFRON
	closetext
	end

SaffronMartCooltrainerMScript:
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronMartCooltrainerM2
	jumptextfaceplayer SaffronMartCooltrainerMText

.SaffronMartCooltrainerM2:
	jumptextfaceplayer SaffronMartCooltrainerMText2

SaffronMartCooltrainerFScript:
	jumptextfaceplayer SaffronMartCooltrainerFText

SaffronMartCooltrainerMText:
	text "I would've fought"
	line "the Feds alongside"
	cont "Koichi if he hadn't"
	cont "surrendered."
	done

SaffronMartCooltrainerMText2:
	text "Let's hope Koichi"
	line "doesn't flake"
	cont "this time."
	done

SaffronMartCooltrainerFText:
	text "Same-old same-old…"

	para "Every day's the"
	line "same here…"
	done

SaffronMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFFRON_CITY, 3
	warp_event  3,  7, SAFFRON_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronMartClerkScript, -1
	object_event  7,  2, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronMartCooltrainerMScript, -1
	object_event  7,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronMartCooltrainerFScript, -1
