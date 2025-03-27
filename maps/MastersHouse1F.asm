	object_const_def ; object_event constants
	const MASTERSHOUSE1F_MASTER
	const MASTERSHOUSE1F_RIVAL
	const MASTERSHOUSE1F_POKE_BALL1
	const MASTERSHOUSE1F_POKE_BALL2

MastersHouse1F_MapScripts:
	db 4 ; scene scripts
	scene_script .MeetMaster ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_CANT_LEAVE_HOUSE
	scene_script .DummyScene2 ; SCENE_MASTERS_HOUSE_1F_NOTHING
	scene_script .DummyScene3 ; SCENE_DONE_WITH_2F

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MasterWeekends

.MasterWeekends:
	checkevent EVENT_BEAT_MASTER
	iftrue .IsItWeekend
	return

.IsItWeekend:
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .MasterAppears
	ifequal SUNDAY, .MasterAppears
	disappear MASTERSHOUSE1F_MASTER
	return

.MasterAppears:
	appear MASTERSHOUSE1F_MASTER
	return

.MeetMaster:
	prioritysjump WalkUpToRival
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

WalkUpToRival:
	appear MASTERSHOUSE1F_RIVAL
	applymovement PLAYER, MastersHouse1F_WalkUpMovement
	turnobject MASTERSHOUSE1F_RIVAL, LEFT
	opentext
	writetext HeySleepyHeadText
	waitbutton
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, UP
	turnobject PLAYER, UP
	applymovement MASTERSHOUSE1F_MASTER, MastersHouse1F_MastersMovement
	opentext
	writetext GoodOfYouText
	waitbutton
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext GoodSportText
	waitbutton
	setscene SCENE_CANT_LEAVE_HOUSE
	closetext
	scall MasterPasswordCheck
	end

TryToLeaveHouseScript:
	opentext
	writetext WhereDoYouThinkYoureGoingText
	waitbutton
	closetext
	applymovement PLAYER, MastersHouse1F_CantLeaveMovement
	end

MaastersHouseMasterScript:
	checkevent EVENT_BEAT_MASTER
	iftrue .MasterBeaten
	checkevent EVENT_MASTERS_RIVAL_DONE
	iftrue .MasterGoodLuck
	checkevent EVENT_BEAT_DRAGON_KID_CLAIR
	iftrue .BeatDragonKid1
	checkevent EVENT_BEAT_DRAGON_KID_LANCE
	iftrue .BeatDragonKid2
	jumptextfaceplayer MastersHouseMasterText

.MasterGoodLuck:
	jumptextfaceplayer MasterGoodLuckText

.BeatDragonKid1:
	jumptextfaceplayer HmText

.BeatDragonKid2:
	jumptextfaceplayer HmText

.MasterBeaten:
	jumptextfaceplayer MasterBeatenText

MastersHouseRivalScript:
	jumptextfaceplayer MastersHouseRivalText

MastersHouseRival2Script:
	jumptextfaceplayer MastersHouseRivalText

DratiniPokeballScript:
	refreshscreen
	checkevent EVENT_PASSWORD_PSEUDOSWAP
	iftrue ChooseBagon
	checkevent EVENT_PASSWORD_MYTHICAL
	iftrue ChooseMew
	checkevent EVENT_PASSWORD_EXPERIMENT
	iftrue ChooseMewtwo
	checkevent EVENT_PASSWORD_COMMENCE
	iftrue ChooseEevee
	checkevent EVENT_PASSWORD_STUPID
	iftrue ChooseMagikarp
	checkevent EVENT_PASSWORD_BAMBINO
	iftrue ChooseElekid
	checkevent EVENT_PASSWORD_EXTINCT
	iftrue ChooseOmanyte
	pokepic DRATINI
	cry DRATINI
	waitbutton
	closepokepic
	opentext
	writetext TakeDratiniText
	yesorno
	iffalse DidntChooseDratiniScript
	disappear MASTERSHOUSE1F_POKE_BALL1
	setevent EVENT_GOT_DRATINI_FROM_MASTER
	writetext ChoseDratiniText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, DRATINI
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke DRATINI, 5, ORAN_BERRY
	closetext
	sjump RivalLarvitarScript

