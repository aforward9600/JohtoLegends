	object_const_def ; object_event constants
	const COLOSSEUM_LINK_TRAINER1
	const COLOSSEUM_LINK_TRAINER2

Colosseum_MapScripts:
	db 3 ; scene scripts
	scene_script .InitializeColosseum ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED
	scene_script .DummyScene2 ; unused

	db 2 ; callbacks
	callback MAPCALLBACK_OBJECTS, .SetWhichChris
	callback MAPCALLBACK_NEWMAP, .PreparePokecenter2F

.InitializeColosseum:
	prioritysjump .InitializeAndPreparePokecenter2F
	end

.DummyScene1:
	end

.DummyScene2:
	end

.SetWhichChris:
	special CableClubCheckWhichChris
	iffalse .Chris2
	disappear COLOSSEUM_LINK_TRAINER2
	appear COLOSSEUM_LINK_TRAINER1
	return

.Chris2:
	disappear COLOSSEUM_LINK_TRAINER1
	appear COLOSSEUM_LINK_TRAINER2
	return

.PreparePokecenter2F:
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_LEAVE_COLOSSEUM
	return

.InitializeAndPreparePokecenter2F:
	setscene SCENE_FINISHED
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_LEAVE_COLOSSEUM
	end

ColosseumConsoleScript:
	special Colosseum
	newloadmap MAPSETUP_LINKRETURN
	end

CableClubFriendScript:
	opentext
	writetext .FriendReadyText
	waitbutton
	closetext
	end

.FriendReadyText:
	text "Your friend is"
	line "ready."
	done

Colosseum_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, POKECENTER_2F, 3
	warp_event  5,  7, POKECENTER_2F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  4,  4, BGEVENT_RIGHT, ColosseumConsoleScript
	bg_event  5,  4, BGEVENT_LEFT, ColosseumConsoleScript

	db 2 ; object events
	object_event  3,  4, SPRITE_LINK_TRAINER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CableClubFriendScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  6,  4, SPRITE_LINK_TRAINER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CableClubFriendScript, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
