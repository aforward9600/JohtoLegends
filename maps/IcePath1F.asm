	object_const_def ; object_event constants
	const ICEPATH1F_POKE_BALL1
	const ICEPATH1F_POKE_BALL2
	const ICEPATH1F_POKE_BALL3
	const ICEPATH1F_KRIS ; if male
	const ICEPATH1F_YOUNGSTER
	const ICEPATH1F_TWIN
	const ICEPATH1F_CHRIS ; if female
	const ICEPATH1F_LASS

IcePath1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene1 ; SCENE_DEFAULT
	scene_script .DummyScene2 ; SCENE_ICE_PATH_1F_RIVAL

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Rival

.DummyScene1:
	end

.DummyScene2:
	end

.Rival:
	disappear ICEPATH1F_KRIS
	disappear ICEPATH1F_CHRIS
	return

IcePath1FRivalScene1:
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .IcePath1FRivalScene2
	appear ICEPATH1F_KRIS
	applymovement ICEPATH1F_KRIS, IcePath_RivalWalksToYou1
	sjump RestOfRival

.IcePath1FRivalScene2:
	appear ICEPATH1F_CHRIS
	applymovement ICEPATH1F_CHRIS, IcePath_RivalWalksToYou1
	sjump RestOfRival

RestOfRival:
	turnobject PLAYER, RIGHT
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
	setlasttalked ICEPATH1F_KRIS
	loadtrainer RIVAL3, RIVAL3_A_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious

.Larvitar:
	winlosstext RivalIcePathWinText, RivalIcePathLossText
	setlasttalked ICEPATH1F_KRIS
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
	applymovement ICEPATH1F_KRIS, IcePath_RivalLeaves
	playsound SFX_EXIT_BUILDING
	disappear ICEPATH1F_KRIS
	setevent EVENT_ICE_PATH_1F_RIVAL1
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
	setlasttalked ICEPATH1F_CHRIS
	loadtrainer RIVAL4, RIVAL4_A_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious2

.Larvitar2:
	winlosstext RivalIcePathWinText, RivalIcePathLossText
	setlasttalked ICEPATH1F_CHRIS
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
	applymovement ICEPATH1F_CHRIS, IcePath_RivalLeaves
	playsound SFX_EXIT_BUILDING
	disappear ICEPATH1F_CHRIS
	setevent EVENT_ICE_PATH_1F_RIVAL2
	setevent EVENT_RIVAL_AT_LAKE_OF_RAGE_1
	setevent EVENT_RIVAL_AT_LAKE_OF_RAGE_2
	setevent EVENT_LAKE_OF_RAGE_MIYAMOTO
	setevent EVENT_MOUNT_MORTAR_HIKER_1
	setscene SCENE_DEFAULT
	waitsfx
	playmapmusic
	end

IcePath1FTMHail:
	itemball TM_HAIL

IcePath1FPotion:
	itemball POTION

IcePath1FPokeBall:
	itemball POKE_BALL

IcePath1FBrotherScript:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .BrotherFemale
	jumptextfaceplayer IcePath1FBrotherText1

.BrotherFemale:
	jumptextfaceplayer IcePath1FBrotherText2

IcePath1FSisterScript:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .SisterFemale
	jumptextfaceplayer IcePath1FSisterText1

.SisterFemale:
	jumptextfaceplayer IcePath1FSisterText2

TrainerPicnickerHaylee:
	trainer PICNICKER, HAYLEE, EVENT_BEAT_PICNICKER_HAYLEE, PicnickerHayleeSeenText, PicnickerHayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHayleeAfterText
	waitbutton
	closetext
	end

IcePath_RivalWalksToYou1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end

IcePath_RivalLeaves:
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
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

IcePath1FBrotherText1:
	text "My sister was"
	line "looking for a"
	cont "Smoochum, but she"
	cont "almost gave up."

	para "Some teenage girl"
	line "felt bad and gave"
	cont "her one."

	para "I'm forever in her"
	line "debt. Now we can"
	cont "get out of here"
	cont "before I freeze."
	done

IcePath1FBrotherText2:
	text "My sister was"
	line "looking for a"
	cont "Smoochum, but she"
	cont "almost gave up."

	para "Some teenage boy"
	line "felt bad and gave"
	cont "her one."

	para "I'm forever in his"
	line "debt. Now we can"
	cont "get out of here"
	cont "before I freeze."
	done

IcePath1FSisterText1:
	text "Yay! Smoochum,"
	line "Smoochum,"
	cont "Smoochum!"

	para "I want to thank"
	line "her again!"
	done

IcePath1FSisterText2:
	text "Yay! Smoochum,"
	line "Smoochum,"
	cont "Smoochum!"

	para "I want to thank"
	line "him again!"
	done

PicnickerHayleeSeenText:
	text "Over there is the"
	line "exit to Route 44."

	para "How about a battle"
	line "to celebrate"
	cont "leaving this"
	cont "frigid cavern?"
	done

PicnickerHayleeBeatenText:
	text "You certainly"
	line "celebrated!"
	done

PicnickerHayleeAfterText:
	text "After Route 44 is"
	line "Mahogany Town."

	para "The Gym Leader"
	line "there is not very"
	cont "easy for Dragon"
	cont "trainers."
	done

IcePath1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4, 19, ROUTE_44, 1
	warp_event 36, 27, BLACKTHORN_CITY, 7
	warp_event 37,  5, ICE_PATH_B1F, 1
	warp_event 37, 13, ICE_PATH_B1F, 3

	db 1 ; coord events
	coord_event 33, 14, SCENE_ICE_PATH_1F_RIVAL, IcePath1FRivalScene1

	db 0 ; bg events

	db 8 ; object events
	object_event 31,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FTMHail, EVENT_GOT_TM07_HAIL
	object_event 32, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FPotion, EVENT_ICE_PATH_1F_PP_UP
	object_event 33,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePath1FPokeBall, EVENT_ICE_PATH_1F_POKE_BALL
	object_event 35,  9, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ICE_PATH_1F_RIVAL1
	object_event 17,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePath1FBrotherScript, -1
	object_event 18,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePath1FSisterScript, -1
	object_event 35,  9, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ICE_PATH_1F_RIVAL2
	object_event 11, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerHaylee, -1
