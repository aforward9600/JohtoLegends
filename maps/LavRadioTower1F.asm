	object_const_def ; object_event constants
	const LAVRADIOTOWER1F_RECEPTIONIST
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2

LavRadioTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LavRadioTower1FReceptionistScript:
	jumptextfaceplayer LavRadioTower1FReceptionistText

LavRadioTower1FOfficerScript:
	jumptextfaceplayer LavRadioTower1FOfficerText

LavRadioTower1FSuperNerd1Script:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .LavRadioTower1FSuperNerd2
	jumptextfaceplayer LavRadioTower1FSuperNerd1Text

.LavRadioTower1FSuperNerd2:
	jumptextfaceplayer LavRadioTower1FSuperNerd1Text2

LavRadioTower1FGentlemanScript:
	jumptextfaceplayer LavRadioTower1FGentlemanText

LavRadioTower1FSuperNerd2Script:
	jumptextfaceplayer LavRadioTower1FSuperNerd2Text

LavRadioTower1FReceptionistText:
	text "Welcome…"

	para "Please be quiet"
	line "and respectful to"
	cont "the mourners…"
	done

LavRadioTower1FOfficerText:
	text "Sorry, but with"
	line "the recent string"
	cont "of vandalism,"

	para "the upper floors"
	line "are closed, even"
	cont "to mourners…"
	done

LavRadioTower1FSuperNerd1Text:
	text "Nidoqueen…"

	para "I'll get my revenge"
	line "on those that took"
	cont "you away from me…"
	done

LavRadioTower1FGentlemanText:
	text "Growlithe, my dear"
	line "friend…"

	para "…Sob…"
	done

LavRadioTower1FSuperNerd2Text:
	text "Why?"

	para "Why did they do"
	line "that to my"
	cont "Meowth?"

	para "I just don't"
	line "understand…"

	para "…Sniff…"
	done

LavRadioTower1FSuperNerd1Text2:
	text "While I didn't get"
	line "to take revenge"
	cont "for Nidoqueen,"

	para "Someone else did…"

	para "I just hope she"
	line "can rest in peace…"
	done

LavRadioTower1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 17, LAVENDER_TOWN, 6
	warp_event 11, 17, LAVENDER_TOWN, 6

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 14, 13, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FReceptionistScript, -1
	object_event 18,  9, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FOfficerScript, -1
	object_event  9,  5, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd1Script, -1
	object_event  7, 12, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 13,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1
