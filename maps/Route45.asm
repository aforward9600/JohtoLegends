	object_const_def ; object_event constants
	const ROUTE45_HIKER1
	const ROUTE45_HIKER2
	const ROUTE45_HIKER3
	const ROUTE45_HIKER4
	const ROUTE45_BLACK_BELT
	const ROUTE45_COOLTRAINER_M
	const ROUTE45_COOLTRAINER_F
	const ROUTE45_FRUIT_TREE
	const ROUTE45_POKE_BALL1
	const ROUTE45_POKE_BALL2
	const ROUTE45_POKE_BALL3
	const ROUTE45_POKE_BALL4
	const ROUTE45_YOUNGSTER

Route45_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearRocks

.ClearRocks:
	checkevent EVENT_SPOKE_WITH_ELM
	iftrue .Done
	changeblock 12, 10, $0a ; rock
	changeblock 14, 10, $0a ; rock
	changeblock 16, 10, $0a ; rock
	changeblock  2, 16, $0a ; rock
	changeblock 10, 12, $0a ; rock
	changeblock  4, 16, $0a ; rock
	changeblock  4, 14, $0a ; rock
.Done:
	return

TrainerBlackbeltMinoru:
	trainer BLACKBELT_T, KENJI3, EVENT_BEAT_BLACKBELT_KENJI3, BlackbeltMinoruSeenText, BlackbeltMinoruBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltMinoruAfterBattleText
	waitbutton
	closetext
	end

HikerWorkerScript:
	faceplayer
	opentext
	checkevent EVENT_SPOKE_WITH_ELM
	iftrue .RockSlideCleared
	writetext RockSlideText
	waitbutton
	closetext
	turnobject ROUTE45_HIKER1, DOWN
	end

.RockSlideCleared:
	writetext RockSlideClearedText
	waitbutton
	closetext
	end

LuckyPunchLass:
	faceplayer
	opentext
	checkevent EVENT_GOT_LUCKY_PUNCH
	iftrue .AlreadyGotLuckyPunch
	writetext HaveALuckyPunchText
	buttonsound
	verbosegiveitem LUCKY_PUNCH
	iffalse .NoRoom
	setevent EVENT_GOT_LUCKY_PUNCH
.AlreadyGotLuckyPunch:
	writetext ThatsLuckyPunchText
	waitbutton
	closetext
	end

.NoRoom:
	writetext NoRoomForLuckyPunchText
	waitbutton
	closetext
	end

TrainerHikerParry:
	trainer HIKER, PARRY1, EVENT_BEAT_HIKER_PARRY, HikerParrySeenText, HikerParryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerParryAfterBattleText
	waitbutton
	closetext
	end

Route45GrampsScript:
	jumptextfaceplayer Route45GrampsText

TrainerCooltrainermKosu:
	trainer COOLTRAINERM, KOSU, EVENT_BEAT_COOLTRAINERM_KOSU, CooltrainermKosuSeenText, CooltrainermKosuBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermKosuAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfHarley:
	trainer COOLTRAINERF, HARLEY, EVENT_BEAT_COOLTRAINERF_HARLEY, CooltrainerfHarleySeenText, CooltrainerfHarleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfHarleyAfterBattleText
	waitbutton
	closetext
	end

Route45YoungsterScript:
	faceplayer
	opentext
	writetext Route45YoungsterText
	waitbutton
	closetext
	end

Route45DummyScript:
	writetext Route45DummyText
	waitbutton
	closetext
	end

Route45Sign:
	jumptext Route45SignText

Route45FruitTree:
	fruittree FRUITTREE_ROUTE_45

Route45Nugget:
	itemball NUGGET

Route45Revive:
	itemball REVIVE

Route45Elixer:
	itemball ELIXER

Route45MaxPotion:
	itemball MAX_POTION

Route45HiddenPpUp:
	hiddenitem PP_UP, EVENT_ROUTE_45_HIDDEN_PP_UP

RockSlideText:
	text "Man, the recent"
	line "earthquake really"
	cont "messed this area"

	para "up bad. It's gonna"
	line "be a while before"
	cont "these rocks are"

	para "cleared. Be care-"
	line "ful if you go into"
	cont "Dark Cave. My bro"

	para "is clearing out"
	line "rocks in there,"
	cont "and he's not very"

	para "happy about it."
	done

