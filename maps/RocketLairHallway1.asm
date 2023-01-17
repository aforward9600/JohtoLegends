	object_const_def
	const ROCKETLAIRHALLWAY1_GRUNTM
	const ROCKETLAIRHALLWAY1_GRUNTF

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
	end

RocketLairHallway1GruntM:
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

RocketDoorLockedText:
	text "The door is"
	line "locked…"
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

	db 2 ; object events
	object_event  2, 14, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAIR_GRUNTS
	object_event  5,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_LAIR_GRUNTS
