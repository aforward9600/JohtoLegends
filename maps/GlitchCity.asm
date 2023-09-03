	object_const_def ; object_event constants
	const GLITCHCITY_MISSINGNO

GlitchCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Missingno

.Missingno:
	checkevent EVENT_CAUGHT_MISSINGNO
	iftrue .MissingnoWontAppear
	checkevent EVENT_BEAT_MISSINGNO
	iftrue .MissingnoWontAppear
	appear GLITCHCITY_MISSINGNO
	return

.MissingnoWontAppear:
	disappear GLITCHCITY_MISSINGNO
	return

MissingnoScript:
	opentext
	writetext MissingnoCry
	pause 15
	cry MISSINGNO
	waitbutton
	closetext
	loadwildmon MISSINGNO, 70
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear GLITCHCITY_MISSINGNO
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtMissingno
	setevent EVENT_BEAT_MISSINGNO
	end

.CaughtMissingno:
	setevent EVENT_CAUGHT_MISSINGNO
	end

.NotBeaten:
	reloadmapafterbattle
	end

WelcomeToGlitchCitySign:
	jumptext WelcomeToGlitchCitySignText

LeaveGlitchCitySign:
	checkevent EVENT_CAUGHT_MISSINGNO
	iftrue .WhyDidYouDoThat
	checkevent EVENT_BEAT_MISSINGNO
	iftrue .WellBeBack
	jumptext LeaveGlitchCitySignText

.WhyDidYouDoThat:
	jumptext WhyDidYouDoThatText

.WellBeBack:
	jumptext WellBeBackText

WelcomeToGlitchCitySignText:
	text "M3I(0w3 2 6Il7(4"
	line "(l7Y"
	done

LeaveGlitchCitySignText:
	text "j6Go&E3T"
	line "%tO8nU)8T"
	done

WellBeBackText:
	text "1sW&(E6UL0&L"
	line "4iB9%E"
	cont "6%B)oA3!C0dK"
	done

WhyDidYouDoThatText:
	text "whydidyoudothat?"
	done

MissingnoCry:
	text "NFU3H%RJ3OG9J!"
	done

GlitchCity_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6, 19, ROUTE_20, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5, 15, BGEVENT_READ, WelcomeToGlitchCitySign
	bg_event 13, 15, BGEVENT_READ, LeaveGlitchCitySign

	db 1 ; object events
	object_event 10,  0, SPRITE_MISSINGNO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, MissingnoScript, EVENT_GLITCH_CITY_MISSINGNO
