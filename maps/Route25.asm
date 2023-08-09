	object_const_def ; object_event constants
	const ROUTE25_SUPER_NERD
	const ROUTE25_LASS
	const ROUTE25_BIKER
	const ROUTE25_ROUGHNECK
	const ROUTE25_DELINQUENT
	const ROUTE25_POKE_BALL

Route25_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE25_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE25_MISTYS_DATE

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

TrainerBikerChance:
	trainer BIKER, CHANCE, EVENT_BEAT_BIKER_CHANCE, BikerChanceSeenText, BikerChanceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerChanceAfterBattleText
	waitbutton
	closetext
	end

TrainerRoughneckPhillip:
	trainer ROUGHNECK, PHILLIP, EVENT_BEAT_ROUGHNECK_PHILLIP, RoughneckPhillipSeenText, RoughneckPhillipBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RoughneckPhillipAfterBattleText
	waitbutton
	closetext
	end

TrainerDelinquentSherry:
	trainer DELINQUENT, SHERRY, EVENT_BEAT_DELINQUENT_SHERRY, DelinquentSherrySeenText, DelinquentSherryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DelinquentSherryAfterBattleText
	waitbutton
	closetext
	end

Route25SuperNerdScript:
	jumptextfaceplayer Route25SuperNerdText

Route25LassScript:
	jumptextfaceplayer Route25LassText

BillsHouseSign:
	jumptext BillsHouseSignText

Route25Protein:
	itemball PROTEIN

Route25HiddenPotion:
	hiddenitem ELIXER, EVENT_ROUTE_25_HIDDEN_POTION

Route25HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_25_HIDDEN_NUGGET

BikerChanceSeenText:
	text "Let's get down!"
	done

BikerChanceBeatenText:
	text "I'm down!"
	done

BikerChanceAfterBattleText:
	text "Well, I got down"
	line "alright."
	done

RoughneckPhillipSeenText:
	text "We tried to rob"
	line "the delivery place"
	cont "up ahead,"

	para "but we got warped"
	line "out!"

	para "I'm gonna take out"
	line "my anger on you!"
	done

RoughneckPhillipBeatenText:
	text "Gah! I'm still"
	line "angry!"
	done

RoughneckPhillipAfterBattleText:
	text "I should probably"
	line "do anger manage-"
	cont "ment."

	para "It would help with"
	line "my blood pressure."
	done

DelinquentSherrySeenText:
	text "I wonder how weak"
	para "you are?"
	done

DelinquentSherryBeatenText:
	text "You're not weak at"
	line "all!"
	done

DelinquentSherryAfterBattleText:
	text "Well, I won't make"
	line "that mistake"
	cont "again."
	done

BillsHouseSignText:
	text "Abra Delivery"
	line "Service"
	done

Route25SuperNerdText:
	text "The bridge here"
	line "used to be the"
	cont "home of the"
	cont "Nugget Challenge."

	para "Everyone fled when"
	line "the Feds showed"
	cont "up."

	para "Hopefully we can"
	line "start it up again"
	cont "someday."
	done

Route25LassText:
	text "This cape is so"
	line "peaceful."

	para "Maybe someday the"
	line "whole region can"
	cont "be like this."
	done

Route25_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 47,  5, BILLS_HOUSE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 45,  5, BGEVENT_READ, BillsHouseSign
	bg_event  4,  5, BGEVENT_ITEM, Route25HiddenPotion
	bg_event 41,  5, BGEVENT_ITEM, Route25HiddenNugget

	db 6 ; object events
	object_event 16,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route25SuperNerdScript, -1
	object_event 49, 10, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route25LassScript, -1
	object_event 26,  8, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBikerChance, -1
	object_event 31,  8, SPRITE_ROUGHNECK, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER,2, TrainerRoughneckPhillip, -1
	object_event 38,  8, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerDelinquentSherry, -1
	object_event 32,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route25Protein, EVENT_ROUTE_25_PROTEIN
