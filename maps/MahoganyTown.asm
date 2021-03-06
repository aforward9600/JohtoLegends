MAHOGANYTOWN_RAGECANDYBAR_PRICE EQU 300

	object_const_def ; object_event constants
	const MAHOGANYTOWN_GRAMPS
	const MAHOGANYTOWN_FISHER
	const MAHOGANYTOWN_SUPER_NERD
	const MAHOGANYTOWN_BUG_CATCHER1
	const MAHOGANYTOWN_BUG_CATCHER2

MahoganyTown_MapScripts:
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
	setflag ENGINE_FLYPOINT_MAHOGANY
	return

MahoganyTownGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext MahoganyTownGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MahoganyTownGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

MahoganyTownFisherScript:
	jumptextfaceplayer MahoganyTownFisherText

MahoganyTownSuperNerdScript:
	jumptextfaceplayer MahoganyTownSuperNerdText

MahoganyTownKid1Script:
	jumptextfaceplayer MahoganyTownKid1Text

MahoganyTownKid2Script:
	jumptextfaceplayer MahoganyTownKid2Text

MahoganyTownSign:
	jumptext MahoganyTownSignText

MahoganyTownRagecandybarSign:
	jumptext MahoganyTownRagecandybarSignText

MahoganyGymSign:
	jumptext MahoganyGymSignText

MahoganyTownPokecenterSign:
	jumpstd pokecentersign

MahoganyTownGrampsText:
	text "The Lake of Rage"
	line "is a spectacular"
	cont "sight."

	para "You should go and"
	line "see for yourself."
	done

MahoganyTownGrampsText_ClearedRocketHideout:
	text "MAGIKARP have"
	line "returned to LAKE"
	cont "OF RAGE."

	para "That should be"
	line "good news for the"
	cont "anglers there."
	done

MahoganyTownFisherText:
	text "You can't catch"
	line "much at the Lake"

	para "of Rage. Magikarp,"
	line "Magikarp, and more"

	para "Magikarp! At"
	line "least, that's all"
	cont "I catch up there."

	para "My friend swears"
	line "he caught a"
	cont "Gyarados in the"
	cont "lake."

	para "I told him he was"
	line "full of Tauros"
	cont "manure!"
	done

MahoganyTownSuperNerdText:
	text "Rumor has it,"
	line "there's a ninja"
	cont "hideout somewhere"

	para "in this town, but"
	line "no one knows where"
	cont "it is."

	para "After all, this"
	line "town is called the"
	cont "home of the ninja,"

	para "so where are they?"
	done

MahoganyTownKid1Text:
	text "Old Man Pryce has"
	line "been pretty cranky"
	cont "lately. I wonder"
	cont "why?"
	done

MahoganyTownKid2Text:
	text "Maybe Old Man"
	line "Pryce is just"
	cont "getting old."

	para "We wouldn't call"
	line "him that if he"
	cont "wasn't."
	done

MahoganyTownSignText:
	text "Mahogany Town"

	para "Welcome to the"
	line "Home of the Ninja"
	done

MahoganyTownRagecandybarSignText:
	text "While visiting"
	line "Mahogany Town, try"
	cont "a Ragecandybar!"
	done

MahoganyGymSignText:
	text "Mahogany Town"
	line "#mon Gym"
	cont "Leader: Pryce"

	para "The Teacher of"
	line "Winter's Harshness"
	done

MahoganyTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 11,  7, MAHOGANY_MART_1F, 1
	warp_event 17,  7, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, 1
	warp_event  6, 13, MAHOGANY_GYM, 1
	warp_event 15, 13, MAHOGANY_POKECENTER_1F, 1
	warp_event  9,  1, ROUTE_43_MAHOGANY_GATE, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event  1,  5, BGEVENT_READ, MahoganyTownSign
	bg_event  9,  7, BGEVENT_READ, MahoganyTownRagecandybarSign
	bg_event  3, 13, BGEVENT_READ, MahoganyGymSign
	bg_event 16, 13, BGEVENT_READ, MahoganyTownPokecenterSign

	db 5 ; object events
	object_event 15,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrampsScript, -1
	object_event  5,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyTownFisherScript, -1
	object_event 12,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownSuperNerdScript, -1
	object_event  3, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownKid1Script, -1
	object_event  2, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownKid2Script, -1
