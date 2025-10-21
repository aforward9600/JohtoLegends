	object_const_def ; object_event constants
	const GREENPATH_CAMPER
	const GREENPATH_GRAMPS
	const GREENPATH_COOLTRAINER_F
	const GREENPATH_LASS
	const GREENPATH_POKE_BALL

GreenPath_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GreenPathCamperScript:
	jumptextfaceplayer GreenPathCamperText

GreenPathGrampsScript:
	jumptextfaceplayer GreenPathGrampsText

TrainerCooltrainerFCorina:
	trainer COOLTRAINERF, CORINA, EVENT_BEAT_COOLTRAINER_F_CORINA, CooltrainerFCorinaSeenText, CooltrainerFCorinaBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext CooltrainerFCorinaAfterText

TrainerLassYvonne:
	trainer LASS, YVONNE, EVENT_BEAT_LASS_YVONNE, LassYvonneSeenText, LassYvonneBeatenText, 0, .Script

.Script:
	endifjustbattled
	jumptext LassYvonneAfterText

GreenPathElixer:
	itemball ELIXER

GreenPathSign:
	jumptext GreenPathSignText

GreenPathCamperText:
	text "The path to the"
	line "south of the trees"
	cont "leads to nowhere."

	para "Just letting you"
	line "know."
	done

GreenPathGrampsText:
	text "It's peaceful here"
	line "in Green Path."

	para "A perfect place"
	line "for retirement."
	done

CooltrainerFCorinaSeenText:
	text "Despite being on"
	line "the water,"

	para "there isn't much"
	line "sand here."
	done

CooltrainerFCorinaBeatenText:
	text "I love sand!"
	done

CooltrainerFCorinaAfterText:
	text "It's pretty much"
	line "all rocks and"
	cont "trees here."
	done

LassYvonneSeenText:
	text "These trees make"
	line "me claustrophobic."
	done

LassYvonneBeatenText:
	text "Too close!"
	done

LassYvonneAfterText:
	text "Would it kill them"
	line "to widen this"
	cont "path?"
	done

GreenPathSignText:
	text "Green Path"

	para "South to Water"
	line "Path"

	para "West to Outcast"
	line "Island"
	done

GreenPath_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 67, 13, GREEN_PATH_HOUSE_1, 1
	warp_event 73, 17, GREEN_PATH_HOUSE_2, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 58,  8, BGEVENT_READ, GreenPathSign

	db 5 ; object events
	object_event 61, 12, SPRITE_CAMPER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GreenPathCamperScript, -1
	object_event 69,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GreenPathGrampsScript, -1
	object_event  7, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerFCorina, -1
	object_event 48, 10, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassYvonne, -1
	object_event 78, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_ITEMBALL, 0, GreenPathElixer, EVENT_GREEN_PATH_ELIXER
	