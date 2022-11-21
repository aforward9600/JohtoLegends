	object_const_def ; object_event constants
	const GOLDENRODGYM_MILTON
	const GOLDENRODGYM_BREEDER1
	const GOLDENRODGYM_BREEDER2
	const GOLDENRODGYM_BREEDER3
	const GOLDENRODGYM_BREEDER4
	const GOLDENRODGYM_GYM_GUY
	const GOLDENRODGYM_DAHLIA

GoldenrodGym_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_GOLDENRODGYM_DEFAULT
	scene_script .DummyScene1 ; SCENE_GOLDENRODGYM_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MiltonSundayGym

.DummyScene0:
	end

.DummyScene1:
	end

.MiltonSundayGym:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .IsItSundayGym
	appear GOLDENRODGYM_MILTON
	return

.IsItSundayGym:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .DisappearMilton
	appear GOLDENRODGYM_MILTON
	return

.DisappearMilton:
	disappear GOLDENRODGYM_MILTON
	return

GoldenrodGymMiltonScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MILTON
	iftrue .FightDone
	writetext MiltonText_Howdy
	waitbutton
	closetext
	winlosstext MiltonText_HooWee, MiltonText_Yeehaw
	loadtrainer MILTON, MILTON1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MILTON
	scall GoldenrodRockets
	opentext
	writetext BeatenMiltonText
	waitbutton
	closetext
	opentext
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	readvar VAR_BADGES
	setflag ENGINE_BEAT_MILTON
.FightDone:
	checkflag ENGINE_BEAT_MILTON
	iffalse .RematchMilton
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	setevent EVENT_BEAT_BREEDER_SARAH
	setevent EVENT_BEAT_BREEDER_BRIDGET
	setevent EVENT_BEAT_BREEDER_NINA
	setevent EVENT_BEAT_BREEDER_EMILY
	writetext MiltonText_PlainBadgeSpeech
	buttonsound
	verbosegiveitem TM_SWORDS_DANCE
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext MiltonAttractText
	waitbutton
	closetext
	end

.GotAttract:
	checkevent EVENT_GOLDENROD_GYM_RIVAL_1
	iffalse .ToughKid
	writetext MiltonSisterText
	waitbutton
.NoRoomForAttract:
	closetext
	end

.ToughKid:
	writetext AsToughAsYouAreText
	waitbutton
	closetext
	turnobject GOLDENRODGYM_MILTON, DOWN
	end

.RematchMilton:
	readvar VAR_BADGES
	ifequal 5, .MiltonBattle1
	ifequal 6, .MiltonBattle2
	ifequal 7, .MiltonBattle3
	ifequal 8, .MiltonBattle4
	sjump .MiltonBattle4

.MiltonBattle1:
	checkevent EVENT_GOLDENROD_GYM_RIVAL_1
	iffalse .ToughKid
	writetext MiltonReadyForARematchText
	waitbutton
	closetext
	winlosstext MiltonText_HooWee, MiltonText_Yeehaw
	loadtrainer MILTON, MILTON1
	startbattle
	reloadmapafterbattle
	sjump AfterMiltonRematch

.MiltonBattle2:
	checkevent EVENT_GOLDENROD_GYM_RIVAL_1
	iffalse .ToughKid
	writetext MiltonReadyForARematchText
	waitbutton
	closetext
	winlosstext MiltonText_HooWee, MiltonText_Yeehaw
	loadtrainer MILTON, MILTON2
	startbattle
	reloadmapafterbattle
	sjump AfterMiltonRematch

.MiltonBattle3:
	checkevent EVENT_GOLDENROD_GYM_RIVAL_1
	iffalse .ToughKid
	writetext MiltonReadyForARematchText
	waitbutton
	closetext
	winlosstext MiltonText_HooWee, MiltonText_Yeehaw
	loadtrainer MILTON, MILTON3
	startbattle
	reloadmapafterbattle
	sjump AfterMiltonRematch

.MiltonBattle4:
	checkevent EVENT_GOLDENROD_GYM_RIVAL_1
	iffalse .ToughKid
	writetext MiltonReadyForARematchText
	waitbutton
	closetext
	winlosstext MiltonText_HooWee, MiltonText_Yeehaw
	loadtrainer MILTON, MILTON4
	startbattle
	reloadmapafterbattle
	sjump AfterMiltonRematch

AfterMiltonRematch:
	opentext
	writetext MiltonText_BeatenAgain
	waitbutton
	closetext
	setflag ENGINE_BEAT_MILTON
	end

GoldenrodRockets:
	jumpstd goldenrodrockets

GoldenrodGymActivateRockets:
	jumpstd radiotowerrockets

GoldenrodGymRivalScript:
	faceplayer
	opentext
	writetext GoldenrodGymRivalText
	waitbutton
	closetext
	turnobject GOLDENRODGYM_DAHLIA, UP
	end

