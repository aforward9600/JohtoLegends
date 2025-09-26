	object_const_def ; object_event constants
	const FOURISLANDMART_CLERK
	const FOURISLANDMART_BEAUTY

FourIslandMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FourIslandMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_FOUR_ISLAND
	closetext
	end

FourIslandMartBeautyScript:
	jumptextfaceplayer FourIslandMartBeautyText

FourIslandMartBeautyText:
	text "Full Heals are"
	line "useful for Icefall"
	cont "Cave."
	done

FourIslandMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, FOUR_ISLAND, 5
	warp_event  3,  7, FOUR_ISLAND, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FourIslandMartClerkScript, -1
	object_event  2,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FourIslandMartBeautyScript, -1
