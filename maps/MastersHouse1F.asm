	object_const_def ; object_event constants
	const MASTERSHOUSE1F_MASTER
	const MASTERSHOUSE1F_RIVAL
	const MASTERSHOUSE1F_POKE_BALL1
	const MASTERSHOUSE1F_POKE_BALL2

MastersHouse1F_MapScripts:
	db 4 ; scene scripts
	scene_script .MeetMaster ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_CANT_LEAVE_HOUSE
	scene_script .DummyScene2 ; SCENE_MASTERS_HOUSE_1F_NOTHING
	scene_script .DummyScene3 ; SCENE_DONE_WITH_2F

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MasterWeekends

.MasterWeekends:
	checkevent EVENT_BEAT_MASTER
	iftrue .IsItWeekend
	return

.IsItWeekend:
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .MasterAppears
	ifequal SUNDAY, .MasterAppears
	disappear MASTERSHOUSE1F_MASTER
	return

.MasterAppears:
	appear MASTERSHOUSE1F_MASTER
	return

.MeetMaster:
	prioritysjump WalkUpToRival
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

WalkUpToRival:
	appear MASTERSHOUSE1F_RIVAL
	applymovement PLAYER, MastersHouse1F_WalkUpMovement
	turnobject MASTERSHOUSE1F_RIVAL, LEFT
	opentext
	writetext HeySleepyHeadText
	waitbutton
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, UP
	turnobject PLAYER, UP
	applymovement MASTERSHOUSE1F_MASTER, MastersHouse1F_MastersMovement
	opentext
	writetext GoodOfYouText
	waitbutton
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext GoodSportText
	waitbutton
	setscene SCENE_CANT_LEAVE_HOUSE
	closetext
	end

TryToLeaveHouseScript:
	opentext
	writetext WhereDoYouThinkYoureGoingText
	waitbutton
	closetext
	applymovement PLAYER, MastersHouse1F_CantLeaveMovement
	end

MaastersHouseMasterScript:
	readvar VAR_BADGES
	ifequal 0, .MasterNoBadges
	ifequal 1, .Master1Badge
	ifequal 2, .Master2Badges
	ifequal 3, .Master3Badges
	ifequal 4, .Master4Badges
	ifequal 5, .Master5Badges
	ifequal 6, .Master6Badges
	ifequal 7, .Master7Badges

.MasterNoBadges:
	checkevent EVENT_MASTERS_RIVAL_DONE
	iftrue .MasterGoodLuck
	checkevent EVENT_BEAT_DRAGON_KID_CLAIR
	iftrue .BeatDragonKid1
	checkevent EVENT_BEAT_DRAGON_KID_LANCE
	iftrue .BeatDragonKid2
	jumptextfaceplayer MastersHouseMasterText

.Master1Badge:
	jumptextfaceplayer MasterPryceText

.Master2Badges:
	jumptextfaceplayer MasterEnokiText

.Master3Badges:
	jumptextfaceplayer MasterChigusaText

.Master4Badges:
	jumptextfaceplayer MasterByronText

.Master5Badges:
	jumptextfaceplayer MasterMiltonText

.Master6Badges:
	jumptextfaceplayer MasterKurtText

.Master7Badges:
	jumptextfaceplayer MasterWalkerText

.MasterGoodLuck:
	jumptextfaceplayer MasterGoodLuckText

.BeatDragonKid1:
	jumptextfaceplayer HmText

.BeatDragonKid2:
	jumptextfaceplayer HmText

MastersHouseRivalScript:
	jumptextfaceplayer MastersHouseRivalText

MastersHouseRival2Script:
	jumptextfaceplayer MastersHouseRivalText

DratiniPokeballScript:
	refreshscreen
	pokepic DRATINI
	cry DRATINI
	waitbutton
	closepokepic
	opentext
	writetext TakeDratiniText
	yesorno
	iffalse DidntChooseDratiniScript
	disappear MASTERSHOUSE1F_POKE_BALL1
	setevent EVENT_GOT_DRATINI_FROM_MASTER
	writetext ChoseDratiniText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, DRATINI
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke DRATINI, 5, ORAN_BERRY
	closetext
	sjump RivalLarvitarScript

LarvitarPokeballScript:
	refreshscreen
	pokepic LARVITAR
	cry LARVITAR
	waitbutton
	closepokepic
	opentext
	writetext TakeLarvitarText
	yesorno
	iffalse DidntChooseLarvitarScript
	disappear MASTERSHOUSE1F_POKE_BALL2
	setevent EVENT_GOT_LARVITAR_FROM_MASTER
	writetext ChoseLarvitarText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, LARVITAR
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke LARVITAR, 5, ORAN_BERRY
	closetext
	sjump RivalDratiniScript

