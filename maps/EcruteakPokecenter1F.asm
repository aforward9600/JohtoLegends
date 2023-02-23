	object_const_def ; object_event constants
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUY

EcruteakPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakPokecenter1FNurseScript:
	jumpstd pokecenternurse

EcruteakPokecenter1FPokefanMScript:
	faceplayer
	opentext
	writetext .introduction_text
	special PlaceMoneyTopRight
	yesorno
	iffalse .cancel
	checkmoney YOUR_MONEY, 2500
	ifequal HAVE_LESS, .not_enough_money
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 2500
	special PlaceMoneyTopRight
	farscall MoveRelearnerScript
	iftrue .end
	givemoney YOUR_MONEY, 2500
.end
	end

.introduction_text:
	text "I can make your"
	line "#mon remember"
	para "the moves that"
	line "they used to know."

	para "For ¥2500, I can"
	line "make one of your"
	para "#mon remember a"
	line "forgotten move."

	para "What do you say?"
	line "It's only ¥2500."
	done

.not_enough_money
	writetext .not_enough_money_text
	waitbutton
	closetext
	end

.not_enough_money_text:
	text "I'm sorry, but it"
	line "seems like you"
	para "can't afford that"
	line "right now."

	para "Please come again"
	line "when you can."
	done

.cancel
	farsjump MoveRelearnerCancel

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuyScript:
	jumptextfaceplayer EcruteakPokecenter1FGymGuyText

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

EcruteakPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 6
	warp_event  4,  7, ECRUTEAK_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event  7,  1, SPRITE_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuyScript, -1
