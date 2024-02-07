ROUTE39FARMHOUSE_MILK_PRICE EQU 500

	object_const_def ; object_event constants
	const ROUTE39FARMHOUSE_POKEFAN_F
	const ROUTE39FARMHOUSE_GRANNY

Route39Farmhouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FarmerFScript_SellMilk:
	faceplayer
	opentext
	pokemart MARTTYPE_MOOMOO_MILK, MART_MOOMOO_MILK
	closetext
	end

Route39FarmhouseGrannyScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .Route39FarmhouseGranny2
	jumptextfaceplayer GrannyText_InTrouble

.Route39FarmhouseGranny2:
	jumptextfaceplayer GrannyText_GoodJob

FarmhouseBookshelf:
	jumpstd picturebookshelf

GrannyText_InTrouble:
	text "My son took over"
	line "his father's farm"
	cont "after his passing,"

	para "but we've never"
	line "experienced this"
	cont "kind of hardship"
	cont "before."

	para "Those idiots over"
	line "in Kanto, letting"
	cont "their region get"
	cont "overrun by a"
	cont "bunch of trouble-"
	cont "makers!"

	para "If I were younger,"
	line "I'd kick all their"
	cont "butts so we could"
	cont "sell milk again!"
	done

GrannyText_GoodJob:
	text "I've heard you were"
	line "the one who took"
	cont "on those idiots in"
	cont "Kanto."

	para "Good on you!"

	para "We can start"
	line "selling milk there"
	cont "again!"
	done

Route39Farmhouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, FarmhouseBookshelf
	bg_event  1,  1, BGEVENT_READ, FarmhouseBookshelf

	db 2 ; object events
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FarmerFScript_SellMilk, -1
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39FarmhouseGrannyScript, -1
