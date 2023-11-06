CeladonMansion2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonMansion2FComputer:
	jumptext CeladonMansion2FComputerText

CeladonMansion2FMeetingRoomSign:
	jumptext CeladonMansion2FMeetingRoomSignText

CeladonMansion2FBookshelf:
	jumpstd difficultbookshelf

CeladonMansion2FComputerText:
	text "<PLAYER> turned on"
	line "the PC."

	para "…"

	para "There's an email"
	line "here…"

	para "…Your mother's"
	line "defeat is most"
	cont "unfortunate…"

	para "We lost all the"
	line "ground we gained"
	cont "in Johto…"

	para "Things don't look"
	line "like they're going"
	cont "well here in Kanto"
	cont "either…"

	para "Chaos is what she"
	line "wanted, but maybe"
	cont "order is needed"
	cont "right now."

	para "I leave Kanto in"
	line "your hands, great"
	cont "leader."

	para "With the boss in"
	line "prison, you're the"
	cont "best person for"
	cont "the job."

	para "Do what you see"
	line "fit for us."

	para "I will be heading"
	line "on my next"
	cont "mission soon."

	para "I will be in"
	line "contact over the"
	cont "radio. Later."

	para "-M"

	para "…"
	done

CeladonMansion2FMeetingRoomSignText:
	text "Vacant Room"
	done

CeladonMansion2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  0, CELADON_MANSION_1F, 4
	warp_event  1,  0, CELADON_MANSION_3F, 2
	warp_event  6,  0, CELADON_MANSION_3F, 3
	warp_event  7,  0, CELADON_MANSION_1F, 5

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  3, BGEVENT_READ, CeladonMansion2FComputer
	bg_event  5,  8, BGEVENT_UP, CeladonMansion2FMeetingRoomSign
	bg_event  2,  3, BGEVENT_READ, CeladonMansion2FBookshelf

	db 0 ; object events
