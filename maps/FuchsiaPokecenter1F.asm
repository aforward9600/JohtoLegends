	object_const_def ; object_event constants
	const FUCHSIAPOKECENTER1F_NURSE
	const FUCHSIAPOKECENTER1F_COOLTRAINER_M
	const FUCHSIAPOKECENTER1F_COOLTRAINER_F
	const FUCHSIAPOKECENTER1F_JANINE_IMPERSONATOR

FuchsiaPokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

FuchsiaPokecenter1FNurseScript:
	jumpstd pokecenternurse

FuchsiaPokecenter1FCooltrainerMScript:
	jumptextfaceplayer FuchsiaPokecenter1FCooltrainerMText

FuchsiaPokecenter1FCooltrainerFScript:
	jumptextfaceplayer FuchsiaPokecenter1FCooltrainerFText

FuchsiaPokecenter1FRivalScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_KOGA
	iftrue .FuchsiaPokecenter1FRival2
	writetext FuchsiaPokecenter1FRivalText1
	waitbutton
	closetext
	end

.FuchsiaPokecenter1FRival2:
	writetext FuchsiaPokecenter1FRivalText2
	waitbutton
	closetext
	end

FuchsiaPokecenter1FCooltrainerMText:
	text "Woosh!"

	para "I'm a ninja! Fear"
	line "me!"
	done

FuchsiaPokecenter1FCooltrainerFText:
	text "Those ninjas look"
	line "a little scary,"

	para "but they're"
	line "actually nice."

	para "You should visit"
	line "them."
	done

FuchsiaPokecenter1FRivalText1:
	text "<RIVAL>: I heard"
	line "the ninja who got"
	cont "us out of that"
	cont "cell is here."

	para "He's at the ninja"
	line "clan building on"
	cont "the West side of"
	cont "town."

	para "I think he'd be the"
	line "perfect candidate,"

	para "wouldn't you say?"
	done

FuchsiaPokecenter1FRivalText2:
	text "<RIVAL>: Ninjas"
	line "are so cool."
	done

FuchsiaPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, FUCHSIA_CITY, 5
	warp_event  4,  7, FUCHSIA_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaPokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaPokecenter1FCooltrainerMScript, -1
	object_event  1,  4, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaPokecenter1FCooltrainerFScript, -1
	object_event  2,  7, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaPokecenter1FRivalScript, EVENT_KANTO_POKECENTER_RIVAL
