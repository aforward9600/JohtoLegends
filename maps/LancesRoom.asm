	object_const_def ; object_event constants
	const LANCESROOM_RIVAL
	const LANCESROOM_RIVAL2
	const LANCESROOM_OAK
	const LANCESROOM_OAK2
	const LANCESROOM_CYNTHIA
	const LANCESROOM_CYNTHIA2

LancesRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .LockDoor ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_LANCESROOM_APPROACH_LANCE

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .LancesRoomDoors

.LockDoor:
	prioritysjump .LancesDoorLocksBehindYou
	end

.DummyScene:
	end

.LancesRoomDoors:
	checkevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	iffalse .KeepEntranceOpen
	changeblock 4, 22, $34 ; wall
.KeepEntranceOpen:
	checkevent EVENT_LANCES_ROOM_EXIT_OPEN
	iffalse .KeepExitClosed
	changeblock 4, 0, $0b ; open door
.KeepExitClosed:
	return

.LancesDoorLocksBehindYou:
	applymovement PLAYER, LancesRoom_EnterMovement
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 4, 22, $34 ; wall
	reloadmappart
	closetext
	setscene SCENE_LANCESROOM_APPROACH_LANCE
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	checkevent EVENT_CURRENTLY_CHAMPION
	iftrue .DisappearSprites
	end

.DisappearSprites:
	disappear LANCESROOM_CYNTHIA
	disappear LANCESROOM_RIVAL
	disappear LANCESROOM_OAK
	disappear LANCESROOM_RIVAL2
	disappear LANCESROOM_CYNTHIA2
	disappear LANCESROOM_OAK2
	end

Script_ApproachLanceFromLeft:
	special FadeOutMusic
	checkevent EVENT_CURRENTLY_CHAMPION
	iftrue .MoveToChampionSpot1
	applymovement PLAYER, MovementData_ApproachLanceFromLeft
	sjump LancesRoomLanceScript

.MoveToChampionSpot1:
	applymovement PLAYER, MoveToChampionSpotFromLeft
	sjump LancesRoomChallengerScript

Script_ApproachLanceFromRight:
	special FadeOutMusic
	checkevent EVENT_CURRENTLY_CHAMPION
	iftrue .MoveToChampionSpot2
	applymovement PLAYER, MovementData_ApproachLanceFromRight
	sjump LancesRoomLanceScript

.MoveToChampionSpot2:
	applymovement PLAYER, MoveToChampionSpotFromRight
	sjump LancesRoomChallengerScript

LancesRoomLanceScript:
;	checkevent EVENT_CHAMPION_CYNTHIA
;	iffalse LancesRoomChallengerScript.ChampionCynthia
	turnobject LANCESROOM_RIVAL, LEFT
	opentext
	writetext LooksLikeImTheChampionText
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .ChampionFemale
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .DahliaDragoniteBattle
	checkevent EVENT_GOT_SILVER_WING
	iftrue .DahliaTyranitarHoOh
	winlosstext ChampionWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL
	loadtrainer CHAMPION_DAHLIA, CHAMP_DAHLIA_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump AfterChampionBattle

.DahliaTyranitarHoOh
	winlosstext ChampionWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL
	loadtrainer CHAMPION_DAHLIA, CHAMP_DAHLIA_3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump AfterChampionBattle

.DahliaDragoniteBattle
	checkevent EVENT_GOT_SILVER_WING
	iftrue .DahliaDragoniteHoOh
	winlosstext ChampionWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL
	loadtrainer CHAMPION_DAHLIA, CHAMP_DAHLIA_2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump AfterChampionBattle

.DahliaDragoniteHoOh
	winlosstext ChampionWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL
	loadtrainer CHAMPION_DAHLIA, CHAMP_DAHLIA_4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump AfterChampionBattle