ChooseBagon:
	pokepic BAGON
	cry BAGON
	waitbutton
	closepokepic
	opentext
	writetext TakeBagonText
	yesorno
	iffalse DidntChooseDratiniScript
	disappear MASTERSHOUSE1F_POKE_BALL1
	setevent EVENT_GOT_DRATINI_FROM_MASTER
	writetext ChoseBagonText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, BAGON
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke BAGON, 5, ORAN_BERRY
	closetext
	sjump RivalLarvitarScript

ChooseMew:
	pokepic MEW
	cry MEW
	waitbutton
	closepokepic
	opentext
	writetext TakeMewText
	yesorno
	iffalse DidntChooseDratiniScript
	disappear MASTERSHOUSE1F_POKE_BALL1
	setevent EVENT_GOT_DRATINI_FROM_MASTER
	writetext ChoseMewText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, MEW
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke MEW, 5, ORAN_BERRY
	closetext
	sjump RivalLarvitarScript

ChooseEevee:
	pokepic EEVEE
	cry EEVEE
	waitbutton
	closepokepic
	opentext
	writetext TakeEeveeText
	yesorno
	iffalse DidntChooseDratiniScript
	disappear MASTERSHOUSE1F_POKE_BALL1
	setevent EVENT_GOT_DRATINI_FROM_MASTER
	writetext ChoseEeveeText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, EEVEE
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke EEVEE, 5, ORAN_BERRY
	closetext
	sjump RivalLarvitarScript

ChooseMagikarp:
	pokepic MAGIKARP
	cry MAGIKARP
	waitbutton
	closepokepic
	opentext
	writetext TakeMagikarpText
	yesorno
	iffalse DidntChooseDratiniScript
	disappear MASTERSHOUSE1F_POKE_BALL1
	setevent EVENT_GOT_DRATINI_FROM_MASTER
	writetext ChoseMagikarpText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, MAGIKARP
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke MAGIKARP, 5, ORAN_BERRY
	closetext
	sjump RivalLarvitarScript

ChooseElekid:
	pokepic ELEKID
	cry ELEKID
	waitbutton
	closepokepic
	opentext
	writetext TakeElekidText
	yesorno
	iffalse DidntChooseDratiniScript
	disappear MASTERSHOUSE1F_POKE_BALL1
	setevent EVENT_GOT_DRATINI_FROM_MASTER
	writetext ChoseElekidText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, ELEKID
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke ELEKID, 5, ORAN_BERRY
	closetext
	sjump RivalLarvitarScript

ChooseMewtwo:
	pokepic MEWTWO
	cry MEWTWO
	waitbutton
	closepokepic
	opentext
	writetext TakeMewtwoText
	yesorno
	iffalse DidntChooseDratiniScript
	disappear MASTERSHOUSE1F_POKE_BALL1
	setevent EVENT_GOT_DRATINI_FROM_MASTER
	writetext ChoseMewtwoText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, MEWTWO
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke MEWTWO, 5, ORAN_BERRY
	closetext
	sjump RivalLarvitarScript

ChooseOmanyte:
	pokepic OMANYTE
	cry OMANYTE
	waitbutton
	closepokepic
	opentext
	writetext TakeOmanyteText
	yesorno
	iffalse DidntChooseDratiniScript
	disappear MASTERSHOUSE1F_POKE_BALL1
	setevent EVENT_GOT_DRATINI_FROM_MASTER
	writetext ChoseOmanyteText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, OMANYTE
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke OMANYTE, 5, ORAN_BERRY
	closetext
	sjump RivalLarvitarScript