DidntChooseDratiniScript:
	writetext DidntChooseDratiniText
	waitbutton
	closetext
	end

DidntChooseLarvitarScript:
	writetext DidntChooseLarvitarText
	waitbutton
	closetext
	end

RivalLarvitarScript:
	applymovement MASTERSHOUSE1F_RIVAL, MastersHouse1F_RivalLarvitarMovement
	disappear MASTERSHOUSE1F_POKE_BALL2
	opentext
	writetext RivalChoseText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, LARVITAR
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	writetext RivalStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext IsntItCuteText
	waitbutton
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, UP
	turnobject PLAYER, UP
	sjump MastersTestScript1

.Female:
	writetext RivalStarter2Text
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext HehToughMonText
	waitbutton
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, UP
	turnobject PLAYER, UP
	sjump MastersTestScript1

RivalDratiniScript:
	applymovement MASTERSHOUSE1F_RIVAL, MastersHouse1F_RivalDratiniMovement
	disappear MASTERSHOUSE1F_POKE_BALL1
	opentext
	writetext RivalChoseText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, DRATINI
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female2
	writetext RivalStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext IsntItCuteText
	waitbutton
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, UP
	turnobject PLAYER, UP
	sjump MastersTestScript2

.Female2:
	writetext RivalStarter2Text
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext HehToughMonText
	waitbutton
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, UP
	turnobject PLAYER, UP
	sjump MastersTestScript2

MastersTestScript1:
	opentext
	writetext MastersTestText
	waitbutton
	closetext
	opentext
	writetext LetsStartText
	waitbutton
	closetext
	applymovement MASTERSHOUSE1F_RIVAL, HeadUpstairs1Movement
	playsound SFX_EXIT_BUILDING
	disappear MASTERSHOUSE1F_RIVAL
	setscene SCENE_CANT_LEAVE_HOUSE
	setevent EVENT_GOT_A_POKEMON_FROM_MASTER
	setevent EVENT_RIVAL_AT_MASTERS_HOUSE_1
	waitsfx
	end

MastersTestScript2:
	opentext
	writetext MastersTestText
	waitbutton
	closetext
	opentext
	writetext LetsStartText
	waitbutton
	closetext
	applymovement MASTERSHOUSE1F_RIVAL, HeadUpstairs2Movement
	playsound SFX_EXIT_BUILDING
	disappear MASTERSHOUSE1F_RIVAL
	setscene SCENE_CANT_LEAVE_HOUSE
	setevent EVENT_GOT_A_POKEMON_FROM_MASTER
	setevent EVENT_RIVAL_AT_MASTERS_HOUSE_1
	waitsfx
	end

FinishTutorialScript:
	checkevent EVENT_2F_RIVAL_1
	iftrue .JourneyStart2
	end

.JourneyStart2:
	appear MASTERSHOUSE1F_RIVAL
	sjump WalkUpToRival2
	end

WalkUpToRival2:
	applymovement PLAYER, PlayerMovesToRivalMovement
	turnobject PLAYER, UP
	applymovement MASTERSHOUSE1F_MASTER, MastersLastMovement
	opentext
	writetext CongratulationsText
	waitbutton
	closetext
	opentext
	writetext ThankYouText
	waitbutton
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext ImOffText
	buttonsound
	getitemname STRING_BUFFER_4, POKE_BALL
	scall Rival_ReceiveTheBalls
	giveitem POKE_BALL, 10
	buttonsound
	itemnotify
	writetext RivalGoodByeText
	waitbutton
	closetext
	applymovement MASTERSHOUSE1F_RIVAL, RivalLeaves1Movement
	playsound SFX_EXIT_BUILDING
	disappear MASTERSHOUSE1F_RIVAL
	setscene SCENE_MASTERS_HOUSE_1F_NOTHING
	setevent EVENT_MASTERS_RIVAL_DONE
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	waitsfx
	applymovement MASTERSHOUSE1F_MASTER, MasterLastMovement
	turnobject PLAYER, UP
	opentext
	writetext TalkToGranny
	closetext
	end

Rival_ReceiveTheBalls:
	jumpstd receiveitem
	end

MastersHouse1F_WalkUpMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

MastersHouse1F_MastersMovement:
	step DOWN
	step DOWN
	step_end

