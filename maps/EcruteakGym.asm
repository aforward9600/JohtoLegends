	object_const_def ; object_event constants
	const ECRUTEAKGYM_ENOKI
	const ECRUTEAKGYM_SAGE1
	const ECRUTEAKGYM_SAGE2
	const ECRUTEAKGYM_HEX_MANIAC1
	const ECRUTEAKGYM_HEX_MANIAC2
	const ECRUTEAKGYM_GYM_GUY
	const ECRUTEAKGYM_GRAMPS
	const ECRUTEAKGYM_MORTY
	const ECRUTEAKGYM_EUSINE

EcruteakGym_MapScripts:
	db 2 ; scene scripts
	scene_script .ForcedToLeave ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .EnokiThursdayGym

.ForcedToLeave:
	prioritysjump EcruteakGymClosed
	end

.DummyScene:
	end

.EnokiThursdayGym:
	checkevent EVENT_BELLCHIME_PATH_ENOKI_PANIC
	iftrue .EnokiCanAppearGym
	disappear ECRUTEAKGYM_ENOKI
	return

.EnokiCanAppearGym:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .IsItThursdayGym
	appear ECRUTEAKGYM_ENOKI
	return

.IsItThursdayGym:
	 readvar VAR_WEEKDAY
	 ifequal THURSDAY, .EnokiDisappears
	 appear ECRUTEAKGYM_ENOKI
	 return

.EnokiDisappears:
	disappear ECRUTEAKGYM_ENOKI
	return

EcruteakGymEnokiScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ENOKI
	iftrue .FightDone
	writetext EnokiIntroText
	waitbutton
	closetext
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .EnokiAlternateBattle
	winlosstext EnokiWinLossText, EnokiWinText
	loadtrainer ENOKI, ENOKI1
.StartEnokiBattle:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ENOKI
	setevent EVENT_DECO_GENGAR_DOLL
	opentext
	writetext BeatenEnokiText
	waitbutton
	closetext
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	loadmem wLevelCap, 28
	readvar VAR_BADGES
	scall EcruteakGymActivateRockets
	setflag ENGINE_BEAT_ENOKI
.FightDone:
	checkflag ENGINE_BEAT_ENOKI
	iffalse .EnokiRematch
	checkevent EVENT_GOT_TM04_HEX
	iftrue .GotShadowBall
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_HEX_MANIAC_HILDA
	setevent EVENT_BEAT_HEX_MANIAC_ZELDA
	writetext EnokiText_FogBadgeSpeech
	buttonsound
	verbosegiveitem TM_HEX
	iffalse .NoRoomForHex
	setevent EVENT_GOT_TM04_HEX
	writetext EnokiText_HexSpeech
	waitbutton
	closetext
	opentext
	writetext EnokiHelpText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ECRUTEAKGYM_ENOKI, 15
	opentext
	writetext WhatIsGoingOnText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear ECRUTEAKGYM_ENOKI
	pause 15
	special FadeInQuickly
	clearevent EVENT_TIN_TOWER_ENTRANCE_ROCKET
	setevent EVENT_ECRUTEAK_GYM_ENOKI
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_FINISHED
	end

.GotShadowBall:
	writetext EnokiFightDoneText
	waitbutton
.NoRoomForHex:
	closetext
	end

.EnokiAlternateBattle:
	winlosstext EnokiWinLossText, EnokiWinText
	loadtrainer ENOKI, ENOKI_ALTERNATE
	sjump .StartEnokiBattle

.EnokiRematch:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .PostGameEnoki
	readvar VAR_BADGES
	ifequal 2, .EnokiBattle1
	ifequal 3, .EnokiBattle2
	ifequal 4, .EnokiBattle3
	ifequal 5, .EnokiBattle4
	ifequal 6, .EnokiBattle5
	ifequal 7, .EnokiBattle6
	ifequal 8, .EnokiBattle7
	sjump .EnokiBattle7

.EnokiBattle1:
	writetext EnokiReadyForARematchText
	waitbutton
	closetext
	winlosstext EnokiWinLossText, EnokiWinText
	loadtrainer ENOKI, ENOKI_ALTERNATE
	startbattle
	reloadmapafterbattle
	sjump AfterEnokiRematch

