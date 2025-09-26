	object_const_def ; object_event constants
	const FOURISLANDLORELEISHOUSE_LORELEI
	const FOURISLANDLORELEISHOUSE_LAPRAS
	const FOURISLANDLORELEISHOUSE_PIKACHU
	const FOURISLANDLORELEISHOUSE_SLOWPOKE

FourIslandLoreleisHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LoreleiScript:
	jumptextfaceplayer LoreleiText

LaprasDollScript:
	jumptext LaprasDollText

LoreleiPikachuDoll:
	jumptext LoreleiPikachuDollText

LoreleiSlowpoke:
	opentext
	writetext LoreleiSlowpokeText
	waitbutton
	closetext
	pause 30
	cry SLOWPOKE
	pause 15
	jumptext LoreleiSlowpokeText2

LoreleiText:
	text "Lorelei: I like to"
	line "collect dolls."
	done

LaprasDollText:
	text "It's a big Lapras"
	line "doll."
	done

LoreleiPikachuDollText:
	text "It's a Pikachu"
	line "doll."
	done

LoreleiSlowpokeText:
	text "It's a Slowpoke"
	line "doll."
	done

LoreleiSlowpokeText2:
	text "…Oh! It's actually"
	line "a Slowpoke!"
	done

FourIslandLoreleisHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, FOUR_ISLAND, 9
	warp_event  5,  7, FOUR_ISLAND, 9

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LoreleiScript, -1
	object_event  8,  2, SPRITE_BIG_LAPRAS, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LaprasDollScript, -1
	object_event  4,  3, SPRITE_PIKACHU, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LoreleiPikachuDoll, -1
	object_event  1,  4, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LoreleiSlowpoke, -1
