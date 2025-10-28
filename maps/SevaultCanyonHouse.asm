	object_const_def ; object_event constants
	const SEVAULTCANYONHOUSE_SCIENTIST
	const SEVAULTCANYONHOUSE_SCIENTIST_F

SevaultCanyonHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SevaultCanyonHouseScientistScript:
	jumptextfaceplayer SevaultCanyonHouseScientistText

SevaultCanyonHouseScientistFScript:
	jumptextfaceplayer SevaultCanyonHouseScientistFText

SevaultCanyonHouseScientistText:
	text "The walls of the"
	line "Tanobi Ruins match"
	cont "those found in the"
	cont "Ruins of Alph."

	para "They had to be"
	line "made by the Johto"
	cont "immigrants long"
	cont "ago."
	done

SevaultCanyonHouseScientistFText:
	text "I have a friend in"
	line "Johto who studies"
	cont "the Ruins of Alph."

	para "The #mon in the"
	line "Tanoby Ruins"
	cont "seem to correspond"
	cont "to the ones that"
	cont "appear in Johto."

	para "Perhaps the"
	line "puzzles in the"
	cont "Ruins of Alph"
	cont "have something to"
	cont "do with it?"
	done

SevaultCanyonHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SEVAULT_CANYON, 1
	warp_event  5,  7, SEVAULT_CANYON, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SevaultCanyonHouseScientistScript, -1
	object_event  6,  3, SPRITE_SCIENTIST_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SevaultCanyonHouseScientistFScript, -1
