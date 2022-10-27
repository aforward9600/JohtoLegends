	object_const_def ; object_event constants
	const OLIVINEGYM2F_ENGINEER
	const OLIVINEGYM2F_BEAUTY

OlivineGym2F_MapScripts:
	db 2 ; scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .Elevators

.DummyScene0:
	end

.DummyScene1:
	end

.Elevators:
	checkevent EVENT_GYM_FOURTH_ELEVATOR
	iftrue .ReplaceFourthElevator
	checkevent EVENT_GYM_FIRST_ELEVATOR
	iftrue .ReplaceFirstElevator
	checkevent EVENT_GYM_SECOND_ELEVATOR
	iftrue .ReplaceSecondElevator
	checkevent EVENT_GYM_THIRD_ELEVATOR
	iftrue .ReplaceThirdElevator
	checkevent EVENT_GYM_FIFTH_ELEVATOR
	iftrue .ReplaceFifthElevator
	return

.ReplaceFirstElevator:
	changeblock 4, 4, $6e
	return

.ReplaceSecondElevator:
	changeblock 6, 4, $74
	return

.ReplaceThirdElevator:
	changeblock 8, 4, $75
	checkevent EVENT_GYM_FIRST_ELEVATOR
	iftrue .ReplaceFirstElevator
	checkevent EVENT_GYM_SECOND_ELEVATOR
	iftrue .ReplaceSecondElevator
	checkevent EVENT_GYM_FIFTH_ELEVATOR
	iftrue .ReplaceFifthElevator
	return

.ReplaceFourthElevator:
	changeblock 12, 10, $88
	checkevent EVENT_GYM_THIRD_ELEVATOR
	iftrue .ReplaceThirdElevator
	return

.ReplaceFifthElevator:
	changeblock 12, 4, $7f
	checkevent EVENT_GYM_SIXTH_ELEVATOR
	iftrue .ReplaceSixthElevator
	return

.ReplaceSixthElevator:
	changeblock 14, 10, $6b
	checkevent EVENT_GYM_SEVENTH_ELEVATOR
	iftrue .ReplaceSeventhElevator
	return

.ReplaceSeventhElevator:
	changeblock 10, 10, $83
	checkevent EVENT_GYM_NINTH_ELEVATOR
	iftrue .ReplaceNinthElevator
	return

.ReplaceNinthElevator:
	changeblock 14, 2, $7b
	checkevent EVENT_GYM_TENTH_ELEVATOR
	iftrue .ReplaceTenthElevator
	return

.ReplaceTenthElevator:
	changeblock 12, 2, $98
	return

TrainerEngineerDante:
	trainer ENGINEER, DANTE, EVENT_BEAT_ENGINEER_DANTE, EngineerDanteSeenText, EngineerDanteBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext EngineerDanteFAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyAshley:
	trainer BEAUTY, ASHLEY, EVENT_BEAT_BEAUTY_ASHLEY, BeautyAshleySeenText, BeautyAshleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyAshleyAfterBattle
	waitbutton
	closetext
	end

First2FElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	clearevent EVENT_GYM_FIRST_ELEVATOR
	warp OLIVINE_GYM_1F, 7, 5
	end

Second2FElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	clearevent EVENT_GYM_SECOND_ELEVATOR
	warp OLIVINE_GYM_1F, 11, 5
	end

Third2FElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	clearevent EVENT_GYM_THIRD_ELEVATOR
	warp OLIVINE_GYM_1F, 14, 5
	end

Fourth2FElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	setevent EVENT_GYM_FOURTH_ELEVATOR
	warp OLIVINE_GYM_1F, 18, 10
	end

Fifth2FElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	clearevent EVENT_GYM_FIFTH_ELEVATOR
	warp OLIVINE_GYM_1F, 17, 5
	end

Sixth2FElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	setevent EVENT_GYM_SIXTH_ELEVATOR
	warp OLIVINE_GYM_1F, 21, 10
	end

Seventh2FElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	clearevent EVENT_GYM_SEVENTH_ELEVATOR
	warp OLIVINE_GYM_1F, 16, 10
	end

Eighth2FElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	setevent EVENT_GYM_EIGHTH_ELEVATOR
	warp OLIVINE_GYM_3F, 3, 12
	end

Ninth2FElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	clearevent EVENT_GYM_NINTH_ELEVATOR
	warp OLIVINE_GYM_3F, 16, 3
	end

Tenth2FElevator:
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_ELEVATOR
	pause 5
	waitsfx
	setevent EVENT_GYM_TENTH_ELEVATOR
	warp OLIVINE_GYM_1F, 19, 2
	end

EngineerDanteSeenText:
	text "Like these lifts?"

	para "I helped design"
	line "and build them!"
	done

EngineerDanteBeatenText:
	text "Designing the"
	line "gym doesn't give"
	cont "me any advantage"
	cont "in battle!"
	done

EngineerDanteFAfterBattleText:
	text "The layout here"
	line "can be confusing."

	para "I get lost myself"
	line "sometimes!"
	done

BeautyAshleySeenText:
	text "Steel is so"
	line "beautiful!"

	para "Just like me!"
	done

BeautyAshleyBeatenText:
	text "My makeup is"
	line "running!"
	done

BeautyAshleyAfterBattle:
	text "The best part"
	line "about Steel-types"
	cont "is seeing my"
	cont "reflection in"
	cont "their bodies!"
	done

OlivineGym2F_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 10 ; coord events
	coord_event  5,  5, SCENE_DEFAULT, First2FElevator
	coord_event  7,  5, SCENE_DEFAULT, Second2FElevator
	coord_event  9,  5, SCENE_DEFAULT, Third2FElevator
	coord_event 13, 10, SCENE_DEFAULT, Fourth2FElevator
	coord_event 12,  5, SCENE_DEFAULT, Fifth2FElevator
	coord_event 15, 10, SCENE_DEFAULT, Sixth2FElevator
	coord_event 11, 10, SCENE_DEFAULT, Seventh2FElevator
	coord_event  2, 12, SCENE_DEFAULT, Eighth2FElevator
	coord_event 15,  3, SCENE_DEFAULT, Ninth2FElevator
	coord_event 13,  3, SCENE_DEFAULT, Tenth2FElevator

	db 0 ; bg events

	db 2 ; object events
	object_event 14,  0, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerEngineerDante, -1
	object_event  0, 10, SPRITE_BUENA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBeautyAshley, -1
