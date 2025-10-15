	object_const_def ; object_event constants
	const REGIGIGASCHAMBER_REGIGIGAS

RegigigasChamber_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoor

.HiddenDoor:
	changeblock 2, 0, $a0
	changeblock 4, 0, $a0
	return

RegigigasScript:
	opentext
	writetext RegigigasText
	pause 15
	cry REGIGIGAS
	waitbutton
	closetext
	loadwildmon REGIGIGAS, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_REGI
	startbattle
	ifequal LOSE, .NotBeaten
	disappear REGIGIGASCHAMBER_REGIGIGAS
	special CheckCaughtCelebi
	iftrue .CaughtRegigigas
	setevent EVENT_BEAT_REGIGIGAS
	end

.CaughtRegigigas:
	setevent EVENT_CAUGHT_REGIGIGAS
	end

.NotBeaten:
	reloadmapafterbattle
	end

RegigigasText:
	text "Zut zutt!"
	done

RegigigasChamber_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  9, ONAGAN_TEMPLE_INSIDE, 3
	warp_event  4,  9, ONAGAN_TEMPLE_INSIDE, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event  2,  7, BGEVENT_READ, OnaganTemplePillar
	bg_event  2,  3, BGEVENT_READ, OnaganTemplePillar
	bg_event  5,  3, BGEVENT_READ, OnaganTemplePillar
	bg_event  5,  7, BGEVENT_READ, OnaganTemplePillar

	db 1 ; object events
	object_event  4,  5, SPRITE_REGIGIGAS, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, RegigigasScript, EVENT_ONAGAN_TEMPLE_REGIGIGAS
	