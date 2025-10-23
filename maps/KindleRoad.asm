	object_const_def ; object_event constants
	const KINDLEROAD_SCIENTIST
	const KINDLEROAD_SCIENTIST2
	const KINDLEROAD_ROCK1
	const KINDLEROAD_ROCK2
	const KINDLEROAD_POKE_BALL1
	const KINDLEROAD_POKE_BALL2
	const KINDLEROAD_POKE_BALL3
	const KINDLEROAD_YOUNSTER
	const KINDLEROAD_TWIN
	const KINDLEROAD_CAMPER
	const KINDLEROAD_SWIMMERM
	const KINDLEROAD_COOLTRAINERF

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

KindleRoadScientistScript2:
	faceplayer
	opentext
	writetext KindleRoadScientistText2
	waitbutton
	closetext
	turnobject UP, KINDLEROAD_SCIENTIST2
	end

TrainerYoungsterMik:
	trainer YOUNGSTER, MIK, EVENT_BEAT_YOUNGSTER_MIK, YoungsterMikSeenText, YoungsterMikBeatenText, 0, .Script

.Script
	endifjustbattled
	jumptext YoungsterMikAfterText

TrainerSwimmerDaryl:
	trainer SWIMMERM, DARYL, EVENT_BEAT_SWIMMERM_JACKSON, SwimmerDarylSeenText, SwimmerDarylBeatenText, 0, .Script

.Script
	endifjustbattled
	jumptext SwimmerDarylAfterText

TrainerCooltrainerFRaina:
	trainer COOLTRAINERF, REENA2, EVENT_BEAT_COOLTRAINERF_REENA2, CooltrainerFRainaSeenText, CooltrainerFRainaBeatenText, 0, .Script

.Script
	endifjustbattled
	jumptext CooltrainerFRainaAfterText

TrainerCamperGerald:
	trainer CAMPER, GERALD, EVENT_BEAT_CAMPER_GERALD, CamperGeraldSeenText, CamperGeraldBeatenText, 0, .Script

.Script
	endifjustbattled
	jumptext CamperGeraldAfterText

KindleRoadTwinScript:
	jumptextfaceplayer KindleRoadTwinText

KindleRoadSign:
	jumptext KindleRoadSignText

KindleRoadRock:
	jumpstd smashrock

KindleRoadCarbos:
	itemball CARBOS

KindleRoadFullRestore:
	itemball FULL_RESTORE

KindleRoadMaxRepel:
	itemball MAX_REPEL

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

KindleRoadScientistText2:
	text "This might be the"
	line "perfect place for"
	cont "a hot spring,"

	para "wouldn't you say?"
	done

KindleRoadSignText:
	text "Kindle Road"

	para "North - Mt. Ember"

	para "South - One Island"
	done

YoungsterMikSeenText:
	text "My sister and I"
	line "plan on becoming"
	cont "strong!"
	done

YoungsterMikBeatenText:
	text "I'm sorry Kia!"
	done

YoungsterMikAfterText:
	text "I must get"
	line "stronger!"
	done

KindleRoadTwinText:
	text "My brother and I"
	line "will become strong"
	cont "someday!"
	done

CamperGeraldSeenText:
	text "Don't you love the"
	line "great outdoors?"
	done

CamperGeraldBeatenText:
	text "It is great,"
	line "after all!"
	done

CamperGeraldAfterText:
	text "I'm not worried"
	line "about the volcano."

	para "I'm a survivor!"
	done

SwimmerDarylSeenText:
	text "Did you see that"
	line "eruption?"

	para "Good thing I'm in"
	line "the water!"
	done

SwimmerDarylBeatenText:
	text "What do you mean"
	line "the water isn't"
	cont "safe?!"
	done

SwimmerDarylAfterText:
	text "Maybe I should"
	line "swim back to"
	cont "shore now…"
	done

CooltrainerFRainaSeenText:
	text "Running around"
	line "these rocky cliffs"
	cont "is good for my"
	cont "legs!"
	done

CooltrainerFRainaBeatenText:
	text "Hey! Stop looking"
	line "at my legs!"
	done

CooltrainerFRainaAfterText:
	text "You should try it!"
	done

KindleRoad_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10,  5, MT_EMBER, 1
	warp_event 11,  5, MT_EMBER, 2

	db 4 ; coord events
	coord_event 10, 32, SCENE_DEFAULT, MtEmberEruptsScript
	coord_event 11, 32, SCENE_DEFAULT, MtEmberEruptsScript
	coord_event 12, 32, SCENE_DEFAULT, MtEmberEruptsScript
	coord_event 13, 32, SCENE_DEFAULT, MtEmberEruptsScript

	db 1 ; bg events
	bg_event 14, 32, BGEVENT_READ, KindleRoadSign

	db 12 ; object events
	object_event 11, 30, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KindleRoadScientistScript, -1
	object_event 15, 32, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KindleRoadScientistScript2, -1
	object_event 16, 42, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KindleRoadRock, -1
	object_event 17, 43, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KindleRoadRock, -1
	object_event 17, 40, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KindleRoadCarbos, EVENT_KINDLE_ROAD_CARBOS
	object_event 18, 65, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KindleRoadMaxRepel, EVENT_KINDLE_ROAD_MAX_REPEL
	object_event 19, 67, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KindleRoadFullRestore, EVENT_KINDLE_ROAD_FULL_RESTORE
	object_event  9, 38, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerYoungsterMik, -1
	object_event  8, 38, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KindleRoadTwinScript, -1
	object_event 10, 54, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerCamperGerald, -1
	object_event  9, 18, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerSwimmerDaryl, -1
	object_event 15, 65, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerFRaina, -1
