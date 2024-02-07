	object_const_def ; object_event constants
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3

OaksLab_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.DummyScene:
	end

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckRematch
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	buttonsound
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckRematch:
	checkflag ENGINE_RALPH
	iffalse .BattleOak
.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

.OpenMtSilver:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .TrulyOpenMountSilver
	writetext OakGotAllBadgesText
	buttonsound
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	buttonsound
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	buttonsound
	sjump .CheckPokedex

.TrulyOpenMountSilver:
	writetext OakOpenMtSilverText
	buttonsound
	setevent EVENT_OPENED_MT_SILVER
	writetext OnceAgainThankYouText
	waitbutton
	closetext
	end

.BattleOak:
	writetext BattleOakText
	waitbutton
	closetext
	winlosstext OakWinText, OakLastMonText
	loadtrainer POKEMON_PROF, OAK
	startbattle
	reloadmapafterbattle
	opentext
;	checkevent EVENT_DECO_GOLD_TROPHY
;	iftrue .FinishOakBattle
;	writetext OakGivesGoldTrophyText
;	buttonsound
;	waitsfx
;	writetext PlayerGotGoldTrophyText
;	playsound SFX_CAUGHT_MON
;	waitsfx
;	buttonsound
;	pause 15
.FinishOakBattle:
	writetext OakBeatText
	waitbutton
	closetext
	setflag ENGINE_RALPH
	end

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd difficultbookshelf

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakWelcomeKantoText:
	text "Oak: Ah, <PLAY_G>!"
	line "It's good of you"

	para "to come see me!"

	para "You've got a"
	line "daunting task"

	para "ahead of you!"

	para "Don't get"
	line "discouraged!"
	done

OakLabDexCheckText:
	text "How is your"
	line "Journal coming?"

	para "Let's see…"
	done

OakLabGoodbyeText:
	text "If you're in the"
	line "area, I hope you"
	cont "come visit again."
	done

OakOpenMtSilverText:
	text "Oak: Well done,"
	line "<PLAYER>!"

	para "Well done indeed!"
	line "The Federation has"
	cont "lost control!"

	para "With new Leaders"
	line "in place, Kanto"
	cont "can rejoin the"
	cont "League!"

	para "The embargo should"
	line "lift shortly."

	para "I can't begin to"
	line "tell you how much"
	cont "we owe you and"
	cont "<RIVAL>!"

	para "It's not much of a"
	line "reward, but now"
	cont "you'll be able to"
	cont "go to Mt.Silver."

	para "It's the tallest"
	line "peak in both Kanto"
	cont "and Johto."

	para "Who knows what you"
	line "will find there?"

	para "Once again, thank"
	line "you for your"
	cont "efforts!"
	done

OakNoKantoBadgesText:
	text "Oak: Hmm? You"
	line "haven't found any"
	cont "candidates yet?"

	para "Well, no one said"
	line "it would be easy,"
	cont "now did they?"

	para "Relax!"

	para "You've got <RIVAL>"
	line "helping you!"

	para "That's better than"
	line "anyone else, I'd"
	cont "say!"
	done

OakYesKantoBadgesText:
	text "Oak: Ah, starting"
	line "to find candidates"
	cont "are you?"

	para "This region is"
	line "depending on you"
	cont "and <RIVAL>!"

	para "Don't hesitate to"
	line "ask <RIVAL> for"
	cont "help sometime!"

	para "Good luck!"

	para "Come and see me"
	line "when you finish"
	cont "your mission!"
	done

OaksAssistant1Text:
	text "The Prof's #mon"
	line "Talk TV program"

	para "isn't aired here"
	line "in Kanto."

	para "Understandable,"
	line "given the current"
	cont "circumstances…"
	done

OaksAssistant2Text:
	text "Thanks to your"
	line "work on the"
	cont "Journal, the Prof's"

	para "research is coming"
	line "along great."
	done

OaksAssistant3Text:
	text "Hopefully I can"
	line "travel to Johto"
	cont "for research one"
	cont "day…"
	done

OaksLabPoster1Text:
	text "Press Start to"
	line "open the Menu."
	done

OaksLabPoster2Text:
	text "The Save option is"
	line "on the Menu."

	para "Use it in a timely"
	line "manner."
	done

OaksLabTrashcanText:
	text "There's nothing in"
	line "here…"
	done

OaksLabPCText:
	text "There's an e-mail"
	line "message on the PC."

	para "…"

	para "Prof.Oak, how is"
	line "your research"
	cont "coming along?"

	para "I'll be starting on"
	line "mine soon."

	para "The lab is all"
	line "done and primed"
	cont "for science!"

	para "Hope to see you"
	line "again someday."

	para "Elm in New Bark"
	line "Town 8-)"
	done

OakGotAllBadgesText:
	text "Oak: Oh, I see you"
	line "have found all of"
	cont "candidates!"

	para "Wonderful!"

	para "Now it's time to"
	line "take back Kanto!"
	done

OnceAgainThankYouText:
	text "Oak: Once again,"
	line "thank you!"
	done

PlayerGotSilverTrophy:
	text "<PLAYER> got the"
	line "Silver Trophy!"
	done

BattleOakText:
	text "Oak: Good to see"
	line "you <PLAYER>!"

	para "You know, I used"
	line "to be quite the"
	cont "trainer in my"
	cont "heyday."

	para "Care to test your"
	line "might against the"
	cont "former Champion?"
	done

OakWinText:
	text "Oak: The savior of"
	line "Kanto indeed!"
	done

OakLastMonText:
	text "Oak: I haven't felt"
	line "this rush in a"
	cont "long time!"
	done

OakBeatText:
	text "Oak: Your skills"
	line "surpass even my"
	cont "best expectations!"

	para "There is no doubt"
	line "in my mind that"
	cont "you're the best"
	cont "trainer in the"
	cont "world!"

	para "Never let anyone"
	line "say different!"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	db 0 ; coord events

	db 16 ; bg events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	db 4 ; object events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  1,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