TrainerBreederSarah:
	trainer BREEDER, SARAH, EVENT_BEAT_BREEDER_SARAH, BreederSarahSeenText, BreederSarahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BreederSarahAfterBattleText
	waitbutton
	closetext
	end

TrainerBreederBridget:
	trainer BREEDER, BRIDGET, EVENT_BEAT_BREEDER_BRIDGET, BreederBridgetSeenText, BreederBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BreederBridgetAfterBattleText
	waitbutton
	closetext
	end

TrainerBreederEmily:
	trainer BREEDER, EMILY, EVENT_BEAT_BREEDER_EMILY, BreederEmilySeenText, BreederEmilyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BreederEmilyAfterBattleText
	waitbutton
	closetext
	end

TrainerBreederNina:
	trainer BREEDER, NINA, EVENT_BEAT_BREEDER_NINA, BreederNinaSeenText, BreederNinaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BreederNinaAfterBattleText
	waitbutton
	closetext
	end

GoldenrodGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_MILTON
	iftrue .GoldenrodGymGuyWinScript
	opentext
	writetext GoldenrodGymGuyText
	waitbutton
	closetext
	end

.GoldenrodGymGuyWinScript:
	opentext
	writetext GoldenrodGymGuyWinText
	waitbutton
	closetext
	end

GoldenrodGymStatue:
	checkevent EVENT_ROCKET_JAIL_RIVAL
	iftrue .RivalBeatGym
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd gymstatue4
.Beaten:
	gettrainername STRING_BUFFER_4, MILTON, MILTON1
	jumpstd gymstatue3
.RivalBeatGym:
	gettrainername STRING_BUFFER_4, MILTON, MILTON1
	jumpstd gymstatue2

TowerInvaded1:
	moveobject, GOLDENRODGYM_DAHLIA, 3, 17
	playsound SFX_ENTER_DOOR
	appear GOLDENRODGYM_DAHLIA
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GoldenrodGymFemale1
	playmusic MUSIC_DAHLIA_ENCOUNTER
	sjump .FinishGoldenrodGymRival1

.GoldenrodGymFemale1:
	playmusic MUSIC_RIVAL_ENCOUNTER
.FinishGoldenrodGymRival1:
	applymovement GOLDENRODGYM_DAHLIA, GoldenrodGymRivalMovement1
	turnobject GOLDENRODGYM_DAHLIA, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext TowerIsBeingInvadedText
	waitbutton
	closetext
	applymovement GOLDENRODGYM_DAHLIA, GoldenrodGymRivalMovement2
	disappear GOLDENRODGYM_DAHLIA
	playsound SFX_EXIT_BUILDING
	special RestartMapMusic
	setscene SCENE_DEFAULT
	setevent EVENT_WILD_AREA_5_RIVAL1
	end

TowerInvaded2:
	moveobject, GOLDENRODGYM_DAHLIA, 2, 17
	playsound SFX_ENTER_DOOR
	appear GOLDENRODGYM_DAHLIA
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GoldenrodGymFemale2
	playmusic MUSIC_DAHLIA_ENCOUNTER
	sjump .FinishGoldenrodGymRival2

.GoldenrodGymFemale2:
	playmusic MUSIC_RIVAL_ENCOUNTER
.FinishGoldenrodGymRival2:
	applymovement GOLDENRODGYM_DAHLIA, GoldenrodGymRivalMovement1
	turnobject GOLDENRODGYM_DAHLIA, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext TowerIsBeingInvadedText
	waitbutton
	closetext
	applymovement GOLDENRODGYM_DAHLIA, GoldenrodGymRivalMovement2
	disappear GOLDENRODGYM_DAHLIA
	playsound SFX_EXIT_BUILDING
	special RestartMapMusic
	setscene SCENE_DEFAULT
	setevent EVENT_WILD_AREA_5_RIVAL1
	end

GoldenrodGymRivalMovement1:
	step UP
	step UP
	step UP
	step UP
	step_end

GoldenrodGymRivalMovement2:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MiltonText_Howdy:
	text "Howdy pardner!"
	line "Welcome to the"
	cont "Goldenrod City"

	para "Gym! Name's"
	line "Milton, and I also"
	cont "own MooMoo Farm! I"

	para "took up this here"
	line "job as Gym Leader"
	cont "so we could make"

	para "extra money. The"
	line "embargo from Kanto"
	cont "has put a"

	para "stranglehold on"
	line "our business, but"
	cont "enough about money"

	para "and politics, and"
	line "let's get to why"
	cont "yer here. I accept"

	para "yer challenge!"
	done

MiltonText_HooWee:
	text "Hoo-wee!"

	para "Now there's some"
	line "fine battling!"
	done

MiltonText_Yeehaw:
	text "Yee-haw!"

	para "Down to the wire!"
	done

MiltonText_BeatenAgain:
	text "Well, dang!"

	para "Ya beat me"
	line "again!"
	done

BeatenMiltonText:
	text "I am impressed! Ya"
	line "handled that"
	cont "better than I can"

	para "handle a greased"
	line "Primape! You've"
	cont "earned this"

	para "PlainBadge!"
	done

