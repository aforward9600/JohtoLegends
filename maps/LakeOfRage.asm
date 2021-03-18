	object_const_def ; object_event constants
	const LAKEOFRAGE_MIYAMOTO
	const LAKEOFRAGE_KRIS ; if Male
	const LAKEOFRAGE_SUPER_NERD1
	const LAKEOFRAGE_POKE_FAN_M_2
	const LAKEOFRAGE_FISHER1
	const LAKEOFRAGE_FISHER2
	const LAKEOFRAGE_POKE_FAN_M
	const LAKEOFRAGE_LASS
	const LAKEOFRAGE_WESLEY
	const LAKEOFRAGE_CHRIS ; if Female
	const LAKEOFRAGE_POKE_BALL1
	const LAKEOFRAGE_POKE_BALL2

LakeOfRage_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_LAKE_OF_RAGE_RIVAL

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Wesley

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	return

.Wesley:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Wesley2
	disappear LAKEOFRAGE_WESLEY
	return

.Wesley2:
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	return

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	return

LakeOfRageMiyamotoScript:
	opentext
	writetext OnlyMagikarpText
	waitbutton
	closetext
	faceplayer
	opentext
	writetext HelloText
	closetext
	winlosstext MiyamotoLossText, 0
	loadtrainer PASSERBY, MIYAMOTO
	startbattle
	reloadmapafterbattle
	opentext
	writetext WillBeKeepingAnEyeText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear LAKEOFRAGE_MIYAMOTO
	pause 15
	special FadeInQuickly
	setevent EVENT_LAKE_OF_RAGE_MIYAMOTO
	clearevent EVENT_MOUNT_MORTAR_HIKER_1
	setevent EVENT_MOUNT_MORTAR_HIKER_2
	end

LakeOfRageRivalScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_MIYAMOTO
	iftrue .BeatMiyamoto
	writetext LakeOfRageRivalScaryText
	waitbutton
	closetext
	turnobject LAKEOFRAGE_KRIS, UP
	end

.BeatMiyamoto:
	writetext LakeOfRageRivalThatWasSomethingText
	waitbutton
	closetext
	end

LakeOfRageSuperNerdScript:
	jumptextfaceplayer LakeOfRageSuperNerdText

LakeOfRageCooltrainerFScript:
	jumptextfaceplayer LakeOfRageCooltrainerFText

LakeOfRageSign:
	jumptext LakeOfRageSignText

MagikarpHouseSignScript:
	opentext
	writetext FishingGurusHouseSignText
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .MagikarpLengthRecord
	waitbutton
	closetext
	end

.MagikarpLengthRecord:
	buttonsound
	special MagikarpHouseSign
	closetext
	end

TrainerFisherAidan:
	trainer FISHER, AIDAN, EVENT_BEAT_FISHER_AIDAN, FisherAidanSeenText, FisherAidanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherAidanAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherNoah:
	trainer FISHER, NOAH, EVENT_BEAT_FISHER_NOAH, FisherNoahSeenText, FisherNoahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherNoahAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end

TrainerLassJackie:
	trainer LASS, JACKIE, EVENT_BEAT_LASS_JACKIE, LassJackieSeenText, LassJackieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassJackieAfterBattleText
	waitbutton
	closetext
	end

WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	buttonsound
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	buttonsound
	verbosegiveitem BLACKBELT
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end

LakeOfRageElixer:
	itemball ELIXER

LakeOfRageTMDetect:
	itemball TM_ROAR

LakeOfRageHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE

LakeOfRageHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY

LakeOfRageHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION

MovementData_0x70155:
	teleport_from
	step_end

OnlyMagikarpText:
	text "Hm…"

	para "This lake is full"
	line "of nothing but"
	cont "Magikarp. What a"

	para "waste."
	done

HelloText:
	text "Oh, sorry. Didn't"
	line "see you there."

	para "Hello. My name is"
	line "Miyamoto. I am a"
	cont "freelance photo-"
	cont "grapher."

	para "I heard some rum-"
	line "mors about a rare"
	cont "#mon here, but"

	para "I've only found"
	line "Magikarp. Hardly"
	cont "rare."

	para "And you are?"

	para "..........Ah,"
	line "<PLAYER>, is it?"

	para "I see that you"
	line "already have a"
	cont "Badge."

	para "Care to see how"
	line "good you really"
	cont "are?"
	done

MiyamotoLossText:
	text "Well, aren't you"
	line "quite the little"
	cont "trainer."
	done

WillBeKeepingAnEyeText:
	text "I'll be continuing"
	line "my journey to snap"
	cont "a rare picture,"

	para "and I'm sure that"
	line "we'll run into"
	cont "each other again."

	para "I'll be keeping an"
	line "eye on your"
	cont "progress."

	para "See ya."
	done

