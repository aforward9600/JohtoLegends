	object_const_def ; object_event constants
	const GOLDENRODBIKESHOP_ROCKET
	const GOLDENRODBIKESHOP_ROCKET_GIRL
	const GOLDENRODBIKESHOP_ROCKER

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
	pokemart MARTTYPE_SHADY, MART_GOLDENROD_BLACK_MARKET_1
	closetext
	end

GoldenrodBlackMarketClerk2Script:
	faceplayer
	opentext
	pokemart MARTTYPE_SHADY, MART_GOLDENROD_BLACK_MARKET_2
	closetext
	end

GoldenrodBlackMarketRocketScript:
	faceplayer
	opentext
	writetext BlackMarketRocketText
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

	para "to work fine, but"
	line "that DubiousDisk."

	para "It was made by"
	line "someone who attem-"
	cont "ted to further"

	para "evolve Porygon."
	line "No idea what went"
	cont "wrong there."
	done

GoldenrodBikeShopBicycleText:
	text "It's a box of"
	line "goods. Are they"
	cont "stolen?"
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

	db 3 ; object events
	object_event  7,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodBlackMarketClerk1Script, -1
	object_event  0,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodBlackMarketClerk2Script, -1
	object_event  4,  2, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodBlackMarketRocketScript, -1
