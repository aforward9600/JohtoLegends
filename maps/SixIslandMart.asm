	object_const_def ; object_event constants
	const SIXISLANDMART_CLERK
	const SIXISLANDMART_HIKER

SixIslandMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SixIslandMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_SIX_ISLAND
	closetext
	end

SixIslandMartHikerScript:
	jumptextfaceplayer SixIslandMartHikerText

SixIslandMartHikerText:
	text "The cave to the"
	line "north is pretty"
	cont "empty."

	para "It's unfortunate,"
	line "as a Hiker."
	done

SixIslandMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SIX_ISLAND, 4
	warp_event  3,  7, SIX_ISLAND, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SixIslandMartClerkScript, -1
	object_event  2,  5, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SixIslandMartHikerScript, -1
