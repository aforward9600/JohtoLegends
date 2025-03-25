	object_const_def ; object_event constants
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BUENA1
	const MAHOGANYGYM_BUENA2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUY

MahoganyGym_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_GYM_GUIDE_STOPS_YOU

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .PryceMondayGym

.DummyScene0:
	end

.DummyScene1:
	end

.PryceMondayGym:
	checkevent EVENT_BEAT_PRYCE
	iftrue .IsItMondayGym
	appear MAHOGANYGYM_PRYCE
	return

.IsItMondayGym:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .PryceDisappears
	appear MAHOGANYGYM_PRYCE
	return

.PryceDisappears:
	disappear MAHOGANYGYM_PRYCE
	return

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Blizzard, PryceText_StillGotIt
	loadtrainer PRYCE, PRYCE1
.StartPryceBattle:
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	setevent EVENT_DECO_TOTODILE_DOLL
	opentext
	writetext PryceText_After
	waitbutton
	closetext
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	loadmem wLevelCap, 22
	readvar VAR_BADGES
	scall MahoganyGymActivateRockets
	setflag ENGINE_BEAT_PRYCE
.FightDone:
	checkflag ENGINE_BEAT_PRYCE
	iffalse .Rematch
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_BRANDY
	setevent EVENT_BEAT_SKIER_PAM
	setevent EVENT_BEAT_BOARDER_SONNY
	writetext PryceText_GlacierBadgeSpeech
	buttonsound
	verbosegiveitem TM_ICY_WIND
	iffalse MahoganyGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	setscene SCENE_GYM_GUIDE_STOPS_YOU
	end

.Rematch:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .PostGamePryce
	readvar VAR_BADGES
	ifequal 1, .PryceBattle1
	ifequal 2, .PryceBattle2
	ifequal 3, .PryceBattle3
	ifequal 4, .PryceBattle4
	ifequal 5, .PryceBattle5
	ifequal 6, .PryceBattle6
	ifequal 7, .PryceBattle7
	ifequal 8, .PryceBattle8
	sjump .PryceBattle8

.PryceBattle1:
	writetext PryceText_WelcomeBack
	waitbutton
	closetext
	winlosstext PryceText_Blizzard, PryceText_StillGotIt
	loadtrainer PRYCE, PRYCE_ALTERNATE
	startbattle
	reloadmapafterbattle
	sjump AfterPryceRematch

.PryceBattle2:
	writetext PryceText_WelcomeBack
	waitbutton
	closetext
	winlosstext PryceText_Blizzard, PryceText_StillGotIt
	loadtrainer PRYCE, PRYCE2
	startbattle
	reloadmapafterbattle
	sjump AfterPryceRematch

.PryceBattle3:
	writetext PryceText_WelcomeBack
	waitbutton
	closetext
	winlosstext PryceText_Blizzard, PryceText_StillGotIt
	loadtrainer PRYCE_2, PRYCE3
	startbattle
	reloadmapafterbattle
	sjump AfterPryceRematch

.PryceBattle4:
	writetext PryceText_WelcomeBack
	waitbutton
	closetext
	winlosstext PryceText_Blizzard, PryceText_StillGotIt
	loadtrainer PRYCE_2, PRYCE4
	startbattle
	reloadmapafterbattle
	sjump AfterPryceRematch

.PryceBattle5:
	writetext PryceText_WelcomeBack
	waitbutton
	closetext
	winlosstext PryceText_Blizzard, PryceText_StillGotIt
	loadtrainer PRYCE_2, PRYCE5
	startbattle
	reloadmapafterbattle
	sjump AfterPryceRematch

.PryceBattle6:
	writetext PryceText_WelcomeBack
	waitbutton
	closetext
	winlosstext PryceText_Blizzard, PryceText_StillGotIt
	loadtrainer PRYCE_3, PRYCE6
	startbattle
	reloadmapafterbattle
	sjump AfterPryceRematch

