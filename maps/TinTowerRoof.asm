	object_const_def ; object_event constants
	const TINTOWERROOF_HO_OH
	const TINTOWERROOF_HO_OH_2
	const TINTOWERROOF_MIYAMOTO
	const TINTOWERROOF_CHRIS ; if male
	const TINTOWERROOF_KRIS ; if female
	const TINTOWERROOF_RIVAL
	const TINTOWERROOF_SHERLES

TinTowerRoof_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .HoOh

.DummyScene0:
	end

.DummyScene1:
	end

.HoOh:
	checkevent EVENT_CAUGHT_HO_OH
	iftrue .NoAppear
;	checkitem RAINBOW_WING
;	iftrue .Appear
;	sjump .NoAppear

.Appear:
	appear TINTOWERROOF_HO_OH
	return

.NoAppear:
	disappear TINTOWERROOF_HO_OH
	return

MiyamotoCatchesHoOhLeft:
	applymovement PLAYER, PlayerHoOhMovement1
	turnobject PLAYER, UP
	sjump MeetUpHoOh

MiyamotoCatchesHoOhRight:
	applymovement PLAYER, PlayerHoOhMovement2
MeetUpHoOh:
	end

TinTowerHoOh:
	faceplayer
	opentext
	writetext HoOhText
	cry HO_OH
	pause 15
	closetext
	setevent EVENT_FOUGHT_HO_OH
	loadvar VAR_BATTLETYPE, BATTLETYPE_HO_OH
	loadwildmon HO_OH, 60
	startbattle
	ifequal LOSE, .NotBeatenHoOh
	disappear TINTOWERROOF_HO_OH
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
.NotBeatenHoOh:
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtHoOh
	end

.CaughtHoOh:
	opentext
	writetext HoOhText
	waitbutton
	closetext
	end

PlayerHoOhMovement1:
	step UP
	step UP
	step UP
	step UP
	step UP
	step LEFT
	step_end

PlayerHoOhMovement2:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

HoOhText:
	text "Shaoooh!"
	done

TinTowerRoof_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9, 17, TIN_TOWER_9F, 4

	db 2 ; coord events
	coord_event  8, 16, SCENE_DEFAULT, MiyamotoCatchesHoOhLeft
	coord_event  9, 16, SCENE_DEFAULT, MiyamotoCatchesHoOhRight

	db 0 ; bg events

	db 7 ; object events
	object_event  9,  9, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TinTowerHoOh, EVENT_TIN_TOWER_ROOF_HO_OH
	object_event  9,  2, SPRITE_HO_OH, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_ROOF_HO_OH_2
	object_event  9, 10, SPRITE_MIYAMOTO, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  9, 11, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_ROOF_PLAYER
	object_event  9, 11, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_ROOF_PLAYER
	object_event  8, 15, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_ROOF_PLAYER
	object_event  8, 15, SPRITE_SHERLES, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TIN_TOWER_ROOF_PLAYER