.EnokiBattle2:
	writetext EnokiReadyForARematchText
	waitbutton
	closetext
	winlosstext EnokiWinLossText, EnokiWinText
	loadtrainer ENOKI_2, ENOKI2
	startbattle
	reloadmapafterbattle
	sjump AfterEnokiRematch

.EnokiBattle3:
	writetext EnokiReadyForARematchText
	waitbutton
	closetext
	winlosstext EnokiWinLossText, EnokiWinText
	loadtrainer ENOKI_2, ENOKI3
	startbattle
	reloadmapafterbattle
	sjump AfterEnokiRematch

.EnokiBattle4:
	writetext EnokiReadyForARematchText
	waitbutton
	closetext
	winlosstext EnokiWinLossText, EnokiWinText
	loadtrainer ENOKI_2, ENOKI4
	startbattle
	reloadmapafterbattle
	sjump AfterEnokiRematch

.EnokiBattle5:
	writetext EnokiReadyForARematchText
	waitbutton
	closetext
	winlosstext EnokiWinLossText, EnokiWinText
	loadtrainer ENOKI_3, ENOKI5
	startbattle
	reloadmapafterbattle
	sjump AfterEnokiRematch

.EnokiBattle6:
	writetext EnokiReadyForARematchText
	waitbutton
	closetext
	winlosstext EnokiWinLossText, EnokiWinText
	loadtrainer ENOKI_3, ENOKI6
	startbattle
	reloadmapafterbattle
	sjump AfterEnokiRematch

.EnokiBattle7:
	writetext EnokiReadyForARematchText
	waitbutton
	closetext
	winlosstext EnokiWinLossText, EnokiWinText
	loadtrainer ENOKI_3, ENOKI7
	startbattle
	reloadmapafterbattle
	sjump AfterEnokiRematch

.PostGameEnoki:
	writetext PostGameEnokiText
	waitbutton
	closetext
	winlosstext EnokiWinLossText, EnokiWinText
	loadtrainer ENOKI_3, ENOKI8
	startbattle
	reloadmapafterbattle
	sjump AfterEnokiRematch

AfterEnokiRematch:
	opentext
	writetext BeatenEnokiAgainText
	waitbutton
	closetext
	setflag ENGINE_BEAT_ENOKI
	end

EcruteakGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

EcruteakGymClosed:
	applymovement PLAYER, EcruteakGymPlayerStepUpMovement
	applymovement ECRUTEAKGYM_GRAMPS, EcruteakGymGrampsSlowStepDownMovement
	opentext
	writetext EcruteakGymClosedText
	waitbutton
	closetext
	follow PLAYER, ECRUTEAKGYM_GRAMPS
	applymovement PLAYER, EcruteakGymPlayerSlowStepDownMovement
	stopfollow
	special FadeOutPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	warp ECRUTEAK_CITY, 6, 27
	end

TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end

TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end

TrainerHexManiacHilda:
	trainer HEX_MANIAC, HILDA, EVENT_BEAT_HEX_MANIAC_HILDA, HexManiacHildaSeenText, HexManiacHildaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HexManiacHildaAfterBattleText
	waitbutton
	closetext
	end

TrainerHexManiacZelda:
	trainer HEX_MANIAC, ZELDA, EVENT_BEAT_HEX_MANIAC_ZELDA, HexManiacZeldaSeenText, HexManiacZeldaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HexManiacZeldaAfterBattleText
	waitbutton
	closetext
	end

EcruteakGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ENOKI
	iftrue .EcruteakGymGuyWinScript
	writetext EcruteakGymGuyText
	waitbutton
	closetext
	end

.EcruteakGymGuyWinScript:
	writetext EcruteakGymGuyWinText
	waitbutton
	closetext
	end

EcruteakGymMorty:
	jumptextfaceplayer EcruteakGymMortyGymText

EcruteakGymEusine:
	jumptextfaceplayer EcruteakGymEusineText

EcruteakGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	gettrainername STRING_BUFFER_4, ENOKI, ENOKI1
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, ENOKI, ENOKI1
	jumpstd gymstatue2

EcruteakGymPlayerStepUpMovement:
	step UP
	step_end

EcruteakGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

EcruteakGymGrampsSlowStepDownMovement:
	slow_step DOWN
	step_end