.PryceBattle7:
	writetext PryceText_WelcomeBack
	waitbutton
	closetext
	winlosstext PryceText_Blizzard, PryceText_StillGotIt
	loadtrainer PRYCE_3, PRYCE7
	startbattle
	reloadmapafterbattle
	sjump AfterPryceRematch

.PryceBattle8:
	writetext PryceText_WelcomeBack
	waitbutton
	closetext
	winlosstext PryceText_Blizzard, PryceText_StillGotIt
	loadtrainer PRYCE_3, PRYCE8
	startbattle
	reloadmapafterbattle
	sjump AfterPryceRematch

.PostGamePryce:
	writetext PryceText_WelcomeBackChampion
	waitbutton
	closetext
	winlosstext PryceText_Blizzard, PryceText_StillGotIt
	loadtrainer PRYCE_3, PRYCE9
	startbattle
	reloadmapafterbattle
	sjump AfterPryceRematch

PryceScript_Defeat:
	writetext PryceText_GoodLooks
	waitbutton
MahoganyGym_NoRoomForIcyWind:
	closetext
	end

AfterPryceRematch:
	opentext
	writetext PryceText_BeatenAgain
	waitbutton
	closetext
	setflag ENGINE_BEAT_PRYCE
	end

MahoganyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerSkierBrandy:
	trainer SKIER, BRANDY, EVENT_BEAT_SKIER_BRANDY, SkierBrandySeenText, SkierBrandyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierBrandyAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierPam:
	trainer SKIER, PAM, EVENT_BEAT_SKIER_PAM, SkierPamSeenText, SkierPamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierPamAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderSonny:
	trainer BOARDER, SONNY, EVENT_BEAT_BOARDER_SONNY, BoarderSonnySeenText, BoarderSonnyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderSonnyAfterBattleText
	waitbutton
	closetext
	end

MahoganyGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuyWinScript
if DEF(_FAITHFUL)
	writetext MahoganyGymGuyFaithfulText
elif DEF(_NOPSS)
	writetext MahoganyGymGuyFaithfulText
endc
	writetext MahoganyGymGuyText
	waitbutton
	closetext
	end

.MahoganyGymGuyWinScript:
	writetext MahoganyGymGuyWinText
	waitbutton
	closetext
	end

GymGuyStopsYou1Script:
	applymovement MAHOGANYGYM_GYM_GUY, StopsYouMovement1
	turnobject PLAYER, RIGHT
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female1
	opentext
	writetext ByTheWay1Text
	waitbutton
	closetext
	applymovement MAHOGANYGYM_GYM_GUY, GoesBackMovement1
	turnobject MAHOGANYGYM_GYM_GUY, DOWN
	setscene SCENE_DEFAULT
	clearevent EVENT_RIVAL_AT_LAKE_OF_RAGE_1
	clearevent EVENT_LAKE_OF_RAGE_MIYAMOTO
	end

.Female1:
	opentext
	writetext ByTheWay2Text
	waitbutton
	closetext
	applymovement MAHOGANYGYM_GYM_GUY, GoesBackMovement1
	turnobject MAHOGANYGYM_GYM_GUY, DOWN
	setscene SCENE_DEFAULT
	clearevent EVENT_RIVAL_AT_LAKE_OF_RAGE_1
	clearevent EVENT_LAKE_OF_RAGE_MIYAMOTO
	end

GymGuyStopsYou2Script:
	applymovement MAHOGANYGYM_GYM_GUY, StopsYouMovement2
	turnobject PLAYER, RIGHT
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female2
	opentext
	writetext ByTheWay1Text
	waitbutton
	closetext
	applymovement MAHOGANYGYM_GYM_GUY, GoesBackMovement2
	turnobject MAHOGANYGYM_GYM_GUY, DOWN
	setscene SCENE_DEFAULT
	clearevent EVENT_RIVAL_AT_LAKE_OF_RAGE_1
	clearevent EVENT_LAKE_OF_RAGE_MIYAMOTO
	end

