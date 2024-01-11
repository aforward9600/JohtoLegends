	object_const_def ; object_event constants
	const ROUTE18_YOUNGSTER1
	const ROUTE18_YOUNGSTER2

Route18_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperBoris:
	trainer BIRD_KEEPER, BORIS, EVENT_BEAT_BIRD_KEEPER_BORIS, BirdKeeperBorisSeenText, BirdKeeperBorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBorisAfterBattleText
	waitbutton
	closetext
	end

TrainerRoughneckMoe:
	trainer ROUGHNECK, MOE, EVENT_BEAT_ROUGHNECK_MOE, RoughneckMoeSeenText, RoughneckMoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RoughneckMoeAfterBattleText
	waitbutton
	closetext
	end

Route18Sign:
	jumptext Route18SignText

BirdKeeperBorisSeenText:
	text "This area is mine!"

	para "Go get your own"
	line "territory!"
	done

BirdKeeperBorisBeatenText:
	text "Ayieee!"
	done

BirdKeeperBorisAfterBattleText:
	text "Sorry, I thought"
	line "you were a Fed."

	para "You're welcome to"
	line "stay if you want."
	done

RoughneckMoeSeenText:
	text "You're not gettin'"
	line "past me!"
	done

RoughneckMoeBeatenText:
	text "You definitely got"
	line "past me!"
	done

RoughneckMoeAfterBattleText:
	text "I'll let you off"
	line "with a warning for"
	cont "now."

	para "Next time will be"
	line "different!"
	done

Route18SignText:
	text "Route 18"

	para "Celadon City -"
	line "Fuchsia City"
	done

Route18_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  6, ROUTE_17_ROUTE_18_GATE, 3
	warp_event  2,  7, ROUTE_17_ROUTE_18_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9,  5, BGEVENT_READ, Route18Sign

	db 2 ; object events
	object_event  9, 12, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBoris, -1
	object_event 13,  6, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoughneckMoe, -1