LakeOfRageRivalScaryText:
	text "............"
	line "That woman at the"
	cont "lake...."

	para "She's quite scary."
	line "She looks"
	cont "familiar, but I"

	para "can't remember if"
	line "I've ever seen her"
	cont "before..."
	done

LakeOfRageRivalThatWasSomethingText:
	text ".....Well, that"
	line "was something."

	para "I'm going to stick"
	line "around for a while"
	cont "and look at the"
	cont "scenes."
	done

LakeOfRageSuperNerdText:
	text "I heard this lake"
	line "was made by ram-"
	cont "paging Gyarados."
	done

LakeOfRageCooltrainerFText:
	text "I've always wanted"
	line "a Gyarados, but I"
	cont "don't have the"

	para "time to raise a"
	line "Magikarp. Maybe I"
	cont "can fish one up"

	para "with a better rod."
	done

FisherAidanSeenText:
	text "Fishing and"
	line "battling both"
	cont "require skill and"

	para "patience."
	done

FisherAidanBeatenText:
	text "Apparently I don't"
	line "have the patience"

	para "for either…"
	done

FisherAidanAfterBattleText:
	text "You're a good"
	line "battler, no doubt."

	para "I don't think you"
	line "would compare to"
	cont "me in fishing."
	done

FisherNoahSeenText:
	text "Despite it's name,"
	line "it's real calm"
	cont "here."

	para "Perfect conditions"
	line "for fishing!"
	done

FisherNoahBeatenText:
	text "Not perfect"
	line "conditions for"
	cont "battling, though."
	done

FisherNoahAfterBattleText:
	text "Fishing is always"
	line "a relaxing time."
	done

CooltrainermAaronSeenText:
	text "If a trainer spots"
	line "another trainer,"

	para "he has to make a"
	line "challenge."

	para "That is our"
	line "destiny."
	done

CooltrainermAaronBeatenText:
	text "Whew…"
	line "Good battle."
	done

CooltrainermAaronAfterBattleText:
	text "#MON and their"
	line "trainer become"

	para "powerful through"
	line "constant battling."
	done

LassJackieSeenText:
	text "This lake is so"
	line "pretty, don't you"
	cont "agree?"
	done

LassJackieBeatenText:
	text "Well, I think it"
	line "is."
	done

LassJackieAfterBattleText:
	text "I could stay here"
	line "forever looking at"
	cont "this lake."
	done

MeetWesleyText:
	text "Howdy! They call"
	line "me the Week Guy."

	para "Not weak as in"
	line "strength, but"
	cont "like time."

	para "Since it's"
	line "Wednesday, I'll"
	cont "give you this!"
	done

WesleyGivesGiftText:
	text "Here you go!"
	done

WesleyGaveGiftText:
	text "That's a Black"
	line "Belt! Powers up"
	cont "Fighting-type"
	cont "moves."
	done

WesleyWednesdayText:
	text "Come back on an-"
	line "other Wednesday,"
	cont "if you want!"
	done

WesleyNotWednesdayText:
	text "Hey, it's not"
	line "Wednesday!"
	done

LakeOfRageSignText:
	text "Lake Of Rage,"
	line "also known as"
	cont "Gyarados Lake."
	done

FishingGurusHouseSignText:
	text "Fishing Guru's"
	line "House"
	done

LakeOfRage_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 21, 27, BGEVENT_READ, LakeOfRageSign
	bg_event 25, 31, BGEVENT_READ, MagikarpHouseSignScript
	bg_event 11, 28, BGEVENT_ITEM, LakeOfRageHiddenFullRestore
	bg_event  4,  4, BGEVENT_ITEM, LakeOfRageHiddenRareCandy
	bg_event 31,  2, BGEVENT_ITEM, LakeOfRageHiddenMaxPotion

	db 12 ; object events
	object_event 20, 27, SPRITE_MIYAMOTO, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageMiyamotoScript, EVENT_LAKE_OF_RAGE_MIYAMOTO
	object_event 20, 29, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageRivalScript, EVENT_RIVAL_AT_LAKE_OF_RAGE_1
	object_event 36, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageSuperNerdScript, -1
	object_event 25, 27, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageCooltrainerFScript, -1
	object_event 32, 20, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherAidan, -1
	object_event 28, 24, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherNoah, -1
	object_event  4, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 37,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassJackie, -1
	object_event  4,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	object_event 20, 29, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageRivalScript, EVENT_RIVAL_AT_LAKE_OF_RAGE_2
	object_event  7, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageElixer, EVENT_LAKE_OF_RAGE_ELIXER
	object_event 35,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageTMDetect, EVENT_LAKE_OF_RAGE_TM_DETECT
