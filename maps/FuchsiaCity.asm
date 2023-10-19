	object_const_def ; object_event constants
	const FUCHSIACITY_YOUNGSTER
	const FUCHSIACITY_POKEFAN_M
	const FUCHSIACITY_TEACHER
	const FUCHSIACITY_FRUIT_TREE
	const FUCHSIACITY_SNORLAX
	const FUCHSIACITY_POKEFAN_M_2

FuchsiaCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_FUCHSIA
	return

FuchsiaCityYoungster:
	jumptextfaceplayer FuchsiaCityYoungsterText

FuchsiaCityPokefanM:
	jumptextfaceplayer FuchsiaCityPokefanMText

FuchsiaCityTeacher:
	jumptextfaceplayer FuchsiaCityTeacherText

FuchsiaCitySnorlax:
	opentext
	writetext SnorlaxIsSleepingText
	waitbutton
	checkevent EVENT_TALKED_WITH_MR_FUJI
	iftrue .WakeUpSnorlax
	closetext
	end

.WakeUpSnorlax:
	writetext WakeUpSnorlaxText
	yesorno
	iffalse .DontWakeUpSnorlax
	closetext
	special FadeOutMusic
	pause 15
	playsound SFX_POKEFLUTE
	waitsfx
	pause 5
	special RestartMapMusic
	pause 5
	opentext
	writetext SnorlaxWokeUpText
	waitbutton
	closetext
	pause 5
	cry SNORLAX
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 70
	startbattle
	ifequal LOSE, .NotBeaten
	disappear FUCHSIACITY_SNORLAX
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtSnorlax
	setevent EVENT_BEAT_SNORLAX
	end

.DontWakeUpSnorlax:
	closetext
	end

.NotBeaten:
	reloadmapafterbattle
	end

.CaughtSnorlax:
	setevent EVENT_CAUGHT_SNORLAX
	end

FuchsiaCityPokefanM2:
	faceplayer
	opentext
	checkevent EVENT_DECO_BIG_SNORLAX_DOLL
	iftrue .GotSnorlaxDoll
	checkevent EVENT_VERMILION_CITY_SNORLAX
	iftrue .GetSnorlaxDoll
	writetext ThatSnorlaxIsThereText
	waitbutton
	closetext
	end

.GetSnorlaxDoll:
	writetext GiveSnorlaxDollText
	buttonsound
	waitsfx
	setevent EVENT_DECO_BIG_SNORLAX_DOLL
	writetext PlayerGotSnorlaxDollText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	pause 15
.GotSnorlaxDoll:
	checkevent EVENT_VERMILION_CITY_SNORLAX
	iffalse .SnorlaxIsBack
	writetext HowsThatSnorlaxDollText
	waitbutton
	closetext
	end

.SnorlaxIsBack:
	writetext SnorlaxIsBackText
	waitbutton
	closetext
	end

FuchsiaCitySign:
	jumptext FuchsiaCitySignText

FuchsiaGymSign:
	jumptext FuchsiaGymSignText

FuchsiaGymBurnedSign:
	jumptext FuchsiaGymBurnedSignText

SafariZoneOfficeSign:
	jumptext SafariZoneOfficeSignText

WardensHomeSign:
	jumptext WardensHomeSignText

SafariZoneClosedSign:
	jumptext SafariZoneClosedSignText

NoLitteringSign:
	jumptext NoLitteringSignText

FuchsiaCityPokecenterSign:
	jumpstd pokecentersign

FuchsiaCityMartSign:
	jumpstd martsign

FuchsiaCityFruitTree:
	fruittree FRUITTREE_FUCHSIA_CITY

FuchsiaCityYoungsterText:
	text "One of the ELITE"
	line "FOUR used to be"

	para "the LEADER of"
	line "FUCHSIA's GYM."
	done

FuchsiaCityPokefanMText:
	text "KOGA's daughter"
	line "succeeded him as"

	para "the GYM LEADER"
	line "after he joined"
	cont "the ELITE FOUR."
	done

FuchsiaCityTeacherText:
	text "The SAFARI ZONE is"
	line "closed… It's sad,"

	para "considering it's"
	line "FUCHSIA's main"
	cont "attraction."
	done

FuchsiaCitySignText:
	text "Fuchsia City"

	para "Behold! It's"
	line "Passion Pink!"
	done

