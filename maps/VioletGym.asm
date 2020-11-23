	object_const_def ; object_event constants
	const VIOLETGYM_WALKER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUY

VioletGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletGymWalkerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext WalkerIntroText
	waitbutton
	closetext
	winlosstext WalkerWinLossText, 0
	loadtrainer WALKER, WALKER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext BeatenWalkerText
	waitbutton
	closetext
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	readvar VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOTHING
	specialphonecall SPECIALCALL_ASSISTANT
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

VioletGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
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
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, WALKER, WALKER1
	jumpstd gymstatue2

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
	text "ZephyrBadge"
	line "raises the attack"
	cont "power of #mon."

	para "It also enables"
	line "#mon to use"

	para "Flash, if they"
	line "have it, anytime."

	para "Here--take this"
	line "too."
	done

WalkerTMRoostText:
	text "By using a TM, a"
	line "#mon will"

	para "instantly learn a"
	line "new move."

	para "Think before you"
	line "act--a TM can be"
	cont "used only once."

	para "TM51 contains"
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

BirdKeeperRodSeenText:
	text "The keyword is"
	line "guts!"

	para "Those here are"
	line "training night and"

	para "day to become bird"
	line "#mon masters."

	para "Come on!"
	done

BirdKeeperRodBeatenText:
	text "Gaaah!"
	done

BirdKeeperRodAfterBattleText:
	text "Walker's skills"
	line "are for real!"

	para "Don't get cocky"
	line "just because you"
	cont "beat me!"
	done

BirdKeeperAbeSeenText:
	text "Let me see if you"
	line "are good enough to"
	cont "face Walker!"
	done

BirdKeeperAbeBeatenText:
	text "This can't be"
	line "true!"
	done

BirdKeeperAbeAfterBattleText:
	text "This is pathetic,"
	line "losing to some"
	cont "rookie trainer…"
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

VioletGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	db 4 ; object events
	object_event  5,  1, SPRITE_WALKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymWalkerScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, -1