LarvitarPokeballScript:
	refreshscreen
	checkevent EVENT_PASSWORD_PSEUDOSWAP
	iftrue ChooseGible
	checkevent EVENT_PASSWORD_MYTHICAL
	iftrue ChooseCelebi
	checkevent EVENT_PASSWORD_EXPERIMENT
	iftrue ChooseMissingno
	checkevent EVENT_PASSWORD_COMMENCE
	iftrue ChoosePikachu
	checkevent EVENT_PASSWORD_BAMBINO
	iftrue ChooseMagby
	checkevent EVENT_PASSWORD_STUPID
	iftrue ChooseMagikarp2
	checkevent EVENT_PASSWORD_EXTINCT
	iftrue ChooseKabuto
	pokepic LARVITAR
	cry LARVITAR
	waitbutton
	closepokepic
	opentext
	writetext TakeLarvitarText
	yesorno
	iffalse DidntChooseLarvitarScript
	disappear MASTERSHOUSE1F_POKE_BALL2
	setevent EVENT_GOT_LARVITAR_FROM_MASTER
	writetext ChoseLarvitarText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, LARVITAR
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke LARVITAR, 5, ORAN_BERRY
	closetext
	sjump RivalDratiniScript

ChooseCelebi:
	pokepic CELEBI
	cry CELEBI
	waitbutton
	closepokepic
	opentext
	writetext TakeCelebiText
	yesorno
	iffalse DidntChooseDratiniScript
	disappear MASTERSHOUSE1F_POKE_BALL2
	setevent EVENT_GOT_LARVITAR_FROM_MASTER
	writetext ChoseCelebiText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, CELEBI
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CELEBI, 5, ORAN_BERRY
	closetext
	sjump RivalDratiniScript

ChooseGible:
	pokepic GIBLE
	cry GIBLE
	waitbutton
	closepokepic
	opentext
	writetext TakeGibleText
	yesorno
	iffalse DidntChooseLarvitarScript
	disappear MASTERSHOUSE1F_POKE_BALL2
	setevent EVENT_GOT_LARVITAR_FROM_MASTER
	writetext ChoseGibleText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, GIBLE
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke GIBLE, 5, ORAN_BERRY
	closetext
	sjump RivalDratiniScript

ChooseMissingno:
	pokepic MISSINGNO
	cry MISSINGNO
	waitbutton
	closepokepic
	opentext
	writetext TakeMissingnoText
	yesorno
	iffalse DidntChooseLarvitarScript
	disappear MASTERSHOUSE1F_POKE_BALL2
	setevent EVENT_GOT_LARVITAR_FROM_MASTER
	writetext ChoseMissingnoText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, MISSINGNO
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke MISSINGNO, 5, ORAN_BERRY
	closetext
	sjump RivalDratiniScript

ChooseMagby:
	pokepic MAGBY
	cry MAGBY
	waitbutton
	closepokepic
	opentext
	writetext TakeMagbyText
	yesorno
	iffalse DidntChooseLarvitarScript
	disappear MASTERSHOUSE1F_POKE_BALL2
	setevent EVENT_GOT_LARVITAR_FROM_MASTER
	writetext ChoseMagbyText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, MAGBY
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke MAGBY, 5, ORAN_BERRY
	closetext
	sjump RivalDratiniScript

ChoosePikachu:
	pokepic PIKACHU
	cry PIKACHU
	waitbutton
	closepokepic
	opentext
	writetext TakePikachuText
	yesorno
	iffalse DidntChooseLarvitarScript
	disappear MASTERSHOUSE1F_POKE_BALL2
	setevent EVENT_GOT_LARVITAR_FROM_MASTER
	writetext ChosePikachuText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, PIKACHU
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke PIKACHU, 5, ORAN_BERRY
	closetext
	sjump RivalDratiniScript

