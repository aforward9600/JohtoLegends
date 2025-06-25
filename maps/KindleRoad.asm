	object_const_def ; object_event constants

KindleRoad_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

KindleRoad_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10,  5, MT_EMBER, 1
	warp_event 11,  5, MT_EMBER, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
	