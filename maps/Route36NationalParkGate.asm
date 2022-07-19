	object_const_def ; object_event constants
	const ROUTE36NATIONALPARKGATE_OFFICER2

Route36NationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE36NATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE36NATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	end

Route36NationalParkGateOfficerScript:
	faceplayer
	opentext
	writetext Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText
	waitbutton
	closetext
	end

Route36ParkGate_DayToText:
	jumpstd daytotext
	end

Route36NationalParkGatePlayerWaitWithContestantsMovement:
	big_step DOWN
	big_step RIGHT
	turn_head UP
	step_end

Route36NationalParkGateOfficer1AskToParticipateText:
	text "Today's @"
	text_ram wStringBuffer3
	text "."
	line "That means the"

	para "Bug-Catching Con-"
	line "test is on today."

	para "The rules are sim-"
	line "ple."

	para "Using one of your"
	line "#mon, catch a"

	para "bug #mon to be"
	line "judged."

	para "Would you like to"
	line "give it a try?"
	done

Route36NationalParkGateOfficer1GiveParkBallsText:
	text "Here are the Bug"
	line "Balls for the"
	cont "Contest."
	done

Route36NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> received"
	line "20 Bug Balls."
	done

Route36NationalParkGateOfficer1ExplainsRulesText:
	text "The person who"
	line "gets the strong-"
	cont "est bug #mon"
	cont "is the winner."

	para "You have 20"
	line "minutes."

	para "If you run out of"
	line "Bug Balls, you're"
	cont "done."

	para "You can keep the"
	line "last #mon you"
	cont "catch as your own."

	para "Go out and catch"
	line "the strongest bug"

	para "#mon you can"
	line "find!"
	done

Route36NationalParkGateOfficer1AskToUseFirstMonText:
	text "Uh-oh…"

	para "You have more than"
	line "one #mon."

	para "You'll have to use"
	line "@"
	text_ram wStringBuffer3
	text ", the"

	para "first #mon in"
	line "your party."

	para "Is that OK with"
	line "you?"
	done

Route36NationalParkGateOfficer1WellHoldYourMonText:
	text "Fine, we'll hold"
	line "your other #mon"
	cont "while you compete."
	done

Route36NationalParkGatePlayersMonLeftWithHelperText:
	text "<PLAYER>'s #mon"
	line "were left with the"
	cont "Contest Helper."
	done

Route36NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Please choose the"
	line "#mon to be used"

	para "in the Contest,"
	line "then come see me."
	done

Route36NationalParkGateOfficer1TakePartInFutureText:
	text "OK. We hope you'll"
	line "take part in the"
	cont "future."
	done

Route36NationalParkGateOfficer1FirstMonCantBattleText:
	text "Uh-oh…"
	line "The first #mon"

	para "in your party"
	line "can't battle."

	para "Please switch it"
	line "with the #mon"

	para "you want to use,"
	line "then come see me."
	done

Route36NationalParkGateOfficer1MakeRoomText:
	text "Uh-oh…"
	line "Both your party"

	para "and your ADS Box"
	line "are full."

	para "You have no room"
	line "to put the bug"
	cont "#mon you catch."

	para "Please make room"
	line "in your party or"

	para "your ADS Box, then"
	line "come see me."
	done

Route36NationalParkGateOfficer1EggAsFirstMonText:
	text "Uh-oh…"
	line "You have an Egg as"

	para "the first #mon"
	line "in your party."

	para "Please switch it"
	line "with the #mon"

	para "you want to use,"
	line "then come see me."
	done

Route36NationalParkGateOfficer1WantToFinishText:
	text "You still have @"
	text_ram wStringBuffer3
	text_start
	line "minute(s) left."

	para "Do you want to"
	line "finish now?"
	done

Route36NationalParkGateOfficer1WaitHereForAnnouncementText:
	text "OK. Please wait"
	line "here for the"

	para "announcement of"
	line "the winners."
	done

Route36NationalParkGateOfficer1OkGoFinishText:
	text "OK. Please go back"
	line "outside and finish"
	cont "up."
	done

Route36NationalParkGateOfficer1ContestIsOverText:
	text "Today's Contest is"
	line "over. We hope you"

	para "will participate"
	line "in the future."
	done

Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText:
	text "Some #mon can"
	line "only be seen in"
	cont "the Forest."
	done

BugCatchingContestant1BText:
	text "Anton: Wow, you"
	line "beat me. You're"
	cont "pretty good."
	done