PlayerReceivedPlainBadgeText:
	text "<PLAYER> received"
	line "PlainBadge."
	done

MiltonText_PlainBadgeSpeech:
	text "Well done there,"
	line "pardner! Here,"
	cont "take this TM as"
	cont "well!"
	done

MiltonAttractText:
	text "It's Swords Dance!"
	line "It sharply increa-"

	para "ses a #mon's"
	line "Attack. Use it"

	para "On a tough"
	line "#mon!"
	done

MiltonSisterText:
	text "My sister is an"
	line "even better"
	cont "trainer than I am,"

	para "if ya kin believe"
	line "it! I hope someday"
	cont "she can take over"

	para "for me, or maybe"
	line "her kid, if she"
	cont "gets to having"

	para "any. Ya might meet"
	line "her someday!"
	cont "You'll know when"

	para "ya see her, trust"
	line "me. Come back for"
	cont "a chat now, ya"

	para "hear?"
	done

BreederSarahSeenText:
	text "Egg Moves aren't"
	line "the only way to"
	cont "give #mon some"

	para "special moves!"
	done

BreederSarahBeatenText:
	text "I guess you"
	line "already knew"
	cont "that!"
	done

BreederSarahAfterBattleText:
	text "TMs can be used to"
	line "teach unique moves"
	cont "to #mon, as"

	para "well as Tutors."
	line "you must have come"
	cont "across some."
	done

BreederBridgetSeenText:
	text "I want to see just"
	line "how strong you"
	cont "are, by seeing"

	para "how strong my"
	line "#mon is!"
	done

BreederBridgetBeatenText:
	text "Well I'll be!"
	line "You're strong as"
	cont "a Tauros!"
	done

BreederBridgetAfterBattleText:
	text "I think our Leader"
	line "will like battling"
	cont "you! You got the"

	para "stuff he's looking"
	line "for! Go on,"

	para "what're you"
	line "waitin' for?"
	done

BreederEmilySeenText:
	text "Heya! You want to"
	line "learn about Egg"

	para "Moves?"
	done

BreederEmilyBeatenText:
	text "Looks like you"
	line "don't need to"
	cont "learn!"
	done

BreederEmilyAfterBattleText:
	text "Egg Moves can be"
	line "learned from the"
	cont "parents. How do"

	para "you think my"
	line "little Teddiursa"
	cont "knows such good"

	para "moves?"
	done

BreederNinaSeenText:
	text "#mon raised"
	line "from Eggs are just"
	cont "the best!"
	done

BreederNinaBeatenText:
	text "They're still the"
	line "best! Even if mine"
	cont "don't win."
	done

BreederNinaAfterBattleText:
	text "Most people don't"
	line "even know that"
	cont "#mon come from"

	para "Eggs! What do they"
	line "think? That they"
	cont "just appear out of"

	para "the grass?"
	done

GoldenrodGymGuyText:
	text "How's it going,"
	line "champ in the"
	cont "making? Milton is"

	para "a Normal Type"
	line "wrangler sort of"
	cont "guy. Fighting is"

	para "their only"
	line "weakness, so hit"
	cont "'em hard and fast!"
	done

GoldenrodGymGuyWinText:
	text "Yee-haw! Congrats"
	line "there pardner! Yer"
	cont "a real tough"

	para "wrangler now! Hi-"
	line "ho silv... Sorry."
	cont "This place is"

	para "getting to me."
	done

TowerIsBeingInvadedText:
	text "<PLAYER>!"

	para "The old tower is"
	line "being invaded!"

	para "I'll bet it's"
	line "those people in"
	cont "black again!"

	para "Looks like my Gym"
	line "challenge will"
	cont "have to wait!"

	para "I'll meet you"
	line "over there!"
	done

GoldenrodGymRivalText:
	text "Tauros is no joke!"
	done

AsToughAsYouAreText:
	text "This kid is as"
	line "tough as you are!"
	done

MiltonReadyForARematchText:
	text "Y'all ready for a"
	line "rematch?"

	para "This ain't gonna"
	line "go the same way"
	cont "as last time!"
	done

BeatenMiltonAgainText:
	text "Hot dang!"

	para "Yer a tough one"
	line "alright!"
	done

GoldenrodGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	db 2 ; coord events
	coord_event  2, 13, SCENE_FINISHED, TowerInvaded1
	coord_event  3, 13, SCENE_FINISHED, TowerInvaded2

	db 2 ; bg events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	db 7 ; object events
	object_event 11,  3, SPRITE_MILTON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGymMiltonScript, EVENT_GOLDENROD_GYM_MILTON
	object_event  9, 13, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBreederSarah, -1
	object_event  9,  6, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBreederBridget, -1
	object_event  5,  1, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBreederEmily, -1
	object_event 18,  3, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerBreederNina, -1
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymGuyScript, -1
	object_event 11,  4, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodGymRivalScript, EVENT_GOLDENROD_GYM_RIVAL_1
