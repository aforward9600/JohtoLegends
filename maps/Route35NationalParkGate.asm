	object_const_def ; object_event constants
	const ROUTE35NATIONALPARKGATE_YOUNGSTER
	const ROUTE35NATIONALPARKGATE_OFFICER2

Route35NationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE35NATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE35NATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	db 0 ; callbacks
;	callback MAPCALLBACK_NEWMAP, .CheckIfContestRunning
;	callback MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	end

Route35NationalParkGate_NoContestToday:
	jumptextfaceplayer Route35NationalParkGateOfficer1WeHoldContestsText

Route35NationalParkGateOfficerScript:
	faceplayer
	opentext
	writetext Route35NationalParkGateOfficer1WeHoldContestsText
	waitbutton
	closetext
	end

Route35NationalParkGateYoungsterScript:
	jumptextfaceplayer Route35NationalParkGateYoungsterText

BugCatchingContestExplanationSign:
	jumptext BugCatchingContestExplanationText

Route35NationalParkGate_GetDayOfWeek:
	jumpstd daytotext
	end

Route35NationalParkGatePlayerApproachOfficer1Movement:
	step DOWN
	turn_head LEFT
	step_end

Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step RIGHT
	step UP
	step UP
	step_end

Route35NationalParkGatePlayerEnterParkMovement:
	step UP
	step_end

Route35NationalParkGateOfficer1AskToParticipateText:
	text "Today's @"
	text_ram wStringBuffer3
	text "."
	line "That means the"

	para "Bug-Catching Con-"
	line "test is on today."

	para "The rules are sim-"
	line "ple."

	para "Using one of your"
	line "#MON, catch a"

	para "bug #mon to be"
	line "judged."

	para "Would you like to"
	line "give it a try?"
	done

Route35NationalParkGateOfficer1GiveParkBallsText:
	text "Here are the Bug"
	line "Balls for the"
	cont "Contest."
	done

Route35NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> received"
	line "20 Bug Balls."
	done

Route35NationalParkGateOfficer1ExplainsRulesText:
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

Route35NationalParkGateOfficer1AskToUseFirstMonText:
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

Route35NationalParkGateOfficer1WellHoldYourMonText:
	text "Fine, we'll hold"
	line "your other #mon"
	cont "while you compete."
	done

Route35NationalParkGatePlayersMonLeftWithHelperText:
	text "<PLAYER>'s #mon"
	line "were left with the"
	cont "Contest Helper."
	done

Route35NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Please choose the"
	line "#mon to be used"

	para "in the Contest,"
	line "then come see me."
	done

Route35NationalParkGateOfficer1TakePartInFutureText:
	text "OK. We hope you'll"
	line "take part in the"
	cont "future."
	done

Route35NationalParkGateOfficer1FirstMonCantBattleText:
	text "Uh-oh…"
	line "The first #mon"

	para "in your party"
	line "can't battle."

	para "Please switch it"
	line "with the #mon"

	para "you want to use,"
	line "then come see me."
	done

Route35NationalParkGateOfficer1MakeRoomText:
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

Route35NationalParkGateOfficer1EggAsFirstMonText:
	text "Uh-oh…"
	line "You have an Egg as"

	para "the first #mon"
	line "in your party."

	para "Please switch it"
	line "with the #mon"

	para "you want to use,"
	line "then come see me."
	done

Route35NationalParkGateOfficer1WantToFinishText:
	text "You still have @"
	text_ram wStringBuffer3
	text_start
	line "minute(s) left."

	para "Do you want to"
	line "finish now?"
	done

Route35NationalParkGateOfficer1WaitAtNorthGateText:
	text "OK. Please wait at"
	line "the North Gate for"

	para "the announcement"
	line "of the winners."
	done

Route35NationalParkGateOfficer1OkGoFinishText:
	text "OK. Please get"
	line "back outside and"
	cont "finish up."
	done

Route35NationalParkGateOfficer1ContestIsOverText:
	text "Today's Contest is"
	line "over. We hope you"

	para "will participate"
	line "in the future."
	done

Route35NationalParkGateOfficer1WeHoldContestsText:
	text "We hold Contests"
	line "regularly in the"

	para "Forest. Well,"
	line "normally we do."

	para "Right now, we're"
	line "constructing a"
	cont "park, so they are"

	para "on hold for now."
	done

Route35NationalParkGateYoungsterText:
	text "When is the next"
	line "Bug-Catching Con-"
	cont "test going to be?"
	done

BugCatchingContestExplanationText:
	text "The Bug-Catching"
	line "Contest is on hold"

	para "for the foresee-"
	line "able future."

	para "It will return"
	line "when the National"

	para "Park is complete."
	done

Route35NationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  0, NATIONAL_PARK, 3
	warp_event  4,  0, NATIONAL_PARK, 4
	warp_event  3,  7, ROUTE_35, 3
	warp_event  4,  7, ROUTE_35, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 2 ; object events
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateYoungsterScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_YOUNGSTER
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateOfficerScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
