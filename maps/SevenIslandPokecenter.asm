	object_const_def ; object_event constants
	const SEVENISLANDPOKECENTER_NURSE
	const SEVENISLANDPOKECENTER_DRAGON_TAMER_F

SevenIslandPokecenter_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SevenIslandPokecenterNurseScript:
	jumpstd pokecenternurse

SevenIslandPokecenterDragonTamerFScript:
	jumptextfaceplayer SevenIslandPokecenterDragonTamerFText

SevenIslandPokecenterDragonTamerFText:
	text "The ruins to the"
	line "south don't seem to"
	cont "have anything in"
	cont "them."

	para "At least nothing"
	line "Dragon-related!"
	done

SevenIslandPokecenter_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, SEVEN_ISLAND, 4
	warp_event  4,  7, SEVEN_ISLAND, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OneIslandPokecenterNurseScript, -1
	object_event  1,  5, SPRITE_DRAGON_TAMER_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SevenIslandPokecenterDragonTamerFScript, -1
