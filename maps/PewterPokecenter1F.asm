	object_const_def ; object_event constants
	const PEWTERPOKECENTER1F_NURSE
	const PEWTERPOKECENTER1F_TEACHER
	const PEWTERPOKECENTER1F_JIGGLYPUFF
	const PEWTERPOKECENTER1F_BUG_CATCHER
	const PEWTERPOKECENTER1F_CHRIS

PewterPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PewterPokecenter1FNurseScript:
	jumpstd pokecenternurse

PewterPokecenter1FTeacherScript:
	jumptextfaceplayer PewterPokecenter1FTeacherText

PewterJigglypuff:
	refreshscreen
	pokepic IGGLYBUFF
	cry IGGLYBUFF
	waitbutton
	closepokepic
	opentext
	writetext PewterJigglypuffText
	waitbutton
	closetext
	end

Chris:
	faceplayer
	opentext
	trade NPC_TRADE_CHRIS
	waitbutton
	closetext
	end

PewterPokecenter1FRivalScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterPokecenterRivalAfter
	writetext PewterPokecenter1FRivalText
	waitbutton
	closetext
	end

.PewterPokecenterRivalAfter:
	writetext PewterPokecenter1FRivalAfterText
	waitbutton
	closetext
	end

PewterPokecenter1FTeacherText:
	text "I use this Iggly-"
	line "buff to sing me to"
	cont "sleep at night."

	para "I need all the"
	line "help I can get."
	done

PewterJigglypuffText:
	text "Igglybuff: Puu"
	line "pupuu."
	done

PewterPokecenter1FRivalText:
	text "I heard a rumor"
	line "about a strong"
	cont "trainer in the"

	para "quarry on the"
	line "northside of town."

	para "Might want to"
	line "check there."
	done

PewterPokecenter1FRivalAfterText:
	text "So, Flint hid his"
	line "identity to prot-"
	cont "ect his family?"

	para "It was probably"
	line "for the best."
	done

PewterPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, PEWTER_CITY, 4
	warp_event  4,  7, PEWTER_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FNurseScript, -1
	object_event  0,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FTeacherScript, -1
	object_event  1,  3, SPRITE_IGGLYBUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterJigglypuff, -1
	object_event  1,  6, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterPokecenter1FRivalScript, EVENT_KANTO_POKECENTER_RIVAL
	object_event  7,  2, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Chris, -1
