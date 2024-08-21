	object_const_def ; object_event constants
	const CINNABARPOKECENTER1F_NURSE
	const CINNABARPOKECENTER1F_COOLTRAINER_F
	const CINNABARPOKECENTER1F_FISHER
	const CINNABARPOKECENTER1F_RIVAL

CinnabarPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CinnabarPokecenter1FNurseScript:
	jumpstd pokecenternurse

CinnabarPokecenter1FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLAINE
	iftrue .CinnabarPokecenter1FCooltrainerF2
	writetext CinnabarPokecenter1FCooltrainerFText
	waitbutton
	closetext
	end

.CinnabarPokecenter1FCooltrainerF2:
	writetext CinnabarPokecenter1FCooltrainerFText2
	waitbutton
	closetext
	end

CinnabarPokecenter1FRival:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLAINE
	iftrue .CinnabarPokecenter1FRival2
	writetext CinnabarPokecenter1FRivalText
	waitbutton
	closetext
	end

.CinnabarPokecenter1FRival2:
	writetext CinnabarPokecenter1FRivalText2
	waitbutton
	closetext
	end

CinnabarPokecenter1FFisherScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .CinnabarPokecenter1FFisher2
	jumptextfaceplayer CinnabarPokecenter1FFisherText

.CinnabarPokecenter1FFisher2:
	jumptextfaceplayer CinnabarPokecenter1FFisherText2

CinnabarPokecenter1FCooltrainerFText:
	text "The Gym's been shut"
	line "down for so long,"
	cont "I can't remember"
	cont "who the Leader was"
	cont "anymore."
	done

CinnabarPokecenter1FCooltrainerFText2:
	text "Blaine's back as"
	line "Gym Leader!"

	para "Finally!"

	para "It was getting"
	line "pretty boring!"
	done

CinnabarPokecenter1FFisherText:
	text "The construction"
	line "of the lab has"
	cont "been put on hold."

	para "Hopefully this"
	line "embargo lifts soon"
	cont "so I can start"
	cont "researching."
	done

CinnabarPokecenter1FFisherText2:
	text "The embargo will"
	line "lift soon and I'll"
	cont "be able to resume"
	cont "my research!"
	done

CinnabarPokecenter1FRivalText:
	text "I hear that the"
	line "former Gym Leader"
	cont "is still around."

	para "Sounds like he"
	line "started working at"
	cont "the mansion before"
	cont "it burned down."

	para "Maybe he'd take up"
	line "the position if"
	cont "you asked?"
	done

CinnabarPokecenter1FRivalText2:
	text "It's always nice to"
	line "see someone find"
	cont "purpose again,"
	cont "don't you think?"
	done

CinnabarPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CINNABAR_ISLAND, 1
	warp_event  4,  7, CINNABAR_ISLAND, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FCooltrainerFScript, -1
	object_event  2,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FFisherScript, -1
	object_event  2,  7, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarPokecenter1FRival, EVENT_KANTO_POKECENTER_RIVAL
