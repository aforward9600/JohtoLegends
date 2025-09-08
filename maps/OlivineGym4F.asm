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
	scall OlivineElevatorEffect
	clearevent EVENT_GYM_ELEVENTH_ELEVATOR
	warp OLIVINE_GYM_1F, 13, 2
	end

TwelthElevator:
	scall OlivineElevatorEffect
	setevent EVENT_GYM_TWELTH_ELEVATOR
	warp OLIVINE_GYM_1F, 5, 2
	end

Byron1F_LittleHero:
	text "Welcome, little"
	line "hero! I'll"
	cont "properly introduce"

	para "myself now! I am"
	line "Byron, the Leader"
	cont "of the Olivine"

	para "City Gym! I came"
	line "from Canalave City"
	cont "in the Sinnoh"

	para "region. I hope to"
	line "return to my home-"
	cont "land someday, but"

	para "for now, I shall"
	line "be the greatest"
	cont "Leader I can be"

	para "here in Johto! You"
	line "were of great help"
	cont "at the Lighthouse,"

	para "but I can't just"
	line "give you a Badge"
	cont "for that! Let's"

	para "get this started!"
	done

Byron1F_Clang:
	text "CLANG! What a"
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
	line "will make any"
	cont "#mon up to Lv."

	para "50 obey you. Take"
	line "this TM as well!"
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
	text "I'll need to find"
	line "a suitable"
	cont "replacement if I"

	para "want to return"
	line "home."

	para "Maybe a cute girl!"

	para "Whaddya think?"
	done

ByronRematchText:
	text "Welcome back, lil'"
	line "hero!"

	para "Ready for our"
	line "rematch?"

	para "CLANG!"
	done

BeatenByronAgainText:
	text "Dang!"

	para "You're too good!"

	para "Maybe you can be"
	line "a Gym Leader some-"
	cont "day!"
	done

PostGameByronText:
	text "Looks like I was"
	line "helpful to you!"

	para "You don't get to"
	line "be Champion by"
	cont "being soft!"

	para "I toughened you up"
	line "before, and now I"
	cont "want to see how"
	cont "good you are!"
	done

BeatenByronAgainText2:
	text "You're quite the"
	line "tough Champion!"

	para "Tough as steel"
	line "I'd say!"
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
