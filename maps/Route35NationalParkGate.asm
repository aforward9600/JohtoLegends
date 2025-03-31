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
