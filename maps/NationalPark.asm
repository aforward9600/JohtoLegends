	object_const_def ; object_event constants
	const NATIONALPARK_LASS1
	const NATIONALPARK_POKEFAN_F1
	const NATIONALPARK_TEACHER1
	const NATIONALPARK_YOUNGSTER1
	const NATIONALPARK_YOUNGSTER2
	const NATIONALPARK_TEACHER2
	const NATIONALPARK_PERSIAN
	const NATIONALPARK_YOUNGSTER3
	const NATIONALPARK_POKEFAN_F2
	const NATIONALPARK_POKEFAN_M
	const NATIONALPARK_LASS2
	const NATIONALPARK_POKE_BALL1
	const NATIONALPARK_ENGINEER
	const NATIONALPARK_POKE_BALL2
	const NATIONALPARK_ENGINEER2

NationalPark_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

NationalParkLassScript:
	jumptextfaceplayer NationalParkLassText

NationalParkPokefanFScript:
	jumptextfaceplayer NationalParkPokefanFText

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
	writetext NationalParkTeacher1Text_GotQuickClaw
	waitbutton
.NoRoom:
	closetext
	end

BirdKeeperGunner:
	trainer BIRD_KEEPER, GUNNER, EVENT_BEAT_BIRD_KEEPER_GUNNER, BirdKeeperGunnerSeenText, BirdKeeperGunnerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperGunnerAfterBattleText
	waitbutton
	closetext
	end

NationalParkYoungster2Script:
	jumptextfaceplayer NationalParkYoungster2Text

NationalParkTeacher2Script:
	jumptextfaceplayer NationalParkTeacher2Text

NationalParkPersian:
	refreshscreen
	pokepic MEOWTH
	cry MEOWTH
	waitbutton
	closepokepic
	faceplayer
	opentext
	writetext NationalParkPersianText
	waitbutton
	closetext
	end

NationalParkEngineerScript:
	faceplayer
	opentext
	writetext NationalParkEngineerText
	waitbutton
	closetext
	end

NationalParkEngineer2Script:
	faceplayer
	opentext
	writetext NationalParkEngineer2Text
	waitbutton
	closetext
	end

TrainerEngineerHarvey:
	trainer ENGINEER, HARVEY1, EVENT_BEAT_ENGINEER_HARVEY, EngineerHarveySeenText, EngineerHarveyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerHarveyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmWilliam:
	trainer POKEFANM, WILLIAM, EVENT_BEAT_POKEFANM_WILLIAM, PokefanmWilliamSeenText, PokefanmWilliamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmWilliamAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfBeverly1:
	trainer POKEFANF, BEVERLY1, EVENT_BEAT_POKEFANF_BEVERLY, PokefanfBeverly1SeenText, PokefanfBeverly1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_POKEFAN_BEVERLY
	endifjustbattled
	opentext
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue .GiveNugget
	checkcellnum PHONE_POKEFAN_BEVERLY
	iftrue .NumberAccepted
	checkpoke MARILL
	iffalse .NoMarill
	checkevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext UnknownText_0x5c5bd
	buttonsound
	setevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_POKEFAN_BEVERLY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEFANF, BEVERLY1
	scall .RegisteredNumber
	sjump .NumberAccepted

.GiveNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalse .NoRoom
	clearflag ENGINE_BEVERLY_HAS_NUGGET
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.NoMarill:
	writetext UnknownText_0x5c68a
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd asknumber1f
	end

.AskNumber2:
	jumpstd asknumber2f
	end

.RegisteredNumber:
	jumpstd registerednumberf
	end

.NumberAccepted:
	jumpstd numberacceptedf
	end

.NumberDeclined:
	jumpstd numberdeclinedf
	end

.PhoneFull:
	jumpstd phonefullf
	end

.Gift:
	jumpstd giftf
	end

.PackFull:
	jumpstd packfullf
	end

TrainerLassKrise:
	trainer LASS, KRISE, EVENT_BEAT_LASS_KRISE, LassKriseSeenText, LassKriseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassKriseAfterBattleText
	waitbutton
	closetext
	end

NationalParkRelaxationSquareSign:
	jumptext NationalParkRelaxationSquareText

NationalParkParlyzHeal:
	itemball PARLYZ_HEAL

NationalParkTMDig:
	itemball TM_SLEEP_TALK

NationalParkHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

