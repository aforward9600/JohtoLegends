	object_const_def ; object_event constants
	const NATIONALPARK_ENGINEER3
	const NATIONALPARK_YOUNGSTER1
	const NATIONALPARK_LASS
	const NATIONALPARK_BUG_CATCHER1
	const NATIONALPARK_ENGINEER5
	const NATIONALPARK_GRAMPS
	const NATIONALPARK_PERSIAN
	const NATIONALPARK_ENGINEER4
	const NATIONALPARK_POKEFAN_F
	const NATIONALPARK_BUG_CATCHER2
	const NATIONALPARK_POKEFAN_M
	const NATIONALPARK_POKE_BALL1
	const NATIONALPARK_ENGINEER
	const NATIONALPARK_POKE_BALL2
	const NATIONALPARK_ENGINEER2

NationalPark_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NationalParkEngineer3Script:
	jumptextfaceplayer NationalParkEngineer3Text

NationalParkTeacher1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_QUICK_CLAW
	iftrue .GotQuickClaw
	writetext NationalParkTeacher1Text
	buttonsound
	verbosegiveitem QUICK_CLAW
	iffalse .NoRoom
	setevent EVENT_GOT_QUICK_CLAW
.GotQuickClaw:
	writetextend NationalParkTeacher1Text_GotQuickClaw
.NoRoom:
	closetext
	end

BugCatcherElmer:
	trainer BUG_CATCHER, ELMER, EVENT_BEAT_BUG_CATCHER_ELMER, BugCatcherElmerSeenText, BugCatcherElmerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetextend BugCatcherElmerAfterBattleText

TrainerEngineerOswald:
	trainer ENGINEER, OSWALD, EVENT_BEAT_ENGINEER_OSWALD, TrainerEngineerOswaldSeenText, TrainerEngineerOswaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetextend TrainerEngineerOswaldAfterBattleText

TrainerPokefanMBernard:
	trainer POKEFANM, BERNARD, EVENT_BEAT_POKEFANM_BERNARD, TrainerPokefanMBernardSeenText, TrainerPokefanMBernardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetextend TrainerPokefanMBernardAfterBattleText

NationalParkYoungster1Script:
	jumptextfaceplayer NationalParkYoungster1Text

NationalParkGrampsScript:
	jumptextfaceplayer NationalParkGrampsText

NationalParkPersian:
	refreshscreen
	pokepic MEOWTH
	cry MEOWTH
	waitbutton
	closepokepic
	faceplayer
	opentext
	writetextend NationalParkPersianText

NationalParkEngineerScript:
	jumptextfaceplayer NationalParkEngineerText

NationalParkEngineer2Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_RAZOR_CLAW_IN_NATIONAL_FOREST
	iftrue .GotRazorClaw
	writetext NationalParkEngineer2Text
	buttonsound
	verbosegiveitem RAZOR_CLAW
	iffalse .NoRoom
	setevent EVENT_GOT_RAZOR_CLAW_IN_NATIONAL_FOREST
.GotRazorClaw:
	writetextend AlreadyHaveRazorClawText
.NoRoom:
	closetext
	end

TrainerEngineerHarvey:
	trainer ENGINEER, HARVEY1, EVENT_BEAT_ENGINEER_HARVEY, EngineerHarveySeenText, EngineerHarveyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetextend EngineerHarveyAfterBattleText

TrainerBugCatcherBuzzy:
	trainer BUG_CATCHER, BUZZY, EVENT_BEAT_BUG_CATCHER_BUZZY, BugCatcherBuzzySeenText, BugCatcherBuzzyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetextend BugCatcherBuzzyAfterBattleText

NationalParkPokefanF2Script:
	jumptextfaceplayer NationalParkPokefanF2Text

NationalParkRelaxationSquareSign:
	jumptext NationalParkRelaxationSquareText

NationalParkEther:
	itemball SILVERPOWDER

NationalParkTMDig:
	itemball TM_DIG

NationalParkHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

NationalParkEngineer3Text:
	text "Whew!"

	para "The fountain is"
	line "almost complete."

	para "Next up we'll cut"
	line "down some of these"
	cont "trees and plant"
	cont "some nice tall"
	cont "grass."

	para "Don't worry, we'll"
	line "also plant some"
	cont "more trees out in"
	cont "the deeper parts"
	cont "of the forest, so"
	cont "we won't hear any"
	cont "whining from the"
	cont "conservationists."
	done

NationalParkTeacher1Text:
	text "I wanna be a"
	line "teacher someday!"

	para "What about you?"

	para "What do you wanna"
	line "be?"

	para "If you wanna be a"
	line "#mon trainer,"
	cont "or a teacher, you"
	cont "need to be quick."

	para "This will help"
	line "with that."
	done

NationalParkTeacher1Text_GotQuickClaw:
	text "Let a #mon hold"
	line "that Quick Claw."

	para "Sometimes it will"
	line "strike first"
	cont "during battle."
	done

NationalParkYoungster1Text:
	text "This place is nice"
	line "and secluded."

	para "Perfect for some"
	line "relaxing isolat-"
	cont "ion."
	done

