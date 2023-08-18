	object_const_def ; object_event constants
	const ROUTE31VIOLETGATE_OFFICER
	const ROUTE31VIOLETGATE_COOLTRAINER_F

Route31VioletGate_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

Route31VioletGateOfficerScript:
	jumptextfaceplayer Route31VioletGateOfficerText

Route31VioletGateCooltrainerFScript:
	setscene SCENE_DEFAULT
	jumptextfaceplayer Route31VioletGateCooltrainerFText

Route31VioletGateStopPlayer:
	turnobject PLAYER, UP
	opentext
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .YouCanGoThrough
	writetext YouCantGoThroughText
	waitbutton
	closetext
	applymovement PLAYER, Route31VioletGateStopPlayerMovement
	end

.YouCanGoThrough:
	writetext ThatsTheZepherBadgeText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_RIVALS_HOUSE_RIVAL
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iffalse .ClearCynthia
	end

.ClearCynthia:
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

Route31VioletGateStopPlayerMovement:
	step LEFT
	step_end

YouCantGoThroughText:
	text "Sorry, but you"
	line "can't go through"
	cont "without the"
	cont "ZephyrBadge."

	para "It's dangerous."
	done

ThatsTheZepherBadgeText:
	text "Ah, I see you have"
	line "the ZephyrBadge."

	para "You can go through"
	line "now."
	done

ThatsTheZepherBadgeText2:
	text "Ah, I see you have"
	line "the ZephyrBadge."

	para "I'm afraid this is"
	line "the end of the"
	cont "hack for now."

	para "Come back when the"
	line "hack is further"
	cont "along."
	done

Route31VioletGateOfficerText:
	text "Hi there!"
	line "Did you visit"
	cont "Sprout Tower?"
	done

Route31VioletGateCooltrainerFText:
	text "I came too far"
	line "out. I'd better"
	cont "phone home from"
	cont "the Center!"
	done

Route31VioletGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, VIOLET_CITY, 8
	warp_event  0,  5, VIOLET_CITY, 9
	warp_event  9,  4, ROUTE_31, 1
	warp_event  9,  5, ROUTE_31, 2

	db 2 ; coord events
	coord_event 5, 4, SCENE_DEFAULT, Route31VioletGateStopPlayer
	coord_event 5, 5, SCENE_DEFAULT, Route31VioletGateStopPlayer

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route31VioletGateOfficerScript, -1
	object_event  1,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route31VioletGateCooltrainerFScript, -1
