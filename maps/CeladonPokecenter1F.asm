	object_const_def ; object_event constants
	const CELADONPOKECENTER1F_NURSE
	const CELADONPOKECENTER1F_GENTLEMAN
	const CELADONPOKECENTER1F_PHARMACIST
	const CELADONPOKECENTER1F_COOLTRAINER_F
	const CELADONPOKECENTER1F_RIVAL

CeladonPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonPokecenter1FNurseScript:
	jumpstd pokecenternurse

CeladonPokecenter1FPokefanMScript:
	jumptextfaceplayer CeladonPokecenter1FPokefanMText

CeladonPokecenter1FCooltrainerMScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .CeladonPokecenter1FCooltrainerM2
	jumptextfaceplayer CeladonPokecenter1FCooltrainerMText

.CeladonPokecenter1FCooltrainerM2:
	jumptextfaceplayer CeladonPokecenter1FCooltrainerMText2

CeladonPokecenter1FTeacherScript:
	jumptextfaceplayer CeladonPokecenter1FTeacherText

CeladonPokecenter1FRival:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ERIKA
	iftrue .CeladonPokecenter1FRival2
	writetext CeladonPokecenter1FRivalText1
	waitbutton
	closetext
	end

.CeladonPokecenter1FRival2:
	writetext CeladonPokecenter1FRivalText2
	waitbutton
	closetext
	end

CeladonPokecenter1FCooltrainerMText:
	text "I wouldn't go near"
	line "that building at"
	cont "the center of the"
	cont "city."

	para "The Feds took over"
	line "the Gym and made"
	cont "it their hideout."
	done

CeladonPokecenter1FCooltrainerMText2:
	text "I wonder what will"
	line "become of the old"
	cont "Fed hideout?"
	done

CeladonPokecenter1FTeacherText:
	text "Our city is so"
	line "torn up…"
	done

CeladonPokecenter1FPokefanMText:
	text "We could all use a"
	line "little happiness"
	cont "in these time."

	para "Too bad I don't"
	line "have any…"
	done

CeladonPokecenter1FRivalText1:
	text "<RIVAL>: This city"
	line "got it the worst."

	para "The Gym Leader is"
	line "gone, but from"
	cont "what I've heard,"

	para "a strong trainer"
	line "tends to the"
	cont "greenhouse in the"
	cont "southwest corner"
	cont "of the city."

	para "We should check"
	line "there first."
	done

CeladonPokecenter1FRivalText2:
	text "<RIVAL>: Erika's a"
	line "bit of an airhead,"
	cont "don't you think?"

	para "Let's hope she"
	line "doesn't fall asleep"
	cont "during the final"
	cont "battle."
	done

CeladonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CELADON_CITY, 5
	warp_event  4,  7, CELADON_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FPokefanMScript, -1
	object_event  0,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FCooltrainerMScript, -1
	object_event  8,  6, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FTeacherScript, -1
	object_event  4,  3, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FRival, EVENT_KANTO_POKECENTER_RIVAL
