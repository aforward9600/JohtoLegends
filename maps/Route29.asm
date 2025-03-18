	object_const_def ; object_event constants
	const ROUTE29_COOLTRAINER_M1
	const ROUTE29_YOUNGSTER
	const ROUTE29_TEACHER1
	const ROUTE29_FRUIT_TREE
	const ROUTE29_COOLTRAINER_M2
	const ROUTE29_TUSCANY
	const ROUTE29_RAIKOU

Route29_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Tuscany

.Tuscany:
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE29_TUSCANY
	sjump .RaikouAppears

.TuscanyDisappears:
	disappear ROUTE29_TUSCANY
.RaikouAppears:
	checkevent EVENT_CAUGHT_RAIKOU
	iftrue .RaikouWillNotAppear
	checkevent EVENT_BEAT_RAIKOU
	iftrue .RaikouWillNotAppear
	checkevent EVENT_BEAT_EIN
	iftrue .RaikouMayAppear
.RaikouWillNotAppear:
	disappear ROUTE29_RAIKOU
	return

.RaikouMayAppear:
	appear ROUTE29_RAIKOU
	return

Route29YoungsterScript:
	faceplayer
	opentext
	checkevent EVENT_SPOKE_WITH_ELM
	iftrue .YoungsterRocksCleared
	writetext Route29YoungsterText
	waitbutton
	closetext
	end

.YoungsterRocksCleared:
	writetext Route29YoungsterText_RocksCleared
	waitbutton
	closetext
	end

TrainerTeacherCharlene:
	trainer TEACHER, CHARLENE, EVENT_BEAT_TEACHER_CHARLENE, TeacherCharleneSeenText, TeacherCharleneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherCharleneAfterText
	waitbutton
	closetext
	end

TrainerCooltrainermJrose:
	trainer COOLTRAINERM, EMILE, EVENT_BEAT_COOLTRAINERM_EMILE, CooltrainermJroseSeenText, CooltrainermJroseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermJroseRematchText
	yesorno
	iffalse .Refused
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext CooltrainermJroseLetsDoItText
	waitbutton
	winlosstext CooltrainermJroseBeatenText, 0
	loadtrainer COOLTRAINERM, EMILE
	startbattle
	reloadmapafterbattle
	closetext
	end

.Refused:
	writetext CooltrainermJroseAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerfReese:
	trainer COOLTRAINERF, REESE, EVENT_BEAT_COOLTRAINERF_REESE, CooltrainerfReeseSeenText, CooltrainerfReeseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfReeseAfterText
	waitbutton
	closetext
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	buttonsound
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	buttonsound
	verbosegiveitem POLKADOT_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end

Route29Sign1:
	jumptext Route29Sign1Text

Route29Sign2:
	jumptext Route29Sign2Text

Route29FruitTree:
	fruittree FRUITTREE_ROUTE_29

Route29Raikou:
	opentext
	writetext RaikouCry
	pause 15
	cry RAIKOU
	waitbutton
	closetext
	loadwildmon RAIKOU, 60
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	startbattle
	ifequal LOSE, .NotBeaten
	disappear ROUTE29_RAIKOU
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtRaikou
	setevent EVENT_BEAT_RAIKOU
	end

.CaughtRaikou:
	setevent EVENT_CAUGHT_RAIKOU
	end

.NotBeaten:
	reloadmapafterbattle
	end

CatchingTutorialBoxFullText:
	text "#MON hide in"
	line "the grass. Who"

	para "knows when they'll"
	line "pop out…"
	done

CatchingTutorialIntroText:
	text "I've seen you a"
	line "couple times. How"

	para "many #MON have"
	line "you caught?"

	para "Would you like me"
	line "to show you how to"
	cont "catch #MON?"
	done

CatchingTutorialDebriefText:
	text "That's how you do"
	line "it."

	para "If you weaken them"
	line "first, #MON are"
	cont "easier to catch."
	done

