	object_const_def ; object_event constants
	const ROUTE11_DAISY
	const ROUTE11_SAILOR
	const ROUTE11_BIKER
	const ROUTE11_SOLDIER
	const ROUTE11_FRUIT_TREE

Route11_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerDelinquentYukari:
	trainer DELINQUENT, YUKARI, EVENT_BEAT_YOUNGSTER_OWEN, DelinquentYukariSeenText, DelinquentYukariBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DelinquentYukariAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorHewbert:
	trainer SAILOR, HUEY1, EVENT_BEAT_YOUNGSTER_JASON, SailorHewbertSeenText, SailorHewbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorHewbertAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerBlazer:
	trainer BIKER, BLAZER, EVENT_BEAT_PSYCHIC_HERMAN, BikerBlazerSeenText, BikerBlazerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerBlazerAfterBattleText
	waitbutton
	closetext
	end

TrainerSoldierMcClellan:
	trainer SOLDIER, MCCLELLAN, EVENT_BEAT_PSYCHIC_FIDEL, SoldierMcClellanSeenText, SoldierMcClellanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierMcClellanAfterBattleText
	waitbutton
	closetext
	end

Route11Sign:
	jumptext Route11SignText

Route11FruitTree:
	fruittree FRUITTREE_ROUTE_11

Route11HiddenRevive:
	hiddenitem REVIVE, EVENT_ROUTE_11_HIDDEN_REVIVE

SoldierMcClellanSeenText:
	text "Halt!"

	para "No Feds allowed"
	line "in town!"
	done

SoldierMcClellanBeatenText:
	text "Man down!"
	line "Man down!"
	done

SoldierMcClellanAfterBattleText:
	text "Ah, you're not a"
	line "Fed!"

	para "My mistake!"
	done

BikerBlazerSeenText:
	text "Stupid soldiers!"

	para "Vermillion should"
	line "be ours!"
	done

BikerBlazerBeatenText:
	text "Stupid trainer!"
	done

BikerBlazerAfterBattleText:
	text "Everything's stupid"
	line "and I hate it!"
	done

SailorHewbertSeenText:
	text "Hold it, evil-"
	line "doer!"
	done

SailorHewbertBeatenText:
	text "Thar she blows!"
	done

SailorHewbertAfterBattleText:
	text "Since I can't sail"
	line "the seas, I just"
	cont "decided to guard"
	cont "Vermillion City!"

	para "Might as well make"
	line "myself useful!"
	done

DelinquentYukariSeenText:
	text "Buzz off, kid!"
	done

DelinquentYukariBeatenText:
	text "Whatever!"
	done

DelinquentYukariAfterBattleText:
	text "I'm not in the mood"
	line "to deal with you!"
	done

Route11SignText:
	text "Route 11"
	done

Route11_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  7, BGEVENT_READ, Route11Sign
	bg_event 32,  5, BGEVENT_ITEM, Route11HiddenRevive

	db 5 ; object events
	object_event 22, 14, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerDelinquentYukari, -1
	object_event 20,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorHewbert, -1
	object_event 28,  7, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBikerBlazer, -1
	object_event  8,  6, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSoldierMcClellan, -1
	object_event 32,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route11FruitTree, -1
