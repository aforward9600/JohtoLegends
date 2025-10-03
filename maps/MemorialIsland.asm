	object_const_def ; object_event constants
	const MEMORIALISLAND_FERROPEXOLA

MemorialIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .FerropexolaWeekend

.FerropexolaWeekend:
	checkevent EVENT_COMPLETED_EPILOGUE
	iffalse .NoAppear
	checkevent EVENT_BEAT_FERROPEXOLA
	iffalse .NoAppear
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .FerroAppears
	ifequal SUNDAY, .FerroAppears
	disappear MEMORIALISLAND_FERROPEXOLA
.NoAppear
	return

.FerroAppears:
	appear ROUTE27SANDSTORMHOUSE_FERROPEXOLA
	return

MemorialIslandFerropexola:
	opentext
	writetext FerropexolaSilenceText
	waitbutton
	closetext
	checkevent EVENT_GOT_THICK_CLUB_FROM_FERROPEXOLA
	iftrue .Finish
	pause 15
	faceplayer
	opentext
	writetext FerropexolaThickClubText
	buttonsound
	verbosegiveitem THICK_CLUB
	setevent EVENT_GOT_THICK_CLUB_FROM_FERROPEXOLA
	closetext
	turnobject MEMORIALISLAND_FERROPEXOLA, UP
.Finish
	end

TrainerCooltrainerMColby:
	trainer COOLTRAINERM, COLBY, EVENT_BEAT_COOLTRAINERM_SEAN, CooltrainerMColbySeenText, CooltrainerMColbyBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainerMColbyAfterText

TrainerSwimmerMCole:
	trainer SWIMMERM, COLE, EVENT_BEAT_SWIMMERM_HAL, SwimmerMColeSeenText, SwimmerMColeBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext SwimmerMColeAfterText

MemorialIslandGrave:
	jumptext MemorialIslandGraveText

FerropexolaSilenceText:
	text "Ferropexola:………………"
	done

FerropexolaThickClubText:
	text "…Oh, hello,"
	line "<PLAYER>…"

	para "…I come here every"
	line "weekend to visit"
	cont "an old friend…"

	para "…I miss him more"
	line "than he knows…"

	para "…I planted these"
	line "flowers in his"
	cont "memory…"

	para "…Here…take this…"

	para "…It doesn't do me"
	line "any good to hold"
	cont "on to this old"
	cont "toy of his…"

	para "…I'm sure he would"
	line "want you to have"
	cont "it…"

	para "…I'd like to be"
	line "left alone now…"
	done

MemorialIslandGraveText:
	text "My dear friend"
	line "    Rocky"

	para "6.23.11-6.10.25"
	done

CooltrainerMColbySeenText:
	text "Only one person"
	line "visits Memorial"
	cont "Island."
	done

CooltrainerMColbyBeatenText:
	text "I've never spoken"
	line "to him."
	done

CooltrainerMColbyAfterText:
	text "He only shows up"
	line "on weekends."
	done

SwimmerMColeSeenText:
	text "I'm the fastest"
	line "Swimmer in the"
	cont "Sevii Islands!"
	done

SwimmerMColeBeatenText:
	text "Leg cramp!"
	done

SwimmerMColeAfterText:
	text "There's never been"
	line "a competition, but"
	cont "I feel like I'm"
	cont "the fastest!"
	done

MemorialIsland_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11, 24, BGEVENT_READ, MemorialIslandGrave

	db 3 ; object events
	object_event 11, 25, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MemorialIslandFerropexola, EVENT_FIVE_ISLAND_FERROPEXOLA
	object_event 21,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerMColby, -1
	object_event 10, 12, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerSwimmerMCole, -1
	