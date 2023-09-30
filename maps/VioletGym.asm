	object_const_def ; object_event constants
	const VIOLETGYM_WALKER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUY
	const VIOLETGYM_YOUNGSTER3
	const VIOLETGYM_RIVAL

VioletGym_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .WalkerFridayGym

.DummyScene0:
	end

.DummyScene1:
	end

.WalkerFridayGym:
	checkevent EVENT_BEAT_WALKER
	iftrue .IsItFridayGym
	appear VIOLETGYM_WALKER
	return

.IsItFridayGym:
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .WalkerDisappears
	appear VIOLETGYM_WALKER
	return

.WalkerDisappears:
	disappear VIOLETGYM_WALKER
	return

VioletGymWalkerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WALKER
	iftrue .FightDone
	writetext WalkerIntroText
	waitbutton
	closetext
	winlosstext WalkerWinLossText, WalkerLossText
	loadtrainer WALKER, WALKER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WALKER
	setevent EVENT_DECO_SQUIRTLE_DOLL
	opentext
	writetext BeatenWalkerText
	waitbutton
	closetext
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	loadmem wLevelCap, 55
	setflag ENGINE_BEAT_WALKER
.FightDone:
	checkflag ENGINE_BEAT_WALKER
	iffalse .WalkerRematch
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_RODNEY
	setevent EVENT_BEAT_BIRD_KEEPER_ABEL
	setevent EVENT_BEAT_BIRD_KEEPER_LUCAS
	writetext WalkerZephyrBadgeText
	buttonsound
	verbosegiveitem TM_ROOST
	iffalse .NoRoomForRoost
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext WalkerTMRoostText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext WalkerFightDoneText
	waitbutton
.NoRoomForRoost:
	closetext
	end

.WalkerRematch:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .PostGameWalker
	readvar VAR_BADGES
	ifequal 7, .WalkerBattle1
	ifequal 8, .WalkerBattle2
	sjump .WalkerBattle2

.WalkerBattle1:
	writetext WalkerReadyForARematchText
	waitbutton
	closetext
	winlosstext WalkerWinLossText, WalkerLossText
	loadtrainer WALKER, WALKER1
	startbattle
	reloadmapafterbattle
	sjump AfterWalkerRematch

.WalkerBattle2:
	writetext WalkerReadyForARematchText
	waitbutton
	closetext
	winlosstext WalkerWinLossText, WalkerLossText
	loadtrainer WALKER, WALKER2
	startbattle
	reloadmapafterbattle
	sjump AfterWalkerRematch

.PostGameWalker:
	writetext PostGameWalkerText
	waitbutton
	closetext
	winlosstext WalkerWinLossText, WalkerLossText
	loadtrainer WALKER, WALKER3
	startbattle
	reloadmapafterbattle
AfterWalkerRematch:
	opentext
	writetext BeatenWalkerAgainText
	waitbutton
	closetext
	setflag ENGINE_BEAT_WALKER
	end

WalkerLossText:
	text "We can't fall just"
	line "yet!"
	done

TrainerBirdKeeperRodney:
	trainer BIRD_KEEPER, RODNEY1, EVENT_BEAT_BIRD_KEEPER_RODNEY, BirdKeeperRodneySeenText, BirdKeeperRodneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodneyAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbel:
	trainer BIRD_KEEPER, ABEL, EVENT_BEAT_BIRD_KEEPER_ABEL, BirdKeeperAbelSeenText, BirdKeeperAbelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbelAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperLucas:
	trainer BIRD_KEEPER, LUCAS, EVENT_BEAT_BIRD_KEEPER_LUCAS, BirdKeeperLucasSeenText, BirdKeeperLucasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperLucasAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WALKER
	iftrue .VioletGymGuyWinScript
	writetext VioletGymGuyText
	waitbutton
	closetext
	end

.VioletGymGuyWinScript:
	writetext VioletGymGuyWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	gettrainername STRING_BUFFER_4, WALKER, WALKER1
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, WALKER, WALKER1
	jumpstd gymstatue2

VioletGymRival1:
	turnobject PLAYER, UP
	moveobject VIOLETGYM_RIVAL, 4, 10
	appear VIOLETGYM_RIVAL
	special FadeOutMusic
	pause 30
	applymovement VIOLETGYM_RIVAL, VioletGymRivalMovement
	pause 15
	opentext
	writetext VioletGymRivalText
	waitbutton
	closetext
	pause 15
	applymovement VIOLETGYM_RIVAL, VioletGymRivalLeavesMovement1
	turnobject PLAYER, DOWN
	playsound SFX_EXIT_BUILDING
	disappear VIOLETGYM_RIVAL
	pause 15
	waitsfx
	special RestartMapMusic
	setscene SCENE_FINISHED
	end

VioletGymRival2:
	turnobject PLAYER, UP
	moveobject VIOLETGYM_RIVAL, 5, 10
	appear VIOLETGYM_RIVAL
	special FadeOutMusic
	pause 30
	applymovement VIOLETGYM_RIVAL, VioletGymRivalMovement
	pause 15
	opentext
	writetext VioletGymRivalText
	waitbutton
	closetext
	pause 15
	applymovement VIOLETGYM_RIVAL, VioletGymRivalLeavesMovement2
	turnobject PLAYER, DOWN
	playsound SFX_EXIT_BUILDING
	disappear VIOLETGYM_RIVAL
	pause 15
	waitsfx
	special RestartMapMusic
	setscene SCENE_FINISHED
	end

