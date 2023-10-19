	object_const_def ; object_event constants
	const SEAFOAMISLANDB4F_ARTICUNO
	const SEAFOAMISLANDB4F_BIRDKEEPER

SeafoamIslandB4F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Articuno

.Articuno:
	checkevent EVENT_CAUGHT_ARTICUNO
	iftrue .ArticunoWillNotAppear
	checkevent EVENT_BEAT_ARTICUNO
	iftrue .ArticunoWillNotAppear
	appear SEAFOAMISLANDB4F_ARTICUNO
	return

.ArticunoWillNotAppear:
	disappear SEAFOAMISLANDB4F_ARTICUNO
	return

ArticunoScript:
	opentext
	writetext ArticunoCry
	pause 15
	cry ARTICUNO
	waitbutton
	closetext
	loadwildmon ARTICUNO, 70
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear SEAFOAMISLANDB4F_ARTICUNO
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtArticuno
	setevent EVENT_BEAT_ARTICUNO
	end

.CaughtArticuno:
	setevent EVENT_CAUGHT_ARTICUNO
	end

.NotBeaten:
	reloadmapafterbattle
	end

SeafoamIslandBirdkeeperScript:
	opentext
	checkevent EVENT_CAUGHT_ARTICUNO
	iftrue .CaughtArticunoKeeper
	checkevent EVENT_BEAT_ARTICUNO
	iftrue .BeatArticuno
	writetext SeafoamIslandBirdkeeperText1
	waitbutton
	closetext
	turnobject SEAFOAMISLANDB4F_BIRDKEEPER, UP
	end

.CaughtArticunoKeeper:
	writetext SeafoamIslandBirdkeeperText2
	waitbutton
	closetext
	turnobject SEAFOAMISLANDB4F_BIRDKEEPER, UP
	end

.BeatArticuno:
	writetext SeafoamIslandBirdkeeperText3
	waitbutton
	closetext
	turnobject SEAFOAMISLANDB4F_BIRDKEEPER, UP
	end

ArticunoCry:
	text "Articuno: Gyao!"
	done

SeafoamIslandBirdkeeperText1:
	text "Do you see that?"

	para "Over there, it's"
	line "the Legendary"
	cont "Articuno!"

	para "I just need to"
	line "get over there."
	done

SeafoamIslandBirdkeeperText2:
	text "You caught it?"

	para "Lucky…"
	done

SeafoamIslandBirdkeeperText3:
	text "Articuno is gone"
	line "now…"
	done

SeafoamIslandB4F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13,  7, SEAFOAM_ISLAND_B3F, 4
	warp_event 27,  3, SEAFOAM_ISLAND_B3F, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  9,  1, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArticunoScript, EVENT_SEAFOAM_ISLAND_ARTICUNO
	object_event  9,  6, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandBirdkeeperScript, -1
