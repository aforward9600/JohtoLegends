	object_const_def ; object_event constants
	const REGICECHAMBER_REGICE

RegiceChamber_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RegiceScript:
	opentext
	writetext RegiceText
	pause 15
	cry REGICE
	waitbutton
	closetext
	loadwildmon REGICE, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_REGI
	startbattle
	ifequal LOSE, .NotBeaten
	disappear REGICECHAMBER_REGICE
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtRegice
	setevent EVENT_BEAT_REGICE
	end

.CaughtRegice:
	setevent EVENT_CAUGHT_REGICE
	end

.NotBeaten:
	reloadmapafterbattle
	end

RegiceText:
	text "Jakiih!"
	done

RegiceChamber_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  4,  7, REGICE_PUZZLE_CHAMBER, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_REGICE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, RegiceScript, EVENT_ICEFALL_CAVE_REGICE
	