EnokiIntroText:
	text "Good of you to"
	line "have come."

	para "I shall re-"
	line "introduce myself"
	cont "properly. I am"

	para "Enoki, Gym Leader"
	line "of Ecruteak City."

	para "For many years, I"
	line "have trained with"
	cont "Ghost Types."

	para "Mysterious and"
	line "dangerous, they"
	cont "will mystify you"

	para "with their powers."
	line "Come! Face the"

	para "spectral terror!"
	done

EnokiWinLossText:
	text "How curious."
	line "It seems I wasn't"

	para "mistaken."
	done

EnokiWinText:
	text "Only one remains…"
	done

BeatenEnokiText:
	text "Bravo young"
	line "trainer. It takes"
	cont "some nerve to face"

	para "ghosts head-on."
	line "You deserve this"
	cont "FogBadge!"
	done

Text_ReceivedFogBadge:
	text "<PLAYER> received"
	line "FogBadge."
	done

EnokiText_FogBadgeSpeech:
	text "The FogBadge will"
	line "make any #mon"
	cont "up to Lv 30 obey"

	para "you. Here, take"
	line "this TM."
	done

EnokiText_HexSpeech:
	text "It contains the"
	line "move Hex. Its"
	cont "power doubles when"

	para "the opponent has a"
	line "status condition."

	para "It's quite"
	line "terrifying to"
	cont "witness."
	done

EnokiHelpText:
	text "Master Enoki!"

	para "Please help!"

	para "There is a"
	line "trouble-maker at"
	cont "Bell Tower!"
	done

WhatIsGoingOnText:
	text "What's that?"

	para "Please, excuse me"
	line "<PLAYER>."

	para "I must go invest-"
	line "igate."
	done

EnokiFightDoneText:
	text "Morty will make a"
	line "fine Gym Leader"
	cont "one day, and"

	para "Eusine will"
	line "continue to chase"
	cont "his dreams, even"

	para "though he may"
	line "fail."
	done

EnokiReadyForARematchText:
	text "Good of you to"
	line "return."

	para "Would you do this"
	line "old man a favor"
	cont "and battle me?"

	para "I need to keep up"
	line "with my skills."
	done

BeatenEnokiAgainText:
	text "You truly are on"
	line "your way to becom-"
	cont "ing a master."

	para "Keep going, and do"
	line "not become discou-"
	cont "aged."
	done

SageJeffreySeenText:
	text "I spent the spring"
	line "with my #mon."

	para "Then summer, fall"
	line "and winter…"

	para "Then spring came"
	line "again. We have"

	para "lived together"
	line "for a long time."
	done

SageJeffreyBeatenText:
	text "Wins and losses, I"
	line "experienced both."
	done

SageJeffreyAfterBattleText:
	text "Where did #mon"
	line "come from?"
	done

SagePingSeenText:
	text "Can you inflict"
	line "any damage on our"
	cont "#mon?"
	done

SagePingBeatenText:
	text "Ah! Well done!"
	done

SagePingAfterBattleText:
	text "We use only ghost-"
	line "type #mon."

	para "No normal-type"
	line "attack can harm"
	cont "them!"
	done

HexManiacHildaSeenText:
	text "I came to this Gym"
	line "because I felt the"
	cont "terror of Ghost-"

	para "types! You shall"
	line "feel it too!"
	done

HexManiacHildaBeatenText:
	text "Terror indeed!"
	done

HexManiacHildaAfterBattleText:
	text "They truly are"
	line "terrifying, don't"
	cont "you agree?"
	done

HexManiacZeldaSeenText:
	text "The invisible"
	line "floor here is"
	cont "quite hard to"

	para "comprehend. Want"
	line "a hint?"
	done

HexManiacZeldaBeatenText:
	text "I can't comprehend"
	line "the true form of"

	para "your attacks!"
	done

HexManiacZeldaAfterBattleText:
	text "I'll tell you the"
	line "secret of the"

	para "invisible"
	line "floor."

	para "The path is right"
	line "before our eyes!"
	done

EcruteakGymGuyText:
	text "How's it going,"
	line "champ in the"
	cont "making? Enoki uses"

	para "the horrific Ghost"
	line "Type #mon! Very"
	cont "little can"

	para "actually hurt"
	line "them, so use Dark"
	cont "Type moves!"

	para "They're also weak"
	line "to themselves, so"
	cont "try that out if"

	para "you have your own"
	line "Ghost Type!"
	done

