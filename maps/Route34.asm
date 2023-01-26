	object_const_def ; object_event constants
	const ROUTE34_COOLTRAINERF
	const ROUTE34_BLACK_BELT
	const ROUTE34_YOUNGSTER
	const ROUTE34_GENTLEMAN
	const ROUTE34_OFFICER
	const ROUTE34_POKEFAN_M
	const ROUTE34_GRAMPS
	const ROUTE34_DAY_CARE_MON_1
	const ROUTE34_DAY_CARE_MON_2
	const ROUTE34_LASS1
	const ROUTE34_LASS2
	const ROUTE34_LASS3
	const ROUTE34_POKE_BALL
	const ROUTE34_NINJA
	const ROUTE34_POKEFAN_M2

Route34_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ROUTE_34_NINJA

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .EggCheckCallback

.DummyScene0:
	end

.DummyScene1:
	pause 15
	special FadeOutMusic
	applymovement PLAYER, PlayerMoveIntoTrapMovement
	pause 15
	appear ROUTE34_NINJA
	applymovement ROUTE34_NINJA, NinjaAmbushesYou1Movement
	turnobject PLAYER, UP
	special HealParty
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	takeitem RAINBOW_WING
	iffalse .TakeSilverWing
	pause 45
	warp TEAM_ROCKET_BASE_JAIL, 5, 6
	blackoutmod TEAM_ROCKET_BASE_JAIL
	setscene SCENE_DEFAULT
	setevent EVENT_ROUTE_34_NINJA
	clearevent EVENT_ROUTE_34_OFFICER
	end

.TakeSilverWing:
	takeitem SILVER_WING
	pause 45
	warp TEAM_ROCKET_BASE_JAIL, 5, 6
	blackoutmod TEAM_ROCKET_BASE_JAIL
	setscene SCENE_DEFAULT
	setevent EVENT_ROUTE_34_NINJA
	clearevent EVENT_ROUTE_34_OFFICER
	end

.EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	sjump .CheckMon1

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	sjump .CheckMon1

.CheckMon1:
	checkflag ENGINE_DAY_CARE_MAN_HAS_MON
	iffalse .HideMon1
	clearevent EVENT_DAY_CARE_MON_1
	sjump .CheckMon2

.HideMon1:
	setevent EVENT_DAY_CARE_MON_1
	sjump .CheckMon2

.CheckMon2:
	checkflag ENGINE_DAY_CARE_LADY_HAS_MON
	iffalse .HideMon2
	clearevent EVENT_DAY_CARE_MON_2
	return

.HideMon2:
	setevent EVENT_DAY_CARE_MON_2
	return

DayCareManScript_Outside:
	faceplayer
	opentext
	special DayCareManOutside
	waitbutton
	closetext
	ifequal TRUE, .end_fail
	clearflag ENGINE_DAY_CARE_MAN_HAS_EGG
	readvar VAR_FACING
	ifequal RIGHT, .walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
.end_fail
	end

.walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
	end

DayCareMon1Script:
	opentext
	special DayCareMon1
	closetext
	end

DayCareMon2Script:
	opentext
	special DayCareMon2
	closetext
	end

TrainerCooltrainerFTina:
	trainer COOLTRAINERF, TINA, EVENT_BEAT_COOLTRAINERF_TINA, CooltrainerFTinaSeenText, CooltrainerFTinaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFTinaRematchText
	yesorno
	iffalse .Refused
	playmusic MUSIC_BEAUTY_ENCOUNTER
	writetext CooltrainerFTinaLetsDoItText
	waitbutton
	winlosstext CooltrainerFTinaBeatenText, 0
	loadtrainer COOLTRAINERF, TINA
	startbattle
	reloadmapafterbattle
	closetext
	end

.Refused:
	writetext CooltrainerFTinaRefusedText
	waitbutton
	closetext
	end

TrainerBlackbeltSatoru:
	trainer BLACKBELT_T, SATORU, EVENT_BEAT_BLACKBELT_SATORU, BlackbeltSatoruSeenText, BlackbeltSatoruBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltSatoruAfterText
	waitbutton
	closetext
	end

TrainerGentlemanFrank:
	trainer GENTLEMAN, FRANK, EVENT_BEAT_GENTLEMAN_FRANK, GentlemanFrankSeenText, GentlemanFrankBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanFrankAfterText
	waitbutton
	closetext
	end

OfficerKeithScript:
	faceplayer
	opentext
	checkevent EVENT_KOGA_SAVES_YOU_FROM_JAIL
	iftrue .NoFight
	writetext OfficerKeithAfterText
	waitbutton
	closetext
	end

.NoFight:
	writetext OfficerKeithDaytimeText
	waitbutton
	closetext
	end

