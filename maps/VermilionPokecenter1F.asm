	object_const_def ; object_event constants
	const VERMILIONPOKECENTER1F_NURSE
	const VERMILIONPOKECENTER1F_FISHING_GURU
	const VERMILIONPOKECENTER1F_SAILOR
	const VERMILIONPOKECENTER1F_BUG_CATCHER

VermilionPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionPokecenter1FNurseScript:
	jumpstd pokecenternurse

VermilionPokecenter1FTwinScript:
	faceplayer
	opentext
	writetext VermilionPokecenter1FTwinText
	waitbutton
	closetext
	end

VermilionPokecenterRivalScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionPokecenterRivalAfter
	writetext VermilionPokecenterRivalText
	waitbutton
	closetext
	end

.VermilionPokecenterRivalAfter:
	writetext VermilionPokecenterRivalText2
	waitbutton
	closetext
	end

VermilionPokecenter1FSailorScript:
	jumptextfaceplayer VermilionPokecenter1FSailorText

VermilionPokecenter1FSoldierScript:
	jumptextfaceplayer VermilionPokecenter1FSoldierText

VermilionPokecenter1FTwinText:
	text "Wow, you actually"
	line "have badges?"

	para "I thought the Gym"
	line "Leaders were gone?"

	para "…Oh, they're from"
	line "Johto?"

	para "What's a Johto?"
	done

VermilionPokecenter1FSailorText:
	text "I was in the navy"
	line "but now I can't get"
	cont "back home."

	para "At least I have"
	line "some of my friends"
	cont "here."
	done

VermilionPokecenter1FSoldierText:
	text "Kanto's #mon"
	line "healthcare is"
	cont "great!"

	para "I hope we can get"
	line "it running back"
	cont "home soon."
	done

VermilionPokecenterRivalText:
	text "<RIVAL>: The old"
	line "Gym Leader isn't"
	cont "here anymore."

	para "From what I've"
	line "heard, there's a"
	cont "foreign soldier"
	cont "at the barracks"
	cont "who's pretty"
	cont "powerful."

	para "He's also one of"
	line "the ones who"
	cont "defended the city."
	done

VermilionPokecenterRivalText2:
	text "<RIVAL>: Having a"
	line "seasoned soldier"
	cont "on our side will"
	cont "be great!"

	para "Let's hope the rest"
	line "of the soldiers"
	cont "can defend the"
	cont "city while he's"
	cont "gone."
	done

VermilionPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, VERMILION_CITY, 2
	warp_event  4,  7, VERMILION_CITY, 2
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FTwinScript, -1
	object_event  6,  5, SPRITE_ENGINEER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FSoldierScript, -1
	object_event  1,  5, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionPokecenter1FSailorScript, -1
	object_event  2,  7, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPokecenterRivalScript, EVENT_KANTO_POKECENTER_RIVAL
