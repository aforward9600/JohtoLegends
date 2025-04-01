	object_const_def ; object_event constants

HoOhTowerScene_MapScripts:
	db 2 ; scene scripts
	scene_script .HoOhTowerSceneMovement ; SCENE_DEFAULT
	scene_script .DummyScene0 ; SCENE_FINISHED

	db 0 ; callbacks

.HoOhTowerSceneMovement:
	prioritysjump .HoOhTowerSceneMovementScript
	end

.HoOhTowerSceneMovementScript:
	applymovement PLAYER, HidePlayerMovementHoOhScene
;	moveobject PLAYER, 4, 9
	pause 50
	applymovement PLAYER, PlayerMovesUpHoOhScene
	pause 50
	cry HO_OH
	pause 50
	special FadeOutMusic
	pause 30
	special FadeOutPalettes
	applymovement PLAYER, ShowPlayerMovementHoOhScene
	turnobject PLAYER, UP
	setmapscene TIN_TOWER_ROOF, SCENE_TIN_TOWER_AFTER_HO_OH
	warpcheck
	end

.DummyScene0:
	end

ShowPlayerMovementHoOhScene:
	show_object
	step_end

HidePlayerMovementHoOhScene:
	hide_object
	step_end

PlayerMovesUpHoOhScene:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

HoOhTowerScene_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  5, TIN_TOWER_ROOF, 2
	warp_event  4, 14, DRACO_SCENE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