NationalParkEngineerStopsYou:
	turnobject NATIONALPARK_ENGINEER, DOWN
	turnobject PLAYER, UP
	opentext
	writetext ConstructionGoingOnText
	waitbutton
	closetext
	applymovement PLAYER, EngineerMovesYouMovement
	turnobject NATIONALPARK_ENGINEER, RIGHT
	end

EngineerMovesYouMovement:
	step RIGHT
	step_end

NationalParkLassText:
	text "Look! Check out my"
	line "bag!"

	para "I printed out my"
	line "favorites from my"

	para "#DEX and stuck"
	line "them on my bag."
	done

NationalParkPokefanFText:
	text "This is MAIL I got"
	line "from my daughter."
	cont "It cheers me up."
	done

NationalParkTeacher1Text:
	text "I wanna be a teac-"
	line "her someday!"

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
	text "I'm playing with"
	line "stickers I printed"
	cont "from my #DEX."
	done

NationalParkYoungster2Text:
	text "I get the other"
	line "guy's #DEX"
	cont "sticker if I win."
	done

NationalParkTeacher2Text:
	text "I take walks in"
	line "the PARK, but I"

	para "never go into the"
	line "grass."

	para "Trainers always"
	line "want to battle…"
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

PokefanfBeverly1SeenText:
	text "My #MON are"
	line "simply darling."

	para "Let me tell you"
	line "how proud my"
	cont "darlings make me."
	done

PokefanfBeverly1BeatenText:
	text "I can beat you in"
	line "pride, but…"
	done

UnknownText_0x5c5bd:
	text "I must say, your"
	line "#MON are quite"
	cont "cute, too."
	done

PokefanmWilliamSeenText:
	text "We adore our #-"
	line "MON, even if they"
	cont "dislike us."

	para "That's what being"
	line "a FAN is about."
	done

PokefanmWilliamBeatenText:
	text "M-my #MON!"
	done

PokefanmWilliamAfterBattleText:
	text "I lost the battle,"
	line "but my #MON win"

	para "the prize for"
	line "being most lovely."
	done

BirdKeeperGunnerSeenText:
	text "The bugs here are"
	line "easy pickins' for"
	cont "my birds!"
	done

BirdKeeperGunnerBeatenText:
	text "My birds!"
	done

BirdKeeperGunnerAfterBattleText:
	text "Bugs are easy, but"
	line "other trainers are"
	cont "another story."
	done

UnknownText_0x5c68a:
	text "My friend keeps a"
	line "MARILL!"

	para "I find them very"
	line "endearing."

	para "Oh, I wish for a"
	line "MARILL of my own…"
	done

LassKriseSeenText:
	text "Hello? Why are you"
	line "staring at me?"

	para "Oh, a battle?"
	done

LassKriseBeatenText:
	text "…Hmmm…"
	done

LassKriseAfterBattleText:
	text "I thought you were"
	line "staring at me"
	cont "because I'm cute!"
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
	text "I'd say this park"
	line "is going to be a"
	cont "nice sight when"
	cont "it's all finished."

	para "Needs some fences,"
	line "though, don't you"
	cont "think?"
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

	db 1 ; coord events
	coord_event 29, 19, SCENE_DEFAULT, NationalParkEngineerStopsYou

	db 2 ; bg events
	bg_event 33, 16, BGEVENT_READ, NationalParkRelaxationSquareSign
	bg_event  2, 34, BGEVENT_ITEM, NationalParkHiddenFullHeal

	db 15 ; object events
	object_event 15, 24, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkLassScript, -1
	object_event 14,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPokefanFScript, -1
	object_event 23, 40, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher1Script, -1
	object_event 11, 41, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, BirdKeeperGunner, -1
	object_event 11, 40, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster2Script, -1
	object_event 17, 41, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher2Script, -1
	object_event 22, 40, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPersian, -1
	object_event  3,  2, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerEngineerHarvey, -1
	object_event 18, 29, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanfBeverly1, -1
	object_event 16,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanmWilliam, -1
	object_event  8, 14, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassKrise, -1
	object_event 35, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkParlyzHeal, EVENT_NATIONAL_PARK_PARLYZ_HEAL
	object_event 29, 18, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkEngineerScript, -1
	object_event  5, 50, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkTMDig, EVENT_NATIONAL_PARK_TM_SLEEP_TALK
	object_event 13, 20, SPRITE_ENGINEER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkEngineer2Script, -1
