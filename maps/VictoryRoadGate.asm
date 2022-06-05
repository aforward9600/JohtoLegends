	object_const_def ; object_event constants
	const VICTORYROADGATE_OFFICER
	const VICTORYROADGATE_BLACK_BELT1
	const VICTORYROADGATE_BLACK_BELT2
	const VICTORYROADGATE_OAK
	const VICTORYROADGATE_RIVAL

VictoryRoadGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_VICTORY_ROAD_GATE_GUARD
	scene_script .DummyScene1 ; SCENE_VICTORY_ROAD_GATE_OAK
	scene_script .DummyScene2 ; SCENE_VICTORY_ROAD_GATE_DONE

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

VictoryRoadGateBadgeCheckScene:
	turnobject PLAYER, LEFT
	sjump VictoryRoadGateBadgeCheckScript

VictoryRoadGateOfficerScript:
	faceplayer
VictoryRoadGateBadgeCheckScript:
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .WelcomeBackChampion
	writetext VictoryRoadGateOfficerText
	buttonsound
	readvar VAR_BADGES
	ifgreater NUM_JOHTO_BADGES - 1, .AllEightBadges
	writetext VictoryRoadGateNotEnoughBadgesText
	waitbutton
	closetext
	applymovement PLAYER, VictoryRoadGateStepDownMovement
	end

.AllEightBadges:
	writetext VictoryRoadGateEightBadgesText
	waitbutton
	closetext
	setscene SCENE_VICTORY_ROAD_GATE_DONE
	end

.WelcomeBackChampion:
	writetext WelcomeBackChampionText
	waitbutton
	closetext
	end

VictoryRoadGateBadgeOakScene2:
	applymovement PLAYER, PlayerWalksToOakAndRival2
	sjump VictoryRoadGateBadgeOakSceneReconverge

VictoryRoadGateBadgeOakScene3:
	applymovement PLAYER, PlayerWalksToOakAndRival3
	turnobject PLAYER, LEFT
	sjump VictoryRoadGateBadgeOakSceneReconverge

VictoryRoadGateBadgeOakScene:
	applymovement PLAYER, PlayerWalksToOakAndRival
	turnobject PLAYER, LEFT
VictoryRoadGateBadgeOakSceneReconverge:
	turnobject VICTORYROADGATE_RIVAL, RIGHT
	opentext
	writetext HeyThereSleepyHeadAgainText
	waitbutton
	closetext
	turnobject PLAYER, UP
	turnobject VICTORYROADGATE_RIVAL, UP
	opentext
	writetext WelcomeYouTwoText
	waitbutton
	closetext
	applymovement VICTORYROADGATE_OAK, OakMovesRight
	pause 15
	opentext
	writetext CorrectText
	waitbutton
	closetext
	applymovement VICTORYROADGATE_OAK, OakMovesLeft
	pause 15
	opentext
	writetext YesHorribleText
	waitbutton
	closetext
	applymovement VICTORYROADGATE_OAK, OakMovesRight
	turnobject VICTORYROADGATE_OAK, DOWN
	opentext
	writetext TheTwoOfYouText
	buttonsound
	verbosegiveitem BADGE_POUCH
	writetext BadgeNumberExplainText
	waitbutton
	closetext
	pause 15
	applymovement VICTORYROADGATE_OAK, OakLeavesGateMovement
	disappear VICTORYROADGATE_OAK
	pause 15
	turnobject VICTORYROADGATE_RIVAL, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext IllScoutText
	waitbutton
	closetext
	applymovement VICTORYROADGATE_RIVAL, RivalLeavesVictoryRoadGateMovement
	disappear VICTORYROADGATE_RIVAL
	setscene SCENE_VICTORY_ROAD_GATE_DONE
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	end

VictoryRoadGateLeftBlackBeltScript:
	jumptextfaceplayer VictoryRoadGateLeftBlackBeltText

VictoryRoadGateRightBlackBeltScript:
	jumptextfaceplayer VictoryRoadGateRightBlackBeltText

VictoryRoadGateOakScript:
	faceplayer
	opentext
	writetext VictoryRoadGateWelcomePlayerText
	waitbutton
	closetext
	turnobject VICTORYROADGATE_OAK, DOWN
	end

VictoryRoadGateRivalScript:
	faceplayer
	opentext
	writetext HeyThereYouReadyText
	waitbutton
	closetext
	turnobject VICTORYROADGATE_RIVAL, UP
	end

VictoryRoadGateStepDownMovement:
	step DOWN
	step_end

PlayerWalksToOakAndRival:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

OakLeavesGateMovement:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

RivalLeavesVictoryRoadGateMovement:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

PlayerWalksToOakAndRival2:
	step DOWN
	step LEFT
	step_end

PlayerWalksToOakAndRival3:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step_end

OakMovesRight:
	step RIGHT
	step_end

OakMovesLeft:
	step LEFT
	step LEFT
	step_end

VictoryRoadGateOfficerText:
	text "Only trainers who"
	line "have proven them-"
	cont "selves may pass."
	done

VictoryRoadGateNotEnoughBadgesText:
	text "You don't have all"
	line "the Gym Badges of"
	cont "Johto."

	para "I'm sorry, but I"
	line "can't let you go"
	cont "through."
	done

VictoryRoadGateEightBadgesText:
	text "Oh! The eight"
	line "Badges of Johto!"

	para "Please, go right"
	line "on through!"
	done

VictoryRoadGateLeftBlackBeltText:
	text "This way leads to"
	line "Mt.Silver."

	para "You'll see scary-"
	line "strong #mon out"
	cont "there."
	done

VictoryRoadGateRightBlackBeltText:
	text "Off to the #mon"
	line "League, are you?"

	para "The Elite Four are"
	line "so strong it's"

	para "scary, and they're"
	line "ready for you!"
	done

