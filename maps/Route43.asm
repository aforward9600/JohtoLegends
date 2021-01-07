	object_const_def ; object_event constants
	const ROUTE43_YOUNGSTER
	const ROUTE43_SUPER_NERD2
	const ROUTE43_LASS
	const ROUTE43_FISHER
	const ROUTE43_SUPER_NERD4
	const ROUTE43_FISHER1
	const ROUTE43_FRUIT_TREE
	const ROUTE43_POKE_BALL

Route43_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFirebreatherChaz:
	trainer FIREBREATHER, CHAZ, EVENT_BEAT_FIREBREATHER_CHAZ, FirebreatherChazSeenText, FirebreatherChazBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherChazAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperGarret:
	trainer CAMPER, CAMPER_GARRET, EVENT_BEAT_CAMPER_GARRET, CamperGarretSeenText, CamperGarretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperGarretAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerPercy:
	trainer JUGGLER, PERCY, EVENT_BEAT_JUGGLER_PERCY, JugglerPercySeenText, JugglerPercyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerPercyAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerChloe:
	trainer PICNICKER, CHLOE, EVENT_BEAT_PICNICKER_CHLOE, PicnickerChloeSeenText, PicnickerChloeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerChloeAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherShane:
	trainer FISHER, FISHER_SHANE, EVENT_BEAT_FISHER_SHANE, FisherShaneSeenText, FisherShaneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherShaneAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacJarvis:
	trainer POKEMANIAC, JARVIS, EVENT_BEAT_POKEMANIAC_JARVIS, PokemaniacJarvisSeenText, PokemaniacJarvisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacJarvisAfterBattleText
	waitbutton
	closetext
	end

Route43Sign1:
	jumptext Route43Sign1Text

Route43Sign2:
	jumptext Route43Sign2Text

Route43TrainerTips:
	jumptext Route43TrainerTipsText

Route43FruitTree:
	fruittree FRUITTREE_ROUTE_43

Route43Ether:
	itemball ETHER

CamperGarretSeenText:
	text "My girlfriend says"
	line "I'm not a good"
	cont "trainer."

	para "I need to beat you"
	line "to prove"
	cont "otherwise!"
	done

CamperGarretBeatenText:
	text "I guess she's"
	line "right."
	done

CamperGarretAfterBattleText:
	text "It doesn't matter"
	line "how weak I am."

	para "she still loves"
	line "me."
	done

JugglerPercySeenText:
	text "I'm still learning"
	line "how to juggle. I'm"

	para "getting better at"
	line "it."
	done

JugglerPercyBeatenText:
	text "Maybe I need to"
	line "keep practicing."
	done

JugglerPercyAfterBattleText:
	text "Practice makes"
	line "perfect."

	para "For #mon and"
	line "juggling."
	done

PicnickerChloeSeenText:
	text "My boyfriend isn't"
	line "very strong, so"
	cont "I have to step up"

	para "and be the strong"
	line "one."
	done

PicnickerChloeBeatenText:
	text "I'm not as strong"
	line "as I thought."
	done

PicnickerChloeAfterBattleText:
	text "We're both not"
	line "very strong, but"

	para "we love each"
	line "other, and that's"
	cont "all that matters."
	done

FisherShaneSeenText:
	text "Magikarp."

	para "Why is it that all"
	line "I catch is"
	cont "Magikarp?"

	para "It's frustrating!"
	done

FisherShaneBeatenText:
	text "I knew I'd lose."
	done

FisherShaneAfterBattleText:
	text "I really need to"
	line "evolve my #mon."

	para "Gyarados is a much"
	line "better battler."
	done

FirebreatherChazSeenText:
	text "Even though my"
	line "#mon are Fire-"
	cont "types, I'm still"

	para "having trouble"
	line "with the local Gym"
	cont "Leader."
	done

FirebreatherChazBeatenText:
	text "Maybe I need more"
	line "#mon."
	done

FirebreatherChazAfterBattleText:
	text "There's some more"
	line "Fire-types here."

	para "Wonder why they're"
	line "here?"
	done

PokemaniacJarvisSeenText:
	text "The Lake of Rage"
	line "is said to have"
	cont "some rare #mon."

	para "I'm on my way to"
	line "look!"
	done

PokemaniacJarvisBeatenText:
	text "You have some rare"
	line "#mon!"
	done

PokemaniacJarvisAfterBattleText:
	text "I wonder if I'll"
	line "find some great"
	cont "#mon there."
	done

PicnickerTiffanyClefairyText:
	text "Isn't my CLEFAIRY"
	line "just the most"
	cont "adorable thing?"
	done

Route43Sign1Text:
	text "Route 43"

	para "Lake Of Rage -"
	line "MAHOGANY TOWN"
	done

Route43Sign2Text:
	text "Route 43"

	para "Lake Of Rage -"
	line "Mahogany Town"
	done

Route43TrainerTipsText:
	text "Trainer Tips"

	para "All #mon have"
	line "pros and cons"

	para "depending on their"
	line "types."

	para "If their types"
	line "differ, a higher-"

	para "level #mon may"
	line "lose in battle."

	para "Learn which types"
	line "are strong and"

	para "weak against your"
	line "#mon's type."
	done

Route43_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  9, 51, ROUTE_43_MAHOGANY_GATE, 1
	warp_event 10, 51, ROUTE_43_MAHOGANY_GATE, 2
	warp_event 17, 35, ROUTE_43_GATE, 3
	warp_event 17, 31, ROUTE_43_GATE, 1
	warp_event 18, 31, ROUTE_43_GATE, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 13,  3, BGEVENT_READ, Route43Sign1
	bg_event 11, 49, BGEVENT_READ, Route43Sign2
	bg_event 16, 38, BGEVENT_READ, Route43TrainerTips

	db 8 ; object events
	object_event 10,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperGarret, -1
	object_event 15, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerJugglerPercy, -1
	object_event 15,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerChloe, -1
	object_event  4, 17, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerFisherShane, -1
	object_event 12, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacJarvis, -1
	object_event  8, 29, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerFirebreatherChaz, -1
	object_event  1, 26, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route43FruitTree, -1
	object_event  1,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route43Ether, EVENT_ROUTE_43_MAX_ETHER