VioletGymRivalMovement:
	step DOWN
	step DOWN
	step DOWN
	step_end

VioletGymRivalLeavesMovement1:
	step RIGHT
	step DOWN
	step DOWN
	step_end

VioletGymRivalLeavesMovement2:
	step LEFT
	step DOWN
	step DOWN
	step_end

WalkerIntroText:
	text "I am Walker, "
	line "Leader of the"
	cont "Violet City Gym."

	para "My birds and I"
	line "yearn to be free"

	para "to soar and expore"
	line "the world, but I"

	para "had to put those"
	line "dreams on hold. My"
	cont "wife is expecting"

	para "our child, and I"
	line "cannot abandon"
	cont "them. I will train"

	para "my child to take"
	line "my place so I may"
	cont "fulfill my dream!"
	
	para "Until that day, I"
	line "will battle all"
	cont "challengers with"
	
	para "all my strength!"
	done

WalkerWinLossText:
	text "We have fallen,"
	line "but we shall rise"
	cont "again!"
	done

BeatenWalkerText:
	text "I see now."
	line "Although I cannot"
	cont "leave here yet, I"
	
	para "feel that battles"
	line "are the key to our"
	cont "freedom!"
	
	para "The soaring sensa-"
	line "tion, not knowing"
	cont "if you'll win or"
	
	para "lose until the"
	line "end. It's"
	cont "invigorating."
	
	para "Thank you for that"
	line "battle. Here, take"
	cont "this ZephyrBadge!"
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> received"
	line "ZephyrBadge."
	done

WalkerZephyrBadgeText:
	text "Here--take this"
	line "TM for yourself."
	done

WalkerTMRoostText:
	text "TM50 contains"
	line "Roost."

	para "It will heal a"
	line "bird #mon of"

	para "its wounds."
	line "Use it well."
	done

WalkerFightDoneText:
	text "Someday, I'll"
	line "travel the world"
	cont "with my cherished"

	para "bird #mon, but"
	line "until that day,"
	cont "I shall continue"

	para "my duties as Gym"
	line "Leader!"
	done

BirdKeeperRodneySeenText:
	text "I'm going to show"
	line "you how awesome"
	cont "bird #mon are!"

	para "Come on!"
	done

BirdKeeperRodneyBeatenText:
	text "Gaaah!"
	done

BirdKeeperRodneyAfterBattleText:
	text "Walker's better"
	line "than all of us"
	cont "here!"

	para "Don't get cocky"
	line "just because you"
	cont "beat me!"
	done

BirdKeeperAbelSeenText:
	text "You think we all"
	line "use just Normal"
	cont "birds? Wrong!"
	done

BirdKeeperAbelBeatenText:
	text "You're anything"
	line "but normal!"
	done

BirdKeeperAbelAfterBattleText:
	text "My Aerodactyl's"
	line "cool, huh?"

	para "I found an Old"
	line "Amber in a rock"

	para "and gave it to a"
	line "weird man on Route"
	cont "42, and he"

	para "resurrected it!"
	line "Science is cool!"
	done

VioletGymGuyText:
	text "How's it going,"
	line "champ in the"
	cont "making?"

	para "Walker's a wander-"
	line "bird master! I'm"
	cont "impressed he's"

	para "even still here,"
	line "but he must have"
	cont "his reasons."

	para "Rock, Electric,"
	line "Ice types will"
	cont "clip the wings of"

	para "his Flying Types!"
	done

VioletGymGuyWinText:
	text "Way to go! You"
	line "knocked 'em right"

	para "outta the sky!"
	done

WalkerReadyForARematchText:
	text "My birds have been"
	line "looking forward to"
	cont "soaring the skies"
	cont "against you again!"
	done

BeatenWalkerAgainText:
	text "Shot down again,"
	line "huh?"

	para "Someday we'll"
	line "soar again!"
	done

BirdKeeperLucasSeenText:
	text "Sorry, this is a"
	line "dead end!"
	done

BirdKeeperLucasBeatenText:
	text "Looks like I hit"
	line "a dead end!"
	done

BirdKeeperLucasAfterBattleText:
	text "You'll have to go"
	line "left or right to"
	cont "reach the leader."
	done

VioletGymRivalText:
	text "……………………………………"

	para "…………<PLAYER>………"

	para "………I'm sorry……"
	done

PostGameWalkerText:
	text "Here to soar yet"
	line "again, Champion?"

	para "Let us meet in"
	line "battle among the"
	cont "clouds!"
	done

VioletGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	db 2 ; coord events
	coord_event  4, 14, SCENE_DEFAULT, VioletGymRival1
	coord_event  5, 14, SCENE_DEFAULT, VioletGymRival2

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	db 6 ; object events
	object_event  5,  1, SPRITE_WALKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymWalkerScript, EVENT_VIOLET_GYM_WALKER
	object_event  0,  8, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRodney, -1
	object_event  9,  5, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbel, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, -1
	object_event  4,  6, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperLucas, -1
	object_event  4,  1, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_VIOLET_GYM_RIVAL
