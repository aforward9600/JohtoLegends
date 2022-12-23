	object_const_def ; object_event constants
	const TINTOWERROOF_HO_OH
	const TINTOWERROOF_HO_OH_2
	const TINTOWERROOF_MIYAMOTO
	const TINTOWERROOF_CHRIS ; if male
	const TINTOWERROOF_KRIS ; if female
	const TINTOWERROOF_RIVAL
	const TINTOWERROOF_SHERLES
	const TINTOWERROOF_ROCKET_BALL

TinTowerRoof_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .Moon
	callback MAPCALLBACK_OBJECTS, .HoOh

.DummyScene0:
	end

.DummyScene1:
	end

.Moon:
	checktime NITE
	iffalse, .NoMoon
	changeblock  8,  0, $55 ; moon
.NoMoon:
	return

.HoOh:
	checkevent EVENT_CAUGHT_HO_OH
	iftrue .NoAppear
	checkevent EVENT_HIDEOUT_HO_OH
	iffalse .NoAppear
	checkevent EVENT_RIVAL_GIVES_UP_HO_OH
	iffalse .NoAppear
;	checkitem RAINBOW_WING
;	iftrue .Appear
;	sjump .NoAppear

.Appear:
	checkevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	iffalse .NoAppear
	appear TINTOWERROOF_HO_OH
	return

.NoAppear:
	disappear TINTOWERROOF_HO_OH
	return

MiyamotoCatchesHoOhLeft:
	applymovement PLAYER, PlayerHoOhMovement1
	turnobject PLAYER, UP
	sjump MeetUpHoOh

MiyamotoCatchesHoOhRight:
	applymovement PLAYER, PlayerHoOhMovement2
MeetUpHoOh:
	pause 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject TINTOWERROOF_MIYAMOTO, DOWN
	opentext
	writetext WelcomeToTheRoofText
	waitbutton
	closetext
	winlosstext Miyamoto3WinText, Miyamoto3LossText
	loadtrainer MYSTERIOUS, MIYAMOTO3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext ImpressiveText
	waitbutton
	closetext
	pause 15
	appear TINTOWERROOF_RIVAL
	applymovement TINTOWERROOF_RIVAL, TinTowerRivalMovement
	opentext
	writetext YouGotHerText
	waitbutton
	closetext
	pause 15
	appear TINTOWERROOF_SHERLES
	applymovement TINTOWERROOF_SHERLES, TinTowerSherlesMovement
	opentext
	writetext YoureUnderArrestText
	waitbutton
	closetext
	special FadeOutMusic
	pause 30
	cry HO_OH
	turnobject TINTOWERROOF_MIYAMOTO, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	showemote EMOTE_SHOCK, TINTOWERROOF_RIVAL, 15
	showemote EMOTE_SHOCK, TINTOWERROOF_SHERLES, 15
	moveobject TINTOWERROOF_RIVAL, 8, 11
	moveobject TINTOWERROOF_SHERLES, 8, 12
	opentext
	writetext WhatWasThatText
	waitbutton
	closetext
	pause 15
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .ShowDahlia
	appear TINTOWERROOF_CHRIS
	sjump .HidePlayer
.ShowDahlia
	appear TINTOWERROOF_KRIS
.HidePlayer
	applymovement PLAYER, HidePlayerMovement
	applymovement PLAYER, CameraPansToHoOhMovement
	pause 15
	cry HO_OH
	pause 30
	applymovement PLAYER, CameraPansToPlayerMovement
	turnobject PLAYER, UP
	applymovement PLAYER, ShowPlayerMovement
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .HideDahlia
	disappear TINTOWERROOF_CHRIS
	sjump .HidDoppelganger
.HideDahlia
	disappear TINTOWERROOF_KRIS
.HidDoppelganger
	pause 15
	playsound SFX_THROW_BALL
	appear TINTOWERROOF_ROCKET_BALL
	applymovement TINTOWERROOF_ROCKET_BALL, PlayerHoOhMovement2
	disappear TINTOWERROOF_ROCKET_BALL
	pause 30
	playsound SFX_BALL_POOF
	pause 20
	playsound SFX_MASTER_BALL
	pause 60
	playsound SFX_CHANGE_DEX_MODE
	pause 15
	playsound SFX_BALL_BOUNCE
	pause 60
	playsound SFX_BALL_WOBBLE
	pause 30
	playsound SFX_BALL_WOBBLE
	pause 30
	playsound SFX_BALL_WOBBLE
	pause 30
	waitsfx
	showemote EMOTE_SHOCK, TINTOWERROOF_RIVAL, 15
	opentext
	writetext SheJustCaughtItText
	waitbutton
	closetext
	turnobject TINTOWERROOF_MIYAMOTO, DOWN
	opentext
	writetext IveGotWhatINeedText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear TINTOWERROOF_MIYAMOTO
	pause 15
	special FadeInQuickly
	pause 30
	waitsfx
	playmusic MUSIC_UNWAVERING_HEART
	opentext
	writetext SheGotAwayText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	turnobject TINTOWERROOF_RIVAL, DOWN
	opentext
	writetext WellGetHerText
	waitbutton
	closetext
	applymovement TINTOWERROOF_SHERLES, TinTowerSherlesLeavesMovement
	disappear TINTOWERROOF_SHERLES
	pause 15
	turnobject TINTOWERROOF_RIVAL, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext LetsLeaveItToTheCopsText
	waitbutton
	closetext
	pause 30
	applymovement TINTOWERROOF_RIVAL, TinTowerRivalLeavesMovement
	disappear TINTOWERROOF_RIVAL
	waitsfx
	playmapmusic
	setevent EVENT_BELLCHIME_PATH_ENOKI_PANIC
	clearevent EVENT_TIN_TOWER_TAKEOVER
	setevent EVENT_TIN_TOWER_1F_WISE_TRIO_1
	setevent EVENT_WHIRL_ISLAND_SAGE_1
	clearevent EVENT_WHIRL_ISLAND_SAGE_2
	setevent EVENT_ROUTE_36_GUY
	clearevent EVENT_ROUTE_36_GUY_2
	setevent EVENT_UNION_CAVE_BLOCKER
	setevent EVENT_BURNED_TOWER_B1F_BEASTS_1
	setevent EVENT_BURNED_TOWER_B1F_BEASTS_2
	clearevent EVENT_HIDE_BASEMENT
	clearevent EVENT_TIN_TOWER_1F_WISE_TRIO_2
	setevent EVENT_CLEARED_TIN_TOWER
	setevent EVENT_MART_SHERLES
	setscene SCENE_FINISHED
	end

