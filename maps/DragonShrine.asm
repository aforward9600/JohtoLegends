	object_const_def ; object_event constants
	const DRAGONSHRINE_ELDER1
	const DRAGONSHRINE_ELDER2
	const DRAGONSHRINE_ELDER3
	const DRAGONSHRINE_ELDER4
	const DRAGONSHRINE_ELDER5

DragonShrine_MapScripts:
	db 2 ; scene scripts
	scene_script .DragonShrineTest ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.DragonShrineTest:
	prioritysjump .DragonShrineTestScript
	end

.DummyScene:
	end

.DragonShrineTestScript:
	applymovement PLAYER, DragonShrinePlayerWalkInMovement
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderStepDownMovement
	opentext
	writetext DragonShrineElderGreetingText
	buttonsound
.Question1:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	writetext DragonShrineQuestion1Text
	buttonsound
	loadmenu DragonShrineQuestion1_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .WrongAnswer
	ifequal 3, .RightAnswer
	end

.Question2:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	writetext DragonShrineQuestion2Text
	buttonsound
	loadmenu DragonShrineQuestion2_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .WrongAnswer
.Question3:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	writetext DragonShrineQuestion3Text
	buttonsound
	loadmenu DragonShrineQuestion3_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .RightAnswer
.Question4:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	writetext DragonShrineQuestion4Text
	buttonsound
	loadmenu DragonShrineQuestion4_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .WrongAnswer
	ifequal 3, .RightAnswer
.Question5:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	writetext DragonShrineQuestion5Text
	buttonsound
	loadmenu DragonShrineQuestion5_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .WrongAnswer
.RightAnswer:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .PassedTheTest
	writetext DragonShrineRightAnswerText
	buttonsound
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question2
.WrongAnswer:
	closetext
	turnobject DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineWrongAnswerText1
	waitbutton
	closetext
	turnobject DRAGONSHRINE_ELDER1, DOWN
	opentext
	writetext DragonShrineWrongAnswerText2
	waitbutton
	closetext
	setevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question1
.PassedTheTest:
	writetext DragonShrinePassedTestText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

DragonShrineElder1Script:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .DontGiveDratiniYet
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue .ReceivedDratini
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratini
	sjump .ReceivedDratini

.GiveDratini:
	checkevent EVENT_PASSWORD_SINGULAR
	iftrue .CantGetBagon
	writetext DragonShrineTakeThisDratiniText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext DragonShrinePlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke BAGON, 15
	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

.PartyFull:
	writetext DragonShrinePartyFullText
	waitbutton
	closetext
	end

.DontGiveDratiniYet:
	writetext DragonShrineComeAgainText
	waitbutton
	closetext
	end

.ReceivedDratini:
	writetext DragonShrineTutorText
	yesorno
	iffalse .ExtremeSpeedRefused
	loadmoveindex EXTREMESPEED
	writetext DragonShrineTutorClearText
	special MoveTutor
	if_equal $0, .TeachMove
.ExtremeSpeedRefused:
	writetext ExtremeSpeedRefusedText
	waitbutton
	closetext
	end

.TeachMove:
	writetext TaughtExtremeSpeedText
	waitbutton
	closetext
	end

.CantGetBagon:
	writetext CantGetBagonText
	setevent EVENT_GOT_DRATINI
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	waitbutton
	closetext
	end

DragonShrineElder2Script:
	faceplayer
	opentext
	writetext DragonShrineElder2Text
	waitbutton
	closetext
	end

DragonShrineElder3Script:
	faceplayer
	opentext
	writetext DragonShrineElder3Text
	waitbutton
	closetext
	end

DragonShrineElder4Script:
	jumptextfaceplayer DragonShrineClairsGrandfatherText

DragonShrineElder5Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_DRATINI_FROM_MASTER
	iftrue .RivalDragonShrine
	writetext DontLikeLarvitarYouText
	waitbutton
	closetext
	end

.RivalDragonShrine:
	writetext DontLikeLarvitarText
	waitbutton
	closetext
	end

DragonShrineQuestion1_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Pal@"
	db "Underling@"
	db "Friend@"

DragonShrineQuestion2_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Strategy@"
	db "Raising@"
	db "Cheating@"

DragonShrineQuestion3_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 5, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Weak person@"
	db "Tough person@"
	db "Anybody@"

DragonShrineQuestion4_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Love@"
	db "Violence@"
	db "Knowledge@"

DragonShrineQuestion5_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 12, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Tough@"
	db "Both@"
	db "Weak@"

DragonShrinePlayerWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineElderStepDownMovement:
	slow_step DOWN
	step_resume

DragonShrineElderGreetingText:
	text "Hm… Good to see"
	line "you here."

	para "I see that you"
	line "possess the"
	cont "RisingBadge."

	para "That means that"
	line "the Master has"
	cont "finally recognized"

	para "you as being"
	line "worthy."

	para "Now that you are"
	line "here, you may take"
	cont "the Dragon Master"
	cont "Challenge."

	para "Not to worry, you"
	line "are to answer only"
	cont "a few questions."

	para "Ready?"
	done

DragonShrineQuestion1Text:
	text "What are #mon"
	line "to you?"
	done

