	object_const_def ; object_event constants
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUY
	const CIANWOODPOKECENTER1F_SUPER_NERD
	const CIANWOODPOKECENTER1F_RIVAL

CianwoodPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodPokecenter1FNurseScript:
	jumpstd pokecenternurse

CianwoodPokecenter1FLassScript:
	jumptextfaceplayer CianwoodPokecenter1FLassText

CianwoodGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuyWinScript
	opentext
	writetext CianwoodGymGuyText
	waitbutton
	closetext
	end

.CianwoodGymGuyWinScript:
	opentext
	writetext CianwoodGymGuyWinText
	waitbutton
	closetext
	end

CianwoodPokecenter1FSuperNerdScript:
	jumptextfaceplayer CianwoodPokecenter1FSuperNerdText

CianwoodPokecenterRivalScript:
	jumptextfaceplayer CianwoodPokecenterRivalText

CianwoodPokecenter1FLassText:
	text "Did you meet the"
	line "kid with the Snea-"
	cont "sel and Shuckle?"

	para "He's always brag-"
	line "ging about his"
	cont "rare #mon."
	done

CianwoodGymGuyText:
	text "How's it going,"
	line "champ in the"
	cont "making? That"

	para "Gym is filled with"
	line "muscle-heads, and"
	cont "I'm not one to"

	para "stick around and"
	line "get beat up, even"
	cont "if the Leader is a"

	para "cute girl. Chigusa"
	line "is an elegant Fig-"
	cont "hting Type expert."

	para "Psychic, Flying"
	line "and Fairy Types"
	cont "will easily put"

	para "them out of commi-"
	line "ssion!"
	done

CianwoodGymGuyWinText:
	text "Nice one! I'm"
	line "still not going in"
	cont "there, even to"

	para "talk to Chigusa."
	done

CianwoodPokecenter1FUnusedText1:
; unreferenced
	text "Don't you get the"
	line "urge to show off"

	para "your #MON to"
	line "friends?"

	para "I wish I could"
	line "show the #MON I"

	para "raised to my pal"
	line "in VIOLET."
	done

CianwoodPokecenter1FUnusedText2:
; unreferenced
	text "I've been battling"
	line "my pal in VIOLET"

	para "using a MOBILE"
	line "ADAPTER link."

	para "I'm down 5-7"
	line "against him. I've"
	cont "gotta crank it up!"
	done

CianwoodPokecenter1FSuperNerdText:
	text "Don't you get the"
	line "urge to show off"

	para "your #mon to"
	line "friends?"

	para "I wish I could"
	line "show the #mon I"

	para "raised to my pal"
	line "in Violet."
	done

CianwoodPokecenterRivalText:
	text "Ugh..."

	para "Sorry...I got a"
	line "little seasick."

	para "I'm not used to"
	line "travelling on"
	cont "water..."

	para "I'm going to take"
	line "a break and try to"
	cont "feel better..."

	para "Ugh..."
	done

CianwoodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CIANWOOD_CITY, 3
	warp_event  4,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FLassScript, -1
	object_event  5,  3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuyScript, -1
	object_event  8,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FSuperNerdScript, -1
	object_event  2,  7, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenterRivalScript, EVENT_CIANWOOD_CITY_CENTER_RIVAL1
