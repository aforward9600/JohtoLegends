	object_const_def ; object_event constants
	const ONEISLANDPOKECENTER_NURSE
	const WILDAREAPOKECENTER_SCIENTIST
;	const WILDAREAPOKECENTER_FISHING_GURU

OneIslandPokecenter_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OneIslandPokecenterNurseScript:
	jumpstd pokecenternurse

OneIslandPokecenterScientist:
	jumptextfaceplayer OneIslandPokecenterScientistText

OneIslandPokecenterScientistText:
	text "Luckily the phones"
	line "out here work."

	para "Otherwise we'd all"
	line "have to carry our"
	cont "# Balls every-"
	cont "where!"
	done

OneIslandPokecenter_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ONE_ISLAND, 3
	warp_event  4,  7, ONE_ISLAND, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OneIslandPokecenterNurseScript, -1
	object_event  1,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OneIslandPokecenterScientist, -1
;	object_event  7,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildAreaPokecenterCooltrainerFScript, -1