.Female2:
	opentext
	waitbutton
	writetext ByTheWay2Text
	waitbutton
	closetext
	applymovement MAHOGANYGYM_GYM_GUY, GoesBackMovement2
	turnobject MAHOGANYGYM_GYM_GUY, DOWN
	setscene SCENE_DEFAULT
	clearevent EVENT_RIVAL_AT_LAKE_OF_RAGE_1
	clearevent EVENT_LAKE_OF_RAGE_MIYAMOTO
	end

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	gettrainername STRING_BUFFER_4, PRYCE, PRYCE1
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, PRYCE, PRYCE1
	jumpstd gymstatue2

StopsYouMovement1:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step_end

StopsYouMovement2:
	step DOWN
	step DOWN
	step LEFT
	step_end

GoesBackMovement1:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_resume

GoesBackMovement2:
	step RIGHT
	step UP
	step UP
	step_resume

PryceText_Intro:
	text "Hurrmph! I heard"
	line "some kids around"
	cont "here are calling"

	para "me Old Man Pryce!"
	line "I may look thrice"
	cont "my age, but 40s"

	para "aren't that old!"
	line "Plus, age is just"
	cont "a number, and it"

	para "sure doesn't"
	line "affect how irresi-"
	cont "stible I am to the"

	para "ladies…Sorry, just"
	line "thinking out loud."
	cont "I am Pryce, the"

	para "Gym Leader of"
	line "Mahogany Town,"
	cont "although I'm sure"

	para "you already know"
	line "that. If you're"
	cont "here for a"

	para "challenge, this"
	line "not-that-old-yet"
	cont "man is gonna give"

	para "you one!"
	done

PryceText_Blizzard:
	text "Urgh! Age is just"
	line "a number, but it"

	para "still hits like"
	line "a Blizzard!"
	done

PryceText_StillGotIt:
	text "Winter is harsh,"
	line "but we can bear"
	cont "it!"
	done

PryceText_After:
	text "I became an Ice-"
	line "Type Gym Leader"
	cont "because I enjoyed"

	para "the cold, but it"
	line "sure did a number"
	cont "on my back and"

	para "looks. Anyway,"
	line "you've got skills,"
	cont "kid! Here is the"
	cont "GlacierBadge!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> received"
	line "GlacierBadge."
	done

PryceText_GlacierBadgeSpeech:
	text "That's your first"
	line "Badge, right? You"
	cont "are on your way"

	para "to becoming a"
	line "master. Here, take"
	cont "this TM. It will"


	para "teach your #mon"
	line "a move, and it"
	cont "can be used"

	para "over and over."
	done

PryceText_IcyWindSpeech:
	text "That TM contains"
	line "Icy Wind."

	para "It inflicts damage"
	line "and lowers speed."

	para "It demonstrates"
	line "the harshness of"
	cont "winter."
	done

PryceText_GoodLooks:
	text "I'll keep my"
	line "dashing good"
	cont "looks, even when"

	para "I enter my senior"
	line "years!"

	para "…Hopefully."
	done

PryceText_WelcomeBack:
	text "Well, well, well,"
	line "looks who's back!"

	para "You here for a"
	line "rematch?"

	para "I'm not too old"
	line "for this yet!"
	done

PryceText_BeatenAgain:
	text "Sheesh!"

	para "Looks like the"
	line "younger folks"
	cont "will give my"
	cont "generation a run"
	cont "for our money!"
	done

BoarderSonnySeenText:
	text "Pryce may be the"
	line "master of Ice, but"
	cont "I'm right behind"
	cont "him in skill."
	done

BoarderSonnyBeatenText:
	text "Apparently I'm"
	line "not."
	done

BoarderSonnyAfterBattleText:
	text "I guess I was too"
	line "focused on snow-"

	para "boarding instead"
	line "of #mon."
	done