NationalParkGrampsText:
	text "It'll be sad to"
	line "see the forest I"

	para "grew up with gone"
	line "in a matter of"
	cont "months."

	para "Sigh..."
	done

NationalParkPersianText:
	text "Meowth: Fufushaa!"
	done

NationalParkEngineerText:
	text "The construction"
	line "is going smoothly."

	para "After we finish"
	line "the fountain, then"
	cont "we'll clear out"
	cont "the rest of the"
	cont "trees."

	para "The grass around"
	line "the fountain will"
	cont "be shaped like a"
	cont "# Ball."
	done

EngineerHarveySeenText:
	text "Go away kid."

	para "Can't you see I'm"
	line "on my break?"
	done

EngineerHarveyBeatenText:
	text "Break's over, I"
	line "guess..."
	done

EngineerHarveyAfterBattleText:
	text "Well, back to"
	line "work for me."
	done

NationalParkPokefanF2Text:
	text "Uh-oh..."

	para "I think I'm lost."
	done

BugCatcherBuzzySeenText:
	text "Bug Types are my"
	line "favorite #mon!"

	para "How 'bout you?"
	done

BugCatcherBuzzyBeatenText:
	text "My bugs!"
	done

BugCatcherBuzzyAfterBattleText:
	text "Don't sleep on Bug"
	line "Type #mon!"

	para "They can mess you"
	line "up!"
	done

TrainerPokefanMBernardSeenText:
	text "All these bugs are"
	line "no good for my"
	cont "#mon!"
	done

TrainerPokefanMBernardBeatenText:
	text "My poor Tangela!"
	done

TrainerPokefanMBernardAfterBattleText:
	text "That's the last"
	line "time I listen to"
	cont "my friends!"

	para "Peer pressure is"
	line "no joke!"
	done

BugCatcherElmerSeenText:
	text "Be vewy, vewy"
	line "quiet!"

	para "I'm hunting"
	line "Catewpie!"
	done

BugCatcherElmerBeatenText:
	text "Aw outta #"
	line "Baws!"
	done

BugCatcherElmerAfterBattleText:
	text "Peopwe wike to"
	line "make fun of my"
	cont "speech impediment."

	para "It's weally not"
	line "good for my sewf"
	cont "esteem."
	done

ConstructionGoingOnText:
	text "Sorry, but we're"
	line "still doing some"
	cont "construction on"
	cont "the fountain."

	para "There's a path"
	line "through the forest"
	cont "if you want to get"
	cont "by."

	para "Be careful."

	para "There's plenty of"
	line "weird people out"
	cont "there, looking for"
	cont "bugs."
	done

NationalParkEngineer2Text:
	text "My buddy got this"
	line "weird claw in Ice"
	cont "Path, but I don't"
	cont "have a use for it."

	para "You want it?"
	done

AlreadyHaveRazorClawText:
	text "I'd say this park"
	line "is going to be a"
	cont "nice sight when"
	cont "it's all finished."

	para "Needs some fences,"
	line "though, don't you"
	cont "think?"
	done

TrainerEngineerOswaldSeenText:
	text "Good job making it"
	line "through the forest"
	cont "in one piece!"

	para "How 'bout a battle"
	line "to celebrate?"
	done

TrainerEngineerOswaldBeatenText:
	text "Now I'm in pieces!"
	done

TrainerEngineerOswaldAfterBattleText:
	text "We should be done"
	line "with the fountain"
	cont "now, so no need to"
	cont "go the long way"
	cont "again."
	done

NationalParkRelaxationSquareText:
	text "National Forest"

	para "National Park"
	line "under construction"
	done

NationalPark_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 33, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 33, 19, ROUTE_36_NATIONAL_PARK_GATE, 2
	warp_event 10, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 11, 47, ROUTE_35_NATIONAL_PARK_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 33, 16, BGEVENT_READ, NationalParkRelaxationSquareSign
	bg_event  2, 34, BGEVENT_ITEM, NationalParkHiddenFullHeal

	db 15 ; object events
	object_event 15, 24, SPRITE_ENGINEER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NationalParkEngineer3Script, -1
	object_event  4, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster1Script, -1
	object_event 23, 40, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher1Script, -1
	object_event 35, 31, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, BugCatcherElmer, -1
	object_event 10, 41, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerEngineerOswald, -1
	object_event 18, 32, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkGrampsScript, -1
	object_event 22, 40, SPRITE_MEOWTH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPersian, -1
	object_event  3,  2, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerEngineerHarvey, -1
	object_event 18,  2, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NationalParkPokefanF2Script, -1
	object_event 36,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherBuzzy, -1
	object_event 12, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerPokefanMBernard, -1
	object_event 24, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkEther, EVENT_NATIONAL_PARK_ETHER
	object_event 29, 18, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkEngineerScript, -1
	object_event  5, 50, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, NationalParkTMDig, EVENT_NATIONAL_PARK_TM_SLEEP_TALK
	object_event 15, 13, SPRITE_ENGINEER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkEngineer2Script, -1