HikerMichaelSeenText:
	text "Yo! You're spunky!"
	line "But you know what?"

	para "When it comes to"
	line "sheer spunkiness,"
	cont "I'm the man!"
	done

HikerMichaelBeatenText:
	text "My #MON weren't"
	line "spunky enough!"
	done

HikerMichaelAfterBattleText:
	text "Boy, do I love"
	line "HP UP! Mmmm, yum!"

	para "I keep drinking my"
	line "#MON's!"

	para "I can't help it!"
	done

HikerParrySeenText:
	text "My #mon are"
	line "power packed!"
	done

HikerParryBeatenText:
	text "Wahahah! I'm the"
	line "big loser!"
	done

HikerParryAfterBattleText:
	text "I'm not much good"
	line "at thinking, see?"

	para "So, I just plow"
	line "ahead with power!"
	done

BlackbeltMinoruSeenText:
	text "Training is what"
	line "I live for!"

	para "Behold the fruits"
	line "of my labor!"
	done

BlackbeltMinoruBeatenText:
	text "Waaaargh!"
	done

BlackbeltMinoruAfterBattleText:
	text "I need more"
	line "training!"
	done

CooltrainermKosuSeenText:
	text "I think I'm ready"
	line "to take on the Gym"
	cont "Leader of"
	cont "Blackthorn City!"
	done

CooltrainermKosuBeatenText:
	text "I'm not ready yet!"
	done

CooltrainermKosuAfterBattleText:
	text "I at least have a"
	line "Slowbro with"
	cont "Blizzard."

	para "That should be"
	line "enough, right?"
	done

CooltrainerfHarleySeenText:
	text "I always try to"
	line "make sure my team"
	cont "is balanced for"
	cont "types."

	para "Don't want too"
	line "many #mon of"
	cont "the same type!"
	done

CooltrainerfHarleyBeatenText:
	text "I guess even"
	line "balanced teams"
	cont "have weaknesses."
	done

CooltrainerfHarleyAfterBattleText:
	text "Then again, Gym"
	line "leaders only use"
	cont "one type."

	para "Maybe I could try"
	line "that…"
	done

Route45DummyText:
	text "I'm really, really"
	line "tough!"

	para "Is there anywhere"
	line "I can prove how"
	cont "tough I really am?"
	done

Route45YoungsterText::
	text "This route is"
	line "always tough to"
	cont "hike through!"
	done

RockSlideClearedText:
	text "These rocks are"
	line "finally cleared!"

	para "My bro in Dark"
	line "Cave might be in a"
	cont "better mood now."
	done

Route45SignText:
	text "Route 45"
	line "Mountain Rd. Ahead"
	done

HaveALuckyPunchText:
	text "You ever wish your"
	line "Chansey could have"
	cont "a little more"
	cont "oomph?"

	para "Then take this!"
	done

ThatsLuckyPunchText:
	text "That's a Lucky"
	line "Punch!"

	para "Chansey will land"
	line "more critical hits"
	cont "when holding it!"
	done

NoRoomForLuckyPunchText:
	text "Hey!"

	para "You don't have"
	line "room for this!"
	done

Route45GrampsText:
	text "The road may be"
	line "hard to walk on,"
	cont "but it's good to"
	cont "keep moving."

	para "Especially at my"
	line "old age!"
	done

Route45_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  2,  5, DARK_CAVE_NEW_ENTRANCE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10,  4, BGEVENT_READ, Route45Sign
	bg_event 13, 80, BGEVENT_ITEM, Route45HiddenPpUp

	db 13 ; object events
	object_event 10, 11, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, HikerWorkerScript, -1
	object_event 16, 65, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, LuckyPunchLass, -1
	object_event  4, 25, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerHikerParry, -1
	object_event  8, 36, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route45GrampsScript, -1
	object_event 11, 46, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltMinoru, -1
	object_event 17, 16, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermKosu, -1
	object_event  9, 60, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfHarley, -1
	object_event 16, 82, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route45FruitTree, -1
	object_event  6, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45Nugget, EVENT_ROUTE_45_NUGGET
	object_event  5, 66, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45Revive, EVENT_ROUTE_45_REVIVE
	object_event  6, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45Elixer, EVENT_ROUTE_45_ELIXER
	object_event  7, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45MaxPotion, EVENT_ROUTE_45_MAX_POTION
	object_event  5, 69, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route45YoungsterScript, -1
