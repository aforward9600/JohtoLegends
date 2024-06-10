	object_const_def ; object_event constants
	const SEAFOAMISLANDB4F_ARTICUNO
	const SEAFOAMISLANDB4F_BIRDKEEPER
	const SEAFOAMISLANDB4F_BOULDER1
	const SEAFOAMISLANDB4F_BOULDER2

SeafoamIslandB4F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .SeafoamIslandB4FCurrents
	callback MAPCALLBACK_OBJECTS, .Articuno

.SeafoamIslandB4FCurrents:
	checkevent EVENT_SEAFOAM_ISLAND_BOULDER_B4F_FALLEN
	iftrue .CalmWaterB4FCallback
	iffalse .CheckBoulderB4F
	return

.CalmWaterB4FCallback:
	changeblock 6, 14, $4d
	changeblock 6, 16, $4d
	changeblock 8, 14, $4d
	return

.CheckBoulderB4F:
	checkevent EVENT_SEAFOAM_ISLAND_BOULDER_B4F_1
	iftrue .NeedsBoulderB4F
	checkevent EVENT_SEAFOAM_ISLAND_BOULDER_B4F_2
	iftrue .NeedsBoulderB4F
.CalmWaterB4F:
	changeblock 6, 14, $4d
	changeblock 6, 16, $4d
	changeblock 8, 14, $4d
	reloadmappart
	setevent EVENT_SEAFOAM_ISLAND_BOULDER_B4F_FALLEN
.NeedsBoulderB4F:
	return

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

SeafoamIslandB4FBoulder:
	jumptext SeafoamIslandB4FBoulderText

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

SeafoamIslandB4FBoulderText:
	text "It looks like this"
	line "boulder isn't going"
	cont "anywhere now!"
	done

SeafoamIslandB4F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event 13,  9, SEAFOAM_ISLAND_B3F, 4
	warp_event 27,  5, SEAFOAM_ISLAND_B3F, 5
	warp_event 22, 19, SEAFOAM_ISLAND_B3F, 8
	warp_event 23, 19, SEAFOAM_ISLAND_B3F, 9
	warp_event  6, 17, SEAFOAM_ISLAND_B3F, 10
	warp_event  7, 17, SEAFOAM_ISLAND_B3F, 11

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  3, SPRITE_ARTICUNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ArticunoScript, EVENT_SEAFOAM_ISLAND_ARTICUNO
	object_event  9,  8, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandBirdkeeperScript, -1
	object_event  6, 18, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandB4FBoulder, EVENT_SEAFOAM_ISLAND_BOULDER_B4F_1
	object_event  7, 18, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SeafoamIslandB4FBoulder, EVENT_SEAFOAM_ISLAND_BOULDER_B4F_2
