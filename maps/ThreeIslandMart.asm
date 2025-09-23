	object_const_def ; object_event constants
	const THREEISLANDMART_CLERK
	const THREEISLANDMART_COOLTRAINER_M

ThreeIslandMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ThreeIslandMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_THREE_ISLAND
	closetext
	end

ThreeIslandMartCooltrainerMScript:
	jumptextfaceplayer ThreeIslandMartCooltrainerMText

ThreeIslandMartCooltrainerMText:
	text "This was the first"
	line "mart in the Sevii"
	cont "Islands."
	done

ThreeIslandMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, THREE_ISLAND, 4
	warp_event  3,  7, THREE_ISLAND, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThreeIslandMartClerkScript, -1
	object_event  2,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ThreeIslandMartCooltrainerMScript, -1
