	object_const_def ; object_event constants
	const NATIONALPARKBUGCONTEST_YOUNGSTER1
	const NATIONALPARKBUGCONTEST_YOUNGSTER2
	const NATIONALPARKBUGCONTEST_ROCKER
	const NATIONALPARKBUGCONTEST_POKEFAN_M
	const NATIONALPARKBUGCONTEST_YOUNGSTER3
	const NATIONALPARKBUGCONTEST_YOUNGSTER4
	const NATIONALPARKBUGCONTEST_LASS
	const NATIONALPARKBUGCONTEST_YOUNGSTER5
	const NATIONALPARKBUGCONTEST_YOUNGSTER6
	const NATIONALPARKBUGCONTEST_YOUNGSTER7
	const NATIONALPARKBUGCONTEST_POKE_BALL1
	const NATIONALPARKBUGCONTEST_POKE_BALL2
	const NATIONALPARKBUGCONTEST_ENGINEER

NationalParkBugContest_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

BugCatchingContestant1AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant1AText
	waitbutton
	closetext
	end

BugCatchingContestant2AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant2AText
	waitbutton
	closetext
	end

BugCatchingContestant3AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant3AText
	waitbutton
	closetext
	end

BugCatchingContestant4AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant4AText
	waitbutton
	closetext
	end

BugCatchingContestant5AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant5AText
	waitbutton
	closetext
	end

BugCatchingContestant6AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant6AText
	waitbutton
	closetext
	end

BugCatchingContestant7AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant7AText
	waitbutton
	closetext
	end

BugCatchingContestant8AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant8AText
	waitbutton
	closetext
	end

BugCatchingContestant9AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant9AText
	waitbutton
	closetext
	end

BugCatchingContestant10AScript:
	faceplayer
	opentext
	writetext BugCatchingContestant10AText
	waitbutton
	closetext
	end

NationalParkBugContestRelaxationSquareSign:
	jumptext NationalParkBugContestRelaxationSquareText

NationalParkBugContestEther:
	itemball SILVERPOWDER

NationalParkBugContestTMDig:
	itemball TM_DIG

NationalParkBugContestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

NationalParkBugContestEngineerScript:
	faceplayer
	opentext
	writetext NationalParkBugContestEngineerText
	waitbutton
	closetext
	end

NationalParkBugContestEngineerStopsYou:
	turnobject NATIONALPARKBUGCONTEST_ENGINEER, DOWN
	turnobject PLAYER, UP
	opentext
	writetext ConstructionGoingOnText
	waitbutton
	closetext
	applymovement PLAYER, EngineerMovesYouMovement
	turnobject NATIONALPARKBUGCONTEST_ENGINEER, RIGHT
	end

BugCatchingContestant1AText:
	text "Anton: I'm going"
	line "to win! Don't"
	cont "bother me."
	done

BugCatchingContestant2AText:
	text "Stevie: My Butter-"
	line "free puts #mon"
	cont "to sleep with sle-"
	cont "ep Powder."
	done

BugCatchingContestant3AText:
	text "Fabio: I'm raising"
	line "fast #mon for"
	cont "battles."
	done

BugCatchingContestant4AText:
	text "Bernard: I'm not"
	line "concerned about"
	cont "winning."

	para "I'm just looking"
	line "for rare #mon."
	done

BugCatchingContestant5AText:
	text "Elmer: Ssh! You'w"
	line "scare off Scyther."

	para "I'w tawk to you"
	line "waiter."
	done

BugCatchingContestant6AText:
	text "Garret: You should"
	line "weaken bug #mon"

	para "first, then throw"
	line "a Ball."
	done

BugCatchingContestant7AText:
	text "Haylee: I love bug"
	line "#mon."

	para "I guess you must"
	line "like them too."
	done

BugCatchingContestant8AText:
	text "Buzzy: I've been"
	line "collecting bug"

	para "#mon since I"
	line "was just a baby."

	para "There's no way I'm"
	line "going to lose!"
	done

BugCatchingContestant9AText:
	text "Timmy: If you've"
	line "got the time to"

	para "chat, go find some"
	line "bug #mon."
	done

BugCatchingContestant10AText:
	text "Pierce: I've stud-"
	line "ied about bug"
	cont "#mon a lot."

	para "I'm going to win"
	line "for sure."
	done

NationalParkBugContestEngineerText:
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

NationalParkBugContestRelaxationSquareText:
	text "National Forest"

	para "National Park"
	line "under construction"
	done

NationalParkBugContest_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 33, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 33, 19, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 10, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 11, 47, ROUTE_35_NATIONAL_PARK_GATE, 1

	db 1 ; coord events
	coord_event 29, 19, SCENE_DEFAULT, NationalParkBugContestEngineerStopsYou

	db 2 ; bg events
	bg_event 33, 16, BGEVENT_READ, NationalParkBugContestRelaxationSquareSign
	bg_event  2, 34, BGEVENT_ITEM, NationalParkBugContestHiddenFullHeal

	db 13 ; object events
	object_event 16, 24, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1AScript, EVENT_BUG_CATCHING_CONTESTANT_1A
	object_event 33, 29, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2AScript, EVENT_BUG_CATCHING_CONTESTANT_2A
	object_event  7, 19, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3AScript, EVENT_BUG_CATCHING_CONTESTANT_3A
	object_event  7,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4AScript, EVENT_BUG_CATCHING_CONTESTANT_4A
	object_event 19,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5AScript, EVENT_BUG_CATCHING_CONTESTANT_5A
	object_event 36, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6AScript, EVENT_BUG_CATCHING_CONTESTANT_6A
	object_event 28,  8, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7AScript, EVENT_BUG_CATCHING_CONTESTANT_7A
	object_event  2, 39, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8AScript, EVENT_BUG_CATCHING_CONTESTANT_8A
	object_event 36, 32, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9AScript, EVENT_BUG_CATCHING_CONTESTANT_9A
	object_event 36, 44, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10AScript, EVENT_BUG_CATCHING_CONTESTANT_10A
	object_event 24, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkBugContestEther, EVENT_NATIONAL_PARK_ETHER
	object_event  5, 50, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, NationalParkBugContestTMDig, EVENT_NATIONAL_PARK_TM_SLEEP_TALK
	object_event 29, 18, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkBugContestEngineerScript, -1
