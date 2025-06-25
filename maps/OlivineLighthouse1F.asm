	object_const_def ; object_event constants
	const OLIVINELIGHTHOUSE1F_ROCKETM1
	const OLIVINELIGHTHOUSE1F_ROCKETM2
	const OLIVINELIGHTHOUSE1F_SHERLES
	const OLIVINELIGHTHOUSE1F_RIVAL
	const OLIVINELIGHTHOUSE1F_OFFICER

OlivineLighthouse1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ElevatorBlocked

.DummyScene0:
	end

.DummyScene1:
	end

.ElevatorBlocked:
	checkevent EVENT_BEAT_LIGHTHOUSE_MIYAMOTO
	iftrue .ElevatorFree
	changeblock 10,  0, $03 ; blocked elevator
.ElevatorFree:
	return

LeftRival:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	clearevent EVENT_LIGHTHOUSE1F_RIVAL1
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, UP
	special FadeOutMusic
	pause 10
	appear OLIVINELIGHTHOUSE1F_RIVAL
	playmusic MUSIC_DAHLIA_ENCOUNTER
	applymovement OLIVINELIGHTHOUSE1F_RIVAL, RivalMovesUp1
	turnobject OLIVINELIGHTHOUSE1F_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext LighthouseHeyPlayerText
	waitbutton
	closetext
	applymovement OLIVINELIGHTHOUSE1F_RIVAL, RivalDisappearsMovement1
	disappear OLIVINELIGHTHOUSE1F_RIVAL
	playsound SFX_EXIT_BUILDING
	special RestartMapMusic
	setscene SCENE_FINISHED
	setevent EVENT_LIGHTHOUSE1F_RIVAL1
	setevent EVENT_LIGHTHOUSE6F_RIVAL1
	end

.Female:
	clearevent EVENT_LIGHTHOUSE1F_RIVAL1
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, UP
	special FadeOutMusic
	pause 10
	appear OLIVINELIGHTHOUSE1F_RIVAL
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement OLIVINELIGHTHOUSE1F_RIVAL, RivalMovesUp1
	turnobject OLIVINELIGHTHOUSE1F_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext LighthouseHeyPlayerText
	waitbutton
	closetext
	applymovement OLIVINELIGHTHOUSE1F_RIVAL, RivalDisappearsMovement1
	disappear OLIVINELIGHTHOUSE1F_RIVAL
	playsound SFX_EXIT_BUILDING
	special RestartMapMusic
	setscene SCENE_FINISHED
	setevent EVENT_LIGHTHOUSE1F_RIVAL1
	setevent EVENT_LIGHTHOUSE6F_RIVAL1
	end

RightRival:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female2
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, UP
	special FadeOutMusic
	pause 10
	clearevent EVENT_LIGHTHOUSE1F_RIVAL1
	appear OLIVINELIGHTHOUSE1F_RIVAL
	playmusic MUSIC_DAHLIA_ENCOUNTER
	applymovement OLIVINELIGHTHOUSE1F_RIVAL, RivalMovesUp2
	opentext
	writetext LighthouseHeyPlayerText
	waitbutton
	closetext
	applymovement OLIVINELIGHTHOUSE1F_RIVAL, RivalDisappearsMovement2
	disappear OLIVINELIGHTHOUSE1F_RIVAL
	playsound SFX_EXIT_BUILDING
	special RestartMapMusic
	setscene SCENE_FINISHED
	setevent EVENT_LIGHTHOUSE1F_RIVAL1
	setevent EVENT_LIGHTHOUSE6F_RIVAL1
	end

.Female2:
	clearevent EVENT_LIGHTHOUSE1F_RIVAL1
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, UP
	special FadeOutMusic
	pause 10
	appear OLIVINELIGHTHOUSE1F_RIVAL
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement OLIVINELIGHTHOUSE1F_RIVAL, RivalMovesUp2
	opentext
	writetext LighthouseHeyPlayerText
	waitbutton
	closetext
	applymovement OLIVINELIGHTHOUSE1F_RIVAL, RivalDisappearsMovement2
	disappear OLIVINELIGHTHOUSE1F_RIVAL
	playsound SFX_EXIT_BUILDING
	special RestartMapMusic
	setscene SCENE_FINISHED
	setevent EVENT_LIGHTHOUSE1F_RIVAL1
	setevent EVENT_LIGHTHOUSE6F_RIVAL1
	end