TrainerSchoolboyGregory:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyGregorySeenText, SchoolboyGregoryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyGregoryAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerfIrene:
	trainer LASS, LAURA, EVENT_BEAT_LASS_IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfIreneAfterText1
	waitbutton
	closetext
	end

.GotSoftSand:
	writetext CooltrainerfIreneAfterText2
	waitbutton
	closetext
	end

TrainerCooltrainerfJenn:
	trainer LASS, CONNIE1, EVENT_BEAT_LASS_JENN, CooltrainerfJennSeenText, CooltrainerfJennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfJennAfterText1
	waitbutton
	closetext
	end

.GotSoftSand:
	writetext CooltrainerfJennAfterText2
	waitbutton
	closetext
	end

TrainerCooltrainerfKate:
	trainer LASS, LINDA, EVENT_BEAT_LASS_KATE, CooltrainerfKateSeenText, CooltrainerfKateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfKateOfferSoftSandText
	buttonsound
	verbosegiveitem SOFT_SAND
	iffalse .BagFull
	setevent EVENT_GOT_SOFT_SAND_FROM_KATE
.GotSoftSand:
	writetext CooltrainerfKateAfterText
	waitbutton
.BagFull:
	closetext
	end

Route34Guard1:
	jumptextfaceplayer ForestGuardianText

Route34Guard2:
	jumptextfaceplayer TakingPicturesText

Route34IlexForestSign:
; unused
	jumptext Route34IlexForestSignText

Route34Sign:
	jumptext Route34SignText

Route34TrainerTips:
	jumptext Route34TrainerTipsText

DayCareSign:
	jumptext DayCareSignText

Route34Nugget:
	itemball NUGGET

Route34HiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_34_HIDDEN_RARE_CANDY

Route34HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_34_HIDDEN_SUPER_POTION

Route34MovementData_DayCareManWalksBackInside:
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	step_end

Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer:
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	slow_step UP
	step_end

PlayerMoveIntoTrapMovement:
	step LEFT
	step LEFT
	step_end

NinjaAmbushesYou1Movement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

NinjaAmbushesYou2Movement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

SchoolboyGregorySeenText:
	text "I've come here to"
	line "observe Egg-making"
	cont "in person!"

	para "This will surely"
	line "get me an A!"
	done

SchoolboyGregoryBeatenText:
	text "That was probably"
	line "an F…"
	done

YoungsterSamuelMobileText:
	text "Have you been to"
	line "GOLDENROD CITY?"

	para "Weren't you amazed"
	line "by how they've"

	para "changed the"
	line "#MON CENTER?"
	done

SchoolboyGregoryAfterText:
	text "Eggs are so"
	line "mysterious!"

	para "It seems like the"
	line "top researchers"
	cont "aren't even look-"
	cont "into them…"

	para "Maybe I can be the"
	line "first!"
	done

CooltrainerFTinaSeenText:
	text "You comin' to see"
	line "the #mon Day-"
	cont "Care?"

	para "It's the only"
	line "thing to do here."
	done

CooltrainerFTinaBeatenText:
	text "Looks like you"
	line "don't need the"
	cont "Day-Care!"
	done

CooltrainerFTinaRematchText:
	text "You here to see"
	line "the Day-Care"
	cont "again?"

	para "Or are you here"
	line "to see me?"
	done

CooltrainerFTinaLetsDoItText:
	text "Sounds good!"
	done

CooltrainerFTinaRefusedText:
	text "Like I said,"

	para "people only come"
	line "here to see the"
	cont "Day-Care…"
	done

GentlemanFrankSeenText:
	text "Ah…"

	para "The Day-Care has"
	line "always supplied me"
	cont "with comfort,"
	cont "especially the"
	cont "sounds…"

	para "………What?"

	para "That's not weird!"

	para "I, uh, have a"
	line "scientific"
	cont "curiosity!"

	para "…Yeah, that's it!"
	done

GentlemanFrankBeatenText:
	text "It's not weird, I"
	line "swear!"
	done

GentlemanFrankAfterText:
	text "Just go away, and"
	line "forget this"
	cont "happened, OK?"
	done

OfficerKeithAfterText:
	text "Looks like every-"
	line "thing's A-OK right"
	cont "now."

	para "No suspicious"
	line "activity here."
	done

OfficerKeithDaytimeText:
	text "Ugh…"

	para "Didn't see that"
	line "guy coming…"

	para "He knocked me out"
	line "and hid me in the"
	cont "trees!"

	para "Talk about low…"
	done

CooltrainerfIreneSeenText:
	text "Irene: Kyaaah!"
	line "Someone found us!"
	done

CooltrainerfIreneBeatenText:
	text "Irene: Ohhh!"
	line "Too strong!"
	done

CooltrainerfIreneAfterText1:
	text "Irene: My sister"
	line "Kate will get you"
	cont "for this!"
	done

