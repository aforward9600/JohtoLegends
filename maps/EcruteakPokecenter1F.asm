	object_const_def ; object_event constants
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUY
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_M

EcruteakPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakPokecenter1FNurseScript:
	jumpstd pokecenternurse

EcruteakPokecenter1FPokefanMScript:
	jumptextfaceplayer EcruteakPokecenter1FPokefanMText

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuyScript:
	jumptextfaceplayer EcruteakPokecenter1FGymGuyText

EcruteakMoveTutorScript:
	faceplayer
	opentext
	writetext EcruteakMoveTutorAskTeachAMoveText
	yesorno
	iffalse .Refused
	writetext EcruteakMoveTutorWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FirePunch
	ifequal 2, .Thunderpunch
	ifequal 3, .IcePunch
	ifequal 4, .PixiePunch
	sjump .Incompatible

.FirePunch:
	loadmoveindex FIRE_PUNCH
	writetext TeachMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.Thunderpunch:
	loadmoveindex THUNDERPUNCH
	writetext TeachMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.IcePunch:
	loadmoveindex ICE_PUNCH
	writetext TeachMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.PixiePunch:
	loadmoveindex PIXIE_PUNCH
	writetext TeachMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.Refused:
	writetext EcruteakMoveTutorVeryWellText
	waitbutton
	closetext
	end

.Incompatible:
	writetext EcruteakMoveTutorHmTooBadText
	waitbutton
	closetext
	end

.TeachMove:
	writetext EcruteakMoveTutorPowerfulFistsText
	buttonsound
	writetext EcruteakMoveTutorFarewellText
	waitbutton
	closetext
	end

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y - 0
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "Fire Punch@"
	db "Thunderpunch@"
	db "Ice Punch@"
	db "Pixie Punch@"
	db "Cancel@"

EcruteakPokecenter1FPokefanMText:
	text "The way Rui the"
	line "Kimono Girl dances"

	para "is fantastic,"
	line "like the way she"
	cont "uses her #mon."
	done

EcruteakPokecenter1FPokefanMTextMobile:
	text "You must be hoping"
	line "to battle more"

	para "people, right?"
	line "There's apparently"

	para "some place where"
	line "trainers gather."

	para "Where, you ask?"

	para "It's a little past"
	line "OLIVINE CITY."
	done

EcruteakPokecenter1FCooltrainerFText:
	text "Enoki, the Gym"
	line "Leader, is soooo"
	cont "mysterious."

	para "His #mon are"
	line "really tough too."
	done

EcruteakPokecenter1FGymGuyText:
	text "The Burned Tower…"

	para "There must be a"
	line "secret there."

	para "I smell a conspir-"
	line "acy. I know it!"
	done

EcruteakMoveTutorAskTeachAMoveText:
	text "There are moves"
	line "that are used with"
	cont "a #mon's fists."

	para "Would you like a"
	line "#mon to learn"
	cont "one?"
	done

EcruteakMoveTutorVeryWellText:
	text "Hmph. Very well."
	line "Return if you"
	cont "change your mind."
	done

EcruteakMoveTutorWhichMoveShouldITeachText:
	text "Which move shall"
	line "suit your style?"
	done

EcruteakMoveTutorPowerfulFistsText:
	text "Your #mon's"
	line "fists are now pow-"
	cont "erful."
	done

EcruteakMoveTutorFarewellText:
	text "Use them wisely."
	done

EcruteakMoveTutorHmTooBadText:
	text "How unfortunate."
	done

TeachMoveText:
	text_start
	done

EcruteakPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 6
	warp_event  4,  7, ECRUTEAK_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event  7,  1, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuyScript, -1
	object_event  7,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMoveTutorScript, -1
