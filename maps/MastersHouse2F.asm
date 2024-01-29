	object_const_def ; object_event constants
	const MASTERSHOUSE2F_CLAIR
	const MASTERSHOUSE2F_LANCE
	const MASTERSHOUSE2F_RIVAL
	const MASTERSHOUSE2F_EKANS

MastersHouse2F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene1 ; SCENE_MASTERS_HOUSE_2F_DEFAULT
	scene_script .DummyScene2 ; SCENE_MASTERS_HOUSE_2F_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Rival

.DummyScene1:
	end

.DummyScene2:
	end

.Rival:
	checkevent EVENT_2F_RIVAL_1
	iftrue .Disappear
	appear MASTERSHOUSE2F_RIVAL
	checkevent EVENT_GOT_DRATINI_FROM_MASTER
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject MASTERSHOUSE2F_RIVAL, 2, 7
	return

.Disappear:
	disappear MASTERSHOUSE2F_RIVAL
	return

.Skip:
	return

TrainerDragonKidClair:
	faceplayer
	opentext
	checkevent EVENT_LOST_FIRST_BATTLE
	iftrue .ClairLost
	checkevent EVENT_BEAT_DRAGON_KID_CLAIR
	iftrue .ClairBeaten
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .LarvitarScript
	writetext DragonKidClairSeenText
	waitbutton
	closetext
	checkevent EVENT_PASSWORD_STUPID
	iftrue .CanLoseToClair
	winlosstext DragonKidClairBeatenText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_DRAGON_KID_CLAIR
	setevent EVENT_BEAT_DRAGON_KID_LANCE
	opentext
	writetext DragonKidClairAfterBattleText
	waitbutton
	closetext
	special HealParty
	sjump Rival1

.LarvitarScript:
	writetext ClairHiText
	waitbutton
	closetext
	end

.ClairBeaten:
	writetext ClairIWontLoseText
	waitbutton
	closetext
	end

.ClairLost:
	writetext LostToClairText
	waitbutton
	closetext
	end

.CanLoseToClair
	winlosstext DragonKidClairBeatenText, 0
	loadtrainer CLAIR, CLAIR1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	ifequal LOSE, .AfterLosingToClair
	setevent EVENT_BEAT_DRAGON_KID_CLAIR
	setevent EVENT_BEAT_DRAGON_KID_LANCE
	opentext
	writetext DragonKidClairAfterBattleText
	waitbutton
	closetext
	special HealParty
	sjump Rival1

.AfterLosingToClair:
	opentext
	writetext LostToClairText
	waitbutton
	closetext
	setevent EVENT_LOST_FIRST_BATTLE
	sjump Rival1

TrainerDragonKidLance:
	faceplayer
	opentext
	checkevent EVENT_LOST_FIRST_BATTLE
	iftrue .LanceLost
	checkevent EVENT_BEAT_DRAGON_KID_LANCE
	iftrue .LanceBeaten
	checkevent EVENT_GOT_DRATINI_FROM_MASTER
	iftrue .DratiniScript
	writetext DragonKidLanceSeenText
	waitbutton
	closetext
	checkevent EVENT_PASSWORD_STUPID
	iftrue .CanLoseToLance
	winlosstext DragonKidLanceBeatenText, 0
	loadtrainer DRAGON_KID, LANCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_DRAGON_KID_LANCE
	setevent EVENT_BEAT_DRAGON_KID_CLAIR
	opentext
	writetext DragonKidLanceAfterBattleText
	waitbutton
	closetext
	special HealParty
	sjump Rival2

.DratiniScript:
	writetext LanceHiText
	waitbutton
	closetext
	end

.LanceBeaten:
	writetext LanceNextTimeText
	waitbutton
	closetext
	end

.LanceLost:
	writetext LostToLanceText
	waitbutton
	closetext
	end

.CanLoseToLance:
	winlosstext DragonKidLanceBeatenText, 0
	loadtrainer DRAGON_KID, LANCE1
	loadvar VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmap
	ifequal LOSE, .AfterLosingToLance
	setevent EVENT_BEAT_DRAGON_KID_LANCE
	setevent EVENT_BEAT_DRAGON_KID_CLAIR
	opentext
	writetext DragonKidLanceAfterBattleText
	waitbutton
	closetext
	special HealParty
	sjump Rival2

.AfterLosingToLance:
	opentext
	writetext LostToLanceText
	waitbutton
	closetext
	setevent EVENT_LOST_FIRST_BATTLE
	sjump Rival2