.ChampionFemale
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .DracoDragoniteBattle
	checkevent EVENT_GOT_SILVER_WING
	iftrue .DracoTyranitarHoOh
	winlosstext ChampionWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL
	loadtrainer CHAMPION_DRACO, CHAMP_DRACO_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump AfterChampionBattle

.DracoTyranitarHoOh
	winlosstext ChampionWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL
	loadtrainer CHAMPION_DRACO, CHAMP_DRACO_3
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump AfterChampionBattle

.DracoDragoniteBattle
	checkevent EVENT_GOT_SILVER_WING
	iftrue .DracoDragoniteHoOh
	winlosstext ChampionWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL
	loadtrainer CHAMPION_DRACO, CHAMP_DRACO_2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump AfterChampionBattle

.DracoDragoniteHoOh
	winlosstext ChampionWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL
	loadtrainer CHAMPION_DRACO, CHAMP_DRACO_4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump AfterChampionBattle

AfterChampionBattle:
	setevent EVENT_BEAT_CHAMPION_LANCE
	opentext
	writetext ChampionBattleAfterText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 0, $0b ; open door
	reloadmappart
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_PALLET_TOWN, 16
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_RIVAL, 15
	turnobject LANCESROOM_RIVAL, DOWN
	showemote EMOTE_SHOCK, LANCESROOM_RIVAL2, 15
	turnobject LANCESROOM_RIVAL2, DOWN
	pause 10
	turnobject PLAYER, DOWN
	moveobject LANCESROOM_OAK2, 4, 7
	appear LANCESROOM_OAK2
	applymovement LANCESROOM_OAK2, LancesRoomMovementData_OakCongratulatesYou
	opentext
	checkevent EVENT_CURRENTLY_CHAMPION
	iftrue .OakCongrats
	writetext OakCongratulatesYouText
	waitbutton
	closetext
.ConveneOak:
	turnobject LANCESROOM_OAK2, RIGHT
	opentext
	writetext OakCongratulatesRivalText
	waitbutton
	closetext
	opentext
	writetext RivalThanksOakText
	waitbutton
	closetext
	applymovement LANCESROOM_OAK2, LancesRoomMovementData_OakPositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	turnobject LANCESROOM_RIVAL, UP
	turnobject LANCESROOM_RIVAL2, UP
	opentext
	writetext OakComeWithMeText
	waitbutton
	closetext
	follow LANCESROOM_OAK2, PLAYER
	applymovement LANCESROOM_OAK2, LancesRoomMovementData_LanceLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_OAK2
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	setevent EVENT_CURRENTLY_CHAMPION
	setevent EVENT_CHAMPION_RIVAL
	end

.OakCongrats:
	writetext OakCongratsText
	waitbutton
	closetext
	sjump .ConveneOak

LancesRoomChallengerScript:
	checkevent EVENT_BEAT_CHERRYGROVE_CYNTHIA
	iffalse .CynthiaCanAppear
.CynthiaDoesNotAppear:
	pause 30
	appear LANCESROOM_RIVAL2
	applymovement LANCESROOM_RIVAL2, LancesRoom_EnterMovement
	turnobject LANCESROOM_RIVAL2, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext ImBackPlayerText
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .ChallengerFemale
	checkevent EVENT_RIVAL_GIVES_UP_LUGIA
	iftrue .DahliaSkarmory
	checkevent EVENT_RIVAL_GIVES_UP_HO_OH
	iftrue .DahliaSkarmory
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .DahliaDragoniteBattle
	checkevent EVENT_GOT_SILVER_WING
	iftrue .DahliaTyranitarHoOh
	winlosstext ChallengerWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL2
	loadtrainer CHALLENGER_DAHLIA, CHALLENGER_DAHLIA_1
	sjump .StartBattle

.DahliaSkarmory:
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .DahliaTyranitarSkarmory
	winlosstext ChallengerWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL2
	loadtrainer CHALLENGER_DAHLIA, CHALLENGER_DAHLIA_5
	sjump .StartBattle

