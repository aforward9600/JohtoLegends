	object_const_def ; object_event constants
	const SEVAULTCANYON_COOLTRAINER_M
	const SEVAULTCANYON_COOLTRAINER_F
	const SEVAULTCANYON_LASS
	const SEVAULTCANYON_YOUNGSTER
	const SEVAULTCANYON_POKE_BALL_1
	const SEVAULTCANYON_POKE_BALL_2
	const SEVAULTCANYON_ROCK1
	const SEVAULTCANYON_ROCK2

SevaultCanyon_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCooltrainerMHector:
	trainer COOLTRAINERM, HECTOR, EVENT_BEAT_COOLTRAINERM_HECTOR, CooltrainerMHectorSeenText, CooltrainerMHectorBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainerMHectorAfterText

TrainerCooltrainerFPhoebe:
	trainer COOLTRAINERF, PHOEBE, EVENT_BEAT_COOLTRAINERF_PHOEBE, CooltrainerFPhoebeSeenText, CooltrainerFPhoebeBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainerFPhoebeAfterText

TrainerLassSamantha:
	trainer LASS, SAMANTHA, EVENT_BEAT_LASS_SAMANTHA, LassSamanthaSeenText, LassSamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext LassSamanthaAfterText

TrainerYoungsterJimmy:
	trainer YOUNGSTER, JIMMY, EVENT_BEAT_YOUNGSTER_JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext YoungsterJimmyAfterText

SevaultCanyonKingsRock:
	itemball KINGS_ROCK

SevaultCanyonEther:
	itemball ETHER

SevaultCanyonRock:
	jumpstd smashrock

CooltrainerMHectorSeenText:
	text "The Larvitar here"
	line "are descended from"
	cont "ones brought here"
	cont "long ago."
	done

CooltrainerMHectorBeatenText:
	text "Guess I should"
	line "have added one"
	cont "to my team…"
	done

CooltrainerMHectorAfterText:
	text "Tyranitar may have"
	line "formed this canyon"
	cont "through their"
	cont "rampaging."
	done

CooltrainerFPhoebeSeenText:
	text "The ruins are so"
	line "mysterious…"
	done

CooltrainerFPhoebeBeatenText:
	text "Truly mysterious…"
	done

CooltrainerFPhoebeAfterText:
	text "Empty, ancient"
	line "rooms…"

	para "What was in there"
	line "long ago?"
	done

LassSamanthaSeenText:
	text "I came here to"
	line "pick flowers, but"
	cont "there aren't"
	cont "any here!"
	done

LassSamanthaBeatenText:
	text "No flowers for me…"
	done

LassSamanthaAfterText:
	text "The elder said I"
	line "can't pick the"
	cont "flowers near the"
	cont "temple."

	para "I hate it here!"
	done

YoungsterJimmySeenText:
	text "It's easy to trip"
	line "on all of these"
	cont "stairs and rocks."
	done

YoungsterJimmyBeatenText:
	text "YOW! Jimmy down!"
	done

YoungsterJimmyAfterText:
	text "I need to look"
	line "where I'm going."
	done

SevaultCanyon_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 19, 67, SEVAULT_CANYON_HOUSE, 1

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	object_event 13, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerMHector, -1
	object_event 17, 70, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerFPhoebe, -1
	object_event 15, 48, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassSamantha, -1
	object_event 24, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterJimmy, -1
	object_event 26, 54, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, SevaultCanyonKingsRock, EVENT_SEVAULT_CANYON_KINGS_ROCK
	object_event 19, 46, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, SevaultCanyonEther, EVENT_SEVAULT_CANYON_ETHER
	object_event 24, 54, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SevaultCanyonRock, -1
	object_event 26, 52, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SevaultCanyonRock, -1
	