MastersHouse2FRival1Script:
	faceplayer
	opentext
	writetext ToughKidText
	waitbutton
	closetext
	turnobject MASTERSHOUSE2F_RIVAL, UP
	end

Rival1:
	applymovement MASTERSHOUSE2F_RIVAL, AfterBattleMovement1
	turnobject MASTERSHOUSE2F_RIVAL, UP
	turnobject PLAYER, DOWN
	opentext
	writetext DahliaTheyWereToughText
	waitbutton
	closetext
	applymovement MASTERSHOUSE2F_RIVAL, LeavingRoomMovement1
	disappear MASTERSHOUSE2F_RIVAL
	setscene SCENE_MASTERS_HOUSE_2F_NOTHING
	setevent EVENT_2F_RIVAL_1
	setmapscene MASTERS_HOUSE_1F, SCENE_DONE_WITH_2F
	setevent EVENT_MASTERS_RIVAL_DONE
	end

Rival2:
	applymovement MASTERSHOUSE2F_RIVAL, AfterBattleMovement2
	turnobject MASTERSHOUSE2F_RIVAL, UP
	turnobject PLAYER, DOWN
	opentext
	writetext DahliaTheyWereToughText
	waitbutton
	closetext
	applymovement MASTERSHOUSE2F_RIVAL, LeavingRoomMovement2
	disappear MASTERSHOUSE2F_RIVAL
	setscene SCENE_MASTERS_HOUSE_2F_NOTHING
	setevent EVENT_2F_RIVAL_1
	setmapscene MASTERS_HOUSE_1F, SCENE_DONE_WITH_2F
	setevent EVENT_MASTERS_RIVAL_DONE
	end

MastersHouseDratiniScript:
	refreshscreen
	pokepic DRATINI
	cry DRATINI
	waitbutton
	closepokepic
	opentext
	writetext MastersHouseDratiniText
	waitbutton
	closetext
	end

AfterBattleMovement1:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_resume

AfterBattleMovement2:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_resume

LeavingRoomMovement1:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_resume

LeavingRoomMovement2:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_resume

ClairHiText:
	text "Hi <PLAYER>!"
	line "I'm playing with"
	cont "Dahlia!"
	done

DragonKidClairSeenText:
	text "Hello there,"
	line "<PLAYER>!"

	para "You finally got"
	line "your #mon,"
	cont "huh?"

	para "Let's see what you"
	line "can do!"
	done

DragonKidClairBeatenText:
	text "No way! There must"
	line "be some mistake!"
	done

DragonKidClairAfterBattleText:
	text "No fair! You"
	line "weren't supposed"
	cont "to win!"
	done

ClairIWontLoseText:
	text "I won't lose next"
	line "time!"
	done

LanceHiText:
	text "Hey <PLAYER>!"
	line "I'm playing with"
	cont "Dahlia!"
	done

DragonKidLanceSeenText:
	text "Hey there,"
	line "<PLAYER>!"

	para "Finally got your"
	line "#mon, did you?"

	para "Let's test your"
	line "skills!"
	done

DragonKidLanceBeatenText:
	text "What a battle!"
	done

DragonKidLanceAfterBattleText:
	text "You'll go far,"
	line "<PLAYER>!"
	done

LanceNextTimeText:
	text "Perhaps next time"
	line "you can battle"
	cont "us both!"
	done

ToughKidText:
	text "Wow! I can't"
	line "believe how tough"
	cont "they've gotten!"
	done

DahliaTheyWereToughText:
	text "<RIVAL>: Master"
	line "wasn't joking"
	cont "about his"

	para "grandchildren!"

	para "But, we won, so"
	line "let's go back to"
	cont "him and tell him"

	para "the good news!"
	done

MastersHouseDratiniText:
	text "Dratini: Draa!"
	done

LostToClairText:
	text "Clair: Wow, you're"
	line "not that good!"

	para "No wonder I beat"
	line "you so easily!"
	done

LostToLanceText:
	text "Lance: Train up a"
	line "bit and maybe it'll"
	cont "be different next"

	para "time!"
	done

MastersHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  1, MASTERS_HOUSE_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  2,  6, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerDragonKidClair, -1
	object_event  7,  6, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerDragonKidLance, -1
	object_event, 7,  7, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MastersHouse2FRival1Script, EVENT_2F_RIVAL_1
	object_event, 6, 11, SPRITE_DRATINI, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MastersHouseDratiniScript, -1
