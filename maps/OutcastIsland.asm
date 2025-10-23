	object_const_def ; object_event constants
	const OUTCASTISLAND_SCIENTIST
	const OUTCASTISLAND_POKE_BALL

OutcastIsland_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OutcastIslandScientistScript:
	jumptextfaceplayer OutcastIslandScientistText

OutcastIslandPPUp:
	itemball PP_UP

OutcastIslandScientistText:
	text "The #mon in"
	line "this cave are odd."

	para "They all appear to"
	line "be native to the"
	cont "Johto region, and"
	cont "are from different"
	cont "habitats."

	para "Were they brought"
	line "here long ago by"
	cont "immigrants from"
	cont "Johto?"

	para "It's possible,"
	line "since the ruins"
	cont "here and to the"
	cont "south are from"
	cont "before they"
	cont "arrived,"

	para "and depict a"
	line "different ancient"
	cont "religion."
	done

OutcastIsland_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6,  9, ALTERING_CAVE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8, 12, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OutcastIslandScientistScript, -1
	object_event 10,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, OutcastIslandPPUp, EVENT_OUTCAST_ISLAND_PP_UP
	