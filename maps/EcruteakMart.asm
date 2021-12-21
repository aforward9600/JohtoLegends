	object_const_def ; object_event constants
	const ECRUTEAKMART_CLERK
	const ECRUTEAKMART_SUPER_NERD
	const ECRUTEAKMART_GRANNY
	const ECRUTEAKMART_CLERK_2

EcruteakMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_ECRUTEAK
	closetext
	end

EcruteakMartBallClerkScript:
	opentext
	pokemart MARTTYPE_BALLS, MART_ECRUTEAK_BALLS
	closetext
	end

EcruteakMartSuperNerdScript:
	jumptextfaceplayer EcruteakMartSuperNerdText

EcruteakMartGrannyScript:
	jumptextfaceplayer EcruteakMartGrannyText

EcruteakMartSuperNerdText:
	text "My Eevee evolved"
	line "into an Espeon."

	para "But my friend's"
	line "Eevee turned into"
	cont "an Umbreon."

	para "I wonder why? We"
	line "both were raising"

	para "our Eevee in the"
	line "same way…"
	done

EcruteakMartGrannyText:
	text "Fast Balls help to"
	line "catch speedy #-"
	cont "mon, like Ponyta"

	para "or Voltorb. There"
	line "are a bunch more"
	cont "#mon they can"

	para "be used on!"
	done

EcruteakMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ECRUTEAK_CITY, 9
	warp_event  3,  7, ECRUTEAK_CITY, 9

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMartClerkScript, -1
	object_event  5,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakMartSuperNerdScript, -1
	object_event  6,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMartGrannyScript, -1
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMartBallClerkScript, -1
