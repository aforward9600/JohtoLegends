	object_const_def ; object_event constants
	const CINNABARVOLCANOB2F_MOLTRES
	const CINNABARVOLCANOB2F_BOULDER1
	const CINNABARVOLCANOB2F_BOULDER2
	const CINNABARVOLCANOB2F_BOULDER3
	const CINNABARVOLCANOB2F_BOULDER4
	const CINNABARVOLCANOB2F_BOULDER5
	const CINNABARVOLCANOB2F_BOULDER6

CinnabarVolcanoB2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Moltres

.Moltres:
	checkevent EVENT_CAUGHT_MOLTRES
	iftrue .MoltresWillNotAppear
	checkevent EVENT_BEAT_MOLTRES
	iftrue .MoltresWillNotAppear
	appear CINNABARVOLCANOB2F_MOLTRES
	return

.MoltresWillNotAppear:
	disappear CINNABARVOLCANOB2F_MOLTRES
	return

CinnabarVolcanoB2FMoltres:
	opentext
	writetext MoltresCry
	pause 15
	cry MOLTRES
	waitbutton
	closetext
	loadwildmon MOLTRES, 70
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear CINNABARVOLCANOB2F_MOLTRES
	reloadmapafterbattle
	checkevent EVENT_GOT_FLAME_DOWN
	iftrue .AfterMoltresBattle
	opentext
	giveitem FLAME_DOWN
	waitsfx
	writetext GotFlameDownText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_FLAME_DOWN
	closetext
.AfterMoltresBattle:
	special CheckCaughtCelebi
	iftrue .CaughtMoltres
	setevent EVENT_BEAT_MOLTRES
	end

.CaughtMoltres:
	setevent EVENT_CAUGHT_MOLTRES
	end

.NotBeaten:
	reloadmapafterbattle
	end

CinnabarVolcanoB2FBoulder:
	jumpstd strengthboulder

MoltresCry:
	text "Moltres: Gyaoo!"
	done

GotFlameDownText:
	text "<PLAYER> got Flame"
	line "Down!"
	done

CinnabarVolcanoB2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5, 17, CINNABAR_VOLCANO_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  5,  1, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarVolcanoB2FMoltres, EVENT_CINNABAR_VOLCANO_MOLTRES
	object_event  4, 14, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarVolcanoB2FBoulder, -1
	object_event  4, 16, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarVolcanoB2FBoulder, -1
	object_event  5, 15, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarVolcanoB2FBoulder, -1
	object_event  5,  8, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarVolcanoB2FBoulder, -1
	object_event  5, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarVolcanoB2FBoulder, -1
	object_event  4,  9, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarVolcanoB2FBoulder, -1