EcruteakGymGuyWinText:
	text "Ghost Types might"
	line "be terrifying,"

	para "but you're"
	line "something else!"
	done

EcruteakGymClosedText:
	text "Enoki, the Gym"
	line "Leader, is absent."

	para "He's at the Burned"
	line "Tower to the"

	para "north. Two"
	line "children have gone"
	cont "there."
	done

EcruteakGymMortyGymText:
	text "Gramps got pretty"
	line "mad at us for"
	cont "going into the"
	cont "Burned Tower."

	para "Can you blame us?"
	line "It's our natural"
	cont "curiosity."

	para "How else are we"
	line "supposed to figure"
	cont "out the mysteries"
	cont "of the Legendary"
	cont "#mon?"
	done

EcruteakGymEusineText:
	text "Ah man."

	para "Our punishment is"
	line "to stay in the Gym"
	cont "and think about"
	cont "what we did."

	para "I'll tell you what"
	line "we did!"

	para "We found out about"
	line "the basement in"
	cont "Burned Tower!"

	para "We're close to"
	line "finding Suicune!"
	done

PostGameEnokiText:
	text "Congratulations on"
	line "becoming Champion."

	para "I knew you could"
	line "do it, from the"
	cont "moment I met you."

	para "May I have this"
	line "battle?"

	para "Not everyone gets"
	line "the pleasure of"
	cont "battling a"
	cont "Champion."
	done

EcruteakGym_MapEvents:
	db 0, 0 ; filler

	db 33 ; warp events
	warp_event  4, 17, ECRUTEAK_CITY, 10
	warp_event  5, 17, ECRUTEAK_CITY, 10
	warp_event  4, 14, ECRUTEAK_GYM, 4
	warp_event  2,  4, ECRUTEAK_GYM, 3
	warp_event  3,  4, ECRUTEAK_GYM, 3
	warp_event  4,  4, ECRUTEAK_GYM, 3
	warp_event  4,  5, ECRUTEAK_GYM, 3
	warp_event  6,  7, ECRUTEAK_GYM, 3
	warp_event  7,  4, ECRUTEAK_GYM, 3
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  3,  6, ECRUTEAK_GYM, 3
	warp_event  4,  6, ECRUTEAK_GYM, 3
	warp_event  5,  6, ECRUTEAK_GYM, 3
	warp_event  7,  6, ECRUTEAK_GYM, 3
	warp_event  7,  7, ECRUTEAK_GYM, 3
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  5,  8, ECRUTEAK_GYM, 3
	warp_event  6,  8, ECRUTEAK_GYM, 3
	warp_event  7,  8, ECRUTEAK_GYM, 3
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  2,  9, ECRUTEAK_GYM, 3
	warp_event  2, 10, ECRUTEAK_GYM, 3
	warp_event  2, 11, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  5, 10, ECRUTEAK_GYM, 3
	warp_event  2, 12, ECRUTEAK_GYM, 3
	warp_event  3, 12, ECRUTEAK_GYM, 3
	warp_event  4, 12, ECRUTEAK_GYM, 3
	warp_event  5, 12, ECRUTEAK_GYM, 3
	warp_event  7, 10, ECRUTEAK_GYM, 3
	warp_event  7, 11, ECRUTEAK_GYM, 3
	warp_event  7, 12, ECRUTEAK_GYM, 3
	warp_event  7, 13, ECRUTEAK_GYM, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, EcruteakGymStatue
	bg_event  6, 15, BGEVENT_READ, EcruteakGymStatue

	db 9 ; object events
	object_event  5,  1, SPRITE_ENOKI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakGymEnokiScript, EVENT_ECRUTEAK_GYM_ENOKI
	object_event  2,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageJeffrey, -1
	object_event  3, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSagePing, -1
	object_event  7,  5, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, TrainerHexManiacHilda, -1
	object_event  7,  9, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, TrainerHexManiacZelda, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuyScript, -1
	object_event  4, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
	object_event  0, 14, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakGymMorty, EVENT_ECRUTEAK_GYM_KIDS
	object_event  1, 14, SPRITE_EUSINE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakGymEusine, EVENT_ECRUTEAK_GYM_KIDS
