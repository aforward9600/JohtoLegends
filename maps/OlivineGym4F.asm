	object_const_def ; object_event constants

OlivineGym4F_MapScripts:
	db 2 ; scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

OlivineGym1FByronScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BYRON
	iftrue .FightDone
	writetext Byron1F_LittleHero
	waitbutton
	closetext
	winlosstext Byron1F_Clang, Byron1F_SteelyDetermination
	loadtrainer BYRON, BYRON1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BYRON
	opentext
	writetext Byron1F_Beaten
	waitbutton
	closetext
	opentext
	writetext Text1F_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	readvar VAR_BADGES
	scall OlivineGym1FActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM42_FLASH_CANNON
	iftrue .GotIronTail
	writetext Byron1F_BadgeSpeech
	buttonsound
	verbosegiveitem TM_FLASH_CANNON
	iffalse .NoRoomForFlashCannon
	setevent EVENT_GOT_TM42_FLASH_CANNON
	setevent EVENT_ROCK_SMASH_GUY
	clearevent EVENT_ROUTE_36_GUY
	writetext Byron1F_FlashCannonSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Byron1F_Sunnyshore
	waitbutton
.NoRoomForFlashCannon:
	closetext
	end

OlivineGym1FActivateRockets:
	ifequal 7, .RadioTower1FRockets
	ifequal 6, .Goldenrod1FRockets
	end

.Goldenrod1FRockets:
	jumpstd goldenrodrockets

.RadioTower1FRockets:
	jumpstd radiotowerrockets

EleventhElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	clearevent EVENT_GYM_ELEVENTH_ELEVATOR
	warp OLIVINE_GYM_1F, 13, 2
	end

TwelthElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	setevent EVENT_GYM_TWELTH_ELEVATOR
	warp OLIVINE_GYM_1F, 5, 2
	end

OlivineGym4F_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 2 ; coord events
	coord_event  7,  4, SCENE_DEFAULT, EleventhElevator
	coord_event  3,  4, SCENE_DEFAULT, TwelthElevator

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  0, SPRITE_BYRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, OlivineGym1FByronScript, EVENT_OLIVINE_GYM_JASMINE
