	object_const_def ; object_event constants
	const ECRUTEAKTINTOWERENTRANCE_SAGE1
	const ECRUTEAKTINTOWERENTRANCE_SAGE2
	const ECRUTEAKTINTOWERENTRANCE_SAGE3
	const ECRUTEAKTINTOWERENTRANCE_GRAMPS
	const ECRUTEAKTINTOWERENTRANCE_GRUNT
	const ECRUTEAKTINTOWERENTRANCE_ENOKI
	const ECRUTEAKTINTOWERENTRANCE_SHERLES

EcruteakTinTowerEntrance_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ECRUTEAKTINTOWERENTRANCE_SHERLES
	scene_script .DummyScene2 ; SCENE_ECRUTEAKTINTOWERENTRANCE_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .InitializeSages

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.InitializeSages:
	checkevent EVENT_TIN_TOWER_ENTRANCE_ROCKET
	iffalse .MoveSage
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .DontBlockTower
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .DontBlockTower
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .BlockTower
	return

.BlockTower:
	clearevent EVENT_RANG_CLEAR_BELL_2
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	checkitem CLEAR_BELL
	iftrue .NoClearBell
	setscene SCENE_DEFAULT
.NoClearBell:
	return

.DontBlockTower:
	clearevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	return

.MoveSage:
	moveobject ECRUTEAKTINTOWERENTRANCE_SAGE1, 5, 6
	return

EcruteakTinTowerEntrance_CoordEvent1:
	checkevent EVENT_RANG_CLEAR_BELL_2
	iftrue EcruteakTinTowerEntrance_CoordEvent_DontMove
	applymovement ECRUTEAKTINTOWERENTRANCE_SAGE2, MovementData_0x980c7
	moveobject ECRUTEAKTINTOWERENTRANCE_SAGE1, 4, 6
	appear ECRUTEAKTINTOWERENTRANCE_SAGE1
	pause 5
	disappear ECRUTEAKTINTOWERENTRANCE_SAGE2
	end

EcruteakTinTowerEntrance_CoordEvent2:
	checkevent EVENT_RANG_CLEAR_BELL_1
	iftrue EcruteakTinTowerEntrance_CoordEvent_DontMove
	applymovement ECRUTEAKTINTOWERENTRANCE_SAGE1, MovementData_0x980cc
	moveobject ECRUTEAKTINTOWERENTRANCE_SAGE2, 5, 6
	appear ECRUTEAKTINTOWERENTRANCE_SAGE2
	pause 5
	disappear ECRUTEAKTINTOWERENTRANCE_SAGE1
	end

EcruteakTinTowerEntrance_CoordEvent_DontMove:
	end

EcruteakTinTowerEntrance_CoordEvent3:
	checkevent EVENT_TIN_TOWER_ENTRANCE_ROCKET
	iffalse .Done
	turnobject ECRUTEAKTINTOWERENTRANCE_SHERLES, LEFT
	turnobject, PLAYER, RIGHT
	opentext
	writetext HoldItRightThereText
	waitbutton
	closetext
	turnobject ECRUTEAKTINTOWERENTRANCE_SHERLES, UP
	setscene SCENE_DEFAULT
	end

.Done:
	end

EcruteakTinTowerEntranceSageScript:
	faceplayer
	opentext
	checkevent EVENT_TIN_TOWER_ENTRANCE_ROCKET
	iffalse .PleaseLeave
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .CheckForClearBell
	checkflag ENGINE_FOGBADGE
	iftrue .BlockPassage_GotFogBadge
	writetext EcruteakTinTowerEntranceSageText
	waitbutton
	closetext
	end

.BlockPassage_GotFogBadge:
	writetext EcruteakTinTowerEntranceSageText_GotFogBadge
	waitbutton
	closetext
	end

.CheckForClearBell:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .AllowedThrough
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .RangClearBell
	checkitem CLEAR_BELL
	iftrue .GotClearBell
	writetext EcruteakTinTowerEntranceSageText_NoClearBell
	waitbutton
	closetext
	end

.GotClearBell:
	writetext EcruteakTinTowerEntranceSageText_HearsClearBell
	waitbutton
	closetext
	setscene SCENE_ECRUTEAKTINTOWERENTRANCE_NOTHING
	setevent EVENT_RANG_CLEAR_BELL_2
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

.AllowedThrough:
	writetext EcruteakTinTowerEntranceSageText_PleaseDoGoOn
	waitbutton
	closetext
	end

.RangClearBell:
	writetext EcruteakTinTowerEntranceSageText_HeardClearBell
	waitbutton
	closetext
	end

.PleaseLeave:
	writetext PleaseLeaveText
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceWanderingSageScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEAR_BELL
	iftrue .GotClearBell
	writetext EcruteakTinTowerEntranceWanderingSageText
	waitbutton
	closetext
	end

.GotClearBell:
	writetext EcruteakTinTowerEntranceWanderingSageText_GotClearBell
	waitbutton
	closetext
	end