ChooseMagikarp2:
	pokepic MAGIKARP
	cry MAGIKARP
	waitbutton
	closepokepic
	opentext
	writetext TakeMagikarpText
	yesorno
	iffalse DidntChooseLarvitarScript
	disappear MASTERSHOUSE1F_POKE_BALL2
	setevent EVENT_GOT_LARVITAR_FROM_MASTER
	writetext ChoseMagikarpText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, MAGIKARP
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke MAGIKARP, 5, ORAN_BERRY
	closetext
	sjump RivalDratiniScript

ChooseKabuto:
	pokepic KABUTO
	cry KABUTO
	waitbutton
	closepokepic
	opentext
	writetext TakeKabutoText
	yesorno
	iffalse DidntChooseLarvitarScript
	disappear MASTERSHOUSE1F_POKE_BALL1
	setevent EVENT_GOT_DRATINI_FROM_MASTER
	writetext ChoseKabutoText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, KABUTO
	writetext RecievedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke KABUTO, 5, ORAN_BERRY
	closetext
	sjump RivalLarvitarScript

DidntChooseDratiniScript:
	writetext DidntChooseDratiniText
	waitbutton
	closetext
	end

DidntChooseLarvitarScript:
	writetext DidntChooseLarvitarText
	waitbutton
	closetext
	end

RivalLarvitarScript:
	applymovement MASTERSHOUSE1F_RIVAL, MastersHouse1F_RivalLarvitarMovement
	disappear MASTERSHOUSE1F_POKE_BALL2
	opentext
	writetext RivalChoseText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, LARVITAR
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	writetext RivalStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext IsntItCuteText
	waitbutton
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, UP
	turnobject PLAYER, UP
	sjump MastersTestScript1

.Female:
	writetext RivalStarter2Text
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext HehToughMonText
	waitbutton
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, UP
	turnobject PLAYER, UP
	sjump MastersTestScript1

RivalDratiniScript:
	applymovement MASTERSHOUSE1F_RIVAL, MastersHouse1F_RivalDratiniMovement
	disappear MASTERSHOUSE1F_POKE_BALL1
	opentext
	writetext RivalChoseText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, DRATINI
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female2
	writetext RivalStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext IsntItCuteText
	waitbutton
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, UP
	turnobject PLAYER, UP
	sjump MastersTestScript2

.Female2:
	writetext RivalStarter2Text
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext HehToughMonText
	waitbutton
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, UP
	turnobject PLAYER, UP
	sjump MastersTestScript2

MastersTestScript1:
	opentext
	writetext MastersTestText
	waitbutton
	closetext
	opentext
	writetext LetsStartText
	waitbutton
	closetext
	applymovement MASTERSHOUSE1F_RIVAL, HeadUpstairs1Movement
	playsound SFX_EXIT_BUILDING
	disappear MASTERSHOUSE1F_RIVAL
	setscene SCENE_CANT_LEAVE_HOUSE
	setevent EVENT_GOT_A_POKEMON_FROM_MASTER
	setevent EVENT_RIVAL_AT_MASTERS_HOUSE_1
	waitsfx
	end

MastersTestScript2:
	opentext
	writetext MastersTestText
	waitbutton
	closetext
	opentext
	writetext LetsStartText
	waitbutton
	closetext
	applymovement MASTERSHOUSE1F_RIVAL, HeadUpstairs2Movement
	playsound SFX_EXIT_BUILDING
	disappear MASTERSHOUSE1F_RIVAL
	setscene SCENE_CANT_LEAVE_HOUSE
	setevent EVENT_GOT_A_POKEMON_FROM_MASTER
	setevent EVENT_RIVAL_AT_MASTERS_HOUSE_1
	waitsfx
	end

FinishTutorialScript:
	checkevent EVENT_2F_RIVAL_1
	iftrue .JourneyStart2
	end

.JourneyStart2:
	appear MASTERSHOUSE1F_RIVAL
	sjump WalkUpToRival2
	end

