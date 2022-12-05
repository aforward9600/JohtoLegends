	object_const_def ; object_event constants
	const RADIOTOWER5F_MIYAMOTO
	const RADIOTOWER5F_RIVAL

RadioTower5F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_script .DummyScene2 ; SCENE_RADIOTOWER5F_NOTHING

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

RadioTowerMiyamotoScene1:
	turnobject RADIOTOWER5F_MIYAMOTO, LEFT
	pause 15
	turnobject RADIOTOWER5F_MIYAMOTO, UP
	pause 15
	turnobject RADIOTOWER5F_MIYAMOTO, DOWN
	showemote EMOTE_SHOCK, RADIOTOWER5F_MIYAMOTO, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext RadioTowerMiyamotoText1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_MIYAMOTO, MiyamotoMovement1
	turnobject RADIOTOWER5F_MIYAMOTO, LEFT
	turnobject PLAYER, RIGHT
	sjump Reconverge

RadioTowerMiyamotoScene2:
	turnobject RADIOTOWER5F_MIYAMOTO, LEFT
	pause 15
	turnobject RADIOTOWER5F_MIYAMOTO, UP
	pause 15
	turnobject RADIOTOWER5F_MIYAMOTO, DOWN
	showemote EMOTE_SHOCK, RADIOTOWER5F_MIYAMOTO, 15
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext RadioTowerMiyamotoText1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_MIYAMOTO, MiyamotoMovement2
	sjump Reconverge

Reconverge:
	opentext
	writetext RadioTowerMiyamotoText2
	waitbutton
	closetext
	winlosstext RadioTowerMiyamotoWinText, RadioTowerMiyamotoLastText
	setlasttalked RADIOTOWER5F_MIYAMOTO
	loadtrainer MYSTERIOUS, MIYAMOTO2
	startbattle
	reloadmapafterbattle
	opentext
	writetext RadioTowerMiyamotoTextAfter
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_MIYAMOTO
	pause 15
	special FadeInQuickly
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setscene SCENE_RADIOTOWER5F_NOTHING
	setevent EVENT_BEAT_GOLDENROD_TOWER_MIYAMOTO
	setevent EVENT_GOLDENROD_TOWER_TAKEOVER
	clearevent EVENT_GOLDENROD_TOWER_DIRECTOR
	clearevent EVENT_GOLDENROD_TOWER_POLICE
	setevent EVENT_GOLDENROD_CITY_DIRECTOR
	setevent EVENT_GOLDENROD_CITY_GUARD_2
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	setevent EVENT_GOLDENROD_TOWER_RIVAL
	clearevent EVENT_GOLDENROD_TOWER_RIVAL_2
	setmapscene RADIO_TOWER_1F, SCENE_RADIOTOWER1F_DIRECTOR
	special PlayMapMusic
	pause 15
	readvar VAR_FACING
	ifequal UP, .RivalAppears1
	ifequal RIGHT, .RivalAppears2
	end

.RivalAppears1:
	playsound SFX_ENTER_DOOR
	moveobject RADIOTOWER5F_RIVAL, 9, 17
	appear RADIOTOWER5F_RIVAL
	applymovement RADIOTOWER5F_RIVAL, RivalMoves1
	turnobject RADIOTOWER5F_RIVAL, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext RadioTower5FRivalText1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_RIVAL, RivalMoves2
	turnobject PLAYER, UP
	turnobject RADIOTOWER5F_RIVAL, LEFT
	pause 15
	turnobject RADIOTOWER5F_RIVAL, RIGHT
	pause 15
	turnobject RADIOTOWER5F_RIVAL, UP
	pause 15
	showemote EMOTE_SHOCK, RADIOTOWER5F_RIVAL, 15
	opentext
	writetext RivalFindsClearBellText
	waitbutton
	closetext
	applymovement RADIOTOWER5F_RIVAL, MiyamotoMovement2
	turnobject RADIOTOWER5F_RIVAL, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext HeresTheClearBellText
	buttonsound
	verbosegiveitem CLEAR_BELL
	writetext LetsGoText
	waitbutton
	closetext
	setevent EVENT_GOLDENROD_TOWER_RIVAL_1
	special FadeOutPalettes
	special HealParty
	pause 15
	warp RADIO_TOWER_1F, 10, 3
	end