EcruteakTinTowerEntranceGrampsScript:
	jumptextfaceplayer EcruteakTinTowerEntranceGrampsText

EcruteakTinTowerEntranceRocketScript:
	opentext
	writetext LetMeInText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ECRUTEAKTINTOWERENTRANCE_GRUNT, 15
	faceplayer
	opentext
	writetext YouWantAPieceOfMeText
	yesorno
	iffalse .Refused
	writetext YouAskedForItText
	winlosstext EcruteakTinTowerEntranceGruntLossText, 0
	loadtrainer GRUNTM, GRUNTM_1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ROCKET_GRUNTM_1
	opentext
	writetext WhateverText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .GruntLeavesDownScript
	ifequal RIGHT, .GruntLeavesDownScript
	ifequal UP, .GruntLeavesScript
	end

.Refused:
	writetext YeahGoodChoiceText
	waitbutton
	closetext
	turnobject ECRUTEAKTINTOWERENTRANCE_GRUNT, UP
	end

.GruntLeavesScript:
	applymovement ECRUTEAKTINTOWERENTRANCE_GRUNT, GruntLeavesMovement
	disappear ECRUTEAKTINTOWERENTRANCE_GRUNT
	sjump GetScytherCall

.GruntLeavesDownScript:
	applymovement ECRUTEAKTINTOWERENTRANCE_GRUNT, GruntLeavesDownMovement
	disappear ECRUTEAKTINTOWERENTRANCE_GRUNT
	sjump GetScytherCall

GetScytherCall:
	opentext
	writetext ThankYouAgainText
	buttonsound
	verbosegiveitem SCYTHER_CALL
	setevent EVENT_GOT_SCYTHER_CALL
	writetext ThatsScytherCallText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear ECRUTEAKTINTOWERENTRANCE_ENOKI
	pause 15
	special FadeInQuickly
	setscene SCENE_ECRUTEAKTINTOWERENTRANCE_SHERLES
	clearevent EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_SHERLES
	appear ECRUTEAKTINTOWERENTRANCE_SHERLES
	setevent EVENT_TIN_TOWER_ENTRANCE_ROCKET
	clearevent EVENT_ECRUTEAK_GYM_ENOKI
	end

TinTowerEntranceSherlesScript:
	opentext
	writetext SunglassesText
	waitbutton
	closetext
	faceplayer
	opentext
	writetext SorryImBusyText
	waitbutton
	closetext
	turnobject ECRUTEAKTINTOWERENTRANCE_SHERLES, UP
	end

MovementData_0x980c7:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

MovementData_0x980cc:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

GruntLeavesMovement:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step_end

GruntLeavesDownMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EcruteakTinTowerEntranceSageText:
	text "Bell Tower is off"
	line "limits to anyone"

	para "without Ecruteak"
	line "Gym's Badge."

	para "Sorry, but you'll"
	line "have to leave."
	done

EcruteakTinTowerEntranceSageText_GotFogBadge:
	text "Bell Tower is off"
	line "limits to anyone"

	para "without Ecruteak"
	line "Gym's Badge."

	para "Ah!"

	para "Ecruteak's Gym"
	line "Badge! Normally"
	cont "I'd let you"
	cont "through, but we"
	cont "need to beef up"
	cont "security for now."
	done

EcruteakTinTowerEntranceSageText_NoClearBell:
	text "A momentous event"
	line "has occurred."

	para "I beg your pardon,"
	line "but I must ask you"
	cont "to leave."

	para "…What soothes the"
	line "soul…"

	para "The WISE TRIO say"
	line "things that are so"

	para "very difficult to"
	line "understand…"
	done

EcruteakTinTowerEntranceSageText_HearsClearBell:
	text "A momentous event"
	line "has occurred."

	para "I beg your pardon,"
	line "but I must ask you"
	cont "to leave."

	para "<……><……><……>"

	para "Ah!"

	para "The sound of that"
	line "CLEAR BELL!"

	para "It… It's sublime!"

	para "I've never heard"
	line "so beautiful a"
	cont "sound before!"

	para "That bell's chime"
	line "is indicative of"
	cont "the bearer's soul."

	para "You…"

	para "You may be able to"
	line "make it through"
	cont "TIN TOWER."

	para "Please, do go on."
	done

EcruteakTinTowerEntranceSageText_PleaseDoGoOn:
	text "Please, do go on."
	done

EcruteakTinTowerEntranceSageText_HeardClearBell:
	text "That bell's chime"
	line "is indicative of"
	cont "the bearer's soul."

	para "You…"

	para "You may be able to"
	line "make it through"
	cont "Bell Tower."

	para "Please, do go on."
	done

EcruteakTinTowerEntranceWanderingSageText:
	text "The Bell Tower"
	line "ahead is a nine-"

	para "tier tower of"
	line "divine beauty."

	para "It soothes the"
	line "soul of all who"
	cont "see it."
	done

