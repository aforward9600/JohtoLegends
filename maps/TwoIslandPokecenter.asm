	object_const_def ; object_event constants
	const TWOISLANDPOKECENTER_NURSE
;	const WILDAREAPOKECENTER_GENTLEMAN
;	const WILDAREAPOKECENTER_FISHING_GURU

TwoIslandPokecenter_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TwoIslandPokecenterNurseScript:
	jumpstd pokecenternurse

TwoIslandPokecenter_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, TWO_ISLAND, 3
	warp_event  4,  7, TWO_ISLAND, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TwoIslandPokecenterNurseScript, -1
;	object_event  1,  5, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WildAreaPokecenterRockerScript, -1
;	object_event  7,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildAreaPokecenterCooltrainerFScript, -1
