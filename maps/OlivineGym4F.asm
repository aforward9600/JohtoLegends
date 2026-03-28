	object_const_def ; object_event constants
	const OLIVINEGYM4F_BYRON

OlivineGym4F_MapScripts:
	db 2 ; scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .WednesdayByron

.DummyScene0:
	end

.DummyScene1:
	end

.WednesdayByron:
	checkevent EVENT_BEAT_BYRON
	iftrue .IsItWednesday
	appear OLIVINEGYM4F_BYRON
	return

.IsItWednesday:
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .DisappearByron
	appear OLIVINEGYM4F_BYRON
	return

.DisappearByron:
	disappear OLIVINEGYM4F_BYRON
	return

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
	setevent EVENT_DECO_CHARMANDER_DOLL
	opentext
	writetext Byron1F_Beaten
	waitbutton
	closetext
	opentext
	writetext Text1F_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	loadmem wLevelCap, 34
	readvar VAR_BADGES
	setflag ENGINE_BEAT_BYRON
.FightDone:
	checkflag ENGINE_BEAT_BYRON
	iffalse .RematchByron
	checkevent EVENT_GOT_TM42_FLASH_CANNON
	iftrue .GotIronTail
	writetext Byron1F_BadgeSpeech
	buttonsound
	verbosegiveitem TM_FLASH_CANNON
	setevent EVENT_GOT_TM42_FLASH_CANNON
	setevent EVENT_ROCK_SMASH_GUY
	clearevent EVENT_ROUTE_36_GUY
	setevent EVENT_BEAT_GENTLEMAN_CROFTON
	setevent EVENT_BEAT_TEACHER_ABIGAIL
	setevent EVENT_BEAT_ENGINEER_DANTE
	setevent EVENT_BEAT_BEAUTY_ASHLEY
	setevent EVENT_BEAT_ENGINEER_RUDY
	writetextend Byron1F_FlashCannonSpeech

.GotIronTail:
	writetextend Byron1F_Sunnyshore
.NoRoomForFlashCannon:
	closetext
	end

.RematchByron:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .PostGameByron
	writetext ByronRematchText
	waitbutton
	closetext
	winlosstext Byron1F_Clang, Byron1F_SteelyDetermination
	readvar VAR_BADGES
	ifequal 4, .ByronBattle1
	ifequal 5, .ByronBattle2
	ifequal 6, .ByronBattle3
	ifequal 7, .ByronBattle4
	ifequal 8, .ByronBattle5
	sjump .ByronBattle5

.ByronBattle1:
	loadtrainer BYRON, BYRON1
	sjump AfterByronRematch

.ByronBattle2:
	loadtrainer BYRON_2, BYRON2
	sjump AfterByronRematch

.ByronBattle3:
	loadtrainer BYRON_2, BYRON3
	sjump AfterByronRematch

.ByronBattle4:
	loadtrainer BYRON_2, BYRON4
	sjump AfterByronRematch

.ByronBattle5:
	loadtrainer BYRON_2, BYRON5
	sjump AfterByronRematch

.PostGameByron:
	writetext PostGameByronText
	waitbutton
	closetext
	winlosstext Byron1F_Clang, Byron1F_SteelyDetermination
	loadtrainer BYRON_2, BYRON6
	startbattle
	reloadmapafterbattle
	opentext
	setflag ENGINE_BEAT_BYRON
	writetextend BeatenByronAgainText2

AfterByronRematch:
	startbattle
	reloadmapafterbattle
	opentext
	setflag ENGINE_BEAT_BYRON
	writetextend BeatenByronAgainText

EleventhElevator:
	scall OlivineDownElevator
	clearevent EVENT_GYM_ELEVENTH_ELEVATOR
	warp OLIVINE_GYM_1F, 13, 2
	end

TwelthElevator:
	scall OlivineDownElevator
	setevent EVENT_GYM_TWELTH_ELEVATOR
	warp OLIVINE_GYM_1F, 5, 2
	end

Byron1F_LittleHero:
	text "Welcome, my hero."
	line "I'll properly"
	cont "introduce myself"
	cont "now."

	para "I am Opal, the"
	line "Leader of the"
	cont "Olivine City Gym."

	para "I am quite the fan"
	line "of Steel-types, as"
	cont "they're sleek and"
	cont "sturdy."

	para "You were of great"
	line "help at the"
	cont "Lighthouse,"

	para "but I can't just"
	line "give you a Badge"
	cont "for that."

	para "Let's start."
	done

Byron1F_Clang:
	text "Wow! What a"
	line "battle!"
	done

Byron1F_SteelyDetermination:
	text "Steel doesn't bend"
	line "so easily!"
	done

Byron1F_Beaten:
	text "Well, that was"
	line "what I expected!"
	cont "A steel-hard"

	para "battle to the end!"
	line "You've earned this"
	cont "MineralBadge!"
	done

Text1F_ReceivedMineralBadge:
	text "<PLAYER> received"
	line "MineralBadge."
	done

Byron1F_BadgeSpeech:
	text "The MineralBadge"
	line "makes #mon up"
	cont "to Lv 50 obey you."

	para "Have this TM for"
	line "your collection!"
	done

Byron1F_FlashCannonSpeech:
	text "That lets you"
	line "teach a #mon"
	cont "Flash Cannon! It"

	para "can lower a foe's"
	line "Special Defense,"
	cont "so it's better to"

	para "be used on a"
	line "#mon like"
	cont "Magneton!"
	done

Byron1F_Sunnyshore:
	text "Did you enjoy the"
	line "layout of our Gym?"

	para "I was inspired by"
	line "my friend Byron,"

	para "the Gym Leader of"
	line "Canalave City in"
	cont "Sinnoh."

	para "I hope that my"
	line "daughter Jasmine"
	cont "can take over the"
	cont "Gym for me"
	cont "someday."
	done

ByronRematchText:
	text "Welcome back,"
	line "<PLAYER>."

	para "Ready for our"
	line "rematch?"
	done

BeatenByronAgainText:
	text "Impressive."

	para "You're too good!"
	done

PostGameByronText:
	text "Looks like I was"
	line "helpful to you."

	para "Your journey has"
	line "made you strong,"
	cont "and I'd like to"
	cont "see just how"
	cont "strong you are."
	done

BeatenByronAgainText2:
	text "You're quite the"
	line "tough Champion."

	para "Tough as steel"
	line "I'd say."
	done

OlivineGym4F_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 2 ; coord events
	coord_event  7,  4, SCENE_DEFAULT, EleventhElevator
	coord_event  3,  4, SCENE_DEFAULT, TwelthElevator

	db 0 ; bg events

	db 1 ; object events
	object_event  7,  0, SPRITE_BYRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, OlivineGym1FByronScript, EVENT_OLIVINE_GYM_JASMINE
