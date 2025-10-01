	object_const_def ; object_event constants
	const BONDBRIDGE_TWIN1
	const BONDBRIDGE_TWIN2
	const BONDBRIDGE_COOLTRAINER_F
	const BONDBRIDGE_COOLTRAINER_M
	const BONDBRIDGE_CAMPER
	const BONDBRIDGE_LASS

BondBridge_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerTwinCam:
	trainer TWINS, CAMANDPAM1, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinCamSeenText, TwinCamBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext TwinCamAfterText

TrainerTwinPam:
	trainer TWINS, CAMANDPAM2, EVENT_BEAT_TWINS_ANN_AND_ANNE, TwinPamSeenText, TwinPamBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext TwinPamAfterText

TrainerCooltrainerFHolly:
	trainer COOLTRAINERF, HOLLY, EVENT_BEAT_COOLTRAINERF_CYBIL, CooltrainerFHollySeenText, CooltrainerFHollyBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainerFHollyAfterText

TrainerCooltrainerMDartz:
	trainer COOLTRAINERM, DARTZ, EVENT_BEAT_COOLTRAINERM_KEVIN, CooltrainerMDartzSeenText, CooltrainerMDartzBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainerMDartzAfterText

TrainerCamperPerry:
	trainer CAMPER, PERRY, EVENT_BEAT_CAMPER_THOMAS, CamperPerrySeenText, CamperPerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CamperPerryAfterText

TrainerLassCarmen:
	trainer LASS, CARMEN, EVENT_BEAT_LASS_ELLEN, LassCarmenSeenText, LassCarmenBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext LassCarmenAfterText

BerryForestSign:
	jumptext BerryForestSignText

BondBridgeSign:
	jumptext BondBridgeSignText

TwinCamSeenText:
	text "Cam: My sister and"
	line "I have a tight"
	cont "bond!"
	done

TwinCamBeatenText:
	text "Cam: It wasn't"
	line "enough!"
	done

TwinCamAfterText:
	text "Cam: Our bond is"
	line "still strong!"
	done

TwinPamSeenText:
	text "Pam: The bond I"
	line "have with Cam is"
	cont "unbreakable!"
	done

TwinPamBeatenText:
	text "Pam: I'm sorry,"
	line "Cam!"
	done

TwinPamAfterText:
	text "Pam: Our bond is"
	line "still unbreakable!"
	done

CooltrainerFHollySeenText:
	text "Did you see a kid"
	line "go into Berry"
	cont "Forest?"
	done

CooltrainerFHollyBeatenText:
	text "I'm worried about"
	line "that kid…"
	done

CooltrainerFHollyAfterText:
	text "I've heard rumors"
	line "about #mon that"
	cont "kidnap kids from"
	cont "the forest."
	done

CooltrainerMDartzSeenText:
	text "Most trainers can"
	line "Surf across water,"

	para "so I don't see the"
	line "point of the"
	cont "bridge."
	done

CooltrainerMDartzBeatenText:
	text "I guess not every-"
	line "one can use Surf…"
	done

CooltrainerMDartzAfterText:
	text "It's aesthetically"
	line "at least."
	done

CamperPerrySeenText:
	text "Water and trees."

	para "I couldn't have"
	line "asked for a better"
	cont "camping spot!"
	done

CamperPerryBeatenText:
	text "Losing isn't"
	line "perfect…"
	done

CamperPerryAfterText:
	text "A campfire would"
	line "make things even"
	cont "better."
	done

LassCarmenSeenText:
	text "The bridge here"
	line "has quite a sight"
	cont "at sunset."
	done

LassCarmenBeatenText:
	text "That battle wasn't"
	line "a good sight…"
	done

LassCarmenAfterText:
	text "The sunset is"
	line "pretty when you're"
	cont "on Bond Bridge."
	done

BondBridgeSignText:
	text "Bond Bridge"

	para "Please be quiet"
	line "when crossing."
	done

BerryForestSignText:
	text "Berry Forest"
	line "ahead"
	done

BondBridge_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  4, BERRY_FOREST, 1
	warp_event  5,  4, BERRY_FOREST, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  6,  6, BGEVENT_READ, BerryForestSign
	bg_event 74,  8, BGEVENT_READ, BondBridgeSign

	db 6 ; object events
	object_event 58,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinCam, -1
	object_event 59,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinPam, -1
	object_event  3,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerFHolly, -1
	object_event 13,  9, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerMDartz, -1
	object_event 54, 12, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperPerry, -1
	object_event 40,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassCarmen, -1
