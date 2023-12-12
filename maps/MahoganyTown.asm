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

EarlsPokemonAcademyMahoganySign:
	jumptext EarlsPokemonAcademyMahoganySignText

MahoganyTownPokecenterSign:
	jumpstd pokecentersign

MahoganyTownGrampsText:
	text "Have you noticed"
	line "any unusual #-"
	cont "mon in the area?"

	para "Johto has #mon"
	line "native to our"
	cont "region, as well"
	cont "as Kanto."

	para "But recently, more"
	line "#mon have been"
	cont "popping up."

	para "They are invasive"
	line "species to some."

	para "Normally, they're"
	line "shipped in as"
	cont "exotic pets, and"
	cont "then abandoned."

	para "They reproduce"
	line "with other species"
	cont "and therefore they"
	cont "multiply."

	para "The League and"
	line "locals have begun"
	cont "concentrated eff-"

	para "orts to relocate"
	line "them back to"
	cont "Hoenn and Sinnoh."

	para "Trainers aren't"
	line "above using them"
	cont "when they want, so"
	cont "go ahead."

	para "Someday they may"
	line "no longer be"
	cont "here…"
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
	text "Spring is here,"
	line "but there's still"

	para "snow on the"
	line "ground!"

	para "At least Pryce"
	line "is at home in"
	cont "this weather."
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
	text "I heard Old Man"
	line "Pryce will be"
	cont "moving his Gym to"
	cont "Mahogany Town,"

	para "and Earl will be"
	line "moving his academy"
	cont "to Violet City."

	para "I'm fine with that"
	line "honestly."

	para "I hate school."
	done

MahoganyTownKid2Text:
	text "Earl's lessons are"
	line "pretty useful."

	para "You should get"
	line "some lessons from"
	cont "him."
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

EarlsPokemonAcademyMahoganySignText:
	text "Earl's #mon"
	line "Academy"
	done

MahoganyTown_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 11,  7, MAHOGANY_MART_1F, 1
	warp_event 17,  7, MAHOGANY_RED_GYARADOS_SPEECH_HOUSE, 1
	warp_event  6, 13, EARLS_POKEMON_ACADEMY, 1
	warp_event 15, 13, MAHOGANY_POKECENTER_1F, 1
	warp_event  9,  1, ROUTE_43_MAHOGANY_GATE, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event  1,  5, BGEVENT_READ, MahoganyTownSign
	bg_event  9,  7, BGEVENT_READ, MahoganyTownRagecandybarSign
	bg_event  3, 13, BGEVENT_READ, EarlsPokemonAcademyMahoganySign
	bg_event 16, 13, BGEVENT_READ, MahoganyTownPokecenterSign

	db 5 ; object events
	object_event 15,  5, SPRITE_HIKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownGrampsScript, -1
	object_event  5,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyTownFisherScript, -1
	object_event 12,  8, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownSuperNerdScript, -1
	object_event  3, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownKid1Script, -1
	object_event  2, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyTownKid2Script, -1
