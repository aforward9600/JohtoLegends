	object_const_def ; object_event constants
	const FUCHSIAMART_CLERK
	const FUCHSIAMART_FISHER
	const FUCHSIAMART_COOLTRAINER_F

FuchsiaMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FuchsiaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_FUCHSIA
	closetext
	end

FuchsiaMartFisherScript:
	jumptextfaceplayer FuchsiaMartFisherText

FuchsiaMartCooltrainerFScript:
	jumptextfaceplayer FuchsiaMartCooltrainerFText

FuchsiaMartFisherText:
	text "Sad to see the"
	line "Safari Zone all"
	cont "closed up…"

	para "Stupid Feds!"
	done

FuchsiaMartCooltrainerFText:
	text "Baoba is a good"
	line "friend of mine."

	para "It's not right,"
	line "what happened to"
	cont "his life's work…"
	done

FuchsiaMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, FUCHSIA_CITY, 1
	warp_event  3,  7, FUCHSIA_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaMartClerkScript, -1
	object_event  3,  2, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaMartFisherScript, -1
	object_event  7,  6, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaMartCooltrainerFScript, -1
