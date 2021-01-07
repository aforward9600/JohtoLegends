	object_const_def ; object_event constants
	const RIVALSHOUSE2F_PIKACHU

RivalsHouse2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PikachuDoll:
	jumptext PikachuText

RivalsHouse2FBookshelf:
	jumpstd magazinebookshelf

PikachuPoster:
	jumptext PikachuPosterText

PikachuText:
	text "It's a Pikachu"
	line "doll! Cool!"
	done

PikachuPosterText:
	text "It's a poster of"
	line "a Pikachu!"
	done

RivalsHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, RIVALS_HOUSE_1F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  1, BGEVENT_READ, RivalsHouse2FBookshelf
	bg_event  6,  0, BGEVENT_READ, PikachuPoster

	db 1 ; object events
	object_event  3,  1, SPRITE_PIKACHU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PikachuDoll, -1