TinTowerHoOh:
	faceplayer
	opentext
	writetext HoOhText
	cry HO_OH
	pause 15
	closetext
	setevent EVENT_FOUGHT_HO_OH
	loadvar VAR_BATTLETYPE, BATTLETYPE_HO_OH
	loadwildmon HO_OH, 60
	startbattle
	ifequal LOSE, .NotBeatenHoOh
	disappear TINTOWERROOF_HO_OH
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
.NotBeatenHoOh:
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtHoOh
	end

.CaughtHoOh:
	opentext
	writetext HoOhText
	waitbutton
	closetext
	end

PlayerHoOhMovement1:
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step_end

PlayerHoOhMovement2:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

TinTowerRivalMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

TinTowerSherlesMovement:
	big_step UP
	big_step UP
	big_step UP
	step_end

TinTowerSherlesLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

TinTowerRivalLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

ShowPlayerMovement:
	show_person
	step_end

HidePlayerMovement:
	hide_person
	step_end

CameraPansToHoOhMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

CameraPansToPlayerMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

HoOhText:
	text "Shaoooh!"
	done

Miyamoto3LossText:
	text "How many times"
	line "will it come to"
	cont "this?"
	done

WelcomeToTheRoofText:
	text "Welcome to the"
	line "roof of Bell"
	cont "Tower."

	para "This time, I"
	line "was hoping you"
	cont "would show up."

	para "Now I can take"
	line "back that wing"
	cont "of yours."
	done

Miyamoto3WinText:
	text "The same result"
	line "again…"
	done

ImpressiveText:
	text "Impressive."

	para "You're just as"
	line "powerful as usual."

	para "Hm…"

	para "It still isn't"
	line "showing up…"
	done

YouGotHerText:
	text "<RIVAL>: Nice!"

	para "You got her!"

	para "Miyamoto: So, you"
	line "decided to show"
	cont "up as well…"

	para "I wonder if…"
	done

YoureUnderArrestText:
	text "Sherles: Halt!"

	para "You're under"
	line "arrest!"
	done

WhatWasThatText:
	text "<RIVAL>: What was"
	line "that?"

	para "Miyamoto: Ho-Oh…"

	para "So, it took the"
	line "two of them to"
	cont "call it…"

	para "Perfect…"
	done

SheJustCaughtItText:
	text "<RIVAL>: She…"

	para "She just caught"
	line "it…"

	para "Miyamoto: Great"
	line "deduction skills"
	cont "you have there."

	para "Ho-Oh is now ours."
	done

IveGotWhatINeedText:
	text "I've finally got"
	line "what I've been"
	cont "searching for."

	para "And by the alerts"
	line "I just received,"

	para "Lugia, Raikou,"
	line "Entei and Suicune"
	cont "are in our"
	cont "possession."

	para "<RIVAL>: No!"
	line "How?"

	para "Miyamoto: They"
	line "sensed that Ho-Oh"
	cont "was in trouble."

	para "They revealed"
	line "themselves to our"
	cont "agents hiding in"
	cont "wait."

	para "It was all thanks"
	line "to you two."

	para "Even if we had the"
	line "wings, I doubt we"

	para "could have gotten"
	line "them."

	para "<RIVAL>: ……No……"

	para "Miyamoto: It's"
	line "been fun, but I"
	cont "have to go."

	para "Later."
	done

SheGotAwayText:
	text "<RIVAL>: …She"
	line "got away…"
	done

WellGetHerText:
	text "Sherles: This is"
	line "not good."

	para "They've poached"
	line "several Legendary"
	cont "#mon…"

	para "Don't worry kids."

	para "Now that I have"
	line "a visual of their"
	cont "leader, I'll be"
	cont "able to track her."

	para "Please, leave this"
	line "to us."

	para "You've been a good"
	line "help already."

	para "Stay safe."
	done

LetsLeaveItToTheCopsText:
	text "……He's right."

	para "……Let's leave it"
	line "to the police now."

	para "I…I need some time"
	line "to think…"
	done

TinTowerRoof_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9, 17, TIN_TOWER_9F, 4

	db 2 ; coord events
	coord_event  8, 16, SCENE_DEFAULT, MiyamotoCatchesHoOhLeft
	coord_event  9, 16, SCENE_DEFAULT, MiyamotoCatchesHoOhRight

	db 0 ; bg events

	db 8 ; object events
	object_event  9,  9, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TinTowerHoOh, EVENT_TIN_TOWER_ROOF_HO_OH
	object_event  9,  2, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_ROOF_HO_OH_2
	object_event  9, 10, SPRITE_MIYAMOTO, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  9, 11, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_ROOF_PLAYER
	object_event  9, 11, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_ROOF_PLAYER
	object_event  8, 15, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_ROOF_PLAYER
	object_event  8, 15, SPRITE_SHERLES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_ROOF_PLAYER
	object_event  9,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_ROOF_ROCKET_BALL
