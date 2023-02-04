	object_const_def
	const ROCKETLAIRHALLWAY1_GRUNTM
	const ROCKETLAIRHALLWAY1_GRUNTF
	const ROCKETLAIRHALLWAY1_SHERLES

RocketLairHallway1_MapScripts:
	db 0 ; scene scripts

	db 1 ; callback
	callback MAPCALLBACK_TILES, .OpenHallDoor

.OpenHallDoor:
	checkevent EVENT_OPEN_DOOR_IN_LAIR
	iftrue .KeepDoorOpen
	changeblock 4, 0, $64 ; locked door
.KeepDoorOpen:
	return

RocketLairHallway1GruntF:
	trainer GRUNTF, GRUNTF_13, EVENT_BEAT_ROCKET_GRUNTF_13, RocketLairHallway1GruntFSeenText, RocketLairHallway1GruntFBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RocketLairHallway1GruntFAfterText
	waitbutton
	closetext
	end

RocketLairHallway1GruntM:
	trainer GRUNTM, GRUNTM_17, EVENT_BEAT_ROCKET_GRUNTM_17, RocketLairHallway1GruntMSeenText, RocketLairHallway1GruntMBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RocketLairHallway1GruntMAfterText
	waitbutton
	closetext
	end

RocketLairLockedDoor:
	checkevent EVENT_OPEN_DOOR_IN_LAIR
	iftrue .Notext
	opentext
	writetext RocketDoorLockedText
	waitbutton
	closetext
.Notext:
	end

RocketLairSherlesScript:
	jumptextfaceplayer RocketLairSherlesText

RocketDoorLockedText:
	text "The door is"
	line "locked…"
	done

RocketLairHallway1GruntFSeenText:
	text "Sorry, but I'm not"
	line "letting you"
	cont "through!"
	done

RocketLairHallway1GruntFBeatenText:
	text "Guess you showed"
	line "me…"
	done

RocketLairHallway1GruntFAfterText:
	text "Don't say I didn't"
	line "warn you…"
	done

RocketLairHallway1GruntMSeenText:
	text "Thanks to you and"
	line "your escapades,"

	para "most of our forces"
	line "have been moved"
	cont "out of here."

	para "…Oops…"

	para "I shouldn't have"
	line "told you that."
	done

RocketLairHallway1GruntMBeatenText:
	text "I should not have"
	line "said that…"
	done

RocketLairHallway1GruntMAfterText:
	text "May as well tell"
	line "you."

	para "There's only a few"
	line "of us left here."

	para "We're abandoning"
	line "this base in favor"
	cont "of somewhere else."

	para "I'm not telling you"
	line "where, so don't"
	cont "ask."
	done

RocketLairSherlesText:
	text "Well done, kid!"

	para "I guess I can't"
	line "call you a kid"
	cont "anymore."

	para "You succeeded"
	line "where we failed."

	para "Good on ya!"

	para "As for me, I think"
	line "I'll be moving on"
	cont "from here."

	para "Heard they need a"
	line "sheriff in Orre,"
	cont "and maybe it'll"
	cont "be a little"
	cont "quieter."

	para "Probably not, ha!"
	done

RocketLairHallway1_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  4, 21, DARK_CAVE_BLACKTHORN_ENTRANCE, 3
	warp_event  5, 21, DARK_CAVE_BLACKTHORN_ENTRANCE, 3
	warp_event  0,  4, HO_OH_LUGIA_ROOM, 1
	warp_event  9,  8, ROCKET_LAIR_BREAK_ROOM, 1
	warp_event  5,  0, ROCKET_LAIR_HALLWAY_2, 1

	db 0 ; coord_events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, RocketLairLockedDoor

	db 3 ; object events
	object_event  2, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, RocketLairHallway1GruntM, EVENT_LAIR_GRUNTS
	object_event  5,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, RocketLairHallway1GruntF, EVENT_LAIR_GRUNTS
	object_event  5, 11, SPRITE_SHERLES, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketLairSherlesScript, EVENT_HOOH_LUGIA_ROOM_OFFICER