.DahliaTyranitarSkarmory:
	winlosstext ChallengerWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL2
	loadtrainer CHALLENGER_DAHLIA, CHALLENGER_DAHLIA_6
	sjump .StartBattle

.DahliaTyranitarHoOh
	winlosstext ChallengerWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL2
	loadtrainer CHALLENGER_DAHLIA, CHALLENGER_DAHLIA_3
	sjump .StartBattle

.DahliaDragoniteBattle
	checkevent EVENT_GOT_SILVER_WING
	iftrue .DahliaDragoniteHoOh
	winlosstext ChallengerWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL2
	loadtrainer CHALLENGER_DAHLIA, CHALLENGER_DAHLIA_2
	sjump .StartBattle

.DahliaDragoniteHoOh
	winlosstext ChallengerWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL2
	loadtrainer CHALLENGER_DAHLIA, CHALLENGER_DAHLIA_4
	sjump .StartBattle

.ChallengerFemale
	checkevent EVENT_RIVAL_GIVES_UP_LUGIA
	iftrue .DracoSkarmory
	checkevent EVENT_RIVAL_GIVES_UP_HO_OH
	iftrue .DracoSkarmory
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .DracoDragoniteBattle
	checkevent EVENT_GOT_SILVER_WING
	iftrue .DracoTyranitarHoOh
	winlosstext ChallengerWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL2
	loadtrainer CHALLENGER_DRACO, CHALLENGER_DRACO_1
	sjump .StartBattle

.DracoSkarmory:
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .DracoSkarmoryDragonite
	winlosstext ChallengerWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL2
	loadtrainer CHALLENGER_DRACO, CHALLENGER_DRACO_5
	sjump .StartBattle

.DracoSkarmoryDragonite:
	winlosstext ChallengerWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL2
	loadtrainer CHALLENGER_DRACO, CHALLENGER_DRACO_6
	sjump .StartBattle

.DracoTyranitarHoOh
	winlosstext ChallengerWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL2
	loadtrainer CHALLENGER_DRACO, CHALLENGER_DRACO_3
	sjump .StartBattle

.DracoDragoniteBattle
	checkevent EVENT_GOT_SILVER_WING
	iftrue .DracoDragoniteHoOh
	winlosstext ChallengerWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL2
	loadtrainer CHALLENGER_DRACO, CHALLENGER_DRACO_2
	sjump .StartBattle

.DracoDragoniteHoOh
	winlosstext ChallengerWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL2
	loadtrainer CHALLENGER_DRACO, CHALLENGER_DRACO_4
	sjump .StartBattle

.StartBattle:
;	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
;	ifequal LOSE, .AfterChampionLoss
	sjump AfterChampionBattle

.CynthiaCanAppear:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .CynthiaAppears
	ifequal WEDNESDAY, .CynthiaAppears
	sjump .CynthiaDoesNotAppear

;.AfterChampionLoss:
;	pause 15
;	opentext
;	writetext BetterLuckNextTimeText
;	waitbutton
;	closetext
;	special HealParty
;	special FadeBlackQuickly
;	special ReloadSpritesNoPalettes
;	pause 30
;	warp ROUTE_23, 9, 6
;	turnobject PLAYER, DOWN
;	blackoutmod ROUTE_23
;	clearevent EVENT_CURRENTLY_CHAMPION
;	clearevent EVENT_CHAMPION_RIVAL
;	setevent EVENT_CHALLENGER_RIVAL
;	end

.CynthiaAppears:
	pause 30
	musicfadeout MUSIC_CYNTHIA_ENCOUNTER, 16
	appear LANCESROOM_CYNTHIA2
	applymovement LANCESROOM_CYNTHIA2, LancesRoom_EnterMovement
	turnobject LANCESROOM_CYNTHIA2, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext ChallengerCynthiaText
	waitbutton
	closetext
	checkevent EVENT_COMPLETED_EPILOGUE
	iftrue .Cynthia2