FuchsiaGymSignText:
	text "Fuchsia City"
	line "#mon Gym"
	cont "Leader: …"

	para "The rest of the"
	line "text is illegible…"
	done

SafariZoneOfficeSignText:
	text "There's a notice"
	line "here…"

	para "The Safari Zone is"
	line "closed until"
	cont "further notice."

	para "There's also some"
	line "graffiti."

	para "Classy…"
	done

WardensHomeSignText:
	text "Safari Zone"
	line "Warden's Home"
	done

SafariZoneClosedSignText:
	text "Home of the"
	line "Fuchsia Ninja clan"

	para "Open to visitors"
	done

NoLitteringSignText:
	text "No littering."

	para "Please take your"
	line "waste with you."
	done

FuchsiaGymBurnedSignText:
	text "The Gym's been"
	line "burned down…"
	done

SnorlaxIsSleepingText:
	text "There is a sleep-"
	line "ing #mon here."
	done

WakeUpSnorlaxText:
	text "Wake it up?"
	done

SnorlaxWokeUpText:
	text "Snorlax woke up!"

	para "It attacked in a"
	line "grumpy rage!"
	done

ThatSnorlaxIsThereText:
	text "All of the #mon"
	line "in the zoo escaped"
	cont "when the Feds took"
	cont "over…"

	para "All of them except"
	line "that lazy pile of"
	cont "lard!"

	para "I wish someone"
	line "would just get it"
	cont "to leave!"
	done

GiveSnorlaxDollText:
	text "Nice going!"

	para "Snorlax is gone"
	line "now!"

	para "Take this Snorlax"
	line "Doll!"

	para "I was originally"
	line "going to use it to"
	cont "try and lure it"
	cont "out of the city,"
	cont "but now I don't"
	cont "need it!"
	done

PlayerGotSnorlaxDollText:
	text "<PLAYER> got the"
	line "Snorlax Doll!"
	done

HowsThatSnorlaxDollText:
	text "How's that Snorlax"
	line "Doll?"

	para "Taking up space in"
	line "your room?"
	done

SnorlaxIsBackText:
	text "Dang it!"

	para "That Snorlax is"
	line "back!"

	para "And I already gave"
	line "away my Snorlax"
	cont "Doll!"

	para "You mind getting"
	line "rid of it again?"
	done

FuchsiaCity_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  5, 13, FUCHSIA_MART, 2
	warp_event 22, 13, SAFARI_ZONE_MAIN_OFFICE, 1
	warp_event  8, 27, FUCHSIA_GYM, 1
	warp_event 11, 27, BILLS_BROTHERS_HOUSE, 1
	warp_event 19, 27, FUCHSIA_POKECENTER_1F, 1
	warp_event 27, 27, SAFARI_ZONE_WARDENS_HOME, 1
	warp_event 18,  3, SAFARI_ZONE_FUCHSIA_GATE_BETA, 3 ; inaccessible
	warp_event 37, 22, ROUTE_15_FUCHSIA_GATE, 1
	warp_event 37, 23, ROUTE_15_FUCHSIA_GATE, 2
	warp_event  7, 35, ROUTE_19_FUCHSIA_GATE, 1
	warp_event  8, 35, ROUTE_19_FUCHSIA_GATE, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event 21, 15, BGEVENT_READ, FuchsiaCitySign
	bg_event  5, 29, BGEVENT_READ, SafariZoneClosedSign
	bg_event 25, 15, BGEVENT_READ, FuchsiaGymSign
	bg_event 27, 29, BGEVENT_READ, WardensHomeSign
	bg_event 17,  5, BGEVENT_READ, SafariZoneOfficeSign
	bg_event 13, 15, BGEVENT_READ, NoLitteringSign
	bg_event 20, 27, BGEVENT_READ, FuchsiaCityPokecenterSign
	bg_event  6, 13, BGEVENT_READ, FuchsiaCityMartSign
	bg_event 24, 13, BGEVENT_READ, FuchsiaGymBurnedSign

	db 6 ; object events
	object_event 23, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityYoungster, -1
	object_event 13,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FuchsiaCityPokefanM, -1
	object_event 16, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaCityTeacher, -1
	object_event  8,  1, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityFruitTree, -1
	object_event 30,  3, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCitySnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 26,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaCityPokefanM2, -1
