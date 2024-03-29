	object_const_def ; object_event constants
	const LAVENDERMART_CLERK
	const LAVENDERMART_POKEFAN_M
	const LAVENDERMART_ROCKER

LavenderMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LavenderMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_LAVENDER
	closetext
	end

LavenderMartRoughneckScript:
	jumptextfaceplayer LavenderMartRoughneckText

LavenderMartRockerScript:
	jumptextfaceplayer LavenderMartRockerText

LavenderMartRoughneckText:
	text "Tch."

	para "There's nothing"
	line "good to steal"
	cont "here."

	para "Maybe I should"
	line "liven this place"
	cont "up a little."

	para "…Nah."

	para "It ain't worth the"
	line "effort."
	done

LavenderMartRockerText:
	text "I oughtta knock"
	line "that Fed around a"
	cont "little."

	para "I know he's up to"
	line "no good!"
	done

LavenderMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAVENDER_TOWN, 5
	warp_event  3,  7, LAVENDER_TOWN, 5

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderMartClerkScript, -1
	object_event  6,  6, SPRITE_ROUGHNECK, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderMartRoughneckScript, EVENT_SAFFRON_CITY_FEDS
	object_event  9,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderMartRockerScript, -1