WalkUpToRival2:
	applymovement PLAYER, PlayerMovesToRivalMovement
	turnobject PLAYER, UP
	applymovement MASTERSHOUSE1F_MASTER, MastersLastMovement
	opentext
	checkevent EVENT_LOST_FIRST_BATTLE
	iftrue .MasterUnfortunate
	writetext CongratulationsText
.MasterFinish:
	waitbutton
	closetext
	opentext
	writetext ThankYouText
	waitbutton
	closetext
	turnobject MASTERSHOUSE1F_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext ImOffText
	buttonsound
	getitemname STRING_BUFFER_4, POKE_BALL
	scall Rival_ReceiveTheBalls
	giveitem POKE_BALL, 10
	buttonsound
	itemnotify
	writetext RivalGoodByeText
	waitbutton
	closetext
	applymovement MASTERSHOUSE1F_RIVAL, RivalLeaves1Movement
	playsound SFX_EXIT_BUILDING
	disappear MASTERSHOUSE1F_RIVAL
	setscene SCENE_MASTERS_HOUSE_1F_NOTHING
	setevent EVENT_MASTERS_RIVAL_DONE
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	waitsfx
	applymovement MASTERSHOUSE1F_MASTER, MasterLastMovement
	turnobject PLAYER, UP
	opentext
	writetext TalkToGranny
	waitbutton
	checkevent EVENT_PASSWORD_CHEATER
	iftrue .GiveCandyPouch
	closetext
	end

.GiveCandyPouch
	writetext TakeCandyPouchText
	buttonsound
	verbosegiveitem CANDY_POUCH
	closetext
	end

.MasterUnfortunate:
	writetext MasterUnfortunateText
	sjump .MasterFinish

Rival_ReceiveTheBalls:
	jumpstd receiveitem
	end

MasterPasswordCheck:
	checkevent EVENT_PASSWORD_SET
	iftrue .stop
	setevent EVENT_PASSWORD_SET
	callasm .pseudoswap
	iftrue .pseudoswap2
	callasm .mythical
	iftrue .mythical2
	callasm .experiment
	iftrue .experiment2
	callasm .stupid
	iftrue .stupid2
	callasm .commence
	iftrue .commence2
	callasm .bambino
	iftrue .bambino2
	callasm .fossil
	iftrue .fossil2
.stop
	end

.pseudoswap:
	xor a
	ld [wScriptVar], a
	ld de, PseudoSwapPassword
	ld hl, wGreensName ; check inputted password
	ld c, 4
	call CompareBytes
	ret nz
	ld a, 1
	ld [wScriptVar], a
	ret

.pseudoswap2:
	setevent EVENT_PASSWORD_PSEUDOSWAP
	end

.mythical:
	xor a
	ld [wScriptVar], a
	ld de, MythicalPassword
	ld hl, wGreensName ; check inputted password
	ld c, 4
	call CompareBytes
	ret nz
	ld a, 1
	ld [wScriptVar], a
	ret

.mythical2:
	setevent EVENT_PASSWORD_MYTHICAL
	end

.experiment:
	xor a
	ld [wScriptVar], a
	ld de, ExperimentPassword
	ld hl, wGreensName ; check inputted password
	ld c, 4
	call CompareBytes
	ret nz
	ld a, 1
	ld [wScriptVar], a
	ret

.experiment2:
	setevent EVENT_PASSWORD_EXPERIMENT
	end

.stupid:
	xor a
	ld [wScriptVar], a
	ld de, StupidPassword
	ld hl, wGreensName ; check inputted password
	ld c, 4
	call CompareBytes
	ret nz
	ld a, 1
	ld [wScriptVar], a
	ret

.stupid2:
	setevent EVENT_PASSWORD_STUPID
	end

