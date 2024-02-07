	object_const_def ; object_event constants
	const ROUTE13_YOUNGSTER1
	const ROUTE13_BIKER
	const ROUTE13_ROUGHNECK
	const ROUTE13_DELINQUENT
	const ROUTE13_POKEFAN_M
	const ROUTE13_BIKER2

Route13_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route13PokefanMScript:
	jumptextfaceplayer Route13PokefanMText

TrainerRoughneckKandori:
	trainer ROUGHNECK, KANDORI, EVENT_BEAT_ROUGHNECK_KANDORI, RoughneckKandoriSeenText, RoughneckKandoriBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RoughneckKandoriAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerKevin:
	trainer BIKER, BIKER_KEVIN, EVENT_BEAT_BIKER_KEVIN, BikerKevinSeenText, BikerKevinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerKevinAfterBattleText
	waitbutton
	closetext
	end

Route13YoungsterScript:
	jumptextfaceplayer Route13YoungsterText

TrainerDelinquentElly:
	trainer DELINQUENT, ELLY, EVENT_BEAT_DELINQUENT_ELLY, DelinquentEllySeenText, DelinquentEllyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DelinquentEllyAfterBattleText
	waitbutton
	closetext
	end

Route13TrainerTips:
	jumptext Route13TrainerTipsText

Route13Sign:
	jumptext Route13SignText

Route13DirectionsSign:
	jumptext Route13DirectionsSignText

Route13BikerScript:
	jumptextfaceplayer Route13BikerText

Route13HiddenCalcium:
	hiddenitem CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM

RoughneckKandoriSeenText:
	text "You lookin' for a"
	line "bad time?"

	para "I'll knock ya out"
	line "real good!"
	done

RoughneckKandoriBeatenText:
	text "Argh! Knocked out!"
	done

RoughneckKandoriAfterBattleText:
	text "You got lucky this"
	line "time!"
	done

BikerKevinSeenText:
	text "You ever maneuver"
	line "a bike through a"
	cont "maze?"

	para "It's not fun!"
	done

BikerKevinBeatenText:
	text "That wasn't fun"
	line "either!"
	done

BikerKevinAfterBattleText:
	text "We should burn"
	line "this maze down!"

	para "Just like we did"
	line "to Silence Bridge!"
	done

DelinquentEllySeenText:
	text "I jump these trees"
	line "every day for"
	cont "exercise."

	para "It's good for my"
	line "legs."
	done

DelinquentEllyBeatenText:
	text "Don't you think so?"
	done

DelinquentEllyAfterBattleText:
	text "I don't like bikes,"
	line "so this is how I"
	cont "better my legs."
	done

Route13TrainerTipsText:
	text "Trainer Tips"

	para "Look! Right there,"
	line "at the left side"
	cont "of the tree."
	done

Route13SignText:
	text "Route 13"

	para "North to Silence"
	line "Bridge"

	para "There's some"
	line "graffiti here."

	para "No bridge for you"
	line "losers!"
	done

Route13DirectionsSignText:
	text "North to Lavender"
	line "Town"

	para "West to Fuchsia"
	line "City"
	done

Route13PokefanMText:
	text "The bridge to"
	line "Lavender Town"
	cont "was destroyed."

	para "What jerks!"
	done

Route13YoungsterText:
	text "The routes to"
	line "Fuchsia City and"
	cont "the maze are"

	para "crawling with"
	line "Feds."

	para "Watch out."
	done

Route13BikerText:
	text "Buzz off, kid!"

	para "I can't find my"
	line "way out of here!"
	done

Route13_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 4 ; bg events
	bg_event 29, 13, BGEVENT_READ, Route13TrainerTips
	bg_event 41, 11, BGEVENT_READ, Route13Sign
	bg_event 17, 13, BGEVENT_READ, Route13DirectionsSign
	bg_event 30, 13, BGEVENT_ITEM, Route13HiddenCalcium

	db 6 ; object events
	object_event  9, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route13YoungsterScript, -1
	object_event 42,  7, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBikerKevin, -1
	object_event 32,  8, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoughneckKandori, -1
	object_event 14, 10, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerDelinquentElly, -1
	object_event 47, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route13PokefanMScript, -1
	object_event 26,  6, SPRITE_BIKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route13BikerScript, -1
