	object_const_def ; object_event constants
	const ROUTE40_OLIVINE_RIVAL1
	const ROUTE40_BUG_CATCHER
	const ROUTE40_LASS3
	const ROUTE40_SWIMMER_GIRL2
	const ROUTE40_ROCK1
	const ROUTE40_ROCK2
	const ROUTE40_ROCK3
	const ROUTE40_LASS1
	const ROUTE40_MONICA
	const ROUTE40_POKEFAN_M
	const ROUTE40_LASS2
	const ROUTE40_STANDING_YOUNGSTER

Route40_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MonicaCallback

.MonicaCallback:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	readvar VAR_WEEKDAY
	ifequal MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	return

.MonicaAppears:
	appear ROUTE40_MONICA
	return

TrainerLassArielle:
	trainer LASS, ARIELLE, EVENT_BEAT_LASS_ARIELLE, LassArielleSeenText, LassArielleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassArielleAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfAngie:
	trainer SWIMMERF, ANGIE, EVENT_BEAT_SWIMMERF_ANGIE, SwimmerfAngieSeenText, SwimmerfAngieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfAngieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermDerrick:
	trainer SWIMMERM, DERRICK, EVENT_BEAT_SWIMMERM_DERRICK, SwimmermDerrickSeenText, SwimmermDerrickBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermDerrickAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherArthur:
	trainer BUG_CATCHER, ARTHUR, EVENT_BEAT_BUG_CATCHER_ARTHUR, BugCatcherArthurSeenText, BugCatcherArthurBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherArthurAfterBattleText
	waitbutton
	closetext
	end

Route40Lass1Script:
	jumptextfaceplayer Route40Lass1Text

Route40PokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer Route40PokefanMText

.mobile
	jumptextfaceplayer Route40PokefanMText_Mobile

Route40Lass2Script:
	jumptextfaceplayer Route40Lass2Text

Route40StandingYoungsterScript:
	jumptextfaceplayer Route40StandingYoungsterText

MonicaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue .Monday
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	buttonsound
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	buttonsound
	verbosegiveitem SHARP_BEAK
	iffalse .done
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

.Monday:
	writetext MonicaMondayText
	waitbutton
.done:
	closetext
	end

.NotMonday:
	writetext MonicaNotMondayText
	waitbutton
	closetext
	end

Route40Sign:
	jumptext Route40SignText

Route40Rock:
	jumpstd smashrock

Route40HiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

MovementData_0x1a621c:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a6224:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a622a:
	step UP
	step UP
	step UP
	step UP
	step_end

SwimmermDerrickSeenText:
	text "The ocean is vast,"
	line "and can be danger-"
	cont "ous."

	para "You should always"
	line "warm up before"
	cont "going for a swim."
	done

SwimmermDerrickBeatenText:
	text "You're dangerous"
	line "too!"
	done

SwimmermDerrickAfterBattleText:
	text "I hear in other"
	line "regions, some"
	cont "people are attack-"

	para "ed by Sharpedo!"
	done

BugCatcherArthurSeenText:
	text "My friends played"
	line "a prank on me and"
	cont "left me here!"

	para "How am I supposed"
	line "to get back?"
	done

BugCatcherArthurBeatenText:
	text "Maybe I can fly"
	line "on Scyther."
	done

BugCatcherArthurAfterBattleText:
	text "They'll come back"
	line "for me."

	para "…hopefully…"
	done

BugCatcherArthurAfterBattleText2: ; unused
	text "My friend always"
	line "says:"

	para "Just keep swim-"
	line "ming. Usually in"
	cont "a sing-songy"
	cont "voice."
	done

LassArielleSeenText:
	text "The tide is low"
	line "right now, so"

	para "you can stand on"
	line "the sand."
	done

LassArielleBeatenText:
	text "That's just"
	line "science!"
	done

LassArielleAfterBattleText:
	text "We should probably"
	line "get out of here"
	cont "soon."

	para "Don't want to be"
	line "here when the"
	cont "tide comes in."
	done

SwimmerfAngieSeenText:
	text "Have you seen the"
	line "Corsola around"
	cont "here?"
	done

SwimmerfAngieBeatenText:
	text "How sad."
	done

SwimmerfAngieAfterBattleText:
	text "Pollution caused"
	line "them to lose their"
	cont "beautiful pink"
	cont "color."

	para "There have been"
	line "efforts in the"
	cont "past few years to"

	para "clean up this"
	line "area."

	para "They say in about"
	line "a decade or so,"

	para "the Corsola will"
	line "have their color"
	cont "back."
	done

Route40Lass1Text:
	text "Although you can't"
	line "see it from here,"

	para "Cianwood is across"
	line "the sea."
	done

Route40PokefanMText:
	text "Hm! There's a big"
	line "building up ahead!"

	para "What is it?"
	done

Route40PokefanMText_Mobile:
	text "Hm! Look at all"
	line "those serious-"
	cont "looking trainers"
	cont "streaming in."

	para "What? What?"
	done

Route40Lass2Text:
	text "I came to Olivine"
	line "by ship to see the"

	para "sights and soak up"
	line "the atmosphere."

	para "Being a port, it"
	line "feels so different"
	cont "from a big city."
	done

Route40StandingYoungsterText:
	text "Have you gone to"
	line "the Battle Tower?"

	para "I think a lot of"
	line "tough trainers"

	para "have gathered"
	line "there already."

	para "But since you have"
	line "so many Badges,"

	para "you shouldn't do"
	line "badly at all."
	done

MeetMonicaText:
	text "Hi!"

	para "I'm known as the"
	line "Week Lady!"

	para "And no, it has"
	line "nothing to do"
	cont "with strength,"

	para "I hear that joke"
	line "enough."

	para "I decided on a"
	line "different dress"
	cont "today!"
	done

MonicaGivesGiftText:
	text "As a token of our"
	line "friendship, I have"
	cont "a gift for you!"
	done

MonicaGaveGiftText:
	text "It's an item that"
	line "raises the power"

	para "of flying-type"
	line "moves."

	para "You should equip a"
	line "bird #mon with"
	cont "that item."
	done

MonicaMondayText:
	text "Come again"
	line "sometime!"

	para "I can't give you"
	line "another item, but"
	cont "I enjoy company!"
	done

MonicaNotMondayText:
	text "Today's not"
	line "Monday!"
	done

Route40SignText:
	text "Route 40"

	para "Cianwood City -"
	line "Olivine City"
	done

Route40_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  5, ROUTE_40_BATTLE_TOWER_GATE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14, 10, BGEVENT_READ, Route40Sign
	bg_event  7,  8, BGEVENT_ITEM, Route40HiddenHyperPotion

	db 12 ; object events
	object_event  5, 31, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermDerrick, -1
	object_event 13, 31, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherArthur, -1
	object_event  8, 24, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassArielle, -1
	object_event 12, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfAngie, -1
	object_event  7, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  6,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  7,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event 11, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Lass1Script, -1
	object_event  8, 10, SPRITE_BUENA, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40PokefanMScript, -1
	object_event 13,  4, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40Lass2Script, -1
	object_event 16,  9, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route40StandingYoungsterScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
