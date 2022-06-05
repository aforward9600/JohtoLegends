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
	end

Script_ApproachLanceFromLeft:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromLeft
	sjump LancesRoomLanceScript

Script_ApproachLanceFromRight:
	special FadeOutMusic
	applymovement PLAYER, MovementData_ApproachLanceFromRight
LancesRoomLanceScript:
	turnobject LANCESROOM_RIVAL, LEFT
	opentext
	writetext LooksLikeImTheChampionText
	waitbutton
	closetext
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .DahliaDragoniteBattle
	winlosstext ChampionWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL
	loadtrainer CHAMPION_DAHLIA, CHAMP_DAHLIA_1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	sjump .AfterChampionBattle

.DahliaDragoniteBattle
	winlosstext ChampionWinText, ChampionLoseText
	setlasttalked LANCESROOM_RIVAL
	loadtrainer CHAMPION_DAHLIA, CHAMP_DAHLIA_2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_CHAMPION_LANCE
	sjump .AfterChampionBattle

.AfterChampionBattle
	opentext
	writetext ChampionBattleAfterText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock 4, 0, $0b ; open door
	reloadmappart
	closetext
	setevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	musicfadeout MUSIC_BEAUTY_ENCOUNTER, 16
	pause 30
	showemote EMOTE_SHOCK, LANCESROOM_RIVAL, 15
	turnobject LANCESROOM_RIVAL, DOWN
	pause 10
	turnobject PLAYER, DOWN
	moveobject LANCESROOM_OAK2, 4, 7
	appear LANCESROOM_OAK2
	applymovement LANCESROOM_OAK2, LancesRoomMovementData_OakCongratulatesYou
	opentext
	writetext OakCongratulatesYouText
	waitbutton
	closetext
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
	end

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
	text "…It's over."

	para "But it's an odd"
	line "feeling."

	para "I'm not angry that"
	line "I lost. In fact, I"
	cont "feel happy."

	para "Happy that I"
	line "I saw my best"
	cont "friend become the"

	para "new Champion!"
	done

ChampionLoseText:
	text "…Looks like I'm"
	line "the strongest"
	cont "trainer after all…"
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

UnknownText_0x1813c5:
	text "MARY: Oh, wait!"
	line "We haven't done"
	cont "the interview!"
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