.commence:
	xor a
	ld [wScriptVar], a
	ld de, CommencePassword
	ld hl, wGreensName ; check inputted password
	ld c, 4
	call CompareBytes
	ret nz
	ld a, 1
	ld [wScriptVar], a
	ret

.commence2:
	setevent EVENT_PASSWORD_COMMENCE
	end

.bambino:
	xor a
	ld [wScriptVar], a
	ld de, BambinoPassword
	ld hl, wGreensName ; check inputted password
	ld c, 4
	call CompareBytes
	ret nz
	ld a, 1
	ld [wScriptVar], a
	ret

.bambino2:
	setevent EVENT_PASSWORD_BAMBINO
	end

.fossil:
	xor a
	ld [wScriptVar], a
	ld de, FossilPassword
	ld hl, wGreensName ; check inputted password
	ld c, 4
	call CompareBytes
	ret nz
	ld a, 1
	ld [wScriptVar], a
	ret

.fossil2:
	setevent EVENT_PASSWORD_EXTINCT
	end

PseudoSwapPassword:
	db "PSEUDO"

MythicalPassword:
	db "MYTHICAL"

ExperimentPassword:
	db "EXPERIMENT"

StupidPassword:
	db "STUPID"

CommencePassword:
	db "COMMENCE"

BambinoPassword:
	db "BAMBINO"

FossilPassword:
	db "EXTINCT"

MastersHouse1F_WalkUpMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_resume

MastersHouse1F_MastersMovement:
	step DOWN
	step DOWN
	step_resume

MastersHouse1F_CantLeaveMovement:
	step UP
	step_resume

MastersHouse1F_RivalLarvitarMovement:
	step UP
	step_resume

MastersHouse1F_RivalDratiniMovement:
	step LEFT
	step UP
	step_resume

HeadUpstairs1Movement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step_resume

HeadUpstairs2Movement:
	step UP
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step_resume

PlayerMovesToRivalMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step DOWN
	step_resume

RivalLeaves1Movement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_resume

MastersLastMovement:
	step DOWN
	step DOWN
	step DOWN
	step_resume

MasterLastMovement:
	step DOWN
	step_resume

HeySleepyHeadText:
	text "Hey sleepy head!"
	line "about time you"

	para "woke up! Don't"
	line "worry, we didn't"
	cont "start without you!"
	done

GoodOfYouText:
	text "Good of you to"
	line "have come."

	para "Today is an impor-"
	line "tant day. Today,"
	cont "you two start your"

	para "#mon journeys."
	line "You two have taken"
	cont "great care of the"

	para "#mon here in"
	line "Blackthorn, and"
	cont "now, you may have"

	para "one of them. Go"
	line "on, choose one of"
	cont "#balls in"

	para "front of you."
	done

GoodSportText:
	text "I can't believe"
	line "it."

	para "It's finally time."

	para "We can be #mon"
	line "trainers. Alright!"

	para "Go ahead and pick."
	line "I'm a good sport,"
	cont "so I'll wait."
	done

WhereDoYouThinkYoureGoingText:
	text "And just where do"
	line "you think you're"
	cont "going?"
	done

TakeDratiniText:
	text "Master: Will you"
	line "take Dratini, the"
	cont "pride of"

	para "Blackthorn City?"
	done

TakeLarvitarText:
	text "Master: Will you"
	line "take Larvitar,"
	cont "the rampaging"

	para "beast?"
	done

DidntChooseDratiniText:
	text "Master: Are you"
	line "sure? It is of"
	cont "great importance"

	para "that you choose"
	line "wisely."
	done

DidntChooseLarvitarText:
	text "Master: Take your"
	line "time, and try not"
	cont "to make a mistake."
	done

ChoseDratiniText:
	text "Master: Excellent"
	line "choice."
	done

ChoseLarvitarText:
	text "Master: Hmm..."
	line "Interesting."
	done

RivalChoseText:
	text "Alright, I'll"
	line "take this one!"
	done

RecievedStarterText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

