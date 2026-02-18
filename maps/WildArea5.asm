	object_const_def ; object_event constants
	const WILDAREA5_RIVAL
	const WILDAREA5_LASS

WildArea5_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildArea5RivalScript:
	jumptextfaceplayer PlentyOfPokemonHereText

WildArea5LassScript:
	jumptextfaceplayer TheFlowersArePrettyText

WildArea5Sign:
	jumptext WildArea5SignText

PlentyOfPokemonHereText:
	text "Wow, there sure"
	line "are plenty of"
	cont "#mon here!"

	para "How many are you"
	line "going to catch?"
	done

TheFlowersArePrettyText:
	text "The flowers here"
	line "are so pretty…"

	para "The Roselia agree"
	line "too."
	done

WildArea5SignText:
	text "Area 5"

	para "The flowers"
	line "attract all"
	cont "species of"
	cont "Grass-types."
	done

WildArea5_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  2, BGEVENT_READ, WildArea5Sign

	db 2 ; object events
	object_event  6,  6, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildArea5RivalScript, EVENT_WILD_AREA_5_RIVAL1
	object_event  3,  8, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WildArea5LassScript, -1
