	object_const_def ; object_event constants
	const PLAYERSNEIGHBORSHOUSE_COOLTRAINER_F
	const PLAYERSNEIGHBORSHOUSE_POKEFAN_F

PlayersNeighborsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PlayersNeighborMScript:
	jumptextfaceplayer PlayersNeighborMText

PlayersNeighborScript:
	jumptextfaceplayer PlayersNeighborText

PlayersNeighborsHouseBookshelfScript:
	jumpstd magazinebookshelf

NewBarkTVScript:
	jumpstd televisionscript

PlayersNeighborMText:
	text "Now that Elm's lab"
	line "is finished, I"
	cont "think things will"

	para "quiet down."

	para "This looks like a"
	line "nice place to"
	cont "raise a family."
	done

PlayersNeighborText:
	text "I don't care if"
	line "we have a boy, or"
	cont "a girl."

	para "As long as they"
	line "grow up to love"
	cont "#mon!"
	done

PlayersNeighborsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, NEW_BARK_TOWN, 2
	warp_event  3,  7, NEW_BARK_TOWN, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  2,  1, BGEVENT_READ, NewBarkTVScript

	db 2 ; object events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PlayersNeighborScript, -1
	object_event  5,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PlayersNeighborMScript, -1
