	object_const_def ; object_event constants
	const SIXISLANDHOUSE_GRANNY
	const SIXISLANDHOUSE_BURGLAR

SixIslandHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SixIslandHouseGrannyScript:
	jumptextfaceplayer SixIslandHouseGrannyText

SixIslandHouseBurglarScript:
	jumptextfaceplayer SixIslandHouseBurglarText

SixIslandHouseGrannyText:
	text "An ancient deity"
	line "is said to sleep"
	cont "in the ruins."

	para "Supposedly there"
	line "is another one in"
	cont "the northern cave."
	done

SixIslandHouseBurglarText:
	text "I tried to loot"
	line "the ruins, but"
	cont "there wasn't"
	cont "anything there!"

	para "Just a bunch of"
	line "holes!"
	done

SixIslandHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, SIX_ISLAND, 5
	warp_event  5,  7, SIX_ISLAND, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SixIslandHouseGrannyScript, -1
	object_event  6,  3, SPRITE_BURGLAR, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SixIslandHouseBurglarScript, -1
