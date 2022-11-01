	object_const_def ; object_event constants
	const GOLDENRODBIKESHOP_ROCKET
	const GOLDENRODBIKESHOP_ROCKET_GIRL
	const GOLDENRODBIKESHOP_ROCKER
	const GOLDENRODBIKESHOP_BURGLAR

GoldenrodBikeShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

GoldenrodBikeShopBicycle:
	jumptext GoldenrodBikeShopBicycleText

GoldenrodBlackMarketClerk1Script:
	faceplayer
	opentext
	checkflag ENGINE_HIVEBADGE
	iftrue .NewMart1
	pokemart MARTTYPE_SHADY, MART_GOLDENROD_BLACK_MARKET_3
	closetext
	end

.NewMart1:
	pokemart MARTTYPE_SHADY, MART_GOLDENROD_BLACK_MARKET_1
	closetext
	end

GoldenrodBlackMarketClerk2Script:
	faceplayer
	opentext
	checkflag ENGINE_HIVEBADGE
	iftrue .NewMart2
	pokemart MARTTYPE_SHADY, MART_GOLDENROD_BLACK_MARKET_4
	closetext
	end

.NewMart2:
	pokemart MARTTYPE_SHADY, MART_GOLDENROD_BLACK_MARKET_2
	closetext
	end

GoldenrodBlackMarketRocketScript:
	faceplayer
	opentext
	checkflag ENGINE_HIVEBADGE
	iftrue .SellDubiousDisk
	writetext BlackMarketRocketText
	waitbutton
	closetext
	end

.SellDubiousDisk:
	writetext BuyADubiousDiskText
	special PlaceMoneyTopRight
	yesorno
	iffalse .RefusedDubiousDisk
	checkmoney YOUR_MONEY, 3000
	ifequal HAVE_LESS, NoMoneyDubiousDisk
	giveitem DUBIOUSDISK
	iffalse NoRoomForDubiousDisk
	takemoney YOUR_MONEY, 3000
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext GotDubiousDiskText
	buttonsound
	itemnotify
	closetext
	end

.RefusedDubiousDisk:
	writetext RefusedDubiousDiskText
	waitbutton
	closetext
	end

NoMoneyDubiousDisk:
	writetext NoMoneyDubiousDiskText
	waitbutton
	closetext
	end

NoRoomForDubiousDisk:
	writetext NoRoomForDubiousDiskText
	waitbutton
	closetext
	end

GoldenrodBikeShopBurglarScript:
	faceplayer
	opentext
	checkflag ENGINE_HIVEBADGE
	iftrue .NewItems
	writetext BikeShopBurglarText1
	waitbutton
	closetext
	end

.NewItems:
	writetext BikeShopBurglarText2
	waitbutton
	closetext
	end

BlackMarketRocketText:
	text "The Upgrade is"
	line "said to have been"
	cont "made by reverse"

	para "engineering the"
	line "blueprints from"
	cont "Silph. It seems"

	para "to work fine."

	para "Right now, I'm"
	line "working on making"
	cont "a new form of"
	cont "upgrade."

	para "Come back later,"
	line "and I might be"
	cont "finished."
	done

BikeShopBurglarText1:
	text "I should be pro-"
	line "curing some new"
	cont "items for the shop"
	cont "soon."

	para "Stop on by later,"
	line "maybe when you"
	cont "have more badges."
	done

BikeShopBurglarText2:
	text "Looks like our"
	line "stock is complete."

	para "Go ahead, buy to"
	line "your heart's"
	cont "content!"
	done

GoldenrodBikeShopBicycleText:
	text "It's a box of"
	line "goods. Are they"
	cont "stolen?"
	done

BuyADubiousDiskText:
	text "Heh, heh, heh."

	para "I did it!"

	para "I made an improved"
	line "upgrade!"

	para "This'll power up"
	line "your Porygon, no"
	cont "problem!"

	para "It can be yours"
	line "for only ¥3,000!"
	done

RefusedDubiousDiskText:
	text "You're gonna"
	line "regret not"
	cont "buyin' this!"
	done

NoMoneyDubiousDiskText:
	text "Do I look like a"
	line "charity worker?"

	para "Come back with"
	line "the dough!"
	done

NoRoomForDubiousDiskText:
	text "You pullin' my leg"
	line "here?"

	para "Your Pack is full!"
	done

GotDubiousDiskText:
	text "<PLAYER> got the"
	line "DubiousDisk."
	done

GoldenrodBikeShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 2
	warp_event  3,  7, GOLDENROD_CITY, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event  1,  2, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  6,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  7,  6, BGEVENT_READ, GoldenrodBikeShopBicycle

	db 4 ; object events
	object_event  7,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodBlackMarketClerk1Script, -1
	object_event  0,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodBlackMarketClerk2Script, -1
	object_event  4,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodBlackMarketRocketScript, -1
	object_event  4,  6, SPRITE_PHARMACIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopBurglarScript, -1
