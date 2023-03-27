	object_const_def ; object_event constants
	const BLACKTHORNPOKECENTER1F_NURSE
	const BLACKTHORNPOKECENTER1F_GENTLEMAN
	const BLACKTHORNPOKECENTER1F_FISHER
	const BLACKTHORNPOKECENTER1F_COOLTRAINER_F

BlackthornPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlackthornPokecenter1FNurseScript:
	jumpstd pokecenternurse

BlackthornPokecenter1FGentlemanScript:
	jumptextfaceplayer BlackthornPokecenter1FGentlemanText

BlackthornPokecenter1FFisherScript:
	jumptextfaceplayer BlackthornPokecenter1FFisherText

BlackthornPokecenter1FCooltrainerFScript:
	jumptextfaceplayer BlackthornPokecenter1FCooltrainerFText

BlackthornPokecenter1FGentlemanText:
	text "That Phone is free"
	line "for any trainer"
	cont "to use."
	done

BlackthornPokecenter1FFisherText:
	text "The ADS is great."
	line "I can store any"

	para "number of #mon,"
	line "and it's all free."
	done

BlackthornPokecenter1FCooltrainerFText:
	text "You can trade and"
	line "battle #mon"
	cont "upstairs."
	done

BlackthornPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, BLACKTHORN_CITY, 5
	warp_event  4,  7, BLACKTHORN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FNurseScript, -1
	object_event  5,  3, SPRITE_DRAGON_TAMER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FGentlemanScript, -1
	object_event  1,  4, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FFisherScript, -1
	object_event  7,  6, SPRITE_DRAGON_TAMER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornPokecenter1FCooltrainerFScript, -1
