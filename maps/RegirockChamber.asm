	object_const_def ; object_event constants
	const REGIROCKCHAMBER_REGIROCK

RegirockChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RegirockScript:
	opentext
	writetext RegirockText
	pause 15
	cry REGIROCK
	waitbutton
	closetext
	loadwildmon REGIROCK, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_REGI
	startbattle
	ifequal LOSE, .NotBeaten
	disappear REGIROCKCHAMBER_REGIROCK
	special CheckCaughtCelebi
	iftrue .CaughtRegirock
	setevent EVENT_BEAT_REGIROCK
	end

.CaughtRegirock:
	setevent EVENT_CAUGHT_REGIROCK
	end

.NotBeaten:
	reloadmapafterbattle
	end

RegirockText:
	text "Zaza zari za…"
	done

RegirockChamber_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  7, ALTERING_CAVE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  4, SPRITE_REGIROCK, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, RegirockScript, EVENT_ALTERING_CAVE_REGIROCK
	