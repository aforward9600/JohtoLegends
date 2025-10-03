	object_const_def ; object_event constants
	const FIVEISLANDHOUSE2_POKEFAN_M
	const FIVEISLANDHOUSE2_POKEFAN_F

FiveIslandHouse2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FiveIslandHouse2PokefanMScript:
	jumptextfaceplayer FiveIslandHouse2PokefanMText

FiveIslandHouse2PokefanFScript:
	jumptextfaceplayer FiveIslandHouse2PokefanFText

FiveIslandHouse2PokefanMText:
	text "That building to"
	line "the south creeps"
	cont "me out."
	done

FiveIslandHouse2PokefanFText:
	text "I wonder what they"
	line "will store in that"
	cont "new warehouse?"
	done

FiveIslandHouse2_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FIVE_ISLAND, 5
	warp_event  5,  7, FIVE_ISLAND, 5

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FiveIslandHouse2PokefanMScript, -1
	object_event  6,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FiveIslandHouse2PokefanFScript, -1
