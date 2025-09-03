	object_const_def ; object_event constants
	const BERRYFOREST_YOUNGSTER
	const BERRYFOREST_HYPNO

BerryForest_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BerryForestYoungsterScript:
	faceplayer
	opentext
	writetext BerryForestYoungsterText1
	waitbutton
	closetext
	pause 15
	cry HYPNO
	showemote EMOTE_SHOCK, BERRYFOREST_YOUNGSTER, 15
	turnobject BERRYFOREST_YOUNGSTER, UP
	opentext
	writetext BerryForestYoungsterText2
	waitbutton
	closetext
	pause 15
	appear BERRYFOREST_HYPNO
	turnobject PLAYER, UP
	loadwildmon HYPNO, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear BERRYFOREST_HYPNO
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtHypno
	setevent EVENT_BEAT_HYPNO
	sjump .EndHypno

.CaughtHypno:
	setevent EVENT_CAUGHT_HYPNO
.EndHypno:
	faceplayer
	opentext
	writetext BerryForestYoungsterText3
	waitbutton
	closetext
	setevent EVENT_LOST_BOY_BERRY_FOREST
	clearevent EVENT_LOST_BOY_TWO_ISLAND
	pause 15
	warp TWO_ISLAND_GAME_HOUSE, 4, 7
	end

.NotBeaten:
	reloadmapafterbattle
	end

BerryForestHypno:
	opentext
	writetext BerryForestHypnoText
	pause 15
	cry HYPNO
	waitbutton
	closetext
	loadwildmon HYPNO, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear BERRYFOREST_HYPNO
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtHypno
	setevent EVENT_BEAT_HYPNO
	end

.CaughtHypno:
	setevent EVENT_CAUGHT_HYPNO
	end

.NotBeaten:
	reloadmapafterbattle
	end

BerryForestHypnoText:
	text "Hypno!"
	done

BerryForestYoungsterText1:
	text "Wah!"

	para "Please help me!"
	done

BerryForestYoungsterText2:
	text "Oh no…"

	para "It's back!"
	done

BerryForestYoungsterText3:
	text "Thank you!"

	para "My mom sent me to"
	line "pick berries here,"

	para "but that #mon"
	line "scared me!"

	para "I'm fine now, so"
	line "let's head to my"
	cont "house!"
	done

BerryForest_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 26, 37, BOND_BRIDGE, 1
	warp_event 27, 37, BOND_BRIDGE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  2, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BerryForestYoungsterScript, EVENT_LOST_BOY_BERRY_FOREST
	object_event  2,  0, SPRITE_HYPNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BerryForestHypno, EVENT_BERRY_FOREST_HYPNO
