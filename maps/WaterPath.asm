	object_const_def ; object_event constants
	const WATERPATH_SWIMMER_GUY
	const WATERPATH_COOLTRAINER_M
	const WATERPATH_POKE_BALL

WaterPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerMGuiseppe:
	trainer SWIMMERM, GUISEPPE, EVENT_BEAT_SWIMMERM_DARYL, SwimmerMGuiseppeSeenText, SwimmerMGuiseppeBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext SwimmerMGuiseppeAfterText

TrainerCooltrainerMRichie:
	trainer COOLTRAINERM, RICHIE, EVENT_BEAT_COOLTRAINERM_RICHIE, CooltrainerMRichieSeenText, CooltrainerMRichieBeatenText, 0, .Script

.Script
	endifjustbattled
	jumptext CooltrainerMRichieAfterText

WaterPathDragonScale:
	itemball DRAGON_SCALE

WaterPathSign:
	jumptext WaterPathSignText

SwimmerMGuiseppeSeenText:
	text "The ruins to the"
	line "south are creepy!"

	para "I'm fine with"
	line "swimming here!"
	done

SwimmerMGuiseppeBeatenText:
	text "I'm not fine with"
	line "losing, though…"
	done

SwimmerMGuiseppeAfterText:
	text "There's only a"
	line "small pond there"
	cont "to swim in."
	done

CooltrainerMRichieSeenText:
	text "If you're not into"
	line "archaeology, then"
	cont "there's nothing in"
	cont "Ruin Valley that's"
	cont "interesting."
	done

CooltrainerMRichieBeatenText:
	text "That certainly was"
	line "interesting!"
	done

CooltrainerMRichieAfterText:
	text "Go ahead if you're"
	line "interested."
	done

WaterPathSignText:
	text "Water Path"

	para "North to Green"
	line "Path"

	para "South to Ruin"
	line "Valley"
	done

WaterPath_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8, 22, BGEVENT_READ, WaterPathSign

	db 3 ; object events
	object_event 13, 13, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0,  OBJECTTYPE_TRAINER, 3, TrainerSwimmerMGuiseppe, -1
	object_event  6, 36, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3,  TrainerCooltrainerMRichie, -1
	object_event 14, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, WaterPathDragonScale, EVENT_WATER_PATH_DRAGON_SCALE
	