MastersHouse1F_CantLeaveMovement:
	step UP
	step_end

MastersHouse1F_RivalLarvitarMovement:
	step UP
	step_end

MastersHouse1F_RivalDratiniMovement:
	step LEFT
	step UP
	step_end

HeadUpstairs1Movement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step_end

HeadUpstairs2Movement:
	step UP
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step_end

PlayerMovesToRivalMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step_end

RivalLeaves1Movement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MastersLastMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

MasterLastMovement:
	step DOWN
	step_end

HeySleepyHeadText:
	text "Hey sleepy head!"
	line "about time you"
	cont "woke up! Don't"

	para "worry, we didn't"
	line "start without you!"
	done

GoodOfYouText:
	text "Good of you to"
	line "have come."

	para "Today is an impor-"
	line "tant day. Today,"
	cont "you two start your"

	para "#mon journeys."
	line "You two have taken"
	cont "great care of the"

	para "#mon here in"
	line "Blackthorn, and"
	cont "now, you may have"

	para "one of them. Go"
	line "on, choose one of"
	cont "#balls in"

	para "front of you."
	done

GoodSportText:
	text "I can't believe"
	line "it."

	para "It's finally time."

	para "We can be #mon"
	line "trainers. Alright!"

	para "Go ahead and pick."
	line "I'm a good sport,"
	cont "so I'll wait."
	done

WhereDoYouThinkYoureGoingText:
	text "And just where do"
	line "you think you're"
	cont "going?"
	done

TakeDratiniText:
	text "Master: Will you"
	line "take Dratini, the"
	cont "pride of"

	para "Blackthorn City?"
	done

TakeLarvitarText:
	text "Master: Will you"
	line "take Larvitar,"
	cont "the rampaging"

	para "beast?"
	done

DidntChooseDratiniText:
	text "Master: are you"
	line "sure? It is of"
	cont "great importance"

	para "that you choose"
	line "wisely."
	done

DidntChooseLarvitarText:
	text "Master: Take your"
	line "time, and try not"
	cont "to make a mistake."
	done

ChoseDratiniText:
	text "Master: Excellent"
	line "choice."
	done

ChoseLarvitarText:
	text "Master: Hmm..."
	line "Interesting."
	done

RivalChoseText:
	text "Alright, I'll"
	line "take this one!"
	done

RecievedStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

RivalStarterText:
	text "<RIVAL> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

RivalStarter2Text:
	text "<RIVAL> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

IsntItCuteText:
	text "Giggle! Isn't my"
	line "my #mon cute?"
	done

HehToughMonText:
	text "Heh! My #mon"
	line "looks tough!"
	done

MastersTestText:
	text "Master: Before you"
	line "begin, your"
	cont "journeys, I want"

	para "to test you."
	line "Upstairs are my"
	cont "grandchildren,"

	para "Lance and Clair."
	line "You've known them"
	cont "since they were"

	para "babies."

	para "Go and battle"
	line "them. Do not"
	cont "worry, they are"

	para "competent enough"
	line "trainers at this"
	cont "point. This will"

	para "strengthen the"
	line "bond between you"
	cont "and your #mon."
	done

LetsStartText:
	text "<RIVAL>: Sounds"
	line "simple enough."
	cont "This'll be fun!"
	done

MastersHouseMasterText:
	text "Go, and face your"
	line "first challenge."
	done

HmText:
	text "Hm."
	done

MastersHouseRivalText:
	text "Go on!"
	done

CongratulationsText:
	text "Congratulations."
	line "I could hear"
	cont "Clair's screams of"

	para "anger from down"
	line "here. You have"
	cont "passed your first"

	para "test. Now you are"
	line "ready to begin"
	cont "your journeys."

	para "Go forth, and come"
	line "back once you have"
	cont "earned seven"

	para "Gym Badges. Then I"
	line "shall test you one"
	cont "last time."
	done

ThankYouText:
	text "<RIVAL>: Thank you,"
	line "Master!"
	done

ImOffText:
	text "Well, it looks"
	line "like it's time!"
	cont "We can finally"

	para "start our"
	line "journeys!"

	para "I'm sure we'll"
	line "run into each"
	cont "other from time"

	para "to time. See you"
	line "later!"

	para "...Oh, wait!"

	para "Before we go, have"
	line "some # Balls"
	cont "to catch #mon!"
	done

RivalGoodByeText:
	text "I'm off. See you"
	line "later!"
	done

MasterGoodLuckText:
	text "Good luck to you"
	line "both on your"
	cont "journeys."
	done

