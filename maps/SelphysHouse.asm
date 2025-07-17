	object_const_def ; object_event constants
	const SELPLHYSHOUSE_SELPHY
	const SELPLHYSHOUSE_BUTLER

SelphysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SelphysHouseSelphyScript:
	jumptextfaceplayer SelphysHouseSelphyText

SelphysHouseButlerScript:
	jumptextfaceplayer SelphysHouseButlerText

SelphysHouseSelphyText:
	text "Are you rich?"

	para "If not, I don't"
	line "care!"
	done

SelphysHouseButlerText:
	text "Please forgive my"
	line "young master."

	para "She has a knack"
	line "for not thinking"
	cont "of the feelings"
	cont "of others."

	para "She is blunt, as"
	line "they say."
	done

SelphysHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, RESORT_GORGEOUS, 1
	warp_event  5,  7, RESORT_GORGEOUS, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SelphysHouseSelphyScript, -1
	object_event  6,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SelphysHouseButlerScript, -1
