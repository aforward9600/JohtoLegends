	object_const_def ; object_event constants
	const LAVENDERPOKECENTER1F_NURSE
	const LAVENDERPOKECENTER1F_GENTLEMAN
	const LAVENDERPOKECENTER1F_TEACHER
	const LAVENDERPOKECENTER1F_YOUNGSTER

LavenderPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LavenderPokecenter1FNurseScript:
	jumpstd pokecenternurse

LavenderPokecenter1FLassScript:
	jumptextfaceplayer LavenderPokecenter1FLassText

LavenderPokecenter1FGrampsScript:
	jumptextfaceplayer LavenderPokecenter1FGrampsText

LavenderPokecenter1FYoungsterScript:
	jumptextfaceplayer LavenderPokecenter1FYoungsterText

LavenderPokecenter1FLassText:
	text "Maybe someday I'll"
	line "get to see my"
	cont "Jigglypuff again…"
	done

LavenderPokecenter1FGrampsText:
	text "Someday, I'll be"
	line "the same as all"
	cont "those buried at"
	cont "the Tower."

	para "It's sad to think"
	line "about…"
	done

LavenderPokecenter1FYoungsterText:
	text "This town is so"
	line "depressing, don't"
	cont "you think?"
	done

LavenderPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, LAVENDER_TOWN, 1
	warp_event  4,  7, LAVENDER_TOWN, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FYoungsterScript, -1
	object_event  5,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FGrampsScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderPokecenter1FLassScript, -1
