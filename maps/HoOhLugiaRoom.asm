	object_const_def
	const HOOHLUGIAROOM_EIN
	const HOOHLUGIAROOM_HO_OH
	const HOOHLUGIAROOM_LUGIA
	const HOOHLUGIAROOM_RAIKOU
	const HOOHLUGIAROOM_RIVAL1
	const HOOHLUGIAROOM_RIVAL2
	const HOOHLUGIAROOM_RIVAL3
	const HOOHLUGIAROOM_OFFICER

HoOhLugiaRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EinScript:
	opentext
	checkevent EVENT_BEAT_EIN
	iftrue .AfterEin
	writetext VeryInterestingText
	waitbutton
	closetext
	pause 10
	showemote EMOTE_SHOCK, HOOHLUGIAROOM_EIN, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	faceplayer
	opentext
	writetext YoureThatChildText
	waitbutton
	closetext
	winlosstext, EinWinText, EinLastText
	loadtrainer, EIN, EIN1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_EIN
	opentext
	writetext ImpressiveBattlingText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .RaikouEscapesDown
	pause 15
	playsound SFX_BALL_POOF
	appear HOOHLUGIAROOM_RAIKOU
	showemote EMOTE_SHOCK, HOOHLUGIAROOM_EIN, 15
	turnobject HOOHLUGIAROOM_EIN, RIGHT
	sjump .RaikouEscapesFinish
.RaikouEscapesDown:
	moveobject HOOHLUGIAROOM_RAIKOU, 5, 8
	pause 15
	playsound SFX_BALL_POOF
	appear HOOHLUGIAROOM_RAIKOU
	showemote EMOTE_SHOCK, HOOHLUGIAROOM_EIN, 15
	turnobject HOOHLUGIAROOM_EIN, DOWN
.RaikouEscapesFinish:
	pause 10
	cry RAIKOU
	pause 10
	playsound SFX_WARP_FROM
	applymovement HOOHLUGIAROOM_RAIKOU, RaikouLeaves1
	disappear HOOHLUGIAROOM_RAIKOU
	turnobject HOOHLUGIAROOM_EIN, DOWN
	opentext
	writetext IntriguingText
	waitbutton
	closetext
	faceplayer
	opentext
	writetext MyHypothesisWasWrongText
	waitbutton
	closetext
	pause 10
	appear HOOHLUGIAROOM_RIVAL1
	readvar VAR_FACING
	ifequal UP, .RivalWalksToEinAlt
	applymovement HOOHLUGIAROOM_RIVAL1, RivalWalksToEin1
	sjump .ContinueEin

.RivalWalksToEinAlt:
	applymovement HOOHLUGIAROOM_RIVAL1, RivalWalksToEin2
	applymovement PLAYER, PlayerMovesToEin
	turnobject PLAYER, DOWN
	applymovement HOOHLUGIAROOM_RIVAL1, RivalWalksToEin3
	turnobject PLAYER, RIGHT
.ContinueEin:
	turnobject HOOHLUGIAROOM_EIN, DOWN
	opentext
	writetext JustSawRaikouText
	buttonsound
	getitemname STRING_BUFFER_4, MASTER_BALL
	scall GivesRocketBall
	giveitem MASTER_BALL, 1
	buttonsound
	itemnotify
	writetext ThatsARocketBallText
	waitbutton
	closetext
	pause 10
	applymovement HOOHLUGIAROOM_RIVAL1, RivalLeavesEin
	playsound SFX_EXIT_BUILDING
	disappear HOOHLUGIAROOM_RIVAL1
	turnobject HOOHLUGIAROOM_EIN, UP
	setevent EVENT_OPEN_DOOR_IN_LAIR
	setevent EVENT_LAIR_SUICUNE
	setevent EVENT_LAIR_ENTEI
	clearevent EVENT_ROUTE_29_RAIKOU
	end

.AfterEin:
	writetext MaybeOrreText
	waitbutton
	closetext
	end

GivesRocketBall:
	jumpstd receiveitem
	end

EinLastText:
	text "Perhaps this is"
	line "impossible…"
	done

HoOhTank:
	refreshscreen
	pokepic HO_OH
	cry HO_OH
	waitbutton
	closepokepic
	opentext
	writetext HoOhIsInPainText
	waitbutton
	closetext
	end

LugiaTank:
	refreshscreen
	pokepic LUGIA
	cry LUGIA
	waitbutton
	closepokepic
	opentext
	writetext LugiaIsInPainText
	waitbutton
	closetext
	end

HoOhLugiaRoomOfficerScript:
	faceplayer
	opentext
	checkitem POKE_BALL
	iffalse .NeedPokeBalls
	writetext GoodThingWeStoppedThemText
	waitbutton
	closetext
	end

.NeedPokeBalls:
	writetext YouNeedBallsText
	buttonsound
	getitemname STRING_BUFFER_4, POKE_BALL
	scall OfficerGivesBalls
	giveitem POKE_BALL, 10
	buttonsound
	itemnotify
	writetext ThatOuttaDoItText
	waitbutton
	closetext
	end

OfficerGivesBalls:
	jumpstd receiveitem
	end

RivalWalksToEin1:
	step UP
	step UP
	step UP
	step_end

