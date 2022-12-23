	object_const_def ; object_event constants
	const VIOLETNICKNAMESPEECHHOUSE_TEACHER
	const VIOLETNICKNAMESPEECHHOUSE_LASS
	const VIOLETNICKNAMESPEECHHOUSE_BIRD

VioletNicknameSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletNicknameSpeechHouseTeacherScript:
	faceplayer
	opentext
	writetext VioletCityAskTeachAMoveText
	checkmoney YOUR_MONEY, 2500
	ifequal HAVE_LESS, .Refused
	yesorno
	iffalse .Refused
	writetext VioletCityWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Moonblast
	ifequal 2, .Hypnosis
	ifequal 3, .GrassKnot
	sjump .Incompatible

.Moonblast:
	loadmoveindex MOONBLAST
	writetext TeachMysticalMoveText
	waitbutton
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.Hypnosis:
	loadmoveindex HYPNOSIS
	writetext TeachMysticalMoveText
	waitbutton
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.GrassKnot:
	loadmoveindex GRASS_KNOT
	writetext TeachMysticalMoveText
	waitbutton
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y - 0
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Moonblast@"
	db "Hypnosis@"
	db "Grass Knot@"
	db "Cancel@"

.Refused:
	writetext VioletCityHowUnfortunateText
	waitbutton
	closetext
	end

.TeachMove:
	writetext VioletCityNiceMoveText
	takemoney YOUR_MONEY, 2500
	buttonsound
	writetext VioletCityGoodLuckText
	waitbutton
	closetext
	end

.Incompatible:
	writetext VioletCityHowUnfortunateText
	waitbutton
	closetext
	end

VioletNicknameSpeechHouseLassScript:
	jumptextfaceplayer VioletNicknameSpeechHouseLassText

VioletNicknameSpeechHouseRaichuScript:
	refreshscreen
	pokepic RAICHU
	cry RAICHU
	waitbutton
	closepokepic
	opentext
	writetext VioletNicknameSpeechHouseRaichuText
	waitbutton
	closetext
	end

VioletNicknameSpeechHouseTeacherText:
	text "She uses the names"
	line "of her favorite"
	cont "things to eat."

	para "For the nicknames"
	line "she gives to her"
	cont "#MON, I mean."
	done

VioletNicknameSpeechHouseLassText:
	text "I call my Raichu"
	line "Orange!"

	para "Maybe my future"
	line "child will also"
	cont "name their #mon"
	cont "after food!"
	done

VioletNicknameSpeechHouseRaichuText:
	text "Orange: Rai-rai!"
	done

VioletCityAskTeachAMoveText:
	text "I can teach some"
	line "mystical moves to"
	cont "your #mon."

	para "It's only ¥2,500."
	done

VioletCityWhichMoveShouldITeachText:
	text "Which move should"
	line "I teach?"
	done

TeachMysticalMoveText:
	text "Which #mon?"
	done

VioletCityNiceMoveText:
	text "A beautiful"
	line "choice."
	done

VioletCityGoodLuckText:
	text "It shall serve you"
	line "well on your"
	cont "journey."
	done

VioletCityHowUnfortunateText:
	text "It's unfortunate"
	line "you feel that way."
	done

VioletNicknameSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, VIOLET_CITY, 4
	warp_event  4,  7, VIOLET_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseTeacherScript, -1
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseLassScript, -1
	object_event  5,  2, SPRITE_RAICHU, SPRITEMOVEDATA_POKEMON, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletNicknameSpeechHouseRaichuScript, -1