TalkToGranny:
	text "Be sure to speak"
	line "to your grand-"
	cont "mother before you"

	para "go. She may have"
	line "something useful"
	cont "for you."
	done

MasterPryceText:
	text "Ah, I see you have"
	line "battled Pryce."

	para "He can be quite"
	line "the cold man."

	para "He has a soft"
	line "spot for children"
	cont "and Ice-types."

	para "You might find him"
	line "in Ice Path on"
	cont "Mondays."

	para "He claims it's"
	line "good for his body."

	para "I'll have to take"
	line "his word for it."

	para "I don't care for"
	line "the cold."
	done

MasterEnokiText:
	text "Ah, I see you have"
	line "battled Enoki."

	para "He's an old friend"
	line "of mine."

	para "He always had a"
	line "knack for the"
	cont "ethereal."
	
	para "He would always"
	line "act like there"
	cont "were ghosts"
	cont "around."

	para "I used to think"
	line "he was just"
	cont "joking."

	para "Maybe he was,"
	line "maybe he wasn't."

	para "On Thursdays, he"
	line "can be found on"
	cont "Bellchime Path."
	done

MasterChigusaText:
	text "Ah, I see you have"
	line "battled Chigusa."

	para "She happens to be"
	line "the youngest Gym"
	cont "Leader in Johto."

	para "She's the only"
	line "woman Leader as"
	cont "well."

	para "I commend her."

	para "Some older folks"
	line "may not like it,"

	para "but I think it's"
	line "great."

	para "The old ways"
	line "aren't always the"
	cont "best."

	para "On Tuesdays, you"
	line "can find her in"
	cont "the cave in the"
	cont "Wild Area."
	done

MasterByronText:
	text "Ah, I see you have"
	line "battled Byron."

	para "He's a native of"
	line "Canalave City in"
	cont "Sinnoh."

	para "He filled a"
	line "vacancy that"
	cont "few could fill."

	para "Perhaps someday"
	line "he will find a"
	cont "successor to"
	cont "replace him."

	para "On Wednesday, you"
	line "can find him at"
	cont "the Lighthouse."
	done

MasterMiltonText:
	text "Ah, I see you have"
	line "battled Milton."

	para "His wrangling"
	line "skills were second"
	cont "to none."

	para "His battling"
	line "skills aren't half"
	cont "bad either."

	para "He's fell on hard"
	line "times lately."

	para "The embargo has"
	line "been a problem."

	para "On Sundays, you"
	line "can find him back"
	cont "on his farm."
	done

MasterKurtText:
	text "Ah, I see you have"
	line "battled Kurt."

	para "His ability to"
	line "make balls was"
	cont "truly incredible."

	para "It's a shame that"
	line "Silph has put him"
	cont "out of business."

	para "His son still"
	line "sells his old"
	cont "work in Ecruteak."

	para "On Saturdays, you"
	line "can find him at"
	cont "his house."
	done

MasterWalkerText:
	text "Ah, I see you have"
	line "battled Walker."

	para "He wishes to"
	line "wander the world,"

	para "but he adheres to"
	line "his duties as a"
	cont "Gym Leader."

	para "On Fridays, you"
	line "can find him at"
	cont "Sprout Tower."
	done

MastersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4, 13, BLACKTHORN_CITY, 10
	warp_event  5, 13, BLACKTHORN_CITY, 10
	warp_event  4,  1, MASTERS_HOUSE_2F, 1

	db 5 ; coord events
	coord_event 2,  8, SCENE_CANT_LEAVE_HOUSE, TryToLeaveHouseScript
	coord_event 4,  8, SCENE_CANT_LEAVE_HOUSE, TryToLeaveHouseScript
	coord_event 5,  8, SCENE_CANT_LEAVE_HOUSE, TryToLeaveHouseScript
	coord_event 7,  8, SCENE_CANT_LEAVE_HOUSE, TryToLeaveHouseScript
	coord_event 5,  1, SCENE_DONE_WITH_2F, FinishTutorialScript

	db 0 ; bg events

	db 4 ; object events
	object_event  4,  2, SPRITE_MASTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MaastersHouseMasterScript, EVENT_MASTERS_HOUSE_MASTER
	object_event  5,  7, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MastersHouseRivalScript, EVENT_RIVAL_AT_MASTERS_HOUSE_1
	object_event  4,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DratiniPokeballScript, EVENT_DRATINI_POKEBALL_AT_MASTERS
	object_event  5,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LarvitarPokeballScript, EVENT_LARVITAR_POKEBALL_AT_MASTERS