RivalStarterText:
	text "<RIVAL> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

RivalStarter2Text:
	text "<RIVAL> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

IsntItCuteText:
	text "Giggle! Isn't my"
	line "my #mon cute?"
	done

HehToughMonText:
	text "Heh! My #mon"
	line "looks tough!"
	done

MastersTestText:
	text "Master: Before you"
	line "begin, your"
	cont "journeys, I want"

	para "to test you."
	line "Upstairs are my"
	cont "grandchildren,"

	para "Lance and Clair."
	line "You've known them"
	cont "since they were"

	para "babies."

	para "Go and battle"
	line "them. Do not"
	cont "worry, they are"

	para "competent enough"
	line "trainers at this"
	cont "point. This will"

	para "strengthen the"
	line "bond between you"
	cont "and your #mon."
	done

LetsStartText:
	text "<RIVAL>: Sounds"
	line "simple enough."
	cont "This'll be fun!"
	done

MastersHouseMasterText:
	text "Go, and face your"
	line "first challenge."
	done

HmText:
	text "Hm."
	done

MastersHouseRivalText:
	text "Go on!"
	done

CongratulationsText:
	text "Congratulations."
	line "I could hear"
	cont "Clair's screams of"

	para "anger from down"
	line "here. You have"
	cont "passed your first"

	para "test. Now you are"
	line "ready to begin"
	cont "your journeys."

	para "Go forth, and come"
	line "back once you have"
	cont "earned seven"

	para "Gym Badges. Then I"
	line "shall test you one"
	cont "last time."
	done

ThankYouText:
	text "<RIVAL>: Thank you,"
	line "Master!"
	done

ImOffText:
	text "Well, it looks"
	line "like it's time!"
	cont "We can finally"

	para "start our"
	line "journeys!"

	para "I'm sure we'll"
	line "run into each"
	cont "other from time"

	para "to time. See you"
	line "later!"

	para "...Oh, wait!"

	para "Before we go, have"
	line "some # Balls"
	cont "to catch #mon!"
	done

RivalGoodByeText:
	text "I'm off. See you"
	line "later!"
	done

MasterGoodLuckText:
	text "Good luck to you"
	line "both on your"
	cont "journeys."
	done

TalkToGranny:
	text "Be sure to speak"
	line "to your grand-"
	cont "mother before you"

	para "go. She may have"
	line "something useful"
	cont "for you."
	done

MasterBeatenText:
	text "Master: You've both"
	line "done so well."

	para "I am proud of you."
	done

TakeBagonText:
	text "Master: Will you"
	line "take Bagon, the"
	cont "hard-headed"

	para "#mon?"
	done

ChoseBagonText:
	text "A good choice. I"
	line "bred that from my"
	cont "own Salamence."
	done

TakeCelebiText:
	text "Master: Will you"
	line "take Celebi, the"
	cont "time-traveller?"
	done

ChoseCelebiText:
	text "Master: Don't ask"
	line "me how I got that."
	done

TakeEeveeText:
	text "Master: Will you"
	line "take Eevee, the"
	cont "#mon of many"

	para "destinies?"
	done

ChoseEeveeText:
	text "Master: Its new"
	line "form is all up to"
	cont "you."
	done

TakeMewtwoText:
	text "Master: Will you"
	line "take Mewtwo, the"
	cont "strongest #mon?"
	done

ChoseMewtwoText:
	text "Master: I think"
	line "you're not taking"
	cont "this seriously."
	done

TakeElekidText:
	text "Master: Will you"
	line "take Elekid, the"
	cont "lightening baby?"
	done

ChoseElekidText:
	text "Master: Nurture it"
	line "and it will be a"
	cont "great ally."
	done

TakeMagikarpText:
	text "Master: Will you"
	line "take Magikarp, the"
	cont "weak fish?"
	done

ChoseMagikarpText:
	text "Master: Good luck."

	para "You're going to"
	line "need it."
	done

