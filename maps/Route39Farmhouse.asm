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
	checkitem MOOMOO_MILK
	iftrue FarmerFScript_Milking
	writetext FarmerFText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse FarmerFScript_NoSale
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	ifequal HAVE_LESS, FarmerFScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse FarmerFScript_NoRoom
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerFText_GotMilk
	buttonsound
	itemnotify
	closetext
	end

FarmerFScript_NoMoney:
	writetext FarmerFText_NoMoney
	waitbutton
	closetext
	end

FarmerFScript_NoRoom:
	writetext FarmerFText_NoRoom
	waitbutton
	closetext
	end

FarmerFScript_NoSale:
	writetext FarmerFText_NoSale
	waitbutton
	closetext
	end

FarmerFScript_Milking:
	writetext FarmerFText_Milking
	waitbutton
	closetext
	end

Route39FarmhouseGrannyScript:
	jumptextfaceplayer GrannyText_InTrouble

FarmhouseBookshelf:
	jumpstd picturebookshelf

FarmerMText_SickCow:
	text "My MILTANK ain't"
	line "givin' me milk"
	cont "n'more."

	para "This here FARM's"
	line "got famous milk."

	para "Most everyone"
	line "wants a drink."

	para "It'll give me lots"
	line "o' milk if'n I"

	para "feed it lots o'"
	line "BERRIES, I reckon."
	done

FarmerFText_BuyMilk:
	text "Howdy!"

	para "Would ya like some"
	line "MooMoo Milk?"

	para "Give it to #mon"
	line "to restore HP!"

	para "I'll give it to ya"
	line "for just ¥500."
	done

FarmerFText_GotMilk:
	text "Here ya go, honey!"
	line "Drink up'n enjoy!"
	done

FarmerFText_NoMoney:
	text "Sorry, there."
	line "No cash, no sale!"
	done

FarmerFText_NoRoom:
	text "I reckon yer"
	line "Pack's full."
	done

FarmerFText_NoSale:
	text "You don't want it?"
	line "Come again, hear?"
	done

FarmerFText_Milking:
	text "I'd best see if"
	line "he's got any more"
	cont "milk."
	done

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
