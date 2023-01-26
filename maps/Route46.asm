	object_const_def ; object_event constants
	const ROUTE46_HIKER
	const ROUTE46_YOUNGSTER
	const ROUTE46_LASS
	const ROUTE46_FRUIT_TREE1
	const ROUTE46_FRUIT_TREE2
	const ROUTE46_POKE_BALL

Route46_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearRocksRoute46

.ClearRocksRoute46:
	checkevent EVENT_SPOKE_WITH_ELM
	iftrue .Done
	changeblock 10, 16, $0a ; rock
	changeblock 10, 14, $0a ; rock
.Done:
	return

TrainerCamperJaoquin:
	trainer CAMPER, JAOQUIN, EVENT_BEAT_CAMPER_JAOQUIN, CamperJaoquinSeenText, CamperJaoquinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJaoquinAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerBarbara:
	trainer PICNICKER, BARBARA, EVENT_BEAT_PICNICKER_BARBARA, PicnickerBarbaraSeenText, PicnickerBarbaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerBarbaraAfterBattleText
	waitbutton
	closetext
	end

Route46HikerScript:
	faceplayer
	opentext
	checkevent EVENT_SPOKE_WITH_ELM
	iftrue .HikerRocksCleared
	writetext Route46HikerText
	waitbutton
	closetext
	end

.HikerRocksCleared:
	writetext Route46HikerText_RocksCleared
	waitbutton
	closetext
	end

Route46Sign:
	jumptext Route46SignText

Route46RareCandy:
	itemball RARE_CANDY

Route46FruitTree1:
	fruittree FRUITTREE_ROUTE_46_1

Route46FruitTree2:
	fruittree FRUITTREE_ROUTE_46_2

CamperJaoquinSeenText:
	text "A nice camping"
	line "trip near Dark"
	cont "Cave is just what"
	cont "I needed!"
	done

CamperJaoquinBeatenText:
	text "Wha…?"
	done

CamperJaoquinAfterBattleText:
	text "I've seen some"
	line "strange people in"
	cont "black clothes come"
	cont "and go into the"
	cont "cave recently."

	para "Maybe they're"
	line "scientists?"
	done

PicnickerBarbaraSeenText:
	text "I don't recommend"
	line "picnicking in Dark"
	cont "Cave!"

	para "Why?"

	para "Because it's dark,"
	line "of course!"
	done

PicnickerBarbaraBeatenText:
	text "Too bright!"
	done

PicnickerBarbaraAfterBattleText:
	text "There're also some"
	line "#mon that would"
	cont "eat the food."
	done

Route46SignText:
	text "Route 46"
	line "Mountain Rd. Ahead"
	done

Route46HikerText:
	text "These rocks will"
	line "be cleared soon."

	para "Come back later."
	done

Route46HikerText_RocksCleared:
	text "Finally got those"
	line "rocks cleared."

	para "You're good to go."
	done

Route46_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7, 33, ROUTE_29_ROUTE_46_GATE, 1
	warp_event  8, 33, ROUTE_29_ROUTE_46_GATE, 2
	warp_event 14,  5, DARK_CAVE_VIOLET_ENTRANCE, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9, 27, BGEVENT_READ, Route46Sign

	db 6 ; object events
	object_event 11, 18, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, Route46HikerScript, -1
	object_event 15,  8, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperJaoquin, -1
	object_event  3, 14, SPRITE_PICNICKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerBarbara, -1
	object_event  7,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route46FruitTree1, -1
	object_event  8,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route46FruitTree2, -1
	object_event  1, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route46RareCandy, EVENT_ROUTE_46_RARE_CANDY
