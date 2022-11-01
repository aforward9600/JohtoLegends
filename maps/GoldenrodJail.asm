	object_const_def ; object_event constants
	const GOLDENRODJAIL_OFFICER
	const GOLDENRODJAIL_ROCKET
	const GOLDENRODJAIL_BURGLAR
	const GOLDENRODJAIL_FRAUD
	const GOLDENRODJAIL_COOLTRAINER_M
	const GOLDENRODJAIL_COOLTRAINER_F
	const GOLDENRODJAIL_POKEFAN_M
	const GOLDENRODJAIL_POKEFAN_F
	const GOLDENRODJAIL_OFFICER_2
	const GOLDENRODJAIL_OFFICER_3

GoldenrodJail_MapScripts:
	db 0  ; scene scripts

	db 0 ; callbacks

GoldenrodJailOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_STRANGE_HAIR
	iftrue .ReleasedRocket
	checkevent EVENT_GOT_PORYGON_R
	iftrue .RocketInJail
	writetext PlentyOfCrimeLatelyText
	waitbutton
	closetext
	end

.RocketInJail:
	writetext GotHimselfCaughtText
	waitbutton
	closetext
	checkevent EVENT_ACCEPTED_GRUNTS_REQUEST
	iftrue .LetRocketOut
	end

.LetRocketOut:
	opentext
	writetext LetRocketOutText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .MovePlayerLeft
	ifequal UP, .MovePlayerLeft2
.OfficerGetsRocket:
	applymovement GOLDENRODJAIL_OFFICER_3, OfficerGetsRocketMovement
	disappear GOLDENRODJAIL_OFFICER_3
	pause 30
	playsound SFX_WALL_OPEN
	pause 15
	playsound SFX_WALL_OPEN
	pause 15
	moveobject GOLDENRODJAIL_OFFICER_3, 6, 5
	appear GOLDENRODJAIL_OFFICER_3
	applymovement GOLDENRODJAIL_OFFICER_3, OfficerGetsInPlaceMovement
	pause 10
	turnobject GOLDENRODJAIL_OFFICER_3, UP
	pause 10
	moveobject GOLDENRODJAIL_ROCKET, 6, 5
	appear GOLDENRODJAIL_ROCKET
	follow GOLDENRODJAIL_OFFICER_3, GOLDENRODJAIL_ROCKET
	applymovement GOLDENRODJAIL_OFFICER_3, RocketFollowsOfficer
	stopfollow
	turnobject GOLDENRODJAIL_OFFICER_3, LEFT
	turnobject GOLDENRODJAIL_ROCKET, LEFT
	pause 10
	opentext
	writetext YoureFreeToGoText
	waitbutton
	closetext
	applymovement GOLDENRODJAIL_ROCKET, RocketWalksToYouMovement
	opentext
	writetext HereIsTheItemText
	buttonsound
	giveitem STRANGE_HAIR
	writetext ReceivedStrangeHairText
	playsound SFX_ITEM
	waitsfx
	writetext PutStrangeHairInKeyItemText
	waitbutton
	setevent EVENT_GOT_STRANGE_HAIR
	closetext
	applymovement GOLDENRODJAIL_ROCKET, RocketLeavesMovement
	playsound SFX_EXIT_BUILDING
	disappear GOLDENRODJAIL_ROCKET
	pause 10
	applymovement GOLDENRODJAIL_OFFICER_3, OfficerGetsBackInPlaceMovement
	moveobject GOLDENRODJAIL_OFFICER_3, 4, 10
	end

.MovePlayerLeft:
	applymovement PLAYER, MovePlayerLeftMovement
	turnobject PLAYER, RIGHT
	sjump .OfficerGetsRocket

.MovePlayerLeft2:
	applymovement PLAYER, MovePlayerLeftMovement2
	turnobject PLAYER, RIGHT
	sjump .OfficerGetsRocket

.ReleasedRocket:
	writetext HopeIDidTheRightThingText
	waitbutton
	closetext
	end

RocketInJailTalk:
	checkevent EVENT_GOT_STRANGE_HAIR
	iftrue .EmptyCellTalk
	checkevent EVENT_GOT_PORYGON_R
	iffalse .EmptyCellTalk
	turnobject GOLDENRODJAIL_ROCKET, DOWN
	opentext
	checkevent EVENT_ACCEPTED_GRUNTS_REQUEST
	iftrue .ThanksMan
	writetext GetMeOuttaHereText
	yesorno
	iffalse .ComeOnMan
	writetext ThanksManText
	waitbutton
	closetext
	setevent EVENT_ACCEPTED_GRUNTS_REQUEST
	end

