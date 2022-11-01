	object_const_def ; object_event constants
	const PLAYERSHOUSE1F_GRANNY1
	const PLAYERSHOUSE1F_GRANNY2
	const PLAYERSHOUSE1F_GRANNY3
	const PLAYERSHOUSE1F_GRANNY4
	const PLAYERSHOUSE1F_POKEFAN_F

PlayersHouse1F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_GRANDMA_GIVES_YOU_WATCH
	scene_script .DummyScene1 ; SCENE_GRANDMA_TELLS_YOU_ABOUT_OAK
	scene_script .DummyScene2 ; SCENE_PLAYERS_HOUSE_NOTHING

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

MeetMomLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetMomRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_GRANNY1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_GRANNY1, MomTurnsTowardPlayerMovement
	sjump MeetMomScript

.OnRight:
	applymovement PLAYERSHOUSE1F_GRANNY1, MomWalksToPlayerMovement
MeetMomScript:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GrannyGirl
	opentext
	writetext WhatWasHerNameText
	buttonsound
	special NameRival
	writetext DahliasLookingForYouText
	buttonsound
	waitsfx
	writetext GotWatchText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEGEAR
	setflag ENGINE_MAP_CARD
	setscene SCENE_PLAYERS_HOUSE_NOTHING
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	buttonsound
	special SetDayOfWeek
.SetDayOfWeek:
	writetext IsItDSTText
	yesorno
	iffalse .WrongDay
	special InitialSetDSTFlag
	yesorno
	iffalse .SetDayOfWeek
	sjump .DayOfWeekDone

.GrannyGirl:
	opentext
	writetext WhatWasHisNameText
	buttonsound
	special NameRivalFemale
	writetext DracosLookingForYouText
	buttonsound
	waitsfx
	writetext GotWatchText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEGEAR
	setflag ENGINE_MAP_CARD
	setscene SCENE_PLAYERS_HOUSE_NOTHING
	variablesprite SPRITE_RIVAL, SPRITE_CHRIS
	setevent EVENT_PLAYERS_HOUSE_MOM_1
	setevent EVENT_RIVAL_AT_MASTERS_HOUSE_1
	clearevent EVENT_PLAYERS_HOUSE_MOM_2
	writetext MomGivesPokegearText
	buttonsound
	special SetDayOfWeek
	sjump .SetDayOfWeek

.WrongDay:
	special InitialClearDSTFlag
	yesorno
	iffalse .SetDayOfWeek
.DayOfWeekDone:
	writetext ComeHomeForDSTText
	waitbutton
	closetext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft
	sjump .Finish

.FromRight:
	applymovement PLAYERSHOUSE1F_GRANNY1, MomTurnsBackMovement
	sjump .Finish

.FromLeft:
	applymovement PLAYERSHOUSE1F_GRANNY1, MomWalksBackMovement
	sjump .Finish

.Finish:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_GRANNY1, LEFT
	end

MeetMomTalkedScript:
	playmusic MUSIC_MOM
	sjump MeetMomScript

MeetGrandmaTalkedScript:
	playmusic MUSIC_MOM
	sjump MeetGrandmaScript

GearName:
	db "#Gear@"

PlayersHouse1FReceiveItemStd:
	jumpstd receiveitem
	end

MomScript:
	faceplayer
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	checkscene SCENE_PLAYERS_HOUSE_NOTHING
	iftrue .GrannySpeaks
	checkscene SCENE_GRANDMA_GIVES_YOU_WATCH
	iftrue MeetMomTalkedScript ; SCENE_DEFAULT
	checkscene SCENE_GRANDMA_TELLS_YOU_ABOUT_OAK
	iftrue MeetGrandmaTalkedScript
.GrannySpeaks
	opentext
	checkevent EVENT_FIRST_TIME_BANKING_WITH_MOM
	iftrue .FirstTimeBanking
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .BankOfMom
	checkevent EVENT_MASTERS_RIVAL_DONE
	iftrue .GaveMysteryEgg
	checkevent EVENT_GOT_A_POKEMON_FROM_MASTER
	iftrue .GotAPokemon
	writetext HurryUpElmIsWaitingText
	waitbutton
	closetext
	end