DragonShrineQuestion2Text:
	text "What helps you to"
	line "win battles?"
	done

DragonShrineQuestion3Text:
	text "What kind of"
	line "trainer do you"
	cont "wish to battle?"
	done

DragonShrineQuestion4Text:
	text "What is most"
	line "important for"
	cont "raising #mon?"
	done

DragonShrineQuestion5Text:
	text "Strong #mon."
	line "Weak #mon."

	para "Which is more"
	line "important?"
	done

DragonShrinePassedTestText:
	text "Hm… I see…"

	para "You care deeply"
	line "for #mon."

	para "Very commendable."

	para "That conviction is"
	line "what is important!"

	para "<PLAYER>, don't"
	line "lose that belief."

	para "It will see you"
	line "through at the"
	cont "#mon League."

	para "Come back later."
	line "I will have a"
	cont "gift befitting of"
	cont "a Dragon Master."
	done

DragonShrineComeAgainText:
	text "Come back later."
	done

DragonShrineTakeThisDratiniText:
	text "Hm… Good to see"
	line "you here."

	para "Your arrival is"
	line "most fortunate."

	para "I have something"
	line "for you."

	para "Take this Bagon"
	line "as proof that we"

	para "have recognized"
	line "your worth."

	para "It is a child of"
	line "the Master's"
	cont "Salamence."
	done

DragonShrinePlayerReceivedDratiniText:
	text "<PLAYER> received"
	line "Bagon!"
	done

DragonShrinePartyFullText:
	text "Hm? Your #mon"
	line "party is full."
	done

DragonShrineSymbolicDragonText:
	text "Dragon #mon are"
	line "symbolic of our"
	cont "clan."

	para "You should know"
	line "this, as you are"
	cont "now a master."
	done

DragonShrineClairsGrandfatherText:
	text "Long ago, while"
	line "journeying in the"
	cont "Hoenn region, the"

	para "Master saved a"
	line "young man's life."

	para "The man's name was"
	line "Drake. He gifted"
	cont "him a Bagon, and"

	para "it has been a life"
	line "long companion."
	cont "I hope that you"

	para "will form such a"
	line "bond with your"
	cont "Bagon."
	done

DragonShrineSilverIsInTrainingText:
	text "A boy close to"
	line "your age is in"
	cont "training here."

	para "He is much like"
	line "CLAIR when she was"

	para "younger. It is a"
	line "little worrisome…"
	done

DragonShrineWrongAnswerText1:
	text "Hah? I didn't"
	line "quite catch that…"
	done

DragonShrineWrongAnswerText2:
	text "What was it you"
	line "said?"
	done

DragonShrineRightAnswerText:
	text "Oh, I understand…"
	done

DragonShrineElder2Text:
	text "For as long as"
	line "anyone can rememb-"
	cont "er, the ones who"

	para "loved the Dragon"
	line "and the ones who"
	cont "loved the Behemoth"

	para "have despised each"
	line "other. It created"
	cont "a rift here in"

	para "Blackthorn, and"
	line "many left. It is"
	cont "believed that they"

	para "relocated to a"
	line "valley in the"
	cont "Sevii Islands."

	para "We older folks"
	line "will still hold"
	cont "prejudices against"

	para "the Behemoth, but"
	line "I'm glad that you"
	cont "young folks are"

	para "beginning to see"
	line "past such"
	cont "nonsense."
	done

DragonShrineElder3Text:
	text "Dragonite the"
	line "Dragon, and"
	cont "Tyranitar the"
	cont "Behemoth."

	para "These two have"
	line "been symbols of"

	para "Blackthorn for"
	line "generations, for"
	cont "better or worse."

	para "The Master is not"
	line "above his own"
	cont "prejudice in the"

	para "matter. He has"
	line "seen past it,"
	cont "though. You and"

	para "your friend are"
	line "proof of that."
	done

DragonShrineTutorText:
	text "Good of you to"
	line "return."

	para "I can teach a"
	line "select few"
	cont "#mon a fast"
	cont "move."

	para "Shall I endow your"
	line "#mon with"
	cont "Extremespeed?"
	done

ExtremeSpeedRefusedText:
	text "Return if you wish"
	line "to learn it."
	done

DragonShrineTutorClearText:
	text ""
	done

TaughtExtremeSpeedText:
	text "There."

	para "Your #mon now"
	line "knows a useful"
	cont "move."

	para "Utilize it"
	line "wisely."
	done

DontLikeLarvitarYouText:
	text "You!"

	para "You chose the"
	line "behemoth?"

	para "For shame!"

	para "You bring"
	line "dishonor to our"
	cont "village!"
	done

DontLikeLarvitarText:
	text "Your friend chose"
	line "the behemoth,"
	cont "correct?"

	para "How foolish…"

	para "To bring such"
	line "dishonor to our"
	cont "village…"
	done

CantGetBagonText:
	text "Unfortunately, I"
	line "cannot give you"
	cont "this special Bagon"
	cont "while you're on"
	cont "your solo run."

	para "Please understand…"
	done

DragonShrine_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  9, DRAGONS_DEN_B1F, 2
	warp_event  5,  9, DRAGONS_DEN_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  5,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder1Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  2,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder2Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  7,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder3Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  2,  7, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder4Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  7,  7, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder5Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
