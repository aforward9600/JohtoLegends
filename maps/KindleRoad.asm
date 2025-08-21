	object_const_def ; object_event constants
	const KINDLEROAD_SCIENTIST

KindleRoad_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

MtEmberEruptsScript:
	pause 10
	special FadeOutMusic
	pause 30
	scall .FX
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	scall .FX
	scall .FX
	scall .FX
	scall .FX
	scall .FX
	pause 30
	special RestartMapMusic
	turnobject KINDLEROAD_SCIENTIST, DOWN
	showemote EMOTE_SHOCK, KINDLEROAD_SCIENTIST, 15
	opentext
	writetext VolcanoEruptedText
	waitbutton
	closetext
	turnobject KINDLEROAD_SCIENTIST, UP
	setevent EVENT_MT_EMBER_ERRUPTED
	setscene SCENE_FINISHED
	end

.FX:
	playsound SFX_STRENGTH
	earthquake 80
	pause 15
	end

KindleRoadScientistScript:
	jumptextfaceplayer KindleRoadRegidragoText

VolcanoEruptedText:
	text "Hey! You should"
	line "leave!"

	para "Mt. Ember just"
	line "erupted!"

	para "It's dangerous"
	line "here!"
	done

KindleRoadRegidragoText:
	text "It wasn't set to"
	line "erupt for a while"
	cont "now…"

	para "Could it be caused"
	line "by the #mon"
	cont "said to be sealed"
	cont "at the summit?"
	done

KindleRoad_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10,  5, MT_EMBER, 1
	warp_event 11,  5, MT_EMBER, 2
;	warp_event 15, 31, PLAYERS_HOUSE_1F, 1

	db 4 ; coord events
	coord_event 10, 32, SCENE_DEFAULT, MtEmberEruptsScript
	coord_event 11, 32, SCENE_DEFAULT, MtEmberEruptsScript
	coord_event 12, 32, SCENE_DEFAULT, MtEmberEruptsScript
	coord_event 13, 32, SCENE_DEFAULT, MtEmberEruptsScript

	db 0 ; bg events

	db 1 ; object events
	object_event 11, 30, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KindleRoadScientistScript, -1
	