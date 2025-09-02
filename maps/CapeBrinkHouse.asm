	object_const_def ; object_event constants
	const CAPEBRINKHOUSE_POKEFAN_F

CapeBrinkHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CapeBrinkPokefanFScript:
	jumptextfaceplayer CapeBrinkPokefanFText

CapeBrinkPokefanFText:
	text "I am working on"
	line "perfecting three"
	cont "powerful moves."

	para "Come back in 12"
	line "years or so and"
	cont "they'll be ready!"
	done

CapeBrinkHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, CAPE_BRINK, 1
	warp_event  5,  7, CAPE_BRINK, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CapeBrinkPokefanFScript, -1