.CynthiaReconverge:
	winlosstext CynthiaWinText, CynthiaLastMonText
	setlasttalked LANCESROOM_CYNTHIA2
	loadtrainer CHALLENGER_CYNTHIA, CHALLENGER_CYNTHIA_1
;	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
;	ifequal LOSE, .AfterCynthiaLoss
; Winning and Losing code not working for Cynthia
.AfterCynthiaBattle:
	opentext
	writetext CynthiaBattleAfterText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 0, $0b ; open door
	reloadmappart
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_PALLET_TOWN, 16
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_CYNTHIA, 15
	turnobject LANCESROOM_CYNTHIA, DOWN
	showemote EMOTE_SHOCK, LANCESROOM_CYNTHIA2, 15
	turnobject LANCESROOM_CYNTHIA2, DOWN
	pause 10
	turnobject PLAYER, DOWN
	moveobject LANCESROOM_OAK2, 4, 7
	appear LANCESROOM_OAK2
	applymovement LANCESROOM_OAK2, LancesRoomMovementData_OakCongratulatesYou
	opentext
	writetext OakCongratsText
	waitbutton
	closetext
	turnobject LANCESROOM_OAK2, RIGHT
	opentext
	writetext OakCongratulatesCynthiaText
	waitbutton
	closetext
	opentext
	writetext CynthiaThanksOakText
	waitbutton
	closetext
	applymovement LANCESROOM_OAK2, LancesRoomMovementData_OakPositionsSelfToGuidePlayerAway
	turnobject PLAYER, UP
	turnobject LANCESROOM_CYNTHIA, UP
	turnobject LANCESROOM_CYNTHIA2, UP
	opentext
	writetext OakComeWithMeText
	waitbutton
	closetext
	follow LANCESROOM_OAK2, PLAYER
	applymovement LANCESROOM_OAK2, LancesRoomMovementData_LanceLeadsPlayerToHallOfFame
	stopfollow
	playsound SFX_EXIT_BUILDING
	disappear LANCESROOM_OAK2
	applymovement PLAYER, LancesRoomMovementData_PlayerExits
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	special FadeOutPalettes
	pause 15
	warpfacing UP, HALL_OF_FAME, 4, 13
	setevent EVENT_CURRENTLY_CHAMPION
	setevent EVENT_CHAMPION_CYNTHIA
	setevent EVENT_CHALLENGER_CYNTHIA
	setevent EVENT_BEAT_CHALLENGER_CYNTHIA
	end

.Cynthia2:
	winlosstext CynthiaWinText, CynthiaLastMonText
	setlasttalked LANCESROOM_CYNTHIA2
	loadtrainer CHALLENGER_CYNTHIA, CHALLENGER_CYNTHIA_2
;	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterCynthiaBattle

.AfterCynthiaLoss:
	pause 15
	opentext
	writetext LooksLikeImTheNewChampionText
	waitbutton
	closetext
	special HealParty
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	pause 30
	warp ROUTE_23, 9, 6
	turnobject PLAYER, DOWN
	blackoutmod ROUTE_23
	clearevent EVENT_CURRENTLY_CHAMPION
	clearevent EVENT_CHAMPION_CYNTHIA
	setevent EVENT_CHALLENGER_CYNTHIA
	end

.ChampionCynthia:
	turnobject LANCESROOM_CYNTHIA, LEFT
	pause 15
	musicfadeout MUSIC_CYNTHIA_ENCOUNTER, 16
	opentext
	writetext CynthiaRematchText
	waitbutton
	closetext
	setlasttalked LANCESROOM_CYNTHIA
	sjump .CynthiaReconverge

CynthiaLastMonText:
	text "This is nostalgic,"
	line "isn't it?"
	done

