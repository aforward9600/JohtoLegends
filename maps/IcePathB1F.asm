	object_const_def ; object_event constants
	const ICEPATHB1F_ROCK1
	const ICEPATHB1F_ROCK2
	const ICEPATHB1F_ROCK3
	const ICEPATHB1F_ROCK4
	const ICEPATHB1F_POKE_BALL1
	const ICEPATHB1F_POKE_BALL2
	const ICEPATHB1F_POKE_BALL3
	const ICEPATHB1F_YOUNGSTER
	const ICEPATHB1F_LASS
	const ICEPATHB1F_KRIS ; if Male
	const ICEPATHB1F_CHRIS ; if Female

IcePathB1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene1 ; SCENE_DEFAULT
	scene_script .DummyScene2 ; SCENE_ICE_PATH_B1F_RIVAL

	db 0 ; callbacks

.DummyScene1:
	end

.DummyScene2:
	end

IcePath1FRivalScene1:
	turnobject PLAYER, RIGHT
	special FadeOutMusic
	pause 5
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .IcePath1FRivalScene2
	applymovement ICEPATHB1F_KRIS, IcePath_RivalWalksToYou1
	sjump RestOfRival

.IcePath1FRivalScene2:
	applymovement ICEPATHB1F_CHRIS, IcePath_RivalWalksToYou1
	sjump RestOfRival

RestOfRival:
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext IcePath1FRivalText_Seen
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar
	winlosstext RivalIcePathWinText, RivalIcePathLossText
	setlasttalked ICEPATHB1F_KRIS
	loadtrainer RIVAL3, RIVAL3_A_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious

.Larvitar:
	winlosstext RivalIcePathWinText, RivalIcePathLossText
	setlasttalked ICEPATHB1F_KRIS
	loadtrainer RIVAL3, RIVAL3_A_DRATINI
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious

.AfterVictorious:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext IcePathRivalText_YouWon
	waitbutton
	closetext
	applymovement ICEPATHB1F_KRIS, IcePath_RivalLeaves
	playsound SFX_EXIT_BUILDING
	disappear ICEPATHB1F_KRIS
	setevent EVENT_ICE_PATH_B1F_RIVAL1
	setevent EVENT_RIVAL_AT_LAKE_OF_RAGE_1
	setevent EVENT_RIVAL_AT_LAKE_OF_RAGE_2
	setevent EVENT_LAKE_OF_RAGE_MIYAMOTO
	setevent EVENT_MOUNT_MORTAR_HIKER_1
	setscene SCENE_DEFAULT
	waitsfx
	playmapmusic
	end

.Female:
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar2
	winlosstext RivalIcePathWinText, RivalIcePathLossText
	setlasttalked ICEPATHB1F_CHRIS
	loadtrainer RIVAL4, RIVAL4_A_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious2

.Larvitar2:
	winlosstext RivalIcePathWinText, RivalIcePathLossText
	setlasttalked ICEPATHB1F_CHRIS
	loadtrainer RIVAL4, RIVAL4_A_DRATINI
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious2

.AfterVictorious2:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext IcePathRivalText_YouWon
	waitbutton
	closetext
	applymovement ICEPATHB1F_CHRIS, IcePath_RivalLeaves
	playsound SFX_EXIT_BUILDING
	disappear ICEPATHB1F_CHRIS
	setevent EVENT_ICE_PATH_B1F_RIVAL2
	setevent EVENT_RIVAL_AT_LAKE_OF_RAGE_1
	setevent EVENT_RIVAL_AT_LAKE_OF_RAGE_2
	setevent EVENT_LAKE_OF_RAGE_MIYAMOTO
	setevent EVENT_MOUNT_MORTAR_HIKER_1
	setscene SCENE_DEFAULT
	waitsfx
	playmapmusic
	end

IcePathB1FRock:
	jumpstd smashrock

