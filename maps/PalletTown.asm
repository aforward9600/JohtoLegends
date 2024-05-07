	object_const_def ; object_event constants
	const PALLETTOWN_TEACHER
	const PALLETTOWN_FISHER

PalletTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PALLET
	return

PalletTownTeacherScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .PalletTownTeacher2
	jumptextfaceplayer PalletTownTeacherText

.PalletTownTeacher2:
	jumptextfaceplayer PalletTownTeacherText2

PalletTownFisherScript:
	jumptextfaceplayer PalletTownFisherText

PalletTownSign:
	jumptext PalletTownSignText

OaksLabSign:
	jumptext OaksLabSignText

PalletTownTeacherText:
	text "I hope everything"
	line "gets sorted out"
	cont "soon…"
	done

PalletTownTeacherText2:
	text "I'm thankful for"
	line "Prof.Oak keeping"
	cont "the Feds away from"
	cont "our quiet town."
	done

PalletTownFisherText:
	text "Having a former"
	line "Champion here has"
	cont "made the Feds"
	cont "think twice about"
	cont "coming here!"
	done

PalletTownSignText:
	text "Pallet Town"

	para "A Tranquil Setting"
	line "of Peace & Purity"
	done

OaksLabSignText:
	text "Oak #mon"
	line "Research Lab"
	done

PalletTown_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  5,  5, REDS_HOUSE_1F, 1
	warp_event 13,  5, BLUES_HOUSE, 1
	warp_event 12, 11, OAKS_LAB, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  7,  9, BGEVENT_READ, PalletTownSign
	bg_event 13, 13, BGEVENT_READ, OaksLabSign

	db 2 ; object events
	object_event  3,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PalletTownTeacherScript, -1
	object_event 12, 14, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PalletTownFisherScript, -1