CooltrainerfIreneAfterText2:
	text "Irene: Isn't this"
	line "beach great?"

	para "It's our secret"
	line "little getaway!"
	done

CooltrainerfJennSeenText:
	text "Jenn: You can't"
	line "beat Irene and go"
	cont "unpunished!"
	done

CooltrainerfJennBeatenText:
	text "Jenn: So sorry,"
	line "Irene! Sis!"
	done

CooltrainerfJennAfterText1:
	text "Jenn: Don't get"
	line "cocky! My sister"
	cont "Kate is tough!"
	done

CooltrainerfJennAfterText2:
	text "Jenn: Sunlight"
	line "makes your body"
	cont "stronger."
	done

CooltrainerfKateSeenText:
	text "Kate: You sure"
	line "were mean to my"
	cont "little sisters!"
	done

CooltrainerfKateBeatenText:
	text "Kate: No! I can't"
	line "believe I lost."
	done

CooltrainerfKateOfferSoftSandText:
	text "Kate: You're too"
	line "strong. I didn't"
	cont "stand a chance."

	para "Here. You deserve"
	line "this."
	done

CooltrainerfKateAfterText:
	text "Kate: I'm sorry we"
	line "jumped you."

	para "We never expected"
	line "anyone to find us"

	para "here. You sure"
	line "startled us."
	done

Route34IlexForestSignText:
; unused
	text "Ilex Forest"
	line "through the gate"
	done

Route34SignText:
	text "Route 34"

	para "Goldenrod City -"
	line "Azalea Town"

	para "Ilex Forest"
	line "somewhere between"
	done

Route34TrainerTipsText:
	text "Trainer Tips"

	para "Berry trees grow"
	line "new Berries"
	cont "every day."

	para "Make a note of"
	line "which trees bear"
	cont "which Berries."
	done

DayCareSignText:
	text "Day-Care"

	para "Let us raise your"
	line "#mon for you!"
	done

ForestGuardianText:
	text "Get lost kid!"

	para "The guardian of"
	line "Ilex Forest has"
	cont "been spotted!"

	para "You'll scare it"
	line "away!"
	done

TakingPicturesText:
	text "We're taking pics"
	line "of the guardian,"
	cont "so scram!"
	done

BlackbeltSatoruSeenText:
	text "Remember, our"
	line "world is bigger"
	cont "than just Johto…"
	done

BlackbeltSatoruBeatenText:
	text "Bigger than all of"
	line "us…"
	done

BlackbeltSatoruAfterText:
	text "To think that"
	line "Kanto is cut off"
	cont "from us here…"

	para "I can only hope"
	line "that the two"
	cont "regions can come"
	cont "together as one"
	cont "someday…"
	done

Route34_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13, 37, ROUTE_34_ILEX_FOREST_GATE, 1
	warp_event 14, 37, ROUTE_34_ILEX_FOREST_GATE, 2
	warp_event 11, 14, DAY_CARE, 1
	warp_event 11, 15, DAY_CARE, 2
	warp_event 13, 15, DAY_CARE, 3

	db 0 ; coord events

	db 5 ; bg events
	bg_event 12,  6, BGEVENT_READ, Route34Sign
	bg_event 13, 33, BGEVENT_READ, Route34TrainerTips
	bg_event 10, 13, BGEVENT_READ, DayCareSign
	bg_event  8, 32, BGEVENT_ITEM, Route34HiddenRareCandy
	bg_event 17, 19, BGEVENT_ITEM, Route34HiddenSuperPotion

	db 15 ; object events
	object_event 13,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerCooltrainerFTina, -1
	object_event 16, 30, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltSatoru, -1
	object_event 11, 20, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyGregory, -1
	object_event 10, 26, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerGentlemanFrank, -1
	object_event  9, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OfficerKeithScript, EVENT_ROUTE_34_OFFICER
	object_event 13, 37, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route34Guard1, EVENT_OPEN_ILEX_FOREST
	object_event 15, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Outside, EVENT_DAY_CARE_MAN_ON_ROUTE_34
	object_event 14, 18, SPRITE_DAY_CARE_MON_1, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon1Script, EVENT_DAY_CARE_MON_1
	object_event 17, 19, SPRITE_DAY_CARE_MON_2, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon2Script, EVENT_DAY_CARE_MON_2
	object_event 11, 48, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerCooltrainerfIrene, -1
	object_event  3, 48, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJenn, -1
	object_event  6, 51, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKate, -1
	object_event  7, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route34Nugget, EVENT_ROUTE_34_NUGGET
	object_event  9, 10, SPRITE_NINJA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_34_NINJA
	object_event 14, 37, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route34Guard2, EVENT_OPEN_ILEX_FOREST
