	object_const_def ; object_event constants
	const VERMILIONPORT_SAILOR1
	const VERMILIONPORT_SAILOR2
	const VERMILIONPORT_SUPER_NERD

VermilionPort_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_VERMILIONPORT_LEAVE_SHIP

	db 0 ; callbacks

.DummyScene0:
	end

.LeaveFastShip:
	end

VermilionPortSailorScript:
	faceplayer
	turnobject PLAYER, LEFT
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .skip2
	writetext UnknownText_0x74f4d
	waitbutton
	closetext
	end

.skip2:
	writetext UnknownText_0x74fa7
	waitbutton
	closetext
	end

VermilionPortWalkUpToShipScript:
	turnobject VERMILIONPORT_SAILOR2, RIGHT
	turnobject PLAYER, LEFT
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .skip
	writetext UnknownText_0x74f4d
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74ef5
	end

.skip:
	writetext UnknownText_0x74fa7
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74ef5
	end

VermilionPortSailorAtGangwayScript:
	end

VermilionPortSuperNerdScript:
	faceplayer
	opentext
	writetext UnknownText_0x750a6
	waitbutton
	closetext
	end

VermilionPortHiddenIron:
	hiddenitem IRON, EVENT_VERMILION_PORT_HIDDEN_IRON

MovementData_0x74ef1:
	step DOWN
	step_end

MovementData_0x74ef3:
	step UP
	step_end

MovementData_0x74ef5:
	step RIGHT
	turn_head LEFT
	step_end

MovementData_0x74ef8:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74efe:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

UnknownText_0x74f06:
	text "We're departing"
	line "soon. Please get"
	cont "on board."
	done

UnknownText_0x74f31:
	text "Sorry. You can't"
	line "board now."
	done

UnknownText_0x74f4d:
	text "You'll have to"
	line "leave."

	para "There are no ships"
	line "that are sailing"
	cont "right now."
	done

UnknownText_0x74f8b:
	text "May I see your"
	line "S.S.TICKET?"
	done

UnknownText_0x74fa7:
	text "I think we'll be"
	line "able to sail again"
	cont "in a few months."
	done

VermilionPortSSTicketText:
	text "<PLAYER> flashed"
	line "the S.S.TICKET."

	para "That's it."
	line "Thank you!"
	done

UnknownText_0x74ff2:
	text "<PLAYER> tried to"
	line "show the S.S."
	cont "TICKET…"

	para "…But no TICKET!"

	para "Sorry!"
	line "You may board only"

	para "if you have an"
	line "S.S.TICKET."
	done

UnknownText_0x75059:
	text "The FAST SHIP will"
	line "sail on Wednesday."
	done

UnknownText_0x75080:
	text "The FAST SHIP will"
	line "sail next Sunday."
	done

UnknownText_0x750a6:
	text "How I miss the"
	line "smell of the sea."

	para "Someday, I shall"
	line "take to the waves"
	cont "once again!"
	done

VermilionPort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9,  5, VERMILION_PORT_PASSAGE, 5
	warp_event  7, 17, FAST_SHIP_1F, 1

	db 1 ; coord events
	coord_event  7, 11, SCENE_DEFAULT, VermilionPortWalkUpToShipScript

	db 1 ; bg events
	bg_event 16, 12, BGEVENT_ITEM, VermilionPortHiddenIron

	db 3 ; object events
	object_event  7, 17, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPortSailorAtGangwayScript, -1
	object_event  6, 11, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPortSailorScript, -1
	object_event 12, 10, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPortSuperNerdScript, -1