.GotAPokemon:
	writetext SoWhatWasProfElmsErrandText
	waitbutton
	closetext
	end

.FirstTimeBanking:
	writetext ImBehindYouText
	waitbutton
	closetext
	end

.GaveMysteryEgg:
	setevent EVENT_FIRST_TIME_BANKING_WITH_MOM
.BankOfMom:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	writetext OhWaitText
	buttonsound
	waitsfx
	writetext GotJournalText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext GrandmaJournalText
	waitbutton
	closetext
	setevent EVENT_GOT_JOURNAL
	setevent EVENT_BLACKTHORN_HIKER
	setevent EVENT_BLACKTHORN_BLACK_BELT
	setmapscene BLACKTHORN_CITY, SCENE_BLACKTHORN_CITY_NOTHING
	setmapscene ICE_PATH_B1F, SCENE_ICE_PATH_B1F_RIVAL
	end

MeetGrandmaLeftScript:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1

MeetGrandmaRightScript:
	playmusic MUSIC_MOM
	showemote EMOTE_SHOCK, PLAYERSHOUSE1F_GRANNY1, 15
	turnobject PLAYER, LEFT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .OnRight
	applymovement PLAYERSHOUSE1F_GRANNY1, MomTurnsTowardPlayerMovement
	sjump MeetGrandmaScript

.OnRight:
	applymovement PLAYERSHOUSE1F_GRANNY1, MomWalksToPlayerMovement
MeetGrandmaScript:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .DracoCameBy
	opentext
	writetext DahliaCameByText
	waitbutton
	closetext
.ReconvergeGranny:
	clearevent EVENT_VICTORY_ROAD_GATE_OAK
	clearevent EVENT_VICTORY_ROAD_GATE_RIVAL
	setevent EVENT_VICTORY_ROAD_GATE_GUARD
	setmapscene VICTORY_ROAD_GATE, SCENE_VICTORY_ROAD_GATE_OAK
	setscene SCENE_PLAYERS_HOUSE_NOTHING
	setevent EVENT_GOT_RIVALS_MESSAGE
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .FromRight2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iffalse .FromLeft2
	sjump .Finish2

.FromRight2:
	applymovement PLAYERSHOUSE1F_GRANNY1, MomTurnsBackMovement
	sjump .Finish2

.FromLeft2:
	applymovement PLAYERSHOUSE1F_GRANNY1, MomWalksBackMovement
	sjump .Finish2

.Finish2:
	special RestartMapMusic
	turnobject PLAYERSHOUSE1F_GRANNY1, LEFT
	end

.DracoCameBy:
	opentext
	writetext DracoCameByText
	waitbutton
	closetext
	sjump .ReconvergeGranny

NeighborScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .CongratulationsOnBeingChampion
	checktime MORN
	iftrue .MornScript
	checktime DAY
	iftrue .DayScript
	checktime NITE
	iftrue .NiteScript

.MornScript:
	writetext NeighborMornIntroText
	buttonsound
	sjump .Main

.DayScript:
	writetext NeighborDayIntroText
	buttonsound
	sjump .Main

.NiteScript:
	writetext NeighborNiteIntroText
	buttonsound
	sjump .Main

.Main:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Main2
	writetext NeighborText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

.Main2:
	writetext NeighborText2
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

.CongratulationsOnBeingChampion:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .CongratsFemale
	writetext CongratulationsOnBeingChampionText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

.CongratsFemale:
	writetext CongratsFemaleText
	waitbutton
	closetext
	turnobject PLAYERSHOUSE1F_POKEFAN_F, RIGHT
	end

TVScript:
	jumptext TVText

StoveScript:
	jumptext StoveText

SinkScript:
	jumptext SinkText

FridgeScript:
	jumptext FridgeText

MomTurnsTowardPlayerMovement:
	turn_head RIGHT
	step_end

MomWalksToPlayerMovement:
	slow_step RIGHT
	step_end