TakePikachuText:
	text "Master: Will you"
	line "take Pikachu, the"
	cont "wildly popular"

	para "mouse #mon?"
	done

ChosePikachuText:
	text "Master: You'll be"
	line "popular too with"
	cont "this #mon!"
	done

TakeGibleText:
	text "Master: Will you"
	line "take Gible, the"
	cont "biting #mon?"
	done

ChoseGibleText:
	text "A good choice. I"
	line "bred that from my"
	cont "own Garchomp."
	done

TakeMagbyText:
	text "Master: Will you"
	line "take Magby, the"
	cont "small, but strong"

	para "fire #mon?"
	done

ChoseMagbyText:
	text "Master: Treat this"
	line "#mon with"
	cont "respect, and it"

	para "will respect you."
	done

TakeMewText:
	text "Master: Will you"
	line "take Mew, the"
	cont "ancestor to all"

	para "#mon?"
	done

ChoseMewText:
	text "Master: You are"
	line "not even meant to"
	cont "have this #mon"

	para "until the post-"
	line "game."
	done

TakeMissingnoText:
	text "Master: Will you"
	line "take Missingno.,"
	cont "the glitch?"
	done

ChoseMissingnoText:
	text "Master: That thing"
	line "shouldn't even be"
	cont "in our world."
	done

TakeCandyPouchText:
	text "By the way, I see"
	line "that you put in"
	cont "the password for"

	para "CHEATER."
	line "Humph. Have you no"
	cont "shame?"

	para "I am bound by the"
	line "laws of the coding"
	cont "to give you this."

	para "Let us never speak"
	line "of this again."
	done

MasterUnfortunateText:
	text "Master: It is most"
	line "unfortunate that"
	cont "you were not able"

	para "to complete your"
	line "test, but given"
	cont "your current"

	para "circumstances, I"
	line "shall let it go."

	para "Patience is the"
	line "key to raising"
	cont "Magikarp."

	para "Go forth, and come"
	line "back once you have"
	cont "earned seven"

	para "Gym Badges. Then I"
	line "shall test you one"
	cont "last time."
	done

TakeOmanyteText:
	text "Master: Will you"
	line "take Omanyte, the"
	cont "Spiral #mon?"
	done

ChoseOmanyteText:
	text "Praise Helix."
	done

TakeKabutoText:
	text "Master: Will you"
	line "take Kabuto, the"
	cont "Shellfish #mon?"
	done

ChoseKabutoText:
	text "You're making a"
	line "mistake."
	done

MastersHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4, 13, BLACKTHORN_CITY, 10
	warp_event  5, 13, BLACKTHORN_CITY, 10
	warp_event  4,  1, MASTERS_HOUSE_2F, 1

	db 5 ; coord events
	coord_event 2,  8, SCENE_CANT_LEAVE_HOUSE, TryToLeaveHouseScript
	coord_event 4,  8, SCENE_CANT_LEAVE_HOUSE, TryToLeaveHouseScript
	coord_event 5,  8, SCENE_CANT_LEAVE_HOUSE, TryToLeaveHouseScript
	coord_event 7,  8, SCENE_CANT_LEAVE_HOUSE, TryToLeaveHouseScript
	coord_event 5,  1, SCENE_DONE_WITH_2F, FinishTutorialScript

	db 0 ; bg events

	db 4 ; object events
	object_event  4,  2, SPRITE_MASTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MaastersHouseMasterScript, EVENT_MASTERS_HOUSE_MASTER
	object_event  5,  7, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MastersHouseRivalScript, EVENT_RIVAL_AT_MASTERS_HOUSE_1
	object_event  4,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DratiniPokeballScript, EVENT_DRATINI_POKEBALL_AT_MASTERS
	object_event  5,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LarvitarPokeballScript, EVENT_LARVITAR_POKEBALL_AT_MASTERS
