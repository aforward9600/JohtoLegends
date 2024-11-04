	object_const_def ; object_event constants

DracoScene_MapScripts:
	db 2 ; scene scripts
	scene_script .DracoSceneMovement ; SCENE_DEFAULT
	scene_script .DracoSceneMovement ; SCENE_FINISHED

	db 0 ; callbacks

.DracoSceneMovement:
	prioritysjump .DracoSceneMovementScript
	end

.DracoSceneMovementScript:
	applymovement PLAYER, HidePlayerMovementDracoScene
;	moveobject PLAYER, 4, 9
	pause 30
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .FemaleDracoScene
	pause 50
	applymovement PLAYER, PlayerMovesUpDracoScene
	pause 50
	cry HO_OH
	pause 50
	special FadeOutPalettes
	warp TIN_TOWER_ROOF, 9, 11
	turnobject PLAYER, UP
	setmapscene TIN_TOWER_ROOF, SCENE_TIN_TOWER_AFTER_HO_OH
;	blackoutmod TIN_TOWER_ROOF
	sjump .DracoSceneFinish

.FemaleDracoScene:
	pause 50
	pause 50
	special FadeOutPalettes
	warp TIN_TOWER_ROOF, 9, 11
;   warp DAHLIA_SCENE, 0, 13
	turnobject PLAYER, UP
;	blackoutmod TIN_TOWER_ROOF
;	blackoutmod DAHLIA_SCENE
.DracoSceneFinish
	return

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

DracoSceneSilenceText:
	text "<PLAYER>:…………………………"
	done

DracoSceneRivalText:
	text "<RIVAL>:…Ho-Oh…"
	line "…The Legendary"
	line "#mon…"
	done

DracoScene_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