HeyThereSleepyHeadAgainText:
	text "<RIVAL>: Hey"
	line "there sleepy head!"

	para "Late again, huh?"

	para "You're lucky we"
	line "didn't start"
	cont "without you!"
	done

WelcomeYouTwoText:
	text "Oak: Welcome you"
	line "two."

	para "I've called you"
	line "here for a special"
	cont "purpose."

	para "You're both aware"
	line "of the embargo"
	cont "between Kanto and"
	cont "Johto, correct?"

	para "<RIVAL>: Yeah…"

	para "Something happened"
	line "in Kanto and now"
	cont "they're no longer"
	cont "a part of the"
	cont "#mon League."
	done

CorrectText:
	text "Oak: Correct. A"
	line "group of gangsters"
	cont "known as the Kanto"
	cont "Federation caused"
	cont "this event."

	para "They began by"
	line "attacking Gyms and"
	cont "forcing Leaders to"
	cont "quit or else."

	para "Some weren't lucky"
	line "enough to get that"
	cont "choice."

	para "<RIVAL>: …That's"
	line "horrible…"
	done

YesHorribleText:
	text "Oak: …Yes."

	para "Some Leaders are"
	line "gone. Some are in"
	cont "hiding. Some gave"
	cont "in to their"
	cont "demands."

	para "After the"
	line "destruction of the"
	cont "Gyms, the League"
	cont "could do nothing."

	para "The Federation cut"
	line "Kanto off from the"
	cont "rest of the world."

	para "People are suffer-"
	line "ing across the"
	cont "region…"

	para "But I have a plan."

	para "And it requires"
	line "both of you."

	para "<RIVAL>: Us?"
	done

TheTwoOfYouText:
	text "Oak: Yes. As you"
	line "two are Champions"
	cont "of the #mon"
	cont "League."

	para "This gives you an"
	line "edge over others."

	para "<RIVAL>: What"
	line "would you have us"
	cont "do?"

	para "Oak: I want you to"
	line "take these badges."

	para "They belonged to"
	line "the previous Gym"
	cont "Leaders, and find"
	cont "new Leaders to"
	cont "take them."

	para "I believe that you"
	line "can rebuild the"
	cont "Kanto League."

	para "Once the Leaders"
	line "are ready, you can"
	cont "take back Kanto"
	cont "from those"
	cont "ruffians!"
	done

BadgeNumberExplainText:
	text "Oak:Each badge you"
	line "give will increase"
	cont "your badge count."

	para "That will help you"
	line "keep track of how"
	cont "many badges you've"
	cont "given out."

	para "If you ever need"
	line "any advice, come"
	cont "visit me in Pallet"

	para "Town. The door to"
	line "my lab is always"
	cont "open!"

	para "<RIVAL>: Wait,"
	line "Professor!"

	para "How can you go"
	line "between Johto and"
	cont "Kanto with the"
	cont "embargo up?"

	para "Oak: Well, being"
	line "me has its"
	cont "advantages."

	para "Being a former"
	line "Champion gives me"
	cont "that advantage."

	para "You have that same"
	line "advantage."

	para "Just go through"
	line "this gate to the"
	cont "East, and you'll"
	cont "be in Kanto."

	para "I'll keep in"
	line "touch!"
	done

IllScoutText:
	text "I'll scout out"
	line "towns for our"
	cont "potential Gym"
	cont "Leaders."

	para "I'll be at a"
	line "#mon Center"
	cont "with any info I"
	cont "find."

	para "See you later!"
	done

VictoryRoadGateWelcomePlayerText:
	text "Welcome, <PLAYER>."

	para "Would you mind"
	line "stepping over here"
	cont "so I can speak"
	cont "with both of you?"
	done

HeyThereYouReadyText:
	text "Hey there,"
	line "<PLAYER>!"

	para "You ready to"
	line "help Prof. Oak?"
	done

WelcomeBackChampionText:
	text "Welcome back,"
	line "Champion."

	para "Have you returned"
	line "to defend your"
	cont "title?"

	para "Good luck!"
	done

VictoryRoadGate_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 17,  7, ROUTE_22, 1
	warp_event 18,  7, ROUTE_22, 1
	warp_event  9, 17, ROUTE_26, 1
	warp_event 10, 17, ROUTE_26, 1
	warp_event  9,  0, VICTORY_ROAD, 1
	warp_event 10,  0, VICTORY_ROAD, 1
	warp_event  1,  7, ROUTE_28, 2
	warp_event  2,  7, ROUTE_28, 2

	db 4 ; coord events
	coord_event 10, 11, SCENE_VICTORY_ROAD_GATE_GUARD, VictoryRoadGateBadgeCheckScene
	coord_event 10, 11, SCENE_VICTORY_ROAD_GATE_OAK, VictoryRoadGateBadgeOakScene
	coord_event 11,  5, SCENE_VICTORY_ROAD_GATE_OAK, VictoryRoadGateBadgeOakScene2
	coord_event  8,  6, SCENE_VICTORY_ROAD_GATE_OAK, VictoryRoadGateBadgeOakScene3

	db 0 ; bg events

	db 5 ; object events
	object_event  8, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateOfficerScript, -1
	object_event  7,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateLeftBlackBeltScript, EVENT_OPENED_MT_SILVER
	object_event 12,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateRightBlackBeltScript, EVENT_VICTORY_ROAD_GATE_GUARD
	object_event 10,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateOakScript, EVENT_VICTORY_ROAD_GATE_OAK
	object_event  9,  6, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VictoryRoadGateRivalScript, EVENT_VICTORY_ROAD_GATE_RIVAL
