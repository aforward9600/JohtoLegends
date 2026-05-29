	object_const_def ; object_event constants
	const OLIVINEGYM2F_LIFT
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
	checkevent EVENT_OLIVINE_GYM_FIRST_PLATFORM
	iftrue .ReplaceFirstPlatform
.ResumeElevator:
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

.ReplaceFirstPlatform:
	changeblock 4, 10, $ad
	changeblock 8, 10, $ac
	sjump .ResumeElevator

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
	changeblock 12, 10, $6b
	checkevent EVENT_GYM_THIRD_ELEVATOR
	iftrue .ReplaceThirdElevator
	return

.ReplaceFifthElevator:
	changeblock 12, 4, $5b
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
	jumptext EngineerDanteFAfterBattleText

TrainerBeautyAshley:
	trainer BEAUTY, ASHLEY, EVENT_BEAT_BEAUTY_ASHLEY, BeautyAshleySeenText, BeautyAshleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext BeautyAshleyAfterBattle

OlivineDownElevator:
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM2F_LIFT
	applymovement PLAYER, OlivineDownElevatorMovement1
	stopfollow PLAYER, OLIVINEGYM2F_LIFT
	loadmem wFollowInSync, FALSE
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	end

OlivineDownElevator2:
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM2F_LIFT
	applymovement PLAYER, OlivineDownElevatorMovement2
	stopfollow PLAYER, OLIVINEGYM2F_LIFT
	loadmem wFollowInSync, FALSE
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	applymovement PLAYER, OlivineGymShowPlayer
	applymovement OLIVINEGYM2F_LIFT, OlivineGymShowPlayer
	end

OlivineDownElevatorMovement1:
	fix_facing
	set_sliding
	hide_person
	step DOWN
	step DOWN
	show_person
	step DOWN
	remove_sliding
	remove_fixed_facing
	step_end

OlivineDownElevatorMovement2:
	fix_facing
	set_sliding
	hide_person
	step DOWN
	step DOWN
	step DOWN
	remove_sliding
	remove_fixed_facing
	step_end

OlivineGymShowPlayer:
	show_person
	step_end

AppearSecondElevator:
	appear OLIVINEGYM2F_LIFT
	refreshscreen
	end

First2FElevator:
	moveobject OLIVINEGYM2F_LIFT, 5, 5
	scall AppearSecondElevator
	changeblock 4, 4, $6d
	scall OlivineDownElevator
	clearevent EVENT_GYM_FIRST_ELEVATOR
	warp OLIVINE_GYM_1F, 7, 5
	end

Second2FElevator:
	moveobject OLIVINEGYM2F_LIFT, 7, 5
	scall AppearSecondElevator
	changeblock 6, 4, $6f
	scall OlivineDownElevator
	clearevent EVENT_GYM_SECOND_ELEVATOR
	warp OLIVINE_GYM_1F, 11, 5
	end

Third2FElevator:
	moveobject OLIVINEGYM2F_LIFT, 9, 5
	scall AppearSecondElevator
	changeblock 8, 4, $70
	scall OlivineDownElevator
	clearevent EVENT_GYM_THIRD_ELEVATOR
	warp OLIVINE_GYM_1F, 14, 5
	end

Fourth2FElevator:
	moveobject OLIVINEGYM2F_LIFT, 13, 10
	scall AppearSecondElevator
	changeblock 12, 10, $6b
	scall OlivineDownElevator
	setevent EVENT_GYM_FOURTH_ELEVATOR
	warp OLIVINE_GYM_1F, 18, 10
	end

Fifth2FElevator:
	moveobject OLIVINEGYM2F_LIFT, 12, 5
	scall AppearSecondElevator
	changeblock 12, 4, $77
	scall OlivineDownElevator2
	clearevent EVENT_GYM_FIFTH_ELEVATOR
	warp OLIVINE_GYM_1F, 17, 5
	end

Sixth2FElevator:
	moveobject OLIVINEGYM2F_LIFT, 15, 10
	scall AppearSecondElevator
	changeblock 14, 10, $6b
	scall OlivineDownElevator
	setevent EVENT_GYM_SIXTH_ELEVATOR
	warp OLIVINE_GYM_1F, 21, 10
	end

Seventh2FElevator:
	moveobject OLIVINEGYM2F_LIFT, 11, 10
	scall AppearSecondElevator
	changeblock 10, 10, $82
	scall OlivineDownElevator
	clearevent EVENT_GYM_SEVENTH_ELEVATOR
	warp OLIVINE_GYM_1F, 16, 10
	end

