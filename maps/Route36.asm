	object_const_def ; object_event constants
	const ROUTE36_YOUNGSTER1
	const ROUTE36_YOUNGSTER2
	const ROUTE36_LASS1
	const ROUTE36_FISHER
	const ROUTE36_FRUIT_TREE
	const ROUTE36_ARTHUR
	const ROUTE36_FLORIA
	const ROUTE36_FISHER2
	const ROUTE36_FISHER3

Route36_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE36_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE36_SUICUNE

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ArthurCallback

.DummyScene0:
	end

.DummyScene1:
	end

.ArthurCallback:
	readvar VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE36_ARTHUR
	return

.ArthurAppears:
	appear ROUTE36_ARTHUR
	return

Route36RockSmashGuyScript:
	faceplayer
	opentext
	writetext RockSmashGuyText1
	waitbutton
	closetext
	end

Route36LassScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
	writetext Route36LassText
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext Route36LassText_ClearedSudowoodo
	waitbutton
	closetext
	end

TrainerPokemaniacAlvin:
	trainer POKEMANIAC, ALVIN, EVENT_BEAT_POKEMANIAC_ALVIN, PokemaniacAlvinSeenText, PokemaniacAlvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacAlvinRematchText
	yesorno
	iffalse .Refused
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	writetext PokemaniacAlvinLetsDoItText
	waitbutton
	winlosstext PokemaniacAlvinBeatenText, 0
	loadtrainer POKEMANIAC, ALVIN
	startbattle
	reloadmapafterbattle
	closetext
	end

.Refused:
	writetext PokemaniacAlvinRefusedText
	waitbutton
	closetext
	end

TrainerSchoolboyPierce:
	trainer SCHOOLBOY, PIERCE, EVENT_BEAT_SCHOOLBOY_PIE, SchoolboyPierceSeenText, SchoolboyPierceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyPierceAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	buttonsound
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	buttonsound
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

Route36RockSmashGuyScript2:
	jumptextfaceplayer RockSmashGuyText4

Route36RockSmashGuyScript3:
	jumptextfaceplayer RockSmashGuyText5

Route36Sign:
	jumptext Route36SignText

RuinsOfAlphNorthSign:
	jumptext RuinsOfAlphNorthSignText

Route36TrainerTips1:
	jumptext Route36TrainerTips1Text

Route36TrainerTips2:
	jumptext Route36TrainerTips2Text

Route36FruitTree:
	fruittree FRUITTREE_ROUTE_36

RockSmashGuyText1:
	text "Wa-hey!"

	para "Don't walk over"
	line "here!"

	para "A tree punched me"
	line "and my contacts"
	cont "fell out!"

	para "I keep trying to"
	line "find them, but the"
	cont "trees keep"
	cont "punching me!"
	done

RockSmashGuyText2:
	text "Did you clear that"
	line "wretched tree?"

	para "I'm impressed!"
	line "I want you to"
	cont "have this."
	done

UnknownText_0x19451a:
	text "<PLAYER> received"
	line "TM08."
	done

UnknownText_0x1945b8:
	text "An odd tree is"
	line "blocking the way"
	cont "to GOLDENROD CITY."

	para "I wanted to go see"
	line "the huge #MON"

	para "CENTER they just"
	line "opened…"
	done

Route36LassText:
	text "The guy that kept"
	line "losing his"
	cont "contacts seems to"
	cont "have found them."

	para "Finally, now I can"
	line "get to Goldenrod!"
	done

Route36LassText_ClearedSudowoodo:
	text "That odd tree dis-"
	line "appeared without a"
	cont "trace."

	para "Oh! That tree was"
	line "really a #MON?"
	done

PokemaniacAlvinSeenText:
	text "I may look for"
	line "rare #mon, but"
	cont "I refuse to look"
	cont "for them in the"
	cont "National Forest!"

	para "Why?"

	para "Because I hate"
	line "bugs!"
	done

PokemaniacAlvinBeatenText:
	text "Yuck!"
	done

PokemaniacAlvinRematchText:
	text "I'll always fight,"
	line "just so long as"
	cont "it's not in the"
	cont "forest."
	done

PokemaniacAlvinLetsDoItText:
	text "Let's get started!"
	done