OlivineLighthouse1FRocket1Script:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, OlivineLighthouse1FRocketSeenText, OlivineLighthouse1FRocketBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext OlivineLighthouse1FRocketAfterBattleText
	waitbutton
	closetext
	end

OlivineLighthouse1FRocket2Script:
	trainer GRUNTM, GRUNTM_4, EVENT_BEAT_ROCKET_GRUNTM_4, OlivineLighthouse1FRocket2SeenText, OlivineLighthouse1FRocket2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext OlivineLighthouse1FRocket2AfterBattleText
	waitbutton
	closetext
	end

OlivineLighthouse1FSherlesScript:
	opentext
	writetext OlivineLighthouse1FSherles1Text
	waitbutton
	closetext
	faceplayer
	opentext
	writetext OlivineLighthouse1FSherles2Text
	waitbutton
	closetext
	end

ElevatorScript:
	opentext
	checkevent EVENT_BEAT_LIGHTHOUSE_MIYAMOTO
	iftrue .ElevatorFunctioning
	writetext ElevatorBlockedText
	waitbutton
	closetext
	end

.ElevatorFunctioning:
	writetext ElevatorFreeText
	waitbutton
	closetext
	end

OlivineLighthouse1FOfficer:
	jumptextfaceplayer Lighthouse1FOfficerText

RivalMovesUp1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

RivalMovesUp2:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

RivalDisappearsMovement1:
	step DOWN
	step_end

RivalDisappearsMovement2:
	step LEFT
	step DOWN
	step DOWN
	step RIGHT
	step_end

OlivineLighthouse1FRocketSeenText:
	text "Hey!"
	line "This area is off"
	cont "limits!"
	done

OlivineLighthouse1FRocketBeatenText:
	text "Doesn't look like"
	line "you care."
	done

OlivineLighthouse1FRocketAfterBattleText:
	text "I guess you saw"
	line "through my lie."
	done

OlivineLighthouse1FRocket2SeenText:
	text "So you're the kid"
	line "he was raving"
	cont "about."

	para "Heh, you don't"
	line "look that tough!"
	done

OlivineLighthouse1FRocket2BeatenText:
	text "You REALLY are"
	line "that strong!"
	done

OlivineLighthouse1FRocket2AfterBattleText:
	text "I just thought"
	line "those guys you"
	cont "beat were weak."

	para "Then again, maybe"
	line "I am too."
	done

OlivineLighthouse1FSherles1Text:
	text "More people in"
	line "black with sun-"
	cont "glasses..."

	para "Someone named"
	line "Miyamoto..."
	done

OlivineLighthouse1FSherles2Text:
	text "Pardon?"

	para "I'm busy right"
	line "now."
	done

LighthouseHeyPlayerText:
	text "Hey <PLAYER>!"

	para "I heard the"
	line "Lighthouse was in"
	cont "trouble, so I came"
	cont "to help!"

	para "I'll go on ahead!"
	done

ElevatorBlockedText:
	text "The elevator seems"
	line "to be stuck."
	done

ElevatorFreeText:
	text "The elevator is"
	line "working."
	done

Lighthouse1FOfficerText:
	text "This is the second"
	line "instance of a"
	cont "tower being"
	cont "invaded by people"
	cont "in black."

	para "If we can't solve"
	line "this problem,"
	cont "conspiracies will"
	cont "start to pop up."
	done

OlivineLighthouse1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 10, 17, OLIVINE_CITY, 8
	warp_event 11, 17, OLIVINE_CITY, 8
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_2F, 1
	warp_event 10,  1, LIGHTHOUSE_ELEVATOR, 1

	db 2 ; coord events
	coord_event  3, 10, SCENE_DEFAULT, RightRival
	coord_event  2, 10, SCENE_DEFAULT, LeftRival

	db 1 ; bg events
	bg_event 10,  1, BGEVENT_READ, ElevatorScript

	db 5 ; object events
	object_event 17,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, OlivineLighthouse1FRocket1Script, EVENT_LIGHTHOUSE_ROCKETS
	object_event  2,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, OlivineLighthouse1FRocket2Script, EVENT_LIGHTHOUSE_ROCKETS
	object_event 15, 12, SPRITE_SHERLES, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FSherlesScript, EVENT_LIGHTHOUSE_SHERLES
	object_event  3,  5, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LIGHTHOUSE1F_RIVAL1
	object_event  6,  2, SPRITE_OFFICER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FOfficer, EVENT_LIGHTHOUSE_SHERLES
