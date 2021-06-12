	object_const_def ; object_event constants
	const AZALEAGYM_KURT
	const AZALEAGYM_BUG_CATCHER1
	const AZALEAGYM_BUG_CATCHER2
	const AZALEAGYM_BUG_CATCHER3
	const AZALEAGYM_TWIN1
	const AZALEAGYM_TWIN2
	const AZALEAGYM_GYM_GUY

AzaleaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaGymKurtScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KURT
	iftrue .FightDone
	writetext KurtText_DangSilph
	waitbutton
	closetext
	winlosstext KurtText_NoRespect, 0
	loadtrainer KURT, KURT1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_KURT
	opentext
	writetext BeatenKurtText
	waitbutton
	closetext
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	readvar VAR_BADGES
	scall AzaleaGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM60_X_SCISSOR
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_ELMER
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_BUZZY
	writetext KurtText_HiveBadgeSpeech
	buttonsound
	verbosegiveitem TM_X_SCISSOR
	iffalse .NoRoomForXScissor
	setevent EVENT_GOT_TM60_X_SCISSOR
	writetext KurtText_XScissorSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	writetext KurtText_Retirement
	waitbutton
.NoRoomForXScissor:
	closetext
	end

AzaleaGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerTwinsAmyandmay1:
	trainer TWINS, AMYANDMAY1, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAmyandmay2:
	trainer TWINS, AMYANDMAY2, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay2AfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherBenny:
	trainer BUG_CATCHER, ELMER, EVENT_BEAT_BUG_CATCHER_ELMER, BugCatcherBennySeenText, BugCatcherBennyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherBennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherAl:
	trainer BUG_CATCHER, AL, EVENT_BEAT_BUG_CATCHER_AL, BugCatcherAlSeenText, BugCatcherAlBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherAlAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherJosh:
	trainer BUG_CATCHER, BUZZY, EVENT_BEAT_BUG_CATCHER_BUZZY, BugCatcherJoshSeenText, BugCatcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherJoshAfterBattleText
	waitbutton
	closetext
	end

AzaleaGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_KURT
	iftrue .AzaleaGymGuyWinScript
	opentext
	writetext AzaleaGymGuyText
	waitbutton
	closetext
	end

.AzaleaGymGuyWinScript:
	opentext
	writetext AzaleaGymGuyWinText
	waitbutton
	closetext
	end

AzaleaGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, KURT, KURT1
	jumpstd gymstatue2

KurtText_DangSilph:
	text "Humph. I'm Kurt,"
	line "Gym Leader of"
	cont "Azalea Town. I"

	para "didn't want to be,"
	line "but that dang"
	cont "Silph Co. put me"

	para "outta business! I"
	line "made the best"
	cont "Balls around, but"

	para "Silph came in with"
	line "their cheap"
	cont "quality ones they"

	para "mass produced! My"
	line "son in Ecruteak"
	cont "City continues my"
	
	para "work as a hobby,"
	line "but I still need"
	cont "to work. That's"
	
	para "why I'm here!"
	line "Alright, enough"
	cont "talk, whipper-"
	
	para "snapper!"
	done

KurtText_NoRespect:
	text "Tch! Kids these"
	line "days! No respect"
	cont "at all!"
	done

BeatenKurtText:
	text "Alright, alright!"
	line "You won, so here!"
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> received"
	line "HiveBadge."
	done

KurtText_HiveBadgeSpeech:
	text "The HiveBadge"
	line "makes all #mon"
	cont "up to Lv 70 obey"

	para "you. Here, take"
	line "this too."
	done

KurtText_XScissorSpeech:
	text "TM60 contains"
	line "X-Scissor."

	para "It's a great move"
	line "for Bug Types!"
	cont "No special effects"

	para "though, so it may"
	line "be boring for a"
	cont "youngster like"

	para "you!"
	done

KurtText_Retirement:
	text "Maybe I can retire"
	line "and rely on my son"

	para "for support. Then"
	line "I can make Balls"

	para "as a hobby. Yeah,"
	line "that sounds nice."
	done

BugCatcherBennySeenText:
	text "Bug #MON evolve"
	line "young. So they get"

	para "stronger that much"
	line "faster."
	done

BugCatcherBennyBeatenText:
	text "Just evolving"
	line "isn't enough!"
	done

BugCatcherBennyAfterBattleText:
	text "#MON become"
	line "stronger if they"
	cont "evolve. Really!"
	done

BugCatcherAlSeenText:
	text "Bug #MON are"
	line "cool and tough!"

	para "I'll prove it to"
	line "you!"
	done

BugCatcherAlBeatenText:
	text "You proved how"
	line "tough you are…"
	done

BugCatcherAlAfterBattleText:
	text "They're so cool,"
	line "but most girls"

	para "don't like bug"
	line "#MON."

	para "I don't know why…"
	done

BugCatcherJoshSeenText:
	text "You saved all the"
	line "SLOWPOKE? Whew,"
	cont "you're mighty!"

	para "But my grown-up"
	line "#MON are pretty"
	cont "tough too!"
	done

BugCatcherJoshBeatenText:
	text "Urrgggh!"
	done

BugCatcherJoshAfterBattleText:
	text "I guess I should"
	line "teach them better"
	cont "moves…"
	done

TwinsAmyandmay1SeenText:
	text "AMY: Hi! Are you"
	line "challenging the"
	cont "LEADER? No way!"
	done

TwinsAmyandmay1BeatenText:
	text "AMY & MAY: Oh,"
	line "double goodness!"
	done

TwinsAmyandmay1AfterBattleText:
	text "AMY: You're"
	line "really strong!"
	done

TwinsAmyandmay2SeenText:
	text "MAY: You want to"
	line "see the LEADER?"
	cont "We come first!"
	done

TwinsAmyandmay2BeatenText:
	text "AMY & MAY: Oh,"
	line "double goodness!"
	done

TwinsAmyandmay2AfterBattleText:
	text "MAY: Our bug #-"
	line "MON lost! Oh, what"
	cont "a shame."
	done

AzaleaGymGuyText:
	text "How's it going,"
	line "champ in the"
	cont "making? Kurt's a"

	para "Bug Type user!"
	line "Fire, Flying and"
	cont "Rock Types make"

	para "quick work of"
	line "them! He used to"
	cont "make unique #"

	para "Balls out of"
	line "Apricorns, but"
	cont "Silph took most"

	para "of his business,"
	line "so he's a little"
	cont "grouchy!"
	done

AzaleaGymGuyWinText:
	text "You really"
	line "squashed those"

	para "Bugs!....."
	line "Sorry, was that"

	para "too brutal?"
	done

AzaleaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, AZALEA_TOWN, 5
	warp_event  5, 15, AZALEA_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, AzaleaGymStatue
	bg_event  6, 13, BGEVENT_READ, AzaleaGymStatue

	db 7 ; object events
	object_event  5,  7, SPRITE_KURT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, AzaleaGymKurtScript, -1
	object_event  5,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherBenny, -1
	object_event  8,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherAl, -1
	object_event  0,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherJosh, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaGymGuyScript, -1
