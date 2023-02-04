	object_const_def
	const ROCKETLAIRBREAKROOM_GRUNTM
	const ROCKETLAIRBREAKROOM_SCIENTIST
	const ROCKETLAIRBREAKROOM_OFFICER

RocketLairBreakRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callback

RocketLairBreakRoomGruntScript:
	jumptextfaceplayer BreakRoomGruntText

RocketLairBreakRoomScientistScript:
	jumptextfaceplayer BreakRoomScientistText

BreakRoomBed:
	faceplayer
	opentext
	writetext ANiceBedText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	end

BreakRoomRefrigerator:
	checkevent EVENT_BEAT_MADAME_BOSS
	iftrue .EmptyFridge
	jumptext BreakRoomRefrigeratorText

.EmptyFridge:
	jumptext EmptyFridgeText

RocketLairBreakRoomOfficerScript:
	opentext
	writetext MunchMunchText
	waitbutton
	closetext
	pause 5
	faceplayer
	opentext
	writetext ImEatingHereText
	waitbutton
	closetext
	turnobject ROCKETLAIRBREAKROOM_OFFICER, UP
	end

BreakRoomGruntText:
	text "Beat it kid!"

	para "I'm on my union-"
	line "mandated break!"
	done

BreakRoomScientistText:
	text "I take a few too"
	line "many naps in here."

	para "I keep getting"
	line "caught."

	para "Oh well."

	para "Not like we'll be"
	line "here much longer."
	done

ANiceBedText:
	text "A nice bed to take"
	line "a nap in…"
	done

BreakRoomRefrigeratorText:
	text "There's a container"
	line "labeled:"

	para "Ariana's. DO NOT"
	line "TOUCH!"

	para "You should leave"
	line "it alone."
	done

EmptyFridgeText:
	text "The fridge is"
	line "empty…"
	done

MunchMunchText:
	text "Munch…munch…"

	para "Munch…munch…"
	done

ImEatingHereText:
	text "D'ya mind?"

	para "I'm trying to eat"
	line "here!"
	done

RocketLairBreakRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, ROCKET_LAIR_HALLWAY_1, 4
	warp_event  5,  7, ROCKET_LAIR_HALLWAY_1, 4

	db 0 ; coord_events

	db 7 ; bg events
	bg_event  9,  2, BGEVENT_READ, BreakRoomBed
	bg_event  9,  3, BGEVENT_READ, BreakRoomBed
	bg_event  9,  4, BGEVENT_READ, BreakRoomBed
	bg_event  9,  5, BGEVENT_READ, BreakRoomBed
	bg_event  9,  6, BGEVENT_READ, BreakRoomBed
	bg_event  9,  7, BGEVENT_READ, BreakRoomBed
	bg_event  1,  1, BGEVENT_READ, BreakRoomRefrigerator

	db 3 ; object events
	object_event  3,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketLairBreakRoomGruntScript, EVENT_LAIR_GRUNTS
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketLairBreakRoomScientistScript, EVENT_LAIR_GRUNTS
	object_event  5,  5, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RocketLairBreakRoomOfficerScript, EVENT_HOOH_LUGIA_ROOM_OFFICER