.EmptyCellTalk:
	opentext
	writetext ItLooksEmptyText
	waitbutton
	closetext
	end

.ComeOnMan:
	writetext ComeOnManText
	waitbutton
	closetext
	end

.ThanksMan:
	writetext ThanksManText
	waitbutton
	closetext
	end

SecondJailCellTalk:
	turnobject GOLDENRODJAIL_BURGLAR, DOWN
	opentext
	writetext DangGotCaughtText
	waitbutton
	closetext
	end

ThirdJailCellTalk:
	turnobject GOLDENRODJAIL_FRAUD, DOWN
	opentext
	writetext LastTimeICommitFraudText
	waitbutton
	closetext
	end

GoldenrodJailCooltrainerFScript:
	faceplayer
	opentext
	writetext MyBoyfriendIsAnIdiotText
	waitbutton
	closetext
	turnobject GOLDENRODJAIL_COOLTRAINER_F, UP
	opentext
	writetext CmonBabeText
	waitbutton
	closetext
	end

GoldenrodJailPokefanFScript:
	faceplayer
	opentext
	writetext MyHusbandNeedsToStopText
	waitbutton
	closetext
	turnobject GOLDENRODJAIL_POKEFAN_F, UP
	opentext
	writetext ListenHereText
	waitbutton
	closetext
	end

GoldenrodJailOfficer2Script:
	jumptextfaceplayer WatchingTheseGuysText

GoldenrodJailOfficer3Script:
	jumptextfaceplayer ImEatingDonutsText

Bookshelf1:
	jumptext Bookshelf1Text

Bookshelf2:
	jumptext Bookshelf2Text

Bookshelf3:
	jumptext Bookshelf3Text

Bookshelf4:
	jumptext Bookshelf4Text

Bookshelf5:
	jumptext Bookshelf5Text

Bookshelf6:
	jumptext Bookshelf6Text

OfficerGetsRocketMovement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

OfficerReturnsMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end

RocketFollowsOfficer:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

RocketWalksToYouMovement:
	step LEFT
	step LEFT
	step_end

RocketLeavesMovement:
	step DOWN
	step LEFT
	step DOWN
	step_end

OfficerGetsBackInPlaceMovement:
	step LEFT
	step LEFT
	step UP
	step_end

OfficerGetsInPlaceMovement:
	step DOWN
	step_end

MovePlayerLeftMovement:
	step DOWN
	step LEFT
	step LEFT
	step UP
	step_end

MovePlayerLeftMovement2:
	step LEFT
	step UP
	step_end

PlentyOfCrimeLatelyText:
	text "The chief has been"
	line "pretty busy as of"
	cont "late."

	para "There's plenty of"
	line "crime recently,"
	cont "and there's not"
	cont "much time to goof"
	cont "off."

	para "If you see anyone"
	line "suspicious, let us"
	cont "know, OK?"
	done

GotHimselfCaughtText:
	text "You're not going"
	line "to believe this!"

	para "We caught one of"
	line "those guys that"
	cont "were involved in"
	cont "the Lighthouse"
	cont "invasion!"

	para "He says he quit"
	line "before that, but"
	cont "we found him in"
	cont "the uniform."

	para "Oh well."

	para "Guess he should"
	line "have gotten rid"
	cont "of his uniform"
	cont "beforehand."
	done

GetMeOuttaHereText:
	text "Hey, you!"

	para "Remember me?"

	para "I gave you that"
	line "Porygon!"

	para "C'mon, you gotta"
	line "get me outta here!"

	para "You can vouch for"
	line "me, right?"

	para "If you testify in"
	line "my favor, I'll"
	cont "give you another"
	cont "gift!"

	para "I swiped this rare"
	line "thing before I"
	cont "left."

	para "I was going to"
	line "pawn it off, but"
	cont "if it can buy my"
	cont "freedom, I'll give"
	cont "it to you!"
	done

ComeOnManText:
	text "Come on!"

	para "Please?"
	done

ThanksManText:
	text "Thanks!"

	para "Convince one of"
	line "those officers,"

	para "and they should"
	line "let me out!"
	done

ItLooksEmptyText:
	text "This cell looks"
	line "empty…"
	done

DangGotCaughtText:
	text "Dang, I got caught"
	line "trying to loot the"
	cont "old tower."

	para "What's the big"
	line "deal?"

	para "They're gonna"
	line "knock it down any-"
	cont "way."
	done

