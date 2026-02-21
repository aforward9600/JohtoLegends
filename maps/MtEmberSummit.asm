	object_const_def ; object_event constants
	const MTEMBERSUMMIT_MOLTRES_G

MtEmberSummit_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GalarianMoltresScript:
	opentext
	writetext MoltresGText
	pause 15
	cry MOLTRES_G
	waitbutton
	closetext
	loadwildmon MOLTRES_G, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear MTEMBERSUMMIT_MOLTRES_G
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtMoltresG
	setevent EVENT_BEAT_MOLTRES_G
	end

.CaughtMoltresG:
	setevent EVENT_CAUGHT_MOLTRES_G
	end

.NotBeaten:
	reloadmapafterbattle
	end

MoltresGText:
	text "Gyaoo!"
	done

MtEmberSummit_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  9,  8, SPRITE_MOLTRES_G, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, GalarianMoltresScript, EVENT_MT_EMBER_MOLTRES_G
	