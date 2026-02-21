	object_const_def ; object_event constants
	const LOSTCAVEREGIELEKI_REGIELEKI

LostCaveRegieleki_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RegielekiScript:
	opentext
	writetext RegielekiText
	pause 15
	cry REGIELEKI
	waitbutton
	closetext
	loadwildmon REGIELEKI, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_REGI
	startbattle
	ifequal LOSE, .NotBeaten
	disappear LOSTCAVEREGIELEKI_REGIELEKI
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtRegieleki
	setevent EVENT_BEAT_REGIELEKI
	end

.CaughtRegieleki:
	setevent EVENT_CAUGHT_REGIELEKI
	end

.NotBeaten:
	reloadmapafterbattle
	end

RegielekiText:
	text "Zizi zizizi"
	done

LostCaveRegieleki_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  7, REGIELEKI_PUZZLE_CHAMBER, 2 ; down to up

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_REGIELEKI, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, RegielekiScript, EVENT_LOST_CAVE_REGIELEKI
	