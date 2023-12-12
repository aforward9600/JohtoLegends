	object_const_def ; object_event constants
	const SAFFRONPOKECENTER1F_NURSE
	const SAFFRONPOKECENTER1F_TEACHER
	const SAFFRONPOKECENTER1F_FISHER
	const SAFFRONPOKECENTER1F_RIVAL

SaffronPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SaffronPokecenter1FNurseScript:
	jumpstd pokecenternurse

SaffronPokecenter1FGrannyScript:
	checkevent EVENT_BEAT_SABRINA
	iftrue .mobile
	jumptextfaceplayer SaffronPokecenter1FTeacherText

.mobile
	jumptextfaceplayer SaffronPokecenter1FTeacherMobileText

SaffronPokecenter1FPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .SaffronPokecenter1FPokefanM2
	checkevent EVENT_BEAT_SABRINA
	iftrue .SolvedKantoPowerCrisis
	writetext SaffronPokecenter1FFisherText
	waitbutton
	closetext
	end

.SolvedKantoPowerCrisis:
	writetext SaffronPokecenter1FFisherReturnedMachinePartText
	waitbutton
	closetext
	end

.SaffronPokecenter1FPokefanM2:
	writetext SaffronPokecenter1FPokefanMText2
	waitbutton
	closetext
	end

SaffronPokecenter1FRival:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .RivalBeatSabrina
	checkevent EVENT_BEAT_KOICHI
	iftrue .RivalBeatKoichi
	writetext SaffronPokecenter1FRivalText1
	waitbutton
	closetext
	end

.RivalBeatSabrina:
	writetext SaffronPokecenter1FRivalText2
	waitbutton
	closetext
	end

.RivalBeatKoichi:
	writetext SaffronPokecenter1FRivalText3
	waitbutton
	closetext
	end

SaffronPokecenter1FTeacherText:
	text "Our city wasn't"
	line "damaged like the"
	cont "other towns,"

	para "but Koichi has"
	line "lost so much"
	cont "respect from us."
	done

SaffronPokecenter1FTeacherMobileText:
	text "Looks like Koichi"
	line "has finally come"
	cont "to his senses."

	para "He'll have to earn"
	line "our respect back."
	done

SaffronPokecenter1FFisherText:
	text "Stupid Feds!"

	para "Koichi should have"
	line "knocked them"
	cont "senseless!"
	done

SaffronPokecenter1FFisherReturnedMachinePartText:
	text "Come on, Koichi!"

	para "Knock some sense"
	line "into those Feds!"
	done

SaffronPokecenter1FRivalText1:
	text "Gym Leader Koichi"
	line "surrendered when"
	cont "the Feds first"
	cont "came."

	para "He's probably the"
	line "best option."

	para "I heard that a"
	line "strong psychic is"
	cont "at the Psychic"
	cont "Institute,"

	para "but there is a"
	line "guard at the door."

	para "No idea what to do"
	line "about that."
	done

SaffronPokecenter1FRivalText2:
	text "Now that the"
	line "Psychic Institute"
	cont "is open, maybe you"
	cont "should check it"
	cont "out."
	done

SaffronPokecenter1FRivalText3:
	text "Looks like we have"
	line "two Leaders on our"
	cont "side."

	para "You should really"
	line "only choose one"
	cont "after this is all"
	cont "over."
	done

SaffronPokecenter1FPokefanMText2:
	text "I guess Koichi is"
	line "good for something"
	cont "after all."
	done

SaffronPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, SAFFRON_CITY, 4
	warp_event  4,  7, SAFFRON_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_GRANNY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FGrannyScript, -1
	object_event  8,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronPokecenter1FRival, EVENT_KANTO_POKECENTER_RIVAL
