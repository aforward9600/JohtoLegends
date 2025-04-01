	object_const_def ; object_event constants

DahliaScene_MapScripts:
	db 2 ; scene scripts
	scene_script .DahliaSceneMovement ; SCENE_DEFAULT
	scene_script .DummyScene0 ; SCENE_FINISHED

	db 0 ; callbacks

.DahliaSceneMovement:
	prioritysjump .DahliaSceneMovementScript
	end

.DahliaSceneMovementScript:
	applymovement PLAYER, HidePlayerMovementDahliaScene
;	moveobject PLAYER, 4, 9
	pause 30
	checkflag ENGINE_PLAYER_IS_FEMALE
	iffalse .MaleDahliaScene
	pause 50
	applymovement PLAYER, PlayerMovesUpDahliaScene
	pause 50
	cry HO_OH
	pause 50
	pause 30
	special FadeOutPalettes
	applymovement PLAYER, ShowPlayerMovementDahliaScene
	turnobject PLAYER, UP
	warpcheck
	sjump .DahliaSceneFinish

.MaleDahliaScene:
	pause 50
	pause 50
	applymovement PLAYER, PlayerMovesRightDahliaScene
	turnobject PLAYER, UP
	special FadeOutPalettes
	warpcheck
.DahliaSceneFinish
	end

.DummyScene0:
	end

ShowPlayerMovementDahliaScene:
	show_object
	step_end

HidePlayerMovementDahliaScene:
	hide_object
	step_end

PlayerMovesUpDahliaScene:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

PlayerMovesRightDahliaScene:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DahliaScene_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4,  4, HO_OH_TOWER_SCENE, 2
	warp_event  6,  9, DRACO_SCENE, 3
	warp_event  4,  9, DRACO_SCENE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