CatchingTutorialDeclinedText:
	text "Oh. Fine, then."

	para "Anyway, if you"
	line "want to catch"

	para "#MON, you have"
	line "to walk a lot."
	done

CatchingTutorialRepeatText:
	text "Huh? You want me"
	line "to show you how to"
	cont "catch #MON?"
	done

Route29YoungsterText:
	text "I hope those rocks"
	line "on Route 46 get"
	cont "cleared soon."

	para "I wanna get to"
	line "Blackthorn City"
	cont "at some point."
	done

Route29YoungsterText_RocksCleared:
	text "Now that the rocks"
	line "are cleared, I can"
	cont "get to Blackthorn."

	para "Eventually."
	done

Route29TeacherText:
	text "See those ledges?"
	line "It's scary to jump"
	cont "off them."

	para "But you can go to"
	line "NEW BARK without"

	para "walking through"
	line "the grass."
	done

CooltrainermJroseLetsDoItText:
	text "Time to battle!"
	done

CooltrainermJroseRematchText:
	text "Care for a"
	line "rematch?"
	done

CooltrainermJroseSeenText:
	text "#mon are"
	line "awesome!"
	done

CooltrainermJroseBeatenText:
	text "Don't you agree?"
	done

CooltrainermJroseAfterText:
	text "I can't help but"
	line "get excited when"
	cont "I'm with #mon!"
	done

MeetTuscanyText:
	text "Hi there!"

	para "I'm the Week Lady!"
	done

TuscanyGivesGiftText:
	text "Here, take this"
	line "Polkadot Bow!"
	done

TuscanyGaveGiftText:
	text "Wouldn't you agree"
	line "that it is the"
	cont "most adorable?"

	para "It strengthens"
	line "Fairy-type moves."

	para "I am certain it"
	line "will be of use."
	done

TuscanyTuesdayText:
	text "Normal-types will"
	line "love that Pink"
	cont "Bow!"

	para "Try it out!"
	done

TuscanyNotTuesdayText:
	text "Today is not"
	line "Tuesday. That"
	cont "is unfortunate…"
	done

TeacherCharleneSeenText:
	text "I'm thinking of"
	line "learning from"
	cont "Prof. Elm."

	para "Maybe he can"
	line "help me become a"
	cont "better teacher."
	done

TeacherCharleneBeatenText:
	text "I could learn"
	line "from you!"
	done

TeacherCharleneAfterText:
	text "He's an expert of"
	line "#mon evolution."

	para "We could all learn"
	line "a thing or two."
	done

CooltrainerfReeseSeenText:
	text "I sometimes forget"
	line "type advantages."

	para "I used Earthquake"
	line "against a"
	cont "Dragonite once."

	para "Whoops!"
	done

CooltrainerfReeseBeatenText:
	text "Oh snap!"
	done

CooltrainerfReeseAfterText:
	text "I like to sing"
	line "songs to a melody"
	cont "that sounds like"
	cont "you'd hear it in"
	cont "a #mon Center."
	done

Route29Sign1Text:
	text "Route 29"

	para "Cherrygrove City -"
	line "New Bark Town"
	done

Route29Sign2Text:
	text "Route 29"

	para "Cherrygrove City -"
	line "New Bark Town"
	done

RaikouCry:
	text "Raikou: Bzzrtzrt!"
	done

Route29_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 27,  1, ROUTE_29_ROUTE_46_GATE, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event 51,  7, BGEVENT_READ, Route29Sign1
	bg_event  3,  5, BGEVENT_READ, Route29Sign2

	db 7 ; object events
	object_event 48, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfReese, -1
	object_event 25, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29YoungsterScript, -1
	object_event 15, 11, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerTeacherCharlene, -1
	object_event 12,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29FruitTree, -1
	object_event 26,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermJrose, -1
	object_event 29, 12, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	object_event 48,  2, SPRITE_RAIKOU_P, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29Raikou, EVENT_ROUTE_29_RAIKOU