MomTurnsBackMovement:
	turn_head LEFT
	step_end

MomWalksBackMovement:
	slow_step LEFT
	step_end

WhatWasHerNameText:
	text "You're finally"
	line "awake, <PLAYER>!"

	para "Your friend, oh,"
	line "what was her"
	cont "name…?"
	done

DahliasLookingForYouText:
	text "Ah, <RIVAL>! She"
	line "came by looking"
	cont "for you. This is"

	para "a big day for you"
	line "two, so get going."

	para "You don't want to"
	line "keep her and the"
	cont "Master waiting, do"

	para "you? I wish your"
	line "parents were here"
	cont "to see this."

	para "They would be so"
	line "proud of you,"
	cont "starting on a"

	para "journey with a"
	line "#mon, just as"
	cont "they did…"

	para "Sorry, I was lost"
	line "in a memory. You"
	cont "better get going."

	para "Here is a watch."
	line "It will help you"
	cont "keep track of time"
	cont "and location."
	done

MomGivesPokegearText:
	text "Oh, the day of the"
	line "week isn't set."

	para "You mustn't forget"
	line "that!"
	done

IsItDSTText:
	text "Is it Daylight"
	line "Saving Time now?"
	done

ComeHomeForDSTText:
	text "Come home to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time."

	para "By the way, for"
	line "the watch, press"
	cont "Left or Right to"
	cont "switch between the"
	cont "clock and map."

	para "See? Even I can"
	line "understand it."
	done

WhatWasHisNameText:
	text "You're finally"
	line "awake, <PLAYER>!"

	para "Your friend, oh,"
	line "what was his"
	cont "name…?"
	done

DracosLookingForYouText:
	text "Ah, <RIVAL>! He"
	line "came by looking"
	cont "for you. This is"

	para "a big day for you"
	line "two, so get going."

	para "You don't want to"
	line "keep him and the"
	cont "Master waiting, do"

	para "you? I wish your"
	line "parents were here"
	cont "to see this."

	para "They would be so"
	line "proud of you,"
	cont "starting on a"

	para "journey with a"
	line "#mon, just as"
	cont "they did…"

	para "Sorry, I was lost"
	line "in a memory. You"
	cont "better get going."

	para "Here is a watch."
	line "It will help you"
	cont "keep track of time"
	cont "and location."
	done

HurryUpElmIsWaitingText:
	text "The Master is wai-"
	line "ting for you."

	para "Don't keep him for"
	line "long!"
	done

SoWhatWasProfElmsErrandText:
	text "Ah, so that's your"
	line "#mon."

	para "…"

	para "How cute."
	done

ImBehindYouText:
	text "<PLAYER>, do it!"

	para "I'm behind you all"
	line "the way!"
	done

NeighborMornIntroText:
	text "Good morning,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborDayIntroText:
	text "Hello, <PLAY_G>!"
	line "I'm visiting!"
	done

NeighborNiteIntroText:
	text "Good evening,"
	line "<PLAY_G>!"

	para "I'm visiting!"
	done

NeighborText:
	text "It's hard to"
	line "believe that my"

	para "baby is going on a"
	line "journey, as are"
	cont "you."

	para "Keep a close eye"
	line "on her for me,"
	cont "would you?"
	done

NeighborText2:
	text "It's hard to"
	line "believe that my"

	para "baby is going on a"
	line "journey, as are"
	cont "you."

	para "Keep a close eye"
	line "on him for me,"
	cont "would you?"
	done

StoveText:
	text "Granny's specialty!"

	para "Shelmet Escargot!"
	done

SinkText:
	text "The sink is spot-"
	line "less. Granny likes"
	cont "it clean."
	done

FridgeText:
	text "Let's see what's"
	line "in the fridge…"

	para "Fresh Water and"
	line "tasty Lemonade!"
	done

TVText:
	text "There's a movie on"
	line "TV: Stars dot the"

	para "sky as two boys"
	line "ride on a train…"

	para "I'd better get"
	line "rolling too!"
	done