Eighth2FElevator:
	moveobject OLIVINEGYM2F_LIFT, 2, 12
	scall AppearSecondElevator
	changeblock 2, 12, $86
	scall OlivineElevatorEffect
	setevent EVENT_GYM_EIGHTH_ELEVATOR
	warp OLIVINE_GYM_3F, 3, 12
	end

Ninth2FElevator:
	moveobject OLIVINEGYM2F_LIFT, 15, 3
	scall AppearSecondElevator
	changeblock 14, 2, $7a
	scall OlivineElevatorEffect
	clearevent EVENT_GYM_NINTH_ELEVATOR
	warp OLIVINE_GYM_3F, 16, 3
	end

Tenth2FElevator:
	moveobject OLIVINEGYM2F_LIFT, 13, 3
	scall AppearSecondElevator
	changeblock 12, 2, $79
	scall OlivineDownElevator2
	setevent EVENT_GYM_TENTH_ELEVATOR
	warp OLIVINE_GYM_1F, 19, 2
	end

FirstPlatform:
	moveobject OLIVINEGYM2F_LIFT, 9, 10
	scall AppearSecondElevator
	changeblock 8, 10, $ac
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM2F_LIFT
	applymovement PLAYER, OlivineGymLeft5Movement
	stopfollow PLAYER, OLIVINEGYM2F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	changeblock 4, 10, $ad
	refreshscreen $86
	moveobject OLIVINEGYM2F_LIFT, 99, 99
	disappear OLIVINEGYM2F_LIFT
	reloadmappart
	setevent EVENT_OLIVINE_GYM_FIRST_PLATFORM
	end

SecondPlatform:
	moveobject OLIVINEGYM2F_LIFT, 4, 10
	scall AppearSecondElevator
	changeblock 4, 10, $ac
	reloadmappart
	playsound SFX_ELEVATOR
	loadmem wFollowInSync, TRUE
	follow PLAYER, OLIVINEGYM2F_LIFT
	applymovement PLAYER, OlivineGymRight5Movement
	stopfollow PLAYER, OLIVINEGYM2F_LIFT
	loadmem wFollowInSync, FALSE
	playsound SFX_BUMP
	changeblock 8, 10, $ab
	refreshscreen $86
	moveobject OLIVINEGYM2F_LIFT, 99, 99
	disappear OLIVINEGYM2F_LIFT
	reloadmappart
	clearevent EVENT_OLIVINE_GYM_FIRST_PLATFORM
	end

OlivineGymLeft9Movement:
	fix_facing
	set_sliding
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	remove_sliding
	remove_fixed_facing
	step_end

OlivineGymLeft5Movement:
	fix_facing
	set_sliding
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	remove_sliding
	remove_fixed_facing
	step_end

OlivineGymLeft3Movement:
	fix_facing
	set_sliding
	step LEFT
	step LEFT
	step LEFT
	remove_sliding
	remove_fixed_facing
	step_end

OlivineGymLeft2Movement:
	fix_facing
	set_sliding
	step LEFT
	step LEFT
	remove_sliding
	remove_fixed_facing
	step_end

OlivineGymLeft1Movement:
	fix_facing
	set_sliding
	step LEFT
	remove_sliding
	remove_fixed_facing
	step_end

OlivineGymRight9Movement:
	fix_facing
	set_sliding
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	remove_sliding
	remove_fixed_facing
	step_end

OlivineGymRight5Movement:
	fix_facing
	set_sliding
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	remove_sliding
	remove_fixed_facing
	step_end

OlivineGymRight3Movement:
	fix_facing
	set_sliding
	step RIGHT
	step RIGHT
	step RIGHT
	remove_sliding
	remove_fixed_facing
	step_end

OlivineGymRight2Movement:
	fix_facing
	set_sliding
	step RIGHT
	step RIGHT
	remove_sliding
	remove_fixed_facing
	step_end

OlivineGymRight1Movement:
	fix_facing
	set_sliding
	step RIGHT
	remove_sliding
	remove_fixed_facing
	step_end

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

	db 12 ; coord events
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
	coord_event  9, 10, SCENE_DEFAULT, FirstPlatform
	coord_event  4, 10, SCENE_DEFAULT, SecondPlatform

	db 0 ; bg events

	db 3 ; object events
	object_event 99, 99, SPRITE_LIFT, SPRITEMOVEDATA_LIFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
	object_event 14,  0, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerEngineerDante, -1
	object_event  0, 10, SPRITE_BUENA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBeautyAshley, -1
