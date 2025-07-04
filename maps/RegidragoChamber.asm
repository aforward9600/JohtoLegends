	object_const_def ; object_event constants
	const REGIDRAGOCHAMBER_REGIDRAGO

RegidragoChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RegidragoScript:
	opentext
	writetext RegidragoText
	pause 15
	cry REGIDRAGO
	waitbutton
	closetext
	loadwildmon REGIDRAGO, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_REGI
	startbattle
	ifequal LOSE, .NotBeaten
	disappear REGIDRAGOCHAMBER_REGIDRAGO
	special CheckCaughtCelebi
	iftrue .CaughtRegidrago
	setevent EVENT_BEAT_REGIDRAGO
	end

.CaughtRegidrago:
	setevent EVENT_CAUGHT_REGIDRAGO
	end

.NotBeaten:
	reloadmapafterbattle
	end

RegidragoText:
	text "Zagd."
	done

RegidragoChamber_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  7, REGIDRAGO_PUZZLE_CHAMBER, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  3, SPRITE_REGIDRAGO, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, RegidragoScript, EVENT_MT_EMBER_REGIDRAGO
	