	object_const_def ; object_event constants
	const CERULEANPOKECENTER1F_NURSE
	const CERULEANPOKECENTER1F_SUPER_NERD
	const CERULEANPOKECENTER1F_RIVAL

CeruleanPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanPokecenter1FNurseScript:
	jumpstd pokecenternurse

CeruleanPokecenter1FCooltrainerM:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SENSATIONAL_SISTERS
	iftrue .CeruleanPokecenter1FCooltrainerMAfter
	writetext CeruleanPokecenter1FCooltrainerMText1
	waitbutton
	closetext
	end

.CeruleanPokecenter1FCooltrainerMAfter:
	writetext CeruleanPokecenter1FCooltrainerMText2
	waitbutton
	closetext
	end

CeruleanPokecenter1FRival:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SENSATIONAL_SISTERS
	iftrue .CeruleanPokecenter1FRivalAfter
	writetext CeruleanPokecenter1FRivalText1
	waitbutton
	closetext
	end

.CeruleanPokecenter1FRivalAfter:
	writetext CeruleanPokecenter1FRivalText2
	waitbutton
	closetext
	end

CeruleanPokecenter1FCooltrainerMText1:
	text "Dang it!"

	para "If my #mon"
	line "weren't knocked"
	cont "out, I'd show"

	para "those Feds!"
	done

CeruleanPokecenter1FCooltrainerMText2:
	text "Looks like those"
	line "Feds are running"
	cont "scared of some"

	para "children!"

	para "Hah! Wimps!"
	done

CeruleanPokecenter1FRivalText1:
	text "I hear that the"
	line "best trainers in"
	cont "the city are some"

	para "young triplets."

	para "That's kinda sad,"
	line "don't you think?"

	para "They like to play"
	line "hide-and-seek, so"
	cont "look around."

	para "You should easily"
	line "find them."
	done

CeruleanPokecenter1FRivalText2:
	text "To think the Feds"
	line "are responsible"
	cont "for their parents'"

	para "deaths…"

	para "Let's avenge them"
	line "together, OK?"
	done

CeruleanPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CERULEAN_CITY, 3
	warp_event  4,  7, CERULEAN_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FCooltrainerM, -1
	object_event  2,  7, SPRITE_RIVAL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FRival, EVENT_KANTO_POKECENTER_RIVAL
