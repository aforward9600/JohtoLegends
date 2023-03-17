	object_const_def ; object_event constants
	const NOWNROOM_NOWN_OPEN_EYES

NownRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

NownClosedScript:
	opentext
	writetext AStrangeStatueText
	waitbutton
	closetext
	pause 30
	turnobject NOWNROOM_NOWN_OPEN_EYES, LEFT
	playsound SFX_POKEBALLS_PLACED_ON_TABLE
	pause 30
	loadwildmon NOWN, 50
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	startbattle
	ifequal LOSE, .NotBeaten
	disappear NOWNROOM_NOWN_OPEN_EYES
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtNown
	setevent EVENT_BEAT_NOWN
	setevent EVENT_NOWN_EYES_OPEN
	end

.CaughtNown:
	setevent EVENT_CAUGHT_NOWN
	setevent EVENT_NOWN_EYES_OPEN
	end

.NotBeaten:
	reloadmapafterbattle
	end

AStrangeStatueText:
	text "There is a strange"
	line "staute here…"
	done

NownRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 21, NOWN_PUZZLE_ROOM, 3
	warp_event  4, 21, NOWN_PUZZLE_ROOM, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  4,  2, SPRITE_NOWN_OPEN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NownClosedScript, EVENT_NOWN_EYES_OPEN
