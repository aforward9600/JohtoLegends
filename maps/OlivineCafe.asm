	object_const_def ; object_event constants
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR2
	const OLIVINECAFE_GENTLEMAN
	const OLIVINECAFE_HAIRCUT_MAN

OlivineCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	buttonsound
	verbosegiveitem MACHAMP_CALL
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeSailorScript:
	jumptextfaceplayer OlivineCafeSailorText

OlivineCafeTutorScript:
	faceplayer
	opentext
	writetext OlivineCafeTutorSteelSliceText
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .TutorRefused
	waitbutton
	writetext OlivineCafeTutorSteelSliceText2
	yesorno
	iffalse .TutorRefused
	loadmoveindex STEEL_SLICE
	writetext OlivineCafeTutorSteelSliceClear
	special MoveTutor
	if_equal $0, .TeachMove
.TutorRefused
	writetext OlivineCafeTutorSteelSliceRefused
	waitbutton
	closetext
	end

.TeachMove
	writetext OlivineCafeTutorSteelSliceTaught
	takemoney YOUR_MONEY, 1000
	waitbutton
	closetext
	end

OlivineCafeHaircutGuyScript:
	faceplayer
	opentext
	checkflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	iftrue .AlreadyGotHaircut
	writetext OlivineCafeHaircutGuyOfferHaircutText
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 500
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext OlivineCafeHaircutGuyWhichMonText
	buttonsound
	special OlderHaircutBrother
	ifequal $0, .Refused
	ifequal $1, .Refused
	setflag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	ifequal $2, .two
	ifequal $3, .three
	sjump .else

.two
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.three
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.else
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	clearevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	sjump .then

.then
	takemoney YOUR_MONEY, 500
	special PlaceMoneyTopRight
	writetext OlivineCafeHaircutGuyWatchItBecomeBeautifulText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext OlivineCafeHaircutGuyAllDoneText
	waitbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue OlivineCafeHaircutGuyScript_SlightlyHappier
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue OlivineCafeHaircutGuyScript_Happier
	sjump OlivineCafeHaircutGuyScript_MuchHappier

.Refused:
	writetext OlivineCafeHaircutGuyThatsAShameText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext OlivineCafeHaircutGuyYoullNeedMoreMoneyText
	waitbutton
	closetext
	end

.AlreadyGotHaircut:
	writetext OlivineCafeHaircutGuyOneHaircutADayText
	waitbutton
	closetext
	end

OlivineCafeHaircutGuyScript_SlightlyHappier:
	writetext OlivineCafeHaircutGuyText_SlightlyHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

OlivineCafeHaircutGuyScript_Happier:
	writetext OlivineCafeHaircutGuyText_Happier
	special PlayCurMonCry
	waitbutton
	closetext
	end

OlivineCafeHaircutGuyScript_MuchHappier:
	writetext OlivineCafeHaircutGuyText_MuchHappier
	special PlayCurMonCry
	waitbutton
	closetext
	end

OlivineCafeStrengthSailorText:
	text "Hah! Your #mon"
	line "sure look like"
	cont "lightweights!"

	para "They don't have"
	line "the power to move"
	cont "boulders aside."

	para "Here, use this"
	line "to call a Machamp!"
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "Machamp are tough!"
	line "They can move"
	cont "boulders with"
	cont "ease!"
	done

OlivineCafeFishingGuruText:
	text "Olivine Cafe's"
	line "menu is chock full"

	para "of hearty fare for"
	line "beefy Sailors!"
	done

OlivineCafeSailorText:
	text "Whenever I roll"
	line "into this town, I"

	para "always visit the"
	line "Olivine Cafe."

	para "Everything on the"
	line "menu makes me feel"

	para "stronger. I can't"
	line "stop eating!"
	done

OlivineCafeTutorSteelSliceText:
	text "I know of a move,"
	line "one made by the"
	cont "Gym Leader here."

	para "It can lower the"
	line "stats of a foe,"
	cont "as well as deal"

	para "damage. It's"
	line "useful."

	para "It's only ¥1,000."
	done

OlivineCafeTutorSteelSliceText2:
	text "Would you like a"
	line "#mon to learn"
	cont "Steel Slice?"
	done

OlivineCafeTutorSteelSliceClear:
	text ""
	done

OlivineCafeTutorSteelSliceRefused:
	text "I'll be here if"
	line "you change your"
	cont "mind."
	done

OlivineCafeTutorSteelSliceTaught:
	text "Be warned, this"
	line "move doesn't have"
	cont "perfect accuracy."

	para "If you do hit the"
	line "foe, they may"
	cont "become weaker, and"

	para "easier to finish"
	line "off."
	done

OlivineCafeHaircutGuyOfferHaircutText:
	text "Hey there!"

	para "I know this isn't"
	line "the best place for"
	cont "it, but I give"
	cont "haircuts to"
	cont "#mon."

	para "I can make your"
	line "#mon beautiful"
	cont "for just ¥500."

	para "Would you like me"
	line "to do that?"
	done

OlivineCafeHaircutGuyWhichMonText:
	text "Which #mon"
	line "should I work on?"
	done

OlivineCafeHaircutGuyWatchItBecomeBeautifulText:
	text "OK! Watch it"
	line "become beautiful!"
	done

OlivineCafeHaircutGuyAllDoneText:
	text "There! All done!"
	done

OlivineCafeHaircutGuyThatsAShameText:
	text "Is that right?"
	line "That's a shame!"
	done

OlivineCafeHaircutGuyYoullNeedMoreMoneyText:
	text "You'll need more"
	line "money than that."
	done

OlivineCafeHaircutGuyOneHaircutADayText:
	text "I do only one"
	line "haircut a day. I'm"
	cont "done for today."
	done

OlivineCafeHaircutGuyText_SlightlyHappier:
	text_ram wStringBuffer3
	text " looks a"
	line "little happier."
	done

OlivineCafeHaircutGuyText_Happier:
	text_ram wStringBuffer3
	text " looks"
	line "happy."
	done

OlivineCafeHaircutGuyText_MuchHappier:
	text_ram wStringBuffer3
	text " looks"
	line "delighted!"
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 6
	warp_event  3,  7, OLIVINE_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  2,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  7,  2, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
	object_event  7,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
	object_event  0,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeTutorScript, -1
	object_event  4,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeHaircutGuyScript, -1
