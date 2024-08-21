	object_const_def ; object_event constants
	const CERULEANMART_CLERK
	const CERULEANMART_COOLTRAINER_M
	const CERULEANMART_COOLTRAINER_F

CeruleanMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanMart_Clerk:
	opentext
	pokemart MARTTYPE_STANDARD, MART_CERULEAN
	closetext
	end

CeruleanMart_CooltrainerM:
	jumptextfaceplayer CeruleanMart_CooltrainerMText

CeruleanMart_CooltrainerF:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .CeruleanMart_CooltrainerF2
	jumptextfaceplayer CeruleanMart_CooltrainerFText

.CeruleanMart_CooltrainerF2:
	jumptextfaceplayer CeruleanMart_CooltrainerFText2

CeruleanMart_CooltrainerMText:
	text "These shops never"
	line "have the good"
	cont "stuff!"

	para "It's always potions"
	line "and junk!"

	para "Where're the video"
	line "games?"
	done

CeruleanMart_CooltrainerFText:
	text "Stealing would be"
	line "good for my image,"

	para "but my conscience"
	line "won't let me."
	done

CeruleanMart_CooltrainerFText2:
	text "I wasn't gonna"
	line "steal anything!"
	done

CeruleanMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CERULEAN_CITY, 5
	warp_event  3,  7, CERULEAN_CITY, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanMart_Clerk, -1
	object_event  1,  6, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, CeruleanMart_CooltrainerM, -1
	object_event  7,  2, SPRITE_DAISY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanMart_CooltrainerF, -1