LancesRoom_EnterMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_ApproachLanceFromLeft:
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_ApproachLanceFromRight:
	step UP
	step LEFT
	step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_OakCongratulatesYou:
	step UP
	step UP
	step UP
	step_end

LancesRoomMovementData_OakWalksIn:
	step UP
	step UP
	step_end

LancesRoomMovementData_MaryYieldsToOak:
	step LEFT
	turn_head RIGHT
	step_end

LancesRoomMovementData_MaryInterviewChampion:
	big_step UP
	turn_head RIGHT
	step_end

LancesRoomMovementData_OakPositionsSelfToGuidePlayerAway:
	step LEFT
	step UP
	step UP
	step RIGHT
	turn_head DOWN
	step_end

LancesRoomMovementData_LanceLeadsPlayerToHallOfFame:
	step UP
	step_end

LancesRoomMovementData_PlayerExits:
	step UP
	step_end

LancesRoomMovementData_MaryTriesToFollow:
	step UP
	step RIGHT
	turn_head UP
	step_end

LancesRoomMovementData_MaryRunsBackAndForth:
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step LEFT
	big_step LEFT
	turn_head UP
	step_end

MoveToChampionSpotFromLeft:
	step UP
	step UP
	turn_head DOWN
	step_end

MoveToChampionSpotFromRight:
	step UP
	step UP
	step LEFT
	turn_head DOWN
	step_end

LooksLikeImTheChampionText:
	text "<PLAY_G>!"

	para "I did it!"

	para "I beat the Elite"
	line "Four before you!"

	para "I'm the Champion"
	line "now! The first one"
	cont "in years!"

	para "It's strange, isn't"
	line "it?"

	para "You always seemed"
	line "one step ahead of"
	cont "me throughout our"
	cont "journey."

	para "But that doesn't"
	line "matter now!"

	para "I avenged my #-"
	line "mon's mother, and"

	para "and we captured"
	line "the legendary"
	cont "#mon together!"

	para "And now here we"
	line "are, the two most"
	cont "powerful Trainers"
	cont "in Johto!"

	para "What do you say we"
	line "see who is the"
	cont "strongest?"

	para "As the Pokemon"
	line "League Champion,"

	para "I, <RIVAL>, accept"
	line "your challenge!"
	done

ChampionWinText:
	text "…I…"

	para "…I lost again…"

	para "…I guess this is"
	line "just how it is,"
	cont "huh?"

	para "…I must have the"
	line "shortest reign as"
	cont "Champion…"

	para "…Heh…"
	done

ChampionLoseText:
	text "…Is this it?"

	para "After all our"
	line "hard work?"
	done

ChampionBattleAfterText:
	text "……………………………"

	para "Well done,"
	line "<PLAY_G>."

	para "I may not be the"
	line "strongest, but I"
	cont "am glad that I got"
	cont "to battle you,"

	para "here, at the #-"
	line "mon League…"

	para "We put our"
	line "strength against"
	cont "each other, and"
	cont "you won."

	para "Regardless of who"
	line "won, I believe we"
	cont "would have had"
	cont "each others'"
	cont "backs."

	para "We're best friends"
	line "after all…"
	done

OakCongratulatesYouText:
	text "Prof.Oak: Hello"
	line "<PLAYER>!"

	para "Congratulations on"
	line "your triumph over"
	cont "the League!"

	para "I knew you had it"
	line "in you!"

	para "It's not very"
	line "often that two"
	cont "Champions are"
	cont "crowned!"
	done

OakCongratulatesRivalText:
	text "Prof.Oak: Ah,"
	line "<RIVAL>!"

	para "You fought well,"
	line "and you fought"
	cont "with conviction."

	para "There's no doubt"
	line "in my mind that"
	cont "you deserved to"
	cont "be here."

	para "You should not"
	line "dwell in self-"
	cont "pity, but should"
	cont "rejoice in your"
	cont "accomplishments!"
	done