SkierBrandySeenText:
	text "The ice is really"
	line "slippery."

	para "You need to think"
	line "before you skate,"

	para "otherwise you'll"
	line "just crash into a"
	cont "wall."
	done

SkierBrandyBeatenText:
	text "Looks like I was"
	line "the one crashing!"
	done

SkierBrandyAfterBattleText:
	text "I once crashed in-"
	line "to a guy on a ski"
	cont "trip."

	para "He's my boyfriend"
	line "now."
	done

SkierPamSeenText:
	text "You should totally"
	line "check out my"
	cont "COOL battling"
	cont "skills!"

	para "Hahaha!"
	line "Get it?"
	done

SkierPamBeatenText:
	text "Hey, CHILL out!"
	line "Hahaha!"
	done

SkierPamAfterBattleText:
	text "Alright, I'm done"
	line "with the puns."

	para "But, you must"
	line "admit, my skills"
	cont "were pretty..."

	para "ICE!"

	para "Hahahaha!"

	para "....I guess you're"
	line "giving me..."

	para "The COLD Shoulder."

	para "Giggle."
	done

MahoganyGymGuyText:
	text "How's it going,"
	line "champ in the"
	cont "making?"

	para "I'm the Gym Guide"
	line "and I'm here to"
	cont "help you out with"

	para "your Challenge!"
	line "Pryce loves his"
	cont "Ice-Types, and"

	para "he's quite ornery"
	line "if you mention his"
	cont "age!"
	
	para "Ice-Types are weak"
	line "against Fire,"
	cont "Rock, Steel, and"

	para "Fighting Types!"
	line "Dragon and Ground"
	cont "Types don't do the"
	cont "greatest. Also,"

	para "Water and Electric"
	line "moves don't effect"
	cont "them so well."
	done

MahoganyGymGuyWinText:
	text "Pryce is ice-cold,"
	line "but you're firey-"
	cont "hot! You melted"

	para "his Ice-Types!"
	done

ByTheWay1Text:
	text "Oh, by the way,"
	line "your friend"
	cont "<RIVAL> told me to"

	para "tell you:"

	para "Meet me in front"
	line "of Lake of Rage!"

	para "You better go see"
	line "her."
	done

ByTheWay2Text:
	text "Oh, by the way,"
	line "your friend"
	cont "<RIVAL> told me to"

	para "tell you:"

	para "Meet me in front"
	line "of Lake of Rage!"

	para "You better go see"
	line "him."
	done

MahoganyGymGuyFaithfulText:
	text "How's it going,"
	line "champ in the"
	cont "making?"

	para "I'm the Gym Guide"
	line "and I'm here to"
	cont "help you out with"

	para "your Challenge!"
	line "Pryce loves his"
	cont "Ice-Types, and"

	para "he's quite ornery"
	line "if you mention his"
	cont "age!"
	
	para "Ice-Types are weak"
	line "against Fire,"
	cont "Rock, Steel, and"

	para "Fighting Types!"
	line "Dragon and Ground"
	cont "Types don't do the"
	cont "greatest."
	done

PryceText_WelcomeBackChampion:
	text "So, you're the"
	line "Chamion now!"

	para "Pretty cool, if I"
	line "do say so!"

	para "Fancy showing this"
	line "'old man' your new"
	cont "strength?"
	done

MahoganyGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, LAKE_OF_RAGE, 3
	warp_event  5, 17, LAKE_OF_RAGE, 3

	db 2 ; coord events
	coord_event 4, 17, SCENE_GYM_GUIDE_STOPS_YOU, GymGuyStopsYou1Script
	coord_event 5, 17, SCENE_GYM_GUIDE_STOPS_YOU, GymGuyStopsYou2Script

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	db 5 ; object events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, EVENT_MAHOGANY_GYM_PRYCE
	object_event  5,  9, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierBrandy, -1
	object_event  9, 17, SPRITE_SKIER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierPam, -1
	object_event  2,  4, SPRITE_BOARDER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderSonny, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuyScript, -1
