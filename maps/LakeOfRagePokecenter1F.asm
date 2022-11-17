	object_const_def ; object_event constants
	const LAKEOFRAGEPOKECENTER1F_NURSE
	const LAKEOFRAGEPOKECENTER1F_SCIENTIST
	const LAKEOFRAGEPOKECENTER1F_COOLTRAINER_F
	const LAKEOFRAGEPOKECENTER1F_KID

LakeOfRagePokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LakeOfRagePokecenter1FNurseScript:
	jumpstd pokecenternurse

LakeOfRagePokecenter1FScientistScript:
	jumptextfaceplayer LakeOfRagePokecenter1FScientistText

LakeOfRagePokecenter1FCooltrainerFScript:
	jumptextfaceplayer LakeOfRagePokecenter1FCooltrainerFText

LakeOfRagePokecenter1FKidScript:
	jumptextfaceplayer LakeOfRagePokecenter1FKidText

LakeOfRagePokecenter1FScientistText:
	text "According to my"
	line "research, the Lake"
	cont "of Rage will"
	cont "continue expanding"
	cont "northwest."

	para "Erosion may make"
	line "this town"
	cont "disappear."

	para "Luckily, the town"
	line "will be torn down,"
	cont "and all the people"
	cont "will move."

	para "…Maybe I didn't"
	line "word that right…"
	done

LakeOfRagePokecenter1FCooltrainerFText:
	text "The Croagunk here"
	line "are an invasive"
	cont "species, but"

	para "they're good for"
	line "fighting the Gym"
	cont "Leader."

	para "I guess it's all"
	line "about perspective."
	done

LakeOfRagePokecenter1FKidText:
	text "I'm skipping school"
	line "today."

	para "It's gonna be gone"
	line "soon, so why"
	cont "bother anyway?"
	done

LakeOfRagePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, LAKE_OF_RAGE, 4
	warp_event  4,  7, LAKE_OF_RAGE, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRagePokecenter1FNurseScript, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRagePokecenter1FScientistScript, -1
	object_event  8,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LakeOfRagePokecenter1FCooltrainerFScript, -1
	object_event  7,  1, SPRITE_KID, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRagePokecenter1FKidScript, -1
