	object_const_def ; object_event constants
	const VERMILIONMART_CLERK
	const VERMILIONMART_SUPER_NERD
	const VERMILIONMART_BUENA

VermilionMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_VERMILION
	closetext
	end

VermilionMartSuperNerdScript:
	jumptextfaceplayer VermilionMartSuperNerdText

VermilionMartBuenaScript:
	jumptextfaceplayer VermilionMartBuenaText

VermilionMartSuperNerdText:
	text "That girl looking"
	line "at me is kinda"
	cont "cute."

	para "Maybe I should"
	line "talk to her."
	done

VermilionMartBuenaText:
	text "That soldier is"
	line "kinda cute, don't"
	cont "you think?"
	done

VermilionMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VERMILION_CITY, 5
	warp_event  3,  7, VERMILION_CITY, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMartClerkScript, -1
	object_event  5,  2, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionMartSuperNerdScript, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionMartBuenaScript, -1