EcruteakTinTowerEntranceWanderingSageText_GotClearBell:
	text "The Bell Tower"
	line "shook! A #mon"

	para "must have returned"
	line "to the top!"
	done

EcruteakTinTowerEntranceGrampsText:
	text "Two towers…"
	line "Two #mon…"

	para "But when one"
	line "burned down, both"

	para "#mon flew away,"
	line "never to return."
	done

PleaseLeaveText:
	text "This man is caus-"
	line "ing an uproar."

	para "Please help us"
	line "get rid of him."
	done

LetMeInText:
	text "Hey, c'mon man!"
	line "Let me in!"

	para "I want to see"
	line "the tower!"

	para "I'm a tourist,"
	line "see?"

	para "Why can't I see"
	line "it?"
	done

YouWantAPieceOfMeText:
	text "What?"

	para "You want a piece"
	line "of me, punk?"
	done

YouAskedForItText:
	text "Alright, you"
	line "asked for it!"
	done

YeahGoodChoiceText:
	text "Yeah, good choice."
	line "I didn't feel like"
	cont "making a kid cry."
	done

EcruteakTinTowerEntranceGruntLossText:
	text "What?"

	para "How did I lose?"
	done

WhateverText:
	text "Whatever!"

	para "I got what I came"
	line "here for."

	para "I didn't want to"
	line "see your stupid"
	cont "tower anyway!"
	done

ThankYouAgainText:
	text "Enoki: Thank you,"
	line "<PLAYER>."

	para "You've helped me"
	line "in a moment of"
	cont "need again."

	para "Here, I want you"
	line "to have this."
	done

ThatsScytherCallText:
	text "That's a Scyther"
	line "Call."

	para "You can use it to"
	line "call a Scyther and"
	cont "it will cut trees."

	para "What he said"
	line "worries me."

	para "I'm going to have"
	line "to increase"
	cont "security for now."

	para "Let us meet again,"
	line "under better"
	cont "circumstances."
	done

HoldItRightThereText:
	text "Hold it right"
	line "there."

	para "You are?"

	para "...Ah, <PLAYER>."

	para "I heard about you"
	line "in the report."

	para "I am Sherles, the"
	line "Johto Chief of"
	cont "Police."

	para "I recieved word of"
	line "a hooligan causing"
	cont "a ruckus at this"
	cont "sacred sight."

	para "You chased him"
	line "out, correct?"

	para "I thank you."

	para "I need to do some"
	line "investigating to"
	cont "determine the"
	cont "suspect, so please"

	para "leave the crime"
	line "scene for the time"
	cont "being."

	para "I will make my"
	line "findings public"
	cont "in due time."

	para "Thank you once"
	line "again for your"
	cont "help."
	done

SunglassesText:
	text "Hm...."

	para "So, a man in black"
	line "with sunglasses..."
	done

SorryImBusyText:
	text "Sorry, but I'm"
	line "busy right now."
	done

EcruteakTinTowerEntrance_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4, 17, ECRUTEAK_CITY, 3
	warp_event  5, 17, ECRUTEAK_CITY, 3
	warp_event  5,  3, ECRUTEAK_TIN_TOWER_ENTRANCE, 4
	warp_event 17, 15, ECRUTEAK_TIN_TOWER_ENTRANCE, 3
	warp_event 17,  3, WISE_TRIOS_ROOM, 3

	db 5 ; coord events
	coord_event  4,  7, SCENE_DEFAULT, EcruteakTinTowerEntrance_CoordEvent1
	coord_event  5,  7, SCENE_DEFAULT, EcruteakTinTowerEntrance_CoordEvent2
	coord_event  4,  7, SCENE_ECRUTEAKTINTOWERENTRANCE_SHERLES, EcruteakTinTowerEntrance_CoordEvent1
	coord_event  5,  7, SCENE_ECRUTEAKTINTOWERENTRANCE_SHERLES, EcruteakTinTowerEntrance_CoordEvent2
	coord_event  4, 14, SCENE_ECRUTEAKTINTOWERENTRANCE_SHERLES, EcruteakTinTowerEntrance_CoordEvent3

	db 0 ; bg events

	db 7 ; object events
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_RANG_CLEAR_BELL_1
	object_event  5,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceSageScript, EVENT_RANG_CLEAR_BELL_2
	object_event  6,  9, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceWanderingSageScript, EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	object_event  3, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceGrampsScript, EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_WANDERING_SAGE
	object_event  4,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakTinTowerEntranceRocketScript, EVENT_TIN_TOWER_ENTRANCE_ROCKET
	object_event  4,  6, SPRITE_ENOKI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_ENTRANCE_ROCKET
	object_event  5, 14, SPRITE_SHERLES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTowerEntranceSherlesScript, EVENT_ECRUTEAK_TIN_TOWER_ENTRANCE_SHERLES
