	object_const_def ; object_event constants
	const NEWBARKTOWN_RIVAL ; if player is male
	const NEWBARKTOWN_GRAMPS
	const NEWBARKTOWN_FISHER

NewBarkTown_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_NEW_BARK
	return

NewBarkTown_RivalMeetsYou:
	turnobject PLAYER, UP
	special FadeOutMusic
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, NBPlayerStepsBack
	playsound SFX_EXIT_BUILDING
	appear NEWBARKTOWN_RIVAL
	applymovement NEWBARKTOWN_RIVAL, NBRivalStepsDown
	pause 15
	opentext
	writetext Text_MeetMeAfterGym
	waitbutton
	closetext
	pause 15
	applymovement NEWBARKTOWN_RIVAL, NBRivalLeaves1
	turnobject PLAYER, DOWN
	applymovement NEWBARKTOWN_RIVAL, NBRivalLeaves2
	disappear NEWBARKTOWN_RIVAL
	pause 15
	waitsfx
	special RestartMapMusic
	setscene SCENE_FINISHED
	clearevent EVENT_RIVALS_HOUSE_RIVAL
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	end

NewBarkTownGrampsScript:
	jumptextfaceplayer NewBarkTownGrampsText

NewBarkTownLassScript:
	jumptextfaceplayer NewBarkTownLassText

NewBarkTownSign:
	jumptext NewBarkTownSignText

NewBarkTownPlayersHouseSign:
	jumptext NewBarkTownPlayersHouseSignText

NewBarkTownElmsLabSign:
	jumptext NewBarkTownElmsLabSignText

NewBarkTownElmsHouseSign:
	jumptext NewBarkTownElmsHouseSignText

NewBarkTownHouseNotice:
	jumptext NewBarkTownHouseText

NBPlayerStepsBack:
	turn_head UP
	fix_facing
	step DOWN
	remove_fixed_facing
	step_end

NBRivalStepsDown:
	step DOWN
	step_end

NBRivalLeaves1:
	step LEFT
	step DOWN
	step DOWN
	step_end

NBRivalLeaves2:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

NewBarkTownGrampsText:
	text "That lab was just"
	line "built not too long"
	cont "ago now."

	para "Used for #mon"
	line "evolution research"

	para "or something like"
	line "that."
	done

NewBarkTownLassText:
	text "I wonder who will"
	line "buy that house?"

	para "Hope it's someone"
	line "cool."
	done

Text_MeetMeAfterGym:
	text "……………………"

	para "<PLAYER>……"

	para "After you earn"
	line "your last badge…"

	para "Come to my room…"

	para "There's something"
	line "I want to say…"
	done

NewBarkTownSignText:
	text "New Bark Town"

	para "The Town Where the"
	line "Winds of a New"
	cont "Beginning Blow"
	done

NewBarkTownPlayersHouseSignText:
	text "House for Sale."
	done

NewBarkTownElmsLabSignText:
	text "Elm #mon Lab"
	done

NewBarkTownElmsHouseSignText:
	text "Elm's House"
	done

NewBarkTownHouseText:
	text "The door is"
	line "locked…"
	done

NewBarkTown_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  6,  3, ELMS_LAB, 1
	warp_event  3, 11, PLAYERS_NEIGHBORS_HOUSE, 1
	warp_event 11, 13, ELMS_HOUSE, 1

	db 1 ; coord events
	coord_event  6,  4, SCENE_DEFAULT, NewBarkTown_RivalMeetsYou

	db 5 ; bg events
	bg_event  8,  8, BGEVENT_READ, NewBarkTownSign
	bg_event 11,  5, BGEVENT_READ, NewBarkTownPlayersHouseSign
	bg_event  3,  3, BGEVENT_READ, NewBarkTownElmsLabSign
	bg_event  9, 13, BGEVENT_READ, NewBarkTownElmsHouseSign
	bg_event 13,  5, BGEVENT_READ, NewBarkTownHouseNotice

	db 3 ; object events
	object_event  6,  3, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_NEW_BARK_TOWN
	object_event  7, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NewBarkTownGrampsScript, -1
	object_event 15, 10, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NewBarkTownLassScript, -1
