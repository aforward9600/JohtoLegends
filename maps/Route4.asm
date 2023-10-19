	object_const_def ; object_event constants
	const ROUTE4_YOUNGSTER
	const ROUTE4_LASS1
	const ROUTE4_LASS2
	const ROUTE4_POKE_BALL

Route4_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBikerRiver:
	trainer BIKER, RIVER, EVENT_BEAT_BIKER_RIVER, BikerRiverSeenText, BikerRiverBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerRiverAfterBattleText
	waitbutton
	closetext
	end

TrainerRoughneckTerrance:
	trainer ROUGHNECK, TERRANCE, EVENT_BEAT_ROUGHNECK_TERRANCE, RoughneckTerranceSeenText, RoughneckTerranceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RoughneckTerranceAfterBattleText
	waitbutton
	closetext
	end

TrainerDelinquentSharon:
	trainer DELINQUENT, SHARON, EVENT_BEAT_DELINQUENT_SHARON, DelinquentSharonSeenText, DelinquentSharonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DelinquentSharonAfterBattleText
	waitbutton
	closetext
	end

MtMoonSquareSign:
	jumptext MtMoonSquareSignText

CeruleanCaveSign:
	jumptext CeruleanCaveSignText

Route4HPUp:
	itemball HP_UP

Route4HiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_ROUTE_4_HIDDEN_ULTRA_BALL

BikerRiverSeenText:
	text "Bikes aren't made"
	line "for rough terrain"
	cont "like this!"
	done

BikerRiverBeatenText:
	text "Ack! I fell"
	line "over!"
	done

BikerRiverAfterBattleText:
	text "I scraped my knee!"

	para "That hurt like"
	line "heck!"
	done

RoughneckTerranceSeenText:
	text "Get outta here,"
	line "punk!"
	done

RoughneckTerranceBeatenText:
	text "Looks like I got"
	line "punked!"
	done

RoughneckTerranceAfterBattleText:
	text "Yeah, keep on"
	line "moving!"

	para "I went easy on ya!"
	done

DelinquentSharonSeenText:
	text "Hey there!"

	para "Up for a fight?"
	done

DelinquentSharonBeatenText:
	text "Not what I was"
	line "hoping for…"
	done

DelinquentSharonAfterBattleText:
	text "Looks like I'll be"
	line "staying out of"
	cont "your way."
	done

MtMoonSquareSignText:
	text "Mt.Moon Square"

	para "Just go up the"
	line "stairs."
	done

CeruleanCaveSignText:
	text "Cerulean Cave"

	para "A creature beyond"
	line "strength lies"
	cont "within."

	para "Only enter if you"
	line "don't value your"
	cont "life."
	done

Route4_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  5, MOUNT_MOON, 2
	warp_event 38,  3, CERULEAN_CAVE_1F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  3,  7, BGEVENT_READ, MtMoonSquareSign
	bg_event 10,  3, BGEVENT_ITEM, Route4HiddenUltraBall
	bg_event 37,  3, BGEVENT_READ, CeruleanCaveSign

	db 4 ; object events
	object_event 17,  9, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBikerRiver, -1
	object_event  9,  8, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 4, TrainerRoughneckTerrance, -1
	object_event 21,  6, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerDelinquentSharon, -1
	object_event 26,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route4HPUp, EVENT_ROUTE_4_HP_UP