RivalWalksToEin2:
	step UP
	step UP
	step_end

RivalWalksToEin3:
	step UP
	step_end

PlayerMovesToEin:
	step LEFT
	step UP
	step_end

RivalLeavesEin:
	step DOWN
	step DOWN
	step DOWN
	step_end

RaikouLeaves1:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	remove_sliding
	step_end

HoOhIsInPainText:
	text "Ho-Oh looks like"
	line "it's in pain…"
	done

LugiaIsInPainText:
	text "Lugia looks like"
	line "it's in pain…"
	done

VeryInterestingText:
	text "…Hm…"

	para "…Very interesting…"

	para "Imagine how strong"
	line "they could be with"
	cont "closed hearts…"
	done

YoureThatChildText:
	text "…What?"

	para "Oh, you're that"
	line "trainer I've been"
	cont "hearing about."

	para "<PLAYER>, was it?"

	para "I'm more interested"
	line "in science than"
	cont "battling, but I"
	cont "still have a job"
	cont "to do."
	done

EinWinText:
	text "They were right"
	line "about you…"
	done

ImpressiveBattlingText:
	text "Impressive skills"
	line "you have."

	para "I only joined this"
	line "organization to"
	cont "further my studies"
	cont "of #mon power."

	para "They won't let me"
	line "conduct my"
	cont "research on the"
	cont "process of closing"
	cont "hearts."

	para "Quite unfortunate,"
	line "really…"
	done

IntriguingText:
	text "Most intriguing…"
	done

MyHypothesisWasWrongText:
	text "It broke out all"
	line "on its own."

	para "It appears the"
	line "Rocket Ball needs"
	cont "more work."

	para "Perhaps it has"
	line "to do with"
	cont "trust?"
	done

JustSawRaikouText:
	text "<RIVAL>: I just"
	line "saw Raikou speed"
	cont "by. Did you free"
	cont "it?"

	para "Ein: It wasn't"
	line "your friend."

	para "The Rocket Ball,"
	line "designed to catch"
	cont "without fail, has,"
	cont "indeed, failed."

	para "<RIVAL>: Hah!"

	para "That means we can"
	line "free the others"
	cont "the same way,"
	cont "right?"

	para "Ein: Statistically"
	line "speaking, yes."

	para "<RIVAL>: Great!"

	para "Now let them out!"

	para "Ein: Sorry, but I"
	line "can't do that."

	para "I don't have the"
	line "key. The boss has"
	cont "it. I suppose they"
	cont "didn't trust me."

	para "Here, take these."
	line "They're of no use"
	cont "to me."
	done

ThatsARocketBallText:
	text "<RIVAL>: These are"
	line "those Rocket Balls"
	cont "you were talking"
	cont "about."

	para "Why are you giving"
	line "us these?"

	para "Ein: I will be"
	line "leaving shortly."

	para "I have no further"
	line "use for those who"
	cont "would stifle my"
	cont "genius."

	para "I hope to find"
	line "someone to finance"
	cont "my Shadow #mon"
	cont "research instead."

	para "<RIVAL>: Shadow"
	line "#mon?"

	para "Ein: You needn't"
	line "worry about that."

	para "I believe that"
	line "those Rocket Balls"
	cont "may work for you."

	para "Your #mon seem"
	line "to trust you, so"
	cont "anything you catch"
	cont "may trust you as"
	cont "well."

	para "Now, please leave."

	para "I have important"
	line "things to finish."

	para "I'll open the door"
	line "in the hallway."

	para "<RIVAL>: I don't"
	line "like this guy, but"
	cont "at least we have a"
	cont "chance now."

	para "I'm going on ahead."

	para "See ya."
	done

MaybeOrreText:
	text "Perhaps Greevil"
	line "back home will"
	cont "finance me…"
	done

GoodThingWeStoppedThemText:
	text "Good thing we"
	line "stopped them, eh?"
	done

YouNeedBallsText:
	text "You look like you"
	line "need some #-"
	cont "Balls."

	para "I got some spares"
	line "right here."
	done

ThatOuttaDoItText:
	text "That outta do it!"

	para "Come back if you"
	line "need more."
	done

HoOhLugiaRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 11, ROCKET_LAIR_HALLWAY_1, 3
	warp_event  6, 11, ROCKET_LAIR_HALLWAY_1, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  2, BGEVENT_READ, HoOhTank
	bg_event  8,  2, BGEVENT_READ, LugiaTank

	db 8 ; object events
	object_event  5,  7, SPRITE_EIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EinScript, EVENT_HIDEOUT_EIN
	object_event  4,  1, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_HO_OH
	object_event  8,  1, SPRITE_LUGIA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_LUGIA
	object_event  6,  7, SPRITE_RAIKOU, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HIDEOUT_RAIKOU
	object_event  5, 11, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HOOH_LUGIA_ROOM_RIVAL1
	object_event  4,  3, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HOOH_LUGIA_ROOM_RIVAL2
	object_event  8,  3, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_HOOH_LUGIA_ROOM_RIVAL3
	object_event  2,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HoOhLugiaRoomOfficerScript, EVENT_HOOH_LUGIA_ROOM_OFFICER
