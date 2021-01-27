	object_const_def ; object_event constants
	const FOSSILHOUSE_SCIENTIST
	const FOSSILHOUSE_KID1
	const FOSSILHOUSE_KID2
	const FOSSILHOUSE_KID3

FossilHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ScientistScript:
	jumptextfaceplayer FossilHouseScientistText

KimScript:
	faceplayer
	opentext
	trade NPC_TRADE_KIM
	waitbutton
	closetext
	end

RockyScript:
	faceplayer
	opentext
	trade NPC_TRADE_ROCKY
	waitbutton
	closetext
	end

SheldonScript:
	faceplayer
	opentext
	trade NPC_TRADE_SHELDON
	waitbutton
	closetext
	end

FossilHouse_ScienceMagazines:
	jumptext FossilHouse_ScienceMagazinesText

FossilHouse_BrokenComputer:
	jumptext FossilHouse_BrokenComputerText

FossilHouse_ComputerScreen:
	jumptext FossilHouse_ComputerScreenText

FossilHouseScientistText:
	text "Hi, hi!"
	line "A scientist, I am!"

	para "Discovered how to"
	line "revive fossils, I"
	cont "did!"

	para "Got a grant for a"
	line "lab on Cinnabar"
	cont "for it!"

	para "Will move when it"
	line "is done, we will!"

	para "Children of mine"
	line "don't care for"
	cont "the #mon I gave"
	cont "them, it seems."

	para "Willing to trade"
	line "them, they are."

	para "How unfortunate."

	para "Not caring for"
	line "scientific prog-"
	cont "ress, looks like."
	done

FossilHouse_ScienceMagazinesText:
	text "It's packed with"
	line "science magazines."

	para "Couldn't begin to"
	line "understand them…"
	done

FossilHouse_BrokenComputerText:
	text "It's a big com-"
	line "puter. No idea"
	cont "what it's for."
	done

FossilHouse_ComputerScreenText:
	text "There are photos"
	line "of fossils on"

	para "the computer"
	line "screen…"
	done

FossilHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_42, 6
	warp_event  3,  7, ROUTE_42, 6

	db 0 ; coord events

	db 5 ; bg events
	bg_event  0,  1, BGEVENT_READ, FossilHouse_ScienceMagazines
	bg_event  1,  1, BGEVENT_READ, FossilHouse_ScienceMagazines
	bg_event  6,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  6,  4, BGEVENT_READ, FossilHouse_ComputerScreen

	db 4 ; object events
	object_event  7,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ScientistScript, -1
	object_event  5,  2, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, KimScript, -1
	object_event  3,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RockyScript, -1
	object_event  2,  1, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SheldonScript, -1
