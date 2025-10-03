	object_const_def ; object_event constants
	const FIVEISLEMEADOW_SCIENTIST1
	const FIVEISLEMEADOW_SCIENTIST2
	const FIVEISLEMEADOW_POKE_BALL
	const FIVEISLEMEADOW_COOLTRAINER_F

FiveIsleMeadow_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerScientistBraun:
	trainer SCIENTIST, BRAUN, EVENT_BEAT_SCIENTIST_RICH, ScientistBraunSeenText, ScientistBraunBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext ScientistBraunAfterText

TrainerScientistGideon:
	trainer SCIENTIST, GIDEON, EVENT_BEAT_SCIENTIST_JED, ScientistGideonSeenText, ScientistGideonBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext ScientistGideonAfterText

FiveIsleMeadowCooltrainerFScript:
	jumptextfaceplayer FiveIsleMeadowCooltrainerFText

FiveIsleMeadowPPUp:
	itemball PP_UP

ScientistBraunSeenText:
	text "This area is off-"
	line "limits!"
	done

ScientistBraunBeatenText:
	text "I couldn't do"
	line "anything."
	done

ScientistBraunAfterText:
	text "Fine. Go ahead."

	para "Don't say I didn't"
	line "warn you."
	done

ScientistGideonSeenText:
	text "I'm a geologist,"
	line "not a bouncer!"
	done

ScientistGideonBeatenText:
	text "I should be"
	line "studying gems!"
	done

ScientistGideonAfterText:
	text "I've been looking"
	line "for rubies and"
	cont "sapphires here in"
	cont "the Sevii Islands,"

	para "but I have been"
	line "unsucessful."
	done

FiveIsleMeadowCooltrainerFText:
	text "I've seen some"
	line "unsavory types"
	cont "coming and going"
	cont "to that warehouse."

	para "I'm not going to"
	line "investigate."

	para "I'm not a cop."
	done

FiveIsleMeadow_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  8, 19, ROCKET_WAREHOUSE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 14,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerScientistBraun, -1
	object_event  9, 22, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerScientistGideon, -1
	object_event  5, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FiveIsleMeadowPPUp, EVENT_FIVE_ISLE_MEADOW_PP_UP
	object_event 15, 23, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FiveIsleMeadowCooltrainerFScript, -1
	