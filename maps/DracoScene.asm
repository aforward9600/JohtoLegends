	object_const_def ; object_event constants

DracoScene_MapScripts:
	db 2 ; scene scripts
	scene_script .DracoSceneMovement ; SCENE_DEFAULT
	scene_script .DummyScene0 ; SCENE_FINISHED

	db 0 ; callbacks

.DracoSceneMovement:
	prioritysjump .DracoSceneMovementScript
	end

.DracoSceneMovementScript:
	applymovement PLAYER, HidePlayerMovementDracoScene
	pause 30
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .FemaleDracoScene
	pause 50
	applymovement PLAYER, PlayerMovesUpDracoScene
	pause 50
	cry HO_OH
	pause 50
	pause 30
	special FadeOutPalettes
	applymovement PLAYER, ShowPlayerMovementDracoScene
	turnobject PLAYER, UP
	warpcheck
	sjump .DracoSceneFinish

.FemaleDracoScene:
	pause 50
	pause 50
	applymovement PLAYER, PlayerMovesLeftDracoScene
	turnobject PLAYER, UP
	special FadeOutPalettes
	warpcheck
.DracoSceneFinish
	end

.DummyScene0:
	end

ShowPlayerMovementDracoScene:
	show_object
	step_end

HidePlayerMovementDracoScene:
	hide_object
	step_end

PlayerMovesUpDracoScene:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

PlayerMovesLeftDracoScene:
	slow_step LEFT
	slow_step LEFT
	step_end

DracoScene_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  4, HO_OH_TOWER_SCENE, 2
	warp_event  4,  9, DAHLIA_SCENE, 3
	warp_event  6,  9, DAHLIA_SCENE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
