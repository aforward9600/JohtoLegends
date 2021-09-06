	object_const_def ; object_event constants
	const MAHOGANYPOKECENTER1F_NURSE
	const MAHOGANYPOKECENTER1F_COOLTRAINER_M
	const MAHOGANYPOKECENTER1F_YOUNGSTER
	const MAHOGANYPOKECENTER1F_TWIN
	const MAHOGANYPOKECENTER1F_SWINUB

MahoganyPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyPokecenter1FNurseScript:
	jumpstd pokecenternurse

MahoganyPokecenter1FCooltrainerMScript:
	jumptextfaceplayer MahoganyPokecenter1FCooltrainerMText

MahoganyPokecenter1FYoungsterScript:
	jumptextfaceplayer MahoganyPokecenter1FYoungsterText

MahoganyPokecenter1FTwinScript:
	jumptextfaceplayer MahoganyPokecenter1FTwinText

MahoganyPokecenter1FSwinubScript:
	refreshscreen
	pokepic SWINUB
	cry SWINUB
	waitbutton
	closepokepic
	opentext
	writetext MahoganyPokecenter1FSwinubText
	waitbutton
	closetext
	end

MahoganyPokecenter1FCooltrainerMText:
	text "Did you ever want"
	line "to have rematches"
	cont "with trainers you"
	cont "have battled"
	cont "before?"

	para "Read the signs at"
	line "beginning and end"
	cont "of the Routes!"

	para "The scrappiest"
	line "trainers write"
	cont "their names on"
	cont "those signs!"

	para "They're always"
	line "ready for a"
	cont "fight!"
	done

MahoganyPokecenter1FYoungsterText:
	text "Pryce can be quite"
	line "cold, but he has a"
	cont "soft spot."

	para "Just ask the girl"
	line "over there."
	done

MahoganyPokecenter1FTwinText:
	text "Isn't my Swinub"
	line "the cutest?"

	para "Pryce gave it to"
	line "me!"

	para "I'm going to raise"
	line "it with love!"
	done

MahoganyPokecenter1FSwinubText:
	text "Swinub: Burrurrr!"
	done

MahoganyPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, MAHOGANY_TOWN, 4
	warp_event  4,  7, MAHOGANY_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FCooltrainerMScript, -1
	object_event  7,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FYoungsterScript, -1
	object_event  2,  3, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FTwinScript, -1
	object_event  1,  3, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FSwinubScript, -1