IcePathB1FPotion:
	itemball POTION

IcePathB1FRazorClaw:
	itemball RAZOR_CLAW

IcePathB1FAntidote:
	itemball ANTIDOTE

TrainerYoungsterTimmy:
	trainer YOUNGSTER, TIMMY, EVENT_BEAT_YOUNGSTER_TIMMY, YoungsterTimmySeenText, YoungsterTimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterTimmyAfterText
	waitbutton
	closetext
	end

TrainerLassArielle:
	trainer LASS, ARIELLE, EVENT_BEAT_LASS_ARIELLE, LassArielleSeenText, LassArielleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassArielleAfterText
	waitbutton
	closetext
	end

IcePathB1FHiddenMaxPotion:
	hiddenitem RARE_CANDY, EVENT_ICE_PATH_B1F_HIDDEN_MAX_POTION

IcePath_RivalWalksToYou1:
	step LEFT
	step_end

IcePath_RivalLeaves:
	step RIGHT
	step DOWN
	step_end

IcePath1FRivalText_Seen:
	text "Hey <PLAYER>!"

	para "Have you been"
	line "catching any new"
	cont "#mon?"

	para "I've caught one"
	line "already. Wanna"
	cont "see?"
	done

RivalIcePathWinText:
	text "Wow, you're pretty"
	line "strong! Stronger"
	cont "than I thought!"
	done

RivalIcePathLossText:
	text "Wow, I won!"
	line "Sweet!"
	done

IcePathRivalText_YouWon:
	text "It looks like I"
	line "need to work on"
	cont "my team some"
	cont "more."

	para "Let's battle again"
	line "sometime! Later!"
	done

YoungsterTimmySeenText:
	text "W-w-w-wow!"
	line "It-t-t-t's"
	cont "f-f-f-reezing!"
	done

YoungsterTimmyBeatenText:
	text "C-c-c-cold!"
	done

YoungsterTimmyAfterText:
	text "I t-t-think m-my"
	line "f-f-feet are f-f-"
	cont "frozen in place!"
	done

LassArielleSeenText:
	text "Aren't you a sight"
	line "for sore eyes!"
	done

LassArielleBeatenText:
	text "That wasn't a"
	line "sight I wanted to"
	cont "see!"
	done

LassArielleAfterText:
	text "Alright, out of"
	line "my sight! I"
	cont "wasn't expecting"

	para "to lose like that!"
	done

IcePathB1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3, 15, ICE_PATH_1F, 3
	warp_event 17,  3, ICE_PATH_B2F_MAHOGANY_SIDE, 1
	warp_event  5, 25, ICE_PATH_1F, 4
	warp_event 11, 27, ICE_PATH_B2F_BLACKTHORN_SIDE, 1
	warp_event  2,  1, ICE_PATH_B2F_BLACKTHORN_SIDE, 3

	db 1 ; coord events
	coord_event  1, 14, SCENE_ICE_PATH_B1F_RIVAL, IcePath1FRivalScene1

	db 1 ; bg events
	bg_event 16, 33, BGEVENT_ITEM, IcePathB1FHiddenMaxPotion

	db 11 ; object events
	object_event 10,  1, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FRock, -1
	object_event 17, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FRock, -1
	object_event  5,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FRock, -1
	object_event  6, 13, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FRock, -1
	object_event  5, 35, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB1FPotion, EVENT_ICE_PATH_B1F_POTION
	object_event  3, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL,0, IcePathB1FRazorClaw, EVENT_ICE_PATH_B1F_RAZOR_CLAW
	object_event 16,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL,0, IcePathB1FAntidote, EVENT_ICE_PATH_B1F_ANTIDOTE
	object_event 14, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerYoungsterTimmy, -1
	object_event  4,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassArielle, -1
	object_event  3, 14, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ICE_PATH_B1F_RIVAL1
	object_event  3, 14, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ICE_PATH_B1F_RIVAL2
