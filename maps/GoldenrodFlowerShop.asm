	object_const_def ; object_event constants
	const GOLDENRODFLOWERSHOP_TEACHER
	const GOLDENRODFLOWERSHOP_FLORIA

GoldenrodFlowerShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FlowerShopFlorinasHusbandScript:
	faceplayer
	opentext
	checkevent EVENT_CURRENTLY_CHAMPION
	iftrue .BerryMart1
	writetextend GoldenrodFlowerShopFlorinasHusbandText

.BerryMart1
	pokemart MARTTYPE_BERRIES_1, MART_BERRIES_1
	closetext
	end

FlowerShopFlorinasDaughterScript:
	faceplayer
	opentext
	checkevent EVENT_CURRENTLY_CHAMPION
	iftrue .BerryMart2
	writetextend GoldenrodFlowerShopFlorinasDaughterText

.BerryMart2
	pokemart MARTTYPE_BERRIES_2, MART_BERRIES_2
	closetext
	end

GoldenrodFlowerShopFlorinasHusbandText:
	text "My wife's current"
	line "job keeps her"
	cont "away from home."

	para "She comes back"
	line "every once and a"
	cont "while, but I hope"

	para "she can open up"
	line "that flower shop"

	para "she always talked"
	line "about."

	para "That way she can"
	line "spend time at"
	cont "home!"
	done

GoldenrodFlowerShopFlorinasDaughterText:
	text "My mommy really"
	line "likes flowers, and"

	para "so do I!"

	para "Maybe someday we"
	line "can open our own"
	cont "flower shop!"
	done

GoldenrodFlowerShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopFlorinasHusbandScript, -1
	object_event  5,  6, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FlowerShopFlorinasDaughterScript, -1