PokemaniacAlvinRefusedText:
	text "Alright, then."

	para "Just so you know,"

	para "bugs are the third"
	line "most disgusting"
	cont "things in the"
	cont "world!"
	done

PsychicMarkSeenText:
	text "Watch this!"

	para "I will bend this"
	line "spoon by the power"
	cont "of my mind alone!"

	para ".................."
	line ".................."

	para "Wait, hold on."

	para "I swear, I was"
	line "doing it earlier."
	done

PsychicMarkBeatenText:
	text "Aw, come on!"
	done

PsychicMarkAfterBattleText:
	text "I did bend it!"

	para "You can't prove I"
	line "didn't!"
	done

SchoolboyPierceSeenText:
	text "The National For-"
	line "est is being turn-"
	cont "ed into a park."

	para "While it's sad to"
	line "see an important"
	cont "landmark go, I'm"
	cont "excited to see"
	cont "what the park will"
	cont "look like!"
	done

SchoolboyPierceBeatenText:
	text "Aw, dang!"
	done

SchoolboyPierceAfterBattleText:
	text "#mon will still"
	line "be able to live in"
	cont "the park, so they"
	cont "won't have to re-"
	cont "locate."
	done

MeetArthurText:
	text "Howdy! It's me,"
	line "the Week Guy!"

	para "I'm wearing diffe-"
	line "rent clothes, but"
	cont "I'm still me!"
	done

ArthurGivesGiftText:
	text "Here. You can have"
	line "this."
	done

ArthurGaveGiftText:
	text "A #mon that"
	line "uses rock-"

	para "type moves should"
	line "hold on to that."

	para "It pumps up rock-"
	line "type attacks."
	done

ArthurThursdayText:
	text "Come back on an-"
	line "other Thursday,"
	cont "if you want!"
	done

ArthurNotThursdayText:
	text "Hey, it's not"
	line "Thursday!"
	done

RockSmashGuyText4:
	text "Dang trees steal-"
	line "ing my contacts!"
	done

RockSmashGuyText5:
	text "Alright, I got my"
	line "contacts back, now"
	cont "it's payback time!"

	para "...Huh?"

	para "Oh. I guess it was"
	line "a Sudowoodo. How"
	cont "awkward..."
	done

Route36SignText:
	text "Route 36"

	para "#maniac Alvin"
	line "is waiting out-"
	cont "side the forest,"
	cont "ready to battle!"
	done

RuinsOfAlphNorthSignText:
	text "Ruins Of Alph"
	line "North Entrance"
	done

Route36TrainerTips1Text:
	text "Trainer Tips"

	para "#mon stats"
	line "vary--even within"
	cont "the same species."

	para "Their stats may be"
	line "similar at first."

	para "However, differ-"
	line "ences will become"

	para "pronounced as the"
	line "#mon grow."
	done

Route36TrainerTips2Text:
	text "Trainer Tips"

	para "Use Dig to return"
	line "to the entrance of"
	cont "any place."

	para "It is convenient"
	line "for exploring"

	para "caves and other"
	line "landmarks."
	done

Route36_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 18,  8, ROUTE_36_NATIONAL_PARK_GATE, 3
	warp_event 18,  9, ROUTE_36_NATIONAL_PARK_GATE, 4
	warp_event 47, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 1
	warp_event 48, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 2

	db 0 ; coord events

	db 4 ; bg events
	bg_event 29,  1, BGEVENT_READ, Route36TrainerTips2
	bg_event 45, 11, BGEVENT_READ, RuinsOfAlphNorthSign
	bg_event 55,  7, BGEVENT_READ, Route36Sign
	bg_event 21,  7, BGEVENT_READ, Route36TrainerTips1

	db 9 ; object events
	object_event 23, 12, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerPsychicMark, -1
	object_event 21,  9, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyPierce, -1
	object_event 53,  9, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36LassScript, -1
	object_event 35,  9, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36RockSmashGuyScript, EVENT_ROCK_SMASH_GUY
	object_event 21,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36FruitTree, -1
	object_event 46,  6, SPRITE_FISHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
	object_event 31, 14, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacAlvin, -1
	object_event 36,  9, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36RockSmashGuyScript2, EVENT_ROUTE_36_GUY
	object_event 42,  7, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36RockSmashGuyScript3, EVENT_ROUTE_36_GUY_2
