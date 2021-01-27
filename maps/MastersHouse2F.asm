	object_const_def ; object_event constants
	const MASTERSHOUSE2F_CLAIR
	const MASTERSHOUSE2F_LANCE
	const MASTERSHOUSE2F_KRIS ; if Male
	const MASTERSHOUSE2F_EKANS
	const MASTERSHOUSE2F_CHRIS ; if Female

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
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	checkevent EVENT_2F_RIVAL_1
	iftrue .Disappear
	disappear MASTERSHOUSE2F_CHRIS
	appear MASTERSHOUSE2F_KRIS
	checkevent EVENT_GOT_DRATINI_FROM_MASTER
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject MASTERSHOUSE2F_KRIS, 2, 7
	return

.Female:
	checkevent EVENT_2F_RIVAL_2
	iftrue .Disappear
	disappear MASTERSHOUSE2F_KRIS
	appear MASTERSHOUSE2F_CHRIS
	checkevent EVENT_GOT_DRATINI_FROM_MASTER
	iftrue .Skip
	moveobject MASTERSHOUSE2F_CHRIS, 2, 7
	return

.Disappear:
	disappear MASTERSHOUSE2F_KRIS
	disappear MASTERSHOUSE2F_CHRIS
	return

.Skip:
	return

TrainerDragonKidClair:
	checkevent EVENT_BEAT_DRAGON_KID_CLAIR
	iftrue .ClairBeaten
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .LarvitarScript
	faceplayer
	opentext
	writetext DragonKidClairSeenText
	waitbutton
	closetext
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
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female4
	sjump Rival1

.Female4:
	sjump Rival3

.LarvitarScript:
	faceplayer
	opentext
	writetext ClairHiText
	waitbutton
	closetext
	end

.ClairBeaten:
	faceplayer
	opentext
	writetext ClairIWontLoseText
	waitbutton
	closetext
	end

TrainerDragonKidLance:
	checkevent EVENT_BEAT_DRAGON_KID_LANCE
	iftrue .LanceBeaten
	checkevent EVENT_GOT_DRATINI_FROM_MASTER
	iftrue .DratiniScript
	faceplayer
	opentext
	writetext DragonKidLanceSeenText
	waitbutton
	closetext
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
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female5
	sjump Rival2

.Female5:
	sjump Rival4

.DratiniScript:
	faceplayer
	opentext
	writetext LanceHiText
	waitbutton
	closetext
	end

.LanceBeaten:
	faceplayer
	opentext
	writetext LanceNextTimeText
	waitbutton
	closetext
	end

MastersHouse2FRival1Script:
	faceplayer
	opentext
	writetext ToughKidText
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female3
	turnobject MASTERSHOUSE2F_KRIS, UP
	end

.Female3:
	turnobject MASTERSHOUSE2F_CHRIS, UP
	end

Rival1:
	applymovement MASTERSHOUSE2F_KRIS, AfterBattleMovement1
	turnobject MASTERSHOUSE2F_KRIS, UP
	turnobject PLAYER, DOWN
	opentext
	writetext TheyWereToughText
	waitbutton
	closetext
	applymovement MASTERSHOUSE2F_KRIS, LeavingRoomMovement1
	disappear MASTERSHOUSE2F_KRIS
	setscene SCENE_MASTERS_HOUSE_2F_NOTHING
	setevent EVENT_2F_RIVAL_1
	setmapscene MASTERS_HOUSE_1F, SCENE_DONE_WITH_2F
	setevent EVENT_MASTERS_RIVAL_DONE
	end

Rival2:
	applymovement MASTERSHOUSE2F_KRIS, AfterBattleMovement2
	turnobject MASTERSHOUSE2F_KRIS, UP
	turnobject PLAYER, DOWN
	opentext
	writetext TheyWereToughText
	waitbutton
	closetext
	applymovement MASTERSHOUSE2F_KRIS, LeavingRoomMovement2
	disappear MASTERSHOUSE2F_KRIS
	setscene SCENE_MASTERS_HOUSE_2F_NOTHING
	setevent EVENT_2F_RIVAL_1
	setmapscene MASTERS_HOUSE_1F, SCENE_DONE_WITH_2F
	setevent EVENT_MASTERS_RIVAL_DONE
	end

Rival3:
	applymovement MASTERSHOUSE2F_CHRIS, AfterBattleMovement1
	turnobject MASTERSHOUSE2F_CHRIS, UP
	turnobject PLAYER, DOWN
	opentext
	writetext TheyWereToughText
	waitbutton
	closetext
	applymovement MASTERSHOUSE2F_CHRIS, LeavingRoomMovement1
	disappear MASTERSHOUSE2F_CHRIS
	setscene SCENE_MASTERS_HOUSE_2F_NOTHING
	setevent EVENT_2F_RIVAL_2
	setmapscene MASTERS_HOUSE_1F, SCENE_DONE_WITH_2F
	setevent EVENT_MASTERS_RIVAL_DONE
	end


Rival4:
	applymovement MASTERSHOUSE2F_CHRIS, AfterBattleMovement2
	turnobject MASTERSHOUSE2F_CHRIS, UP
	turnobject PLAYER, DOWN
	opentext
	writetext TheyWereToughText
	waitbutton
	closetext
	applymovement MASTERSHOUSE2F_CHRIS, LeavingRoomMovement2
	disappear MASTERSHOUSE2F_CHRIS
	setscene SCENE_MASTERS_HOUSE_2F_NOTHING
	setevent EVENT_2F_RIVAL_2
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
	step_end

AfterBattleMovement2:
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

LeavingRoomMovement1:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

LeavingRoomMovement2:
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

ClairHiText:
	text "Hi <PLAYER>!"
	line "I'm playing with"
	cont "Dahlia!"
	done

DragonKidClairSeenText:
	text "Hi <PLAYER>!"
	line "Are you here to"
	cont "play? Yay! I won't"

	para "lose!"
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
	line "next time!"
	done

LanceHiText:
	text "Hey <PLAYER>!"
	line "I'm playing with"
	cont "Dahlia!"
	done

DragonKidLanceSeenText:
	text "Hey there,"
	line "<PLAYER>!"

	para "Did Grandpa send"
	line "you to play with"
	cont "us?"

	para "Let's play, then!"
	done

DragonKidLanceBeatenText:
	text "That was fun!"
	done

DragonKidLanceAfterBattleText:
	text "Someday, I'll be"
	line "as strong as you!"
	done

LanceNextTimeText:
	text "Perhaps next time"
	line "you can play with"
	cont "us both!"
	done

ToughKidText:
	text "Wow! This kid is"
	line "tough!"
	done

TheyWereToughText:
	text "Master wasn't"
	line "joking about his"
	cont "grandchildren!"

	para "But, we won, so"
	line "let's go back to"
	cont "him and tell him"

	para "the good news!"
	done

MastersHouseDratiniText:
	text "Dratini: Draa!"
	done

MastersHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  1, MASTERS_HOUSE_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  2,  6, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerDragonKidClair, -1
	object_event  7,  6, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerDragonKidLance, -1
	object_event, 7,  7, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MastersHouse2FRival1Script, EVENT_2F_RIVAL_1
	object_event, 6, 11, SPRITE_EKANS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MastersHouseDratiniScript, -1
	object_event, 7,  7, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MastersHouse2FRival1Script, EVENT_2F_RIVAL_2