OhWaitText:
	text "So, you've got"
	line "your #mon and"
	cont "you're leaving on"
	cont "an adventure…"

	para "Good luck to you,"
	line "and you're always"
	cont "welcome back."

	para "…Oh, wait!"

	para "I almost forgot!"
	line "Here, have your"
	cont "father's journal."

	para "He was going to"
	line "use it to record"
	cont "information on all"

	para "the #mon he"
	line "found, but then he"
	cont "met your mother,"

	para "and he got a bit"
	line "distracted, hoho!"

	para "I'm certain he'd"
	line "want you to have"
	cont "it."
	done

GotJournalText:
	text "<PLAYER> received"
	line "the Journal!"
	done

GotWatchText:
	text "<PLAYER> received"
	line "the Watch!"
	done

GrandmaJournalText:
	text "Well, that's"
	line "everything, then."
	cont "Good luck, and"

	para "don't forget, I'm"
	line "always here for"
	cont "you."
	done

DahliaCameByText:
	text "Ah, there you are,"
	line "<PLAYER>!"

	para "Congratulations on"
	line "becoming Champion!"

	para "I'm certain your"
	line "parents would be"
	cont "proud!"

	para "Oh, by the way…"

	para "<RIVAL> came by."

	para "She said to meet"
	line "her at the gate"
	cont "to Victory Road."

	para "I don't know what"
	line "she wants, but"
	cont "you better not"
	cont "keep her waiting!"
	done

DracoCameByText:
	text "Ah, there you are,"
	line "<PLAYER>!"

	para "Congratulations on"
	line "becoming Champion!"

	para "I'm certain your"
	line "parents would be"
	cont "proud!"

	para "Oh, by the way…"

	para "<RIVAL> came by."

	para "He said to meet"
	line "him at the gate"
	cont "to Victory Road."

	para "I don't know what"
	line "he wants, but"
	cont "you better not"
	cont "keep him waiting!"
	done

CongratulationsOnBeingChampionText:
	text "<PLAYER>!"

	para "Congratulations on"
	line "becoming champion!"

	para "I'm proud of you,"
	line "and <RIVAL> as"
	cont "well!"

	para "She's taking the"
	line "loss better than"
	cont "I thought she"
	cont "would."

	para "She certainly"
	line "doesn't get her"
	cont "humility from"
	cont "her father!"

	para "Hohoho!"
	done

CongratsFemaleText:
	text "<PLAYER>!"

	para "Congratulations on"
	line "becoming champion!"

	para "I'm proud of you,"
	line "and <RIVAL> as"
	cont "well!"

	para "He's taking the"
	line "loss better than"
	cont "I thought he"
	cont "would."

	para "He certainly"
	line "doesn't get his"
	cont "humility from"
	cont "her father!"

	para "Hohoho!"
	done

PlayersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  7, BLACKTHORN_CITY, 9
	warp_event  7,  7, BLACKTHORN_CITY, 9
	warp_event  9,  0, PLAYERS_HOUSE_2F, 1

	db 4 ; coord events
	coord_event  8,  4, SCENE_GRANDMA_GIVES_YOU_WATCH, MeetMomLeftScript
	coord_event  9,  4, SCENE_GRANDMA_GIVES_YOU_WATCH, MeetMomRightScript
	coord_event  8,  4, SCENE_GRANDMA_TELLS_YOU_ABOUT_OAK, MeetGrandmaLeftScript
	coord_event  9,  4, SCENE_GRANDMA_TELLS_YOU_ABOUT_OAK, MeetGrandmaRightScript

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, StoveScript
	bg_event  1,  1, BGEVENT_READ, SinkScript
	bg_event  2,  1, BGEVENT_READ, FridgeScript
	bg_event  4,  1, BGEVENT_READ, TVScript

	db 6 ; object events
	object_event  7,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_1
	object_event  2,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  7,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, NITE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  0,  2, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, EVE, 0, OBJECTTYPE_SCRIPT, 0, MomScript, EVENT_PLAYERS_HOUSE_MOM_2
	object_event  4,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NeighborScript, EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
