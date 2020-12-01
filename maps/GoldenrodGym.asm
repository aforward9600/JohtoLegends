	object_const_def ; object_event constants
	const GOLDENRODGYM_MILTON
	const GOLDENRODGYM_BREEDER
	const GOLDENRODGYM_LASS
	const GOLDENRODGYM_BUENA1
	const GOLDENRODGYM_BUENA2
	const GOLDENRODGYM_GYM_GUY

GoldenrodGym_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene0 ; SCENE_GOLDENRODGYM_NOTHING

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

GoldenrodGymMiltonScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	writetext MiltonText_Howdy
	waitbutton
	closetext
	winlosstext MiltonText_HooWee, 0
	loadtrainer MILTON, MILTON1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
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
	scall GoldenrodGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
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
	writetext MiltonSisterText
	waitbutton
.NoRoomForAttract:
	closetext
	end

GoldenrodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end

TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
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

TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end

GoldenrodGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
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
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, MILTON, MILTON1
	jumpstd gymstatue2

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
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
	text "All #mon up to"
	line "Lv 60 will listen"
	cont "to ya. Here, take"

	para "This TM as well!"
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

LassCarrieSeenText:
	text "Don't let my"
	line "#MON's cute"

	para "looks fool you."
	line "They can whip you!"
	done

LassCarrieBeatenText:
	text "Darn… I thought"
	line "you were weak…"
	done

LassCarrieAfterBattleText:
	text "Do my #MON"
	line "think I'm cute?"
	done

LassBridgetSeenText:
	text "I like cute #-"
	line "MON better than"
	cont "strong #MON."

	para "But I have strong"
	line "and cute #MON!"
	done

LassBridgetBeatenText:
	text "Oh, no, no, no!"
	done

LassBridgetAfterBattleText:
	text "I'm trying to beat"
	line "WHITNEY, but…"
	cont "It's depressing."

	para "I'm okay! If I"
	line "lose, I'll just"

	para "try harder next"
	line "time!"
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

BeautySamanthaSeenText:
	text "Give it your best"
	line "shot, or I'll take"
	cont "you down!"
	done

BeautySamanthaBeatenText:
	text "No! Oh, MEOWTH,"
	line "I'm so sorry!"
	done

BeautySamanthaAfterBattleText:
	text "I taught MEOWTH"
	line "moves for taking"
	cont "on any type…"
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

GoldenrodGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	db 6 ; object events
	object_event 11,  3, SPRITE_MILTON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGymMiltonScript, -1
	object_event  9, 13, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerLassCarrie, -1
	object_event  9,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassBridget, -1
	object_event  5,  1, SPRITE_BREEDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerBreederEmily, -1
	object_event 18,  3, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymGuyScript, -1
