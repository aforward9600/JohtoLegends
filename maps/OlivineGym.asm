	object_const_def ; object_event constants
	const OLIVINEGYM_BYRON
	const OLIVINEGYM_GYM_GUY

OlivineGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivineGymByronScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BYRON
	iftrue .FightDone
	writetext Byron_LittleHero
	waitbutton
	closetext
	winlosstext Byron_Clang, 0
	loadtrainer BYRON, BYRON1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BYRON
	opentext
	writetext Byron_Beaten
	waitbutton
	closetext
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	readvar VAR_BADGES
	scall OlivineGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM42_FLASH_CANNON
	iftrue .GotIronTail
	writetext Byron_BadgeSpeech
	buttonsound
	verbosegiveitem TM_FLASH_CANNON
	iffalse .NoRoomForFlashCannon
	setevent EVENT_GOT_TM42_FLASH_CANNON
	writetext Byron_FlashCannonSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Byron_Sunnyshore
	waitbutton
.NoRoomForFlashCannon:
	closetext
	end

OlivineGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

OlivineGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_BYRON
	iftrue .OlivineGymGuyWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuyPreScript
	opentext
	writetext OlivineGymGuyText
	waitbutton
	closetext
	end

.OlivineGymGuyWinScript:
	opentext
	writetext OlivineGymGuyWinText
	waitbutton
	closetext
	end

.OlivineGymGuyPreScript:
	opentext
	writetext OlivineGymGuyPreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, BYRON, BYRON1
	jumpstd gymstatue2

Byron_LittleHero:
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

Byron_Clang:
	text "CLANG! What a"
	line "battle!"
	done

Byron_Beaten:
	text "Well, that was"
	line "what I expected!"
	cont "A steel-hard"

	para "battle to the end!"
	line "You've earned this"
	cont "MineralBadge!"
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> received"
	line "MineralBadge."
	done

Byron_BadgeSpeech:
	text "The MineralBadge"
	line "will make any"
	cont "#mon up to Lv."

	para "50 obey you. Take"
	line "this TM as well!"
	done

Byron_FlashCannonSpeech:
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

Byron_Sunnyshore:
	text "I'll need to find"
	line "a suitable replac-"
	cont "ement if I want to"

	para "return home."
	line "There's a family"
	cont "of strong Steel"

	para "trainers in Sunny-"
	line "shore City in"
	cont "Sinnoh. Perhaps"

	para "one of them can"
	line "take my place som-"
	cont "day! Hahahaha!"
	done

OlivineGymGuyText:
	text "How's it going,"
	line "champ in the"
	cont "making?"

	para "Byron uses the"
	line "Steel-Type. They"
	cont "are durable, and"

	para "it takes a strong"
	line "attack to break"
	cont "through their"

	para "defense. Try Fire,"
	line "Fighting, or Grou-"
	cont "nd Types!"
	done

OlivineGymGuyWinText:
	text "Sharp as ever,"
	cont "you are!"
	done

OlivineGymGuyPreText:
	text "Byron, the Gym"
	line "Leader, is at the"
	cont "Lighthouse."

	para "There's apparently"
	line "an incident."
	done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	db 2 ; object events
	object_event  5,  3, SPRITE_BYRON, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, OlivineGymByronScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuyScript, -1
