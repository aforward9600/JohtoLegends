	object_const_def ; object_event constants
	const WILDAREAPOKECENTER_NURSE
	const WILDAREAPOKECENTER_GENTLEMAN
	const WILDAREAPOKECENTER_FISHING_GURU

WildAreaPokecenter_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WildAreaPokecenterNurseScript:
	jumpstd pokecenternurse

WildAreaPokecenterRockerScript:
	jumptextfaceplayer WildAreaPokecenterRockerText

WildAreaPokecenterCooltrainerFScript:
	faceplayer
	opentext
	writetext WildAreaPokecenterCooltrainerFText
	waitbutton
	closetext
	setflag ENGINE_FLYPOINT_WILD_AREA
	end

WildAreaPokecenterRockerText:
	text "The Wild Area has"
	line "a few different"
	cont "zones to explore."

	para "They each have"
	line "rare #mon you"
	cont "can't find else-"
	cont "where."
	done

WildAreaPokecenterCooltrainerFText:
	text "This area isn't"
	line "regulated, unlike"
	cont "Fuchsia's Safari"
	cont "Zone."

	para "Unfortunately, I"
	line "have heard rumors"
	cont "that it was"
	cont "vandalized."

	para "Plenty of #mon"
	line "got hurt in the"
	cont "process."

	para "Poor things..."

	para "I hope they catch"
	line "the ones that"
	cont "did it!"
	done

WildAreaPokecenter_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, WILD_AREA_OUTSIDE, 1
	warp_event  4,  7, WILD_AREA_OUTSIDE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildAreaPokecenterNurseScript, -1
	object_event  1,  5, SPRITE_ROCKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WildAreaPokecenterRockerScript, -1
	object_event  7,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildAreaPokecenterCooltrainerFScript, -1
