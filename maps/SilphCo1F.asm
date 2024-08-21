	object_const_def ; object_event constants
	const SILPHCO1F_RECEPTIONIST
	const SILPHCO1F_OFFICER
	const SILPHCO1F_GENTLEMAN
	const SILPHCO1F_SCIENTIST
	const SILPHCO1F_GENTLEMAN2

SilphCo1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SilphCoReceptionistScript:
	jumptextfaceplayer SilphCoReceptionistText

SilphCoOfficerScript:
	jumptextfaceplayer SilphCoOfficerText

SilphCo1FGentlemanScript:
	jumptextfaceplayer SilphCo1FGentlemanText

SilphCo1FScientistScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .SilphCo1FScientist2
	jumptextfaceplayer SilphCo1FScientistText

.SilphCo1FScientist2:
	jumptextfaceplayer SilphCo1FScientistText2

SilphCo1FGentlemanScript2:
	jumptextfaceplayer SilphCo1FGentlemanText2

SilphElevator:
	jumptext SilphElevatorText

SilphCoReceptionistText:
	text "Welcome. This is"
	line "Silph Co.'s Head"
	cont "Office Building."
	done

SilphCoOfficerText:
	text "I'm sorry, but due"
	line "to some recent"
	cont "incidents, no"
	cont "unauthorized"
	cont "personnel are"
	cont "allowed on the"
	cont "upper floors."

	para "We apologize for"
	line "the inconvenience."
	done

SilphElevatorText:
	text "There's a note:"

	para "Authorized"
	line "personnel only."
	done

SilphCo1FGentlemanText:
	text "Silph has been"
	line "mostly spared from"
	cont "the Feds' wrath."

	para "The rumor is that"
	line "the President is"
	cont "paying them off to"
	cont "prevent them from"
	cont "vandalizing and"
	cont "looting."

	para "It's sad, but"
	line "necessary."
	done

SilphCo1FScientistText:
	text "Don't tell anyone,"
	line "but we were the"
	cont "victim of a break-"
	cont "in a while ago."

	para "Several digital-"
	line "made #mon were"
	cont "stolen by some"
	cont "people in black."

	para "Not only that, but"
	line "several prototype"
	cont "Upgrades were also"
	cont "stolen."

	para "Not to mention the"
	line "ultimate ball"
	cont "prototype."

	para "We can't really"
	line "investigate well,"
	cont "due to the Feds."

	para "They may be a part"
	line "of it."
	done

SilphCo1FScientistText2:
	text "Don't tell anyone,"
	line "but we were the"
	cont "victim of a break-"
	cont "in a while ago."

	para "Several digital-"
	line "made #mon were"
	cont "stolen by some"
	cont "people in black."

	para "Not only that, but"
	line "several prototype"
	cont "Upgrades were also"
	cont "stolen."

	para "Not to mention the"
	line "ultimate ball"
	cont "prototype."

	para "Most of the Feds"
	line "are gone now, so"
	cont "there's no point in"
	cont "investigating"
	cont "them."
	done

SilphCo1FGentlemanText2:
	text "I hope we can get"
	line "back to normal"
	cont "soon."

	para "The amount of"
	line "security makes me"
	cont "uncomfortable."
	done

SilphCo1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 17, SAFFRON_CITY, 6
	warp_event 11, 17, SAFFRON_CITY, 6

	db 0 ; coord events

	db 1 ; bg events
	bg_event 21,  0, BGEVENT_READ, SilphElevator

	db 5 ; object events
	object_event  6,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoReceptionistScript, -1
	object_event 27,  1, SPRITE_OFFICER_JENNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SilphCoOfficerScript, -1
	object_event 27, 15, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo1FGentlemanScript, -1
	object_event  1, 13, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo1FScientistScript, -1
	object_event 16,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SilphCo1FGentlemanScript2, -1
