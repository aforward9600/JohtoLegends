	object_const_def ; object_event constants
	const VIRIDIANPOKECENTER1F_NURSE
	const VIRIDIANPOKECENTER1F_COOLTRAINER_M
	const VIRIDIANPOKECENTER1F_COOLTRAINER_F
	const VIRIDIANPOKECENTER1F_RIVAL

ViridianPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianPokecenter1FNurseScript:
	jumpstd pokecenternurse

ViridianPokecenter1FTwinScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GIOVANNI
	iftrue .BlueReturned
	writetext ViridianPokecenter1FTwinText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianPokecenter1FTwinText_BlueReturned
	waitbutton
	closetext
	end

ViridianPokecenter1FSchoolboyScript:
	jumptextfaceplayer ViridianPokecenter1FSchoolboyText

ViridianPokecenter1FRivalScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GIOVANNI
	iftrue .ViridianPokecenterRivalAfter
	readvar VAR_BADGES
	ifequal 15, .ViridianPokecenter1FRival2
	writetext ViridianPokecenter1FRivalText
	waitbutton
	closetext
	setevent EVENT_TALKED_WITH_RIVAL_IN_VIRIDIAN
	end

.ViridianPokecenterRivalAfter:
	writetext ViridianPokecenter1FRivalAfterText
	waitbutton
	closetext
	end

.ViridianPokecenter1FRival2:
	writetext ViridianPokecenter1FRivalText2
	waitbutton
	closetext
	end

ViridianPokecenter1FTwinText:
	text "I wanna go out-"
	line "side, but those"
	cont "meanies won't let"
	cont "me!"
	done

ViridianPokecenter1FTwinText_BlueReturned:
	text "Yay!"

	para "I can go outside"
	cont "again!"

	para "But now I don't"
	line "wanna."
	done

ViridianPokecenter1FSchoolboyText:
	text "I hear Pallet Town"
	line "is untouched by"
	cont "the Feds."

	para "Considering who"
	line "lives there, it"
	cont "makes sense."
	done

ViridianPokecenter1FRivalText:
	text "I heard a rich and"
	line "powerful trainer"
	cont "owns the storage"
	cont "building here."

	para "He might prove to"
	line "be a great ally."

	para "Thing is, no one"
	line "really sees him."

	para "Maybe we'll have to"
	line "check back later."
	done

ViridianPokecenter1FRivalText2:
	text "I heard a rich and"
	line "powerful trainer"
	cont "owns the storage"
	cont "building here."

	para "He might prove to"
	line "be a great ally."

	para "Thing is, no one"
	line "really sees him."

	para "I also heard he"
	line "owns a mansion on"
	cont "Cinnabar Island"
	cont "that burned down."

	para "Maybe try there?"
	done

ViridianPokecenter1FRivalAfterText:
	text "So, Giovanni, huh?"

	para "He's seems pretty"
	line "mysterious to me."

	para "Well, we need all"
	line "the help we can"
	cont "get."
	done

ViridianPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, VIRIDIAN_CITY, 5
	warp_event  4,  7, VIRIDIAN_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FTwinScript, -1
	object_event  5,  3, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FSchoolboyScript, -1
	object_event  1,  6, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianPokecenter1FRivalScript, EVENT_KANTO_POKECENTER_RIVAL
