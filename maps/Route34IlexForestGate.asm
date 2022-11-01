	object_const_def ; object_event constants
	const ROUTE34ILEXFORESTGATE_TEACHER1
	const ROUTE34ILEXFORESTGATE_BUTTERFREE
	const ROUTE34ILEXFORESTGATE_LASS
	const ROUTE34ILEXFORESTGATE_TEACHER2

Route34IlexForestGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .IsForestRestless

.IsForestRestless:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse .Normal
	disappear ROUTE34ILEXFORESTGATE_TEACHER1
	appear ROUTE34ILEXFORESTGATE_TEACHER2
	return

.Normal:
	disappear ROUTE34ILEXFORESTGATE_TEACHER2
	appear ROUTE34ILEXFORESTGATE_TEACHER1
	return

Route34IlexForestGateCelebiEvent:
	checkevent EVENT_FOREST_IS_RESTLESS
	iffalse .skip
	showemote EMOTE_SHOCK, ROUTE34ILEXFORESTGATE_TEACHER2, 20
	turnobject ROUTE34ILEXFORESTGATE_TEACHER2, LEFT
	turnobject PLAYER, RIGHT
	follow PLAYER, ROUTE34ILEXFORESTGATE_TEACHER2
	applymovement PLAYER, MovementData_0x62d97
	stopfollow
	turnobject PLAYER, DOWN
	opentext
	writetext Route34IlexForestGateTeacher_ForestIsRestless
	waitbutton
	closetext
	applymovement ROUTE34ILEXFORESTGATE_TEACHER2, MovementData_0x62d9a
.skip:
	end

Route34IlexForestGateTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .ForestIsRestless
	checkmoney YOUR_MONEY, 1200
	ifequal HAVE_LESS, .Refused
	writetext Route34IlexForestGateTeacherText
	yesorno
	iffalse .Refused
	loadmoveindex STRENGTH_SAP
	writetext StrengthSapTutorClear
	special MoveTutor
	if_equal $0, .TeachMove
.Refused:
	writetext Route34IlexForestGateTeacher_GotSweetScent
	waitbutton
	closetext
	end

.TeachMove
	takemoney YOUR_MONEY, 1200
	writetext StrengthSapTutorTaught
	waitbutton
	closetext
	end

.ForestIsRestless:
	writetext Route34IlexForestGateTeacher_ForestIsRestless
	buttonsound
	closetext
	end

Route34IlexForestGateButterfreeScript:
	refreshscreen
	pokepic BUTTERFREE
	cry BUTTERFREE
	waitbutton
	closepokepic
	opentext
	writetext Route34IlexForestGateButterfreeText
	waitbutton
	closetext
	end

Route34IlexForestGateLassScript:
	jumptextfaceplayer Route34IlexForestGateLassText

MovementData_0x62d97:
	step UP
	step UP
	step_end

MovementData_0x62d9a:
	step DOWN
	step RIGHT
	step_end

Route34IlexForestGateTeacherText:
	text "Oh, honey. You're"
	line "writing a journal?"

	para "It must be hard if"
	line "#mon are too"
	cont "strong."

	para "I can teach your"
	line "#mon a move"
	cont "that will weaken"
	cont "an opponent's"

	para "Attack and heal"
	line "your #mon!"

	para "Shall I teach"
	line "your #mon"
	cont "Strength Sap?"

	para "It's only ¥1,200."
	done

Route34IlexForestGateTeacher_GotSweetScent:
	text "Don't say I didn't"
	line "warn you…"
	done

StrengthSapTutorClear:
	text ""
	done

StrengthSapTutorTaught:
	text "This should help"
	line "your #mon stay"
	cont "healthy!"
	done

Route34IlexForestGateTeacher_ForestIsRestless:
	text "Something's wrong"
	line "in Ilex Forest…"

	para "Sorry, I can't"
	line "teach your #mon"

	para "Strength Sap right"
	line "now."
	done

Route34IlexForestGateButterfreeText:
	text "Butterfree: Freeh!"
	done

Route34IlexForestGateLassText:
	text "Apparently, the"
	line "rumors of the"
	cont "Forest's protector"

	para "appearing was just"
	line "a prank!"

	para "Dang it!"

	para "I was hoping to"
	line "see it!"
	done

Route34IlexForestGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_34, 1
	warp_event  5,  0, ROUTE_34, 2
	warp_event  4,  7, ILEX_FOREST, 1
	warp_event  5,  7, ILEX_FOREST, 1

	db 1 ; coord events
	coord_event  4,  7, SCENE_DEFAULT, Route34IlexForestGateCelebiEvent

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateTeacherScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_BEHIND_COUNTER
	object_event  9,  4, SPRITE_BUTTERFREE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateButterfreeScript, -1
	object_event  3,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateLassScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	object_event  5,  7, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route34IlexForestGateTeacherScript, EVENT_ROUTE_34_ILEX_FOREST_GATE_TEACHER_IN_WALKWAY