BugCatchingContestant1BStillCompetingText:
	text "Anton: Luck plays"
	line "a big part in"
	cont "this."

	para "You never know"
	line "what #mon will"
	cont "appear."
	done

BugCatchingContestant2BText:
	text "Stevie: I envy"
	line "you. I just could-"
	cont "n't do it this"
	cont "time."
	done

BugCatchingContestant2BStillCompetingText:
	text "Stevie: Maybe you"
	line "win with big #-"
	cont "mon?"
	done

BugCatchingContestant3BText:
	text "Fabio: Well done!"
	line "I'm going to raise"
	cont "my #mon better."
	done

BugCatchingContestant3BStillCompetingText:
	text "Fabio: Maybe you"
	line "get a higher score"

	para "for a #mon of"
	line "an unusual color."
	done

BugCatchingContestant4BText:
	text "Bernard: You're"
	line "the winner? What"
	cont "did you catch?"
	done

BugCatchingContestant4BStillCompetingText:
	text "Bernard: Well, I'm"
	line "satisfied because"

	para "I caught a #mon"
	line "that I wanted."
	done

BugCatchingContestant5BText:
	text "Elmer: Congwats!"
	line "You have earned my"
	cont "wespect!"
	done

BugCatchingContestant5BStillCompetingText:
	text "Elmer: I caught a"
	line "Scyther befowe,"
	cont "but I didn't win."
	done

BugCatchingContestant6BText:
	text "Garret: That #-"
	line "mon you caught…"
	cont "it's awesome!"
	done

BugCatchingContestant6BStillCompetingText:
	text "Garret: It's"
	line "easier to win if"
	cont " you get"

	para "a high-level bug"
	line "#mon."

	para "But I think they"
	line "also consider some"
	cont "other points."
	done

BugCatchingContestant7BText:
	text "Haylee: You won?"
	line "That's great!"

	para "Do you feel like"
	line "looking for bug"
	cont "#mon with me?"
	done

BugCatchingContestant7BStillCompetingText:
	text "Haylee: I really"
	line "love bug #mon!"
	done

BugCatchingContestant8BText:
	text "Buzzy: I… I can't"
	line "believe I lost at"
	cont "bug-catching…"
	done

BugCatchingContestant8BStillCompetingText:
	text "Buzzy: I heard"
	line "that somebody won"
	cont "with a Caterpie!"
	done

BugCatchingContestant9BText:
	text "Timmy: Next time,"
	line "I'm going to win."
	done

BugCatchingContestant9BStillCompetingText:
	text "Timmy: Darn."
	line "I thought I would"
	cont "score higher…"
	done

BugCatchingContestant10BText:
	text "Pierce: Could you"
	line "give me some tips?"

	para "I want to study"
	line "your style."
	done

BugCatchingContestant10BStillCompetingText:
	text "Pierce: I study a"
	line "lot, but that's"

	para "not good enough to"
	line "win."
	done

UnusedSudowoodoText:
; This text is unused and unreferenced in the final game.
; The tree Pokémon is Sudowoodo.
; The Silph Scope 2 was later reworked into the Squirtbottle.
	text "I hear there's a"
	line "#MON that looks"
	cont "just like a tree."

	para "You can reveal its"
	line "identity using a"
	cont "SILPHSCOPE 2."
	done

UnusedBugCatchingContestExplanationText:
; duplicate of BugCatchingContestExplanationText in Route35NationalParkGate.asm
	text "The Bug-Catching"
	line "Contest is held on"

	para "Tuesday, Thursday"
	line "and Saturday."

	para "Not only do you"
	line "earn a prize just"

	para "for participating,"
	line "you also get to"

	para "keep the bug"
	line "#mon you may"

	para "have at the end of"
	line "the contest."
	done

Route36NationalParkGateOfficer1WellHoldPrizeText:
	text "Uh-oh… Your Pack"
	line "is full."

	para "We'll hold on to"
	line "your prize, but"
	cont "only for today."

	para "Please make room,"
	line "then come see me."
	done

Route36NationalParkGateOfficer1HeresThePrizeText:
	text "<PLAYER>?"

	para "Here's the prize"
	line "we were holding"
	cont "for you."
	done

Route36NationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, NATIONAL_PARK, 1
	warp_event  0,  5, NATIONAL_PARK, 2
	warp_event  9,  4, ROUTE_36, 1
	warp_event  9,  5, ROUTE_36, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 1 ; object events
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36NationalParkGateOfficerScript, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