RivalThanksOakText:
	text "<RIVAL>: Thank you"
	line "Prof.Oak. I have"
	cont "come to terms with"
	cont "my loss here."

	para "I am happy that I"
	line "got to share this"
	cont "moment with my"
	cont "best friend."
	done

OakComeWithMeText:
	text "Prof.Oak: With"
	line "that all settled,"

	para "<PLAY_G>, could you"
	line "come with me?"
	done

ImBackPlayerText:
	text "<PLAYER>, I'm back."

	para "I'm here to take"
	line "back the title."

	para "Ready?"
	done

ChallengerWinText:
	text "…I…"

	para "…I lost again…"

	para "…I guess this is"
	line "just how it is,"
	cont "huh?"

	para "…I must just"
	line "be destined to be"
	cont "a former Champion…"

	para "…Heh…"
	done

BetterLuckNextTimeText:
	text "…I…"

	para "…I did it…"

	para "I'm the champion"
	line "again!"

	para "<PLAYER>, come back"
	line "when you want"
	cont "another chance!"

	para "I'll be waiting!"
	done

ChallengerCynthiaText:
	text "We meet again."

	para "I decided to"
	line "collect the 8"
	cont "Badges of Johto"
	cont "while I'm here."

	para "Figured I'd give"
	line "you a nice"
	cont "challenge,"
	cont "Champion."

	para "What do you say?"

	para "Up for another"
	line "battle?"

	para "Don't expect me to"
	line "go easy on you!"
	done

CynthiaWinText:
	text "There's a reason"
	line "you're the"
	cont "Champion here."
	done

CynthiaBattleAfterText:
	text "Congratulations"
	line "are in order."

	para "Time and time"
	line "again, you've"

	para "proven what a"
	line "great trainer you"
	cont "are."

	para "I hope someday to"
	line "be as strong as"
	cont "you are."
	done

OakCongratulatesCynthiaText:
	text "I must give my"
	line "congrats to you as"
	cont "well, Cynthia!"

	para "I've heard good"
	line "things from Prof."
	cont "Rowan!"

	para "It takes great"
	line "skill to get this"
	cont "far!"
	done

CynthiaThanksOakText:
	text "Thank you, Prof."
	line "Oak."

	para "I will be sure"
	line "to let Prof."
	cont "Rowan know of"
	cont "your praise."
	done

OakCongratsText:
	text "Prof.Oak: Hello"
	line "<PLAYER>!"

	para "Congratulations on"
	line "defending your"
	cont "title!"

	para "I knew you had it"
	line "in you!"
	done

LooksLikeImTheNewChampionText:
	text "Looks like I'm"
	line "the new Champion."

	para "It was a good"
	line "battle."

	para "Come back if you"
	line "want another try."
	done

CynthiaRematchText:
	text "Here for a"
	line "rematch?"

	para "Let's see if you"
	line "can reclaim your"
	cont "title!"
	done

LancesRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 23, KARENS_ROOM, 3
	warp_event  5, 23, KARENS_ROOM, 4
	warp_event  4,  1, HALL_OF_FAME, 1
	warp_event  5,  1, HALL_OF_FAME, 2

	db 2 ; coord events
	coord_event  4,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromLeft
	coord_event  5,  5, SCENE_LANCESROOM_APPROACH_LANCE, Script_ApproachLanceFromRight

	db 0 ; bg events

	db 6 ; object events
	object_event  5,  3, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LancesRoomLanceScript, EVENT_CHAMPION_RIVAL
	object_event  5,  7, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LancesRoomLanceScript, EVENT_CHALLENGER_RIVAL
	object_event  5,  3, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CHAMPION_OAK
	object_event  5,  7, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CHALLENGER_OAK
	object_event  5,  3, SPRITE_CYNTHIA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CHAMPION_CYNTHIA
	object_event  5,  7, SPRITE_CYNTHIA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CHALLENGER_CYNTHIA
