	object_const_def ; object_event constants
	const OLIVINEGYM1F_GYM_GUY
	const OLIVINEGYM1F_GENTLEMAN
	const OLIVINEGYM1F_TEACHER

OlivineGym1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Elevators2

.DummyScene0:
	end

.DummyScene1:
	end

.Elevators2:
	checkevent EVENT_GYM_THIRD_ELEVATOR
	iftrue .ThirdElevator2
	checkevent EVENT_GYM_FIFTH_ELEVATOR
	iftrue .FifthElevator2
	return

.ThirdElevator2:
	changeblock 14, 4, $87
	checkevent EVENT_GYM_FOURTH_ELEVATOR
	iftrue .FourthElevator2
	checkevent EVENT_GYM_FIFTH_ELEVATOR
	iftrue .FifthElevator2
	checkevent EVENT_GYM_THIRD_ELEVATOR
	iftrue .ThirdElevator2
	return

.FourthElevator2:
	changeblock 18, 10, $67
	checkevent EVENT_GYM_FIFTH_ELEVATOR
	iftrue .SixthElevator2
	return

.FifthElevator2:
	changeblock 16, 4, $89
	checkevent EVENT_GYM_SIXTH_ELEVATOR
	iftrue .SixthElevator2
	return

.SixthElevator2:
	changeblock 20, 10, $66
	checkevent EVENT_GYM_SEVENTH_ELEVATOR
	iftrue .SeventhElevator2
	return

.SeventhElevator2:
	changeblock 16, 10, $8a
	checkevent EVENT_GYM_TENTH_ELEVATOR
	iftrue .TenthElevator2
	return

.TenthElevator2:
	changeblock 18, 2, $66
	checkevent EVENT_GYM_ELEVENTH_ELEVATOR
	iftrue .EleventhElevator2
	return

.EleventhElevator2:
	changeblock 12, 2, $68
	checkevent EVENT_GYM_TWELTH_ELEVATOR
	iftrue .TwelthElevator2
	return

.TwelthElevator2:
	changeblock 4, 2, $99
	return

OlivineGym1FGuyScript:
	faceplayer
	checkevent EVENT_BEAT_BYRON
	iftrue .OlivineGymGuy1FWinScript
	opentext
	writetext OlivineGym1FGuyText
	waitbutton
	closetext
	end

.OlivineGymGuy1FWinScript:
	opentext
	writetext OlivineGym1FGuyWinText
	waitbutton
	closetext
	end

.OlivineGymGuy1FPreScript:
	opentext
	writetext OlivineGym1FGuyPreText
	waitbutton
	closetext
	end

OlivineGymTrainerGentlemanCrofton1F:
	trainer GENTLEMAN, CROFTON, EVENT_BEAT_GENTLEMAN_CROFTON, GentlemanCrofton1FSeenText, GentlemanCrofton1FBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanCrofton1FAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherAbigail1F:
	trainer TEACHER, ABIGAIL, EVENT_BEAT_TEACHER_ABIGAIL, TeacherAbigail1FSeenText, TeacherAbigail1FBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherAbigail1FAfterBattleText
	waitbutton
	closetext
	end

OlivineGym1FStatue:
	checkflag ENGINE_PLAINBADGE
	iftrue .RivalBeaten
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd gymstatue4
.Beaten:
	gettrainername STRING_BUFFER_4, BYRON, BYRON1
	jumpstd gymstatue3
.RivalBeaten:
	gettrainername STRING_BUFFER_4, BYRON, BYRON1
	jumpstd gymstatue1

FirstElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	setevent EVENT_GYM_FIRST_ELEVATOR
	warp OLIVINE_GYM_2F, 5, 5
	end

SecondElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	setevent EVENT_GYM_SECOND_ELEVATOR
	warp OLIVINE_GYM_2F, 7, 5
	end

ThirdElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	setevent EVENT_GYM_THIRD_ELEVATOR
	warp OLIVINE_GYM_2F, 9, 5
	end

FourthElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	clearevent EVENT_GYM_FOURTH_ELEVATOR
	warp OLIVINE_GYM_2F, 13, 10
	end

FifthElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	setevent EVENT_GYM_FIFTH_ELEVATOR
	warp OLIVINE_GYM_2F, 12, 5
	end

SixthElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	clearevent EVENT_GYM_SIXTH_ELEVATOR
	warp OLIVINE_GYM_2F, 15, 10
	end

SeventhElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	setevent EVENT_GYM_SEVENTH_ELEVATOR
	warp OLIVINE_GYM_2F, 11, 10
	end

TenthElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	clearevent EVENT_GYM_TENTH_ELEVATOR
	warp OLIVINE_GYM_2F, 13, 3
	end

EleventhElevator1F:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	setevent EVENT_GYM_ELEVENTH_ELEVATOR
	warp OLIVINE_GYM_4F, 7, 4
	end

TwelthElevator1F:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	clearevent EVENT_GYM_TWELTH_ELEVATOR
	warp OLIVINE_GYM_4F, 3, 4
	end

ResetElevators:
	clearevent EVENT_GYM_FIRST_ELEVATOR
	clearevent EVENT_GYM_SECOND_ELEVATOR
	clearevent EVENT_GYM_THIRD_ELEVATOR
	clearevent EVENT_GYM_FOURTH_ELEVATOR
	clearevent EVENT_GYM_FIFTH_ELEVATOR
	clearevent EVENT_GYM_SIXTH_ELEVATOR
	clearevent EVENT_GYM_SEVENTH_ELEVATOR
	clearevent EVENT_GYM_EIGHTH_ELEVATOR
	clearevent EVENT_GYM_NINTH_ELEVATOR
	clearevent EVENT_GYM_TENTH_ELEVATOR
	clearevent EVENT_GYM_ELEVENTH_ELEVATOR
	clearevent EVENT_GYM_TWELTH_ELEVATOR
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
	text "Steely determin-"
	line "ation wins every"
	cont "time!"
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

GentlemanCrofton1FSeenText:
	text "Steel is a hard"
	line "type to overcome."

	para "What can you do"
	line "against it?"
	done

GentlemanCrofton1FBeatenText:
	text "Apparently you are"
	line "harder to"
	cont "overcome."
	done

GentlemanCrofton1FAfterBattleText:
	text "Steel's weaknesses"
	line "are less than that"
	cont "of most other"
	cont "types."
	done

TeacherAbigail1FSeenText:
	text "Teachers need to"
	line "be sharp in order"
	cont "to mold young"
	cont "minds."

	para "As sharp as a"
	line "Steel-Type!"
	done

TeacherAbigail1FBeatenText:
	text "Truly sharp."
	done

TeacherAbigail1FAfterBattleText:
	text "I guess you're"
	line "sharper then me."

	para "I need to sharpen"
	line "my mind."
	done

OlivineGym1FGuyText:
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

OlivineGym1FGuyWinText:
	text "Sharp as ever,"
	line "you are!"
	done

OlivineGym1FGuyPreText:
	text "Byron, the Gym"
	line "Leader, is at the"
	cont "Lighthouse."

	para "There's apparently"
	line "an incident."
	done

OlivineGym1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 12, 13, OLIVINE_CITY, 2
	warp_event 13, 13, OLIVINE_CITY, 2

	db 12 ; coord events
	coord_event  7,  5, SCENE_DEFAULT, FirstElevator
	coord_event 11,  5, SCENE_DEFAULT, SecondElevator
	coord_event 14,  5, SCENE_DEFAULT, ThirdElevator
	coord_event 18, 10, SCENE_DEFAULT, FourthElevator
	coord_event 17,  5, SCENE_DEFAULT, FifthElevator
	coord_event 21, 10, SCENE_DEFAULT, SixthElevator
	coord_event 16, 10, SCENE_DEFAULT, SeventhElevator
	coord_event 12, 13, SCENE_DEFAULT, ResetElevators
	coord_event 13, 13, SCENE_DEFAULT, ResetElevators
	coord_event 19,  2, SCENE_DEFAULT, TenthElevator
	coord_event 13,  2, SCENE_DEFAULT, EleventhElevator1F
	coord_event  5,  2, SCENE_DEFAULT, TwelthElevator1F

	db 2 ; bg events
	bg_event 11, 11, BGEVENT_READ, OlivineGym1FStatue
	bg_event 14, 11, BGEVENT_READ, OlivineGym1FStatue

	db 3 ; object events
	object_event 12, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGym1FGuyScript, -1
	object_event  6,  7, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, OlivineGymTrainerGentlemanCrofton1F, -1
	object_event 16,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerTeacherAbigail1F, -1
