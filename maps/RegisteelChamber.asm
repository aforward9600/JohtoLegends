	object_const_def ; object_event constants
	const REGISTEELCHAMBER_REGISTEEL

RegisteelChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RegisteelScript:
	opentext
	writetext RegisteelText
	pause 15
	cry REGISTEEL
	waitbutton
	closetext
	loadwildmon REGISTEEL, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_REGI
	startbattle
	ifequal LOSE, .NotBeaten
	disappear REGISTEELCHAMBER_REGISTEEL
	special CheckCaughtCelebi
	iftrue .CaughtRegisteel
	setevent EVENT_BEAT_REGISTEEL
	end

.CaughtRegisteel:
	setevent EVENT_CAUGHT_REGISTEEL
	end

.NotBeaten:
	reloadmapafterbattle
	end

RegisteelText:
	text "Ji-ji-ze-ji-zoh."
	done

RegisteelChamber_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6, 10, DOTTED_HOLE_B4F, 4
	warp_event 11,  7, DOTTED_HOLE_ENTRANCE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  6,  6, SPRITE_REGISTEEL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, RegisteelScript, EVENT_DOTTED_HOLE_REGISTEEL
	