LastTimeICommitFraudText:
	text "That's the last"
	line "time I commit tax"
	cont "fraud."
	done

MyBoyfriendIsAnIdiotText:
	text "My boyfriend is"
	line "such an idiot."

	para "I don't know why"
	line "I'm bailing him"
	cont "out."
	done

CmonBabeText:
	text "Come on, babe!"

	para "I promise I won't"
	line "jaywalk again!"
	done

MyHusbandNeedsToStopText:
	text "My husband needs"
	line "to stop ending up"
	cont "here."

	para "It's embarasing."
	done

ListenHereText:
	text "Listen here!"

	para "I can stop anytime"
	line "I want!"

	para "Hey, kid!"

	para "Got any Game"
	line "Corner coins?"
	done

WatchingTheseGuysText:
	text "I'm watching these"
	line "guys while they"
	cont "talk with their"
	cont "girls."

	para "Not the first time"
	line "I've had to for"
	cont "these two."
	done

ImEatingDonutsText:
	text "Not now, kid."

	para "I'm eating some"
	line "donuts."

	para "What?"

	para "I don't care that"
	line "it's a stereotype."

	para "They're delicious!"
	done

Bookshelf1Text:
	text "Name: C. Redfield"

	para "Crime: Illegal"
	line "performance"
	cont "enhancers."
	done

Bookshelf2Text:
	text "Name: J."
	line "Valentine"

	para "Crime: Breaking"
	line "and entering."
	done

Bookshelf3Text:
	text "Name: B. Burton"

	para "Crime: Discharge"
	line "of deadly weapon."
	done

Bookshelf4Text:
	text "Name: R. Chambers"

	para "Crime: Illegal"
	line "plant possession."
	done

Bookshelf5Text:
	text "Name: A. Wesker"

	para "Crime: Unauthor-"
	line "ized biological"
	cont "experiments."
	done

Bookshelf6Text:
	text "Name: J. Frost"

	para "Crime: Abuse of a"
	line "Growlithe."
	done

LetRocketOutText:
	text "……………Pardon?"

	para "He really did"
	line "quit?"

	para "Well, can't argue"
	line "with that!"

	para "Wait right here."
	done

YoureFreeToGoText:
	text "Well, you're free"
	line "to go!"

	para "Thank you"
	line "officer!"

	para "And thank you,"
	line "kid!"

	para "Hope to see you"
	line "around!"
	done

HereIsTheItemText:
	text "Psst…"

	para "Here's that item."

	para "They'll be pretty"
	line "mad that's gone"
	cont "missing."

	para "I'd sell it to a"
	line "collector."

	para "See ya."
	done

ReceivedStrangeHairText:
	text "<PLAYER> received"
	line "Strange Hair."
	done

PutStrangeHairInKeyItemText:
	text "<PLAYER> put the"
	line "Strange Hair in"
	cont "the Key Item"
	cont "pocket."
	done

HopeIDidTheRightThingText:
	text "I hope I did the"
	line "right thing in"
	cont "letting him go."
	done

GoldenrodJail_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 12, GOLDENROD_CITY, 5
	warp_event  3, 12, GOLDENROD_CITY, 5

	db 0 ; coord events

	db 9 ; bg events
	bg_event  4,  4, BGEVENT_READ, RocketInJailTalk
	bg_event 10,  4, BGEVENT_READ, SecondJailCellTalk
	bg_event 16,  4, BGEVENT_READ, ThirdJailCellTalk
	bg_event  8,  9, BGEVENT_READ, Bookshelf1
	bg_event  9,  9, BGEVENT_READ, Bookshelf2
	bg_event 10,  9, BGEVENT_READ, Bookshelf3
	bg_event 11,  9, BGEVENT_READ, Bookshelf4
	bg_event 12,  9, BGEVENT_READ, Bookshelf5
	bg_event 13,  9, BGEVENT_READ, Bookshelf6

	db 10 ; object events
	object_event  3,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodJailOfficer3Script, -1
	object_event  4,  3, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_JAILED_ROCKET
	object_event 10,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 16,  3, SPRITE_CLERK, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 18,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 18, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodJailCooltrainerFScript, -1
	object_event 20,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 20, 10, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodJailPokefanFScript, -1
	object_event 17,  5, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodJailOfficer2Script, -1
	object_event  4, 10, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodJailOfficerScript, -1
