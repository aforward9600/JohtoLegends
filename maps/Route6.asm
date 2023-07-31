	object_const_def ; object_event constants
	const ROUTE6_SOLDIER1
	const ROUTE6_SOLDIER2
	const ROUTE6_TEACHER

Route6_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSoldierDwight:
	trainer SOLDIER, DWIGHT, EVENT_BEAT_SOLDIER_DWIGHT, SoldierDwightSeenText, SoldierDwightBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierDwightAfterBattleText
	waitbutton
	closetext
	end

TrainerSoldierSherman:
	trainer SOLDIER, SHERMAN, EVENT_BEAT_SOLDIER_SHERMAN, SoldierShermanSeenText, SoldierShermanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SoldierShermanAfterBattleText
	waitbutton
	closetext
	end

Route6Teacher:
	jumptextfaceplayer Route6TeacherText

Route6UndergroundPathSign:
	jumptext Route6UndergroundPathSignText

Route6TeacherText:
	text "I don't know who's"
	line "scarier,"

	para "the Feds, or the"
	line "soldiers."
	done

Route6UndergroundPathSignText:
	text "Underground Path"

	para "Cerulean City -"
	line "Vermilion City"
	done

SoldierDwightSeenText:
	text "Halt!"

	para "Identify yourself!"
	done

SoldierDwightBeatenText:
	text "KIA!"
	done

SoldierDwightAfterBattleText:
	text "The Champion?"

	para "My mistake!"

	para "We're patrolling"
	line "the perimeter for"
	cont "Federation thugs!"

	para "All clear so far!"
	done

SoldierShermanSeenText:
	text "Perimeter has been"
	line "breached!"

	para "Target acquired!"
	done

SoldierShermanBeatenText:
	text "Looks like I was"
	line "the target!"
	done

SoldierShermanAfterBattleText:
	text "We chased the Feds"
	line "out of here a few"
	cont "years ago."

	para "We're stuck here,"
	line "so we make the"
	cont "best of it."
	done

Route6_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17,  3, ROUTE_6_UNDERGROUND_PATH_ENTRANCE, 1
	warp_event  6,  1, ROUTE_6_SAFFRON_GATE, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 19,  5, BGEVENT_READ, Route6UndergroundPathSign

	db 3 ; object events
	object_event 16,  9, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSoldierDwight, -1
	object_event  9, 15, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSoldierSherman, -1
	object_event  2,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route6Teacher, -1
