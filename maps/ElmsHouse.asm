	object_const_def ; object_event constants
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_PAPER
	const ELMSHOUSE_ELMS_PICHU

ElmsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsPichu:
	refreshscreen
	pokepic PICHU
	cry PICHU
	waitbutton
	closepokepic
	opentext
	writetext ElmsPichuText
	waitbutton
	closetext
	end

ElmsHousePC:
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd difficultbookshelf

ElmsWifeText:
	text "I tried to tell my"
	line "boyfriend that I"
	cont "hatched this Pichu"
	cont "from an Egg,"

	para "but he doesn't"
	line "seem to notice!"

	para "I love him, but"
	line "sometimes he's too"
	cont "buried in his"
	cont "research."
	done

ElmsPichuText:
	text "Pichu: Piiii!"
	done

ElmsHouseLabFoodText:
; unused
	text "There's some food"
	line "here. It must be"
	cont "for the LAB."
	done

ElmsHousePokemonFoodText:
; unused
	text "There's some food"
	line "here. This must be"
	cont "for #MON."
	done

ElmsHousePCText:
	text "#mon. Where do"
	line "they come from? "

	para "Where are they"
	line "going?"

	para "Why has no one"
	line "ever witnessed a"
	cont "#mon's birth?"

	para "I want to know! I"
	line "will dedicate my"

	para "life to the study"
	line "of #mon!"

	para "…"

	para "It's a part of"
	line "Prof.Elm's re-"
	cont "search papers."
	done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  4,  1, BGEVENT_READ, NewBarkTVScript

	db 3 ; object events
	object_event  1,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  0,  1, SPRITE_PAPER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsHousePC, -1
	object_event  6,  6, SPRITE_PICHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ElmsPichu, -1