.RivalAppears2:
	playsound SFX_ENTER_DOOR
	moveobject RADIOTOWER5F_RIVAL, 9, 17
	appear RADIOTOWER5F_RIVAL
	applymovement RADIOTOWER5F_RIVAL, RivalMoves2
	turnobject RADIOTOWER5F_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5FRivalText1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_RIVAL, RivalMoves2
	turnobject PLAYER, UP
	turnobject RADIOTOWER5F_RIVAL, LEFT
	pause 15
	turnobject RADIOTOWER5F_RIVAL, RIGHT
	pause 15
	turnobject RADIOTOWER5F_RIVAL, UP
	pause 15
	showemote EMOTE_SHOCK, RADIOTOWER5F_RIVAL, 15
	opentext
	writetext RivalFindsClearBellText
	waitbutton
	closetext
	applymovement RADIOTOWER5F_RIVAL, MiyamotoMovement2
	turnobject RADIOTOWER5F_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext HeresTheClearBellText
	buttonsound
	verbosegiveitem CLEAR_BELL
	writetext LetsGoText
	waitbutton
	closetext
	setevent EVENT_GOLDENROD_TOWER_RIVAL_1
	special FadeOutPalettes
	special HealParty
	pause 15
	warp RADIO_TOWER_1F, 10, 3
	end

MiyamotoMovement1:
	step DOWN
	step DOWN
	step DOWN
	step_end

MiyamotoMovement2:
	step DOWN
	step DOWN
	step_end

RivalMoves1:
	step UP
	step LEFT
	step UP
	step_end

RivalMoves2:
	step UP
	step UP
	step_end

RadioTowerMiyamotoText1:
	text "Right on time, as"
	line "usual, <PLAYER>."
	done

RadioTowerMiyamotoText2:
	text "I'm a little busy"
	line "right now, but if"
	cont "you truly want to"
	cont "get in my way,"
	cont "I'll be happy to"
	cont "oblige, and"
	cont "destroy you."
	done

RadioTowerMiyamotoWinText:
	text "Another loss for"
	line "me, it seems."
	done

RadioTowerMiyamotoTextAfter:
	text "Well, it would"
	line "appear that our"
	cont "informant was in-"
	cont "correct."

	para "I'll have to pun-"
	line "ish him later."

	para "For now, let me"
	line "tell you some-"
	cont "thing."

	para "What we seek is"
	line "unknown to you,"
	cont "and it should stay"
	cont "that way."

	para "I really hope that"
	line "we don't meet"
	cont "again."

	para "If we do, I won't"
	line "hesitate to defeat"
	cont "you."

	para "Later."
	done

RadioTower5FRivalText1:
	text "<PLAYER>,"
	line "sorry I'm late!"

	para "That guy had six"
	line "Wobbuffets!"

	para "What a cruel joke!"

	para "…Oh, looks like I"
	line "missed her again…"

	para "I still want to"
	line "get revenge on"
	cont "behalf of my #-"
	cont "mon…"

	para "…Well, for right"
	line "now, let's look"
	cont "for the item the"
	cont "old man was talk-"
	cont "ing about."
	done

RivalFindsClearBellText:
	text "Hey, I think I"
	line "found it!"

	para "It's…an old bell?"

	para "It's not my place"
	line "to criticize a"
	cont "person's tastes."
	done

HeresTheClearBellText:
	text "Here, you take"
	line "this for now."

	para "I don't want to"
	line "break it."
	done

LetsGoText:
	text "<PLAYER>, we"
	line "should head back."

	para "There's nothing"
	line "else we need here."
	done

RadioTowerMiyamotoLastText:
	text "I underestimated"
	line "you again."
	done

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9, 17, RADIO_TOWER_4F, 1

	db 2 ; coord events
	coord_event  8, 15, SCENE_DEFAULT, RadioTowerMiyamotoScene1
	coord_event  9, 15, SCENE_DEFAULT, RadioTowerMiyamotoScene2

	db 0 ; bg events

	db 2 ; object events
	object_event  9, 12, SPRITE_MIYAMOTO, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event  0, 17, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GOLDENROD_TOWER_RIVAL_1
