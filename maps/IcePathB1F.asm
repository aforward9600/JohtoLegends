	object_const_def ; object_event constants
	const ICEPATHB1F_ROCK1
	const ICEPATHB1F_ROCK2
	const ICEPATHB1F_ROCK3
	const ICEPATHB1F_POKE_BALL1
	const ICEPATHB1F_POKE_BALL2
	const ICEPATHB1F_POKE_BALL3
	const ICEPATHB1F_YOUNGSTER
	const ICEPATHB1F_SKIER
	const ICEPATHB1F_RIVAL
	const ICEPATHB1F_BOARDER

IcePathB1F_MapScripts:
	db 2 ; scene scripts
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
	applymovement ICEPATHB1F_RIVAL, IcePath_RivalWalksToYou1
	playmusic MUSIC_DAHLIA_ENCOUNTER
	sjump RestOfRival

.IcePath1FRivalScene2:
	applymovement ICEPATHB1F_RIVAL, IcePath_RivalWalksToYou1
	playmusic MUSIC_RIVAL_ENCOUNTER
	sjump RestOfRival

RestOfRival:
	opentext
	writetext IcePath1FRivalText_Seen
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar
	winlosstext RivalIcePathWinText, RivalIcePathLossText
	setlasttalked ICEPATHB1F_RIVAL
	loadtrainer RIVAL3, RIVAL3_A_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious

.Larvitar:
	winlosstext RivalIcePathWinText, RivalIcePathLossText
	setlasttalked ICEPATHB1F_RIVAL
	loadtrainer RIVAL3, RIVAL3_A_DRATINI
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious

.AfterVictorious:
	playmusic MUSIC_DAHLIA_AFTER_BATTLE
	opentext
	writetext IcePathRivalText_YouWon
	waitbutton
	closetext
	applymovement ICEPATHB1F_RIVAL, IcePath_RivalLeaves
	playsound SFX_EXIT_BUILDING
	disappear ICEPATHB1F_RIVAL
	setevent EVENT_ICE_PATH_B1F_RIVAL1
	setscene SCENE_DEFAULT
	waitsfx
	playmapmusic
	end

.Female:
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar2
	winlosstext RivalIcePathWinText, RivalIcePathLossText
	setlasttalked ICEPATHB1F_RIVAL
	loadtrainer RIVAL4, RIVAL4_A_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious2

.Larvitar2:
	winlosstext RivalIcePathWinText, RivalIcePathLossText
	setlasttalked ICEPATHB1F_RIVAL
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
	applymovement ICEPATHB1F_RIVAL, IcePath_RivalLeaves
	playsound SFX_EXIT_BUILDING
	disappear ICEPATHB1F_RIVAL
	setevent EVENT_ICE_PATH_B1F_RIVAL1
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
	itemball ICE_STONE

IcePathB1FWaterfall:
	itemball TM_WATERFALL

TrainerYoungsterTimmy:
	trainer YOUNGSTER, TIMMY, EVENT_BEAT_YOUNGSTER_TIMMY, YoungsterTimmySeenText, YoungsterTimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterTimmyAfterText
	waitbutton
	closetext
	end

TrainerSkierLupita:
	trainer SKIER, LUPITA, EVENT_BEAT_SKIER_LUPITA, SkierLupitaSeenText, SkierLupitaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierLupitaAfterText
	waitbutton
	closetext
	end

TrainerBoarderGareth:
	trainer BOARDER, GARETH, EVENT_BEAT_BOARDER_GARETH, BoarderGarethSeenText, BoarderGarethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderGarethAfterText
	waitbutton
	closetext
	end

TrainerBoarderBrody:
	trainer BOARDER, BRODY, EVENT_BEAT_BOARDER_BRODY, BoarderBrodySeenText, BoarderBrodyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBrodyAfterText
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
	text "We're already on"
	line "the ropes!"
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

SkierLupitaSeenText:
	text "Aren't you a sight"
	line "for sore eyes!"
	done

SkierLupitaBeatenText:
	text "That wasn't a"
	line "sight I wanted to"
	cont "see!"
	done

SkierLupitaAfterText:
	text "Alright, out of"
	line "my sight! I"
	cont "wasn't expecting"

	para "to lose like that!"
	done

BoarderGarethSeenText:
	text "Hey, hey, hey!"

	para "Let's battle!"
	done

BoarderGarethBeatenText:
	text "Hey, hey, hey!"

	para "I lost!"
	done

BoarderGarethAfterText:
	text "I keep saying that"
	line "ever since I saw"
	cont "someone on TV say"
	cont "it."
	done

BoarderBrodySeenText:
	text "The cold of this"
	line "cave is great for"
	cont "training!"

	para "It really builds"
	line "resistance!"
	done

BoarderBrodyBeatenText:
	text "My #mon didn't"
	line "have enough"
	cont "resistance..."
	done

BoarderBrodyAfterText:
	text "My Ice-types love"
	line "the cold, but I"
	cont "can't stand it."

	para "There's no way I'm"
	line "going to be build-"
	cont "ing resistance for"
	cont "myself!"
	done

IcePathB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3, 15, ICE_PATH_1F, 3
	warp_event  5, 25, ICE_PATH_1F, 4
	warp_event 11, 27, ICE_PATH_B2F_BLACKTHORN_SIDE, 1
	warp_event  2,  1, ICE_PATH_B2F_BLACKTHORN_SIDE, 2

	db 1 ; coord events
	coord_event  1, 14, SCENE_ICE_PATH_B1F_RIVAL, IcePath1FRivalScene1

	db 1 ; bg events
	bg_event 16, 33, BGEVENT_ITEM, IcePathB1FHiddenMaxPotion

	db 11 ; object events
	object_event 10,  1, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FRock, -1
	object_event 16, 12, SPRITE_BOARDER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBoarderGareth, -1
	object_event  5,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FRock, -1
	object_event  5, 35, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB1FPotion, EVENT_ICE_PATH_B1F_POTION
	object_event  3, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL,0, IcePathB1FRazorClaw, EVENT_ICE_PATH_B1F_RAZOR_CLAW
	object_event 16,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL,0, IcePathB1FAntidote, EVENT_ICE_PATH_B1F_ANTIDOTE
	object_event 14, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerYoungsterTimmy, -1
	object_event  7, 11, SPRITE_SKIER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerSkierLupita, -1
	object_event  3, 14, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ICE_PATH_B1F_RIVAL1
	object_event 17,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, IcePathB1FWaterfall, EVENT_GOT_TM_WATERFALL
	object_event 17,  1, SPRITE_BOARDER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrody, -1
