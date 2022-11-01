	object_const_def
	const ECRUTEAKMOVETUTORHOUSE_MOVETUTOR

EcruteakMoveTutorHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakMoveTutorHouseMoveTutorScript:
	faceplayer
	opentext
	writetext EcruteakMoveTutorHouseAskTeachAMoveText
	checkmoney YOUR_MONEY, 800
	ifequal HAVE_LESS, .Refused
	yesorno
	iffalse .Refused
	writetext EcruteakMoveTutorHouseWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FireFang
	ifequal 2, .ThunderFang
	ifequal 3, .IceFang
	ifequal 4, .DracoFang
	sjump .Incompatible

.FireFang:
	loadmoveindex FIRE_FANG
	writetext TeachMoveText2
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.ThunderFang:
	loadmoveindex THUNDER_FANG
	writetext TeachMoveText2
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.IceFang:
	loadmoveindex ICE_FANG
	writetext TeachMoveText2
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.DracoFang:
	loadmoveindex DRACO_FANG
	writetext TeachMoveText2
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
	db 5 ; items
	db "Fire Fang@"
	db "Thunder Fang@"
	db "Ice Fang@"
	db "Draco Fang@"
	db "Cancel@"

.Refused:
	writetext YourLossText
	waitbutton
	closetext
	end

.TeachMove:
	writetext NiceMoveText
	takemoney YOUR_MONEY, 800
	buttonsound
	writetext GoodLuckText
	waitbutton
	closetext
	end

.Incompatible:
	writetext HowUnfortunateText
	waitbutton
	closetext
	end

MoveTutorTV:
	jumpstd televisionscript

EcruteakMoveTutorHouseAskTeachAMoveText:
	text "You ever wish your"
	line "#mon's bite"
	cont "had more power?"

	para "Would you like me"
	line "to teach one a"
	cont "new move?"

	para "It's only ¥800."
	done

EcruteakMoveTutorHouseWhichMoveShouldITeachText:
	text "Alright!"

	para "Which move?"
	done

YourLossText:
	text "Fine. Your loss."
	done

NiceMoveText:
	text "That's a very nice"
	line "move right there."
	done

GoodLuckText:
	text "Good luck on your"
	line "journey!"

	para "Come back if you"
	line "want me to teach"

	para "another move!"
	done

HowUnfortunateText:
	text "How unfortunate."

	para "Come back later"
	line "if you change"
	cont "your mind."
	done

TeachMoveText2:
	text_start
	done

MoveTutorTVText:
	text "A movie about a"
	line "robot from the"
	cont "future is playing."
	done

EcruteakMoveTutorHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 12
	warp_event  4,  7, ECRUTEAK_CITY, 12

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, MoveTutorTV

	db 1 ; object events
	object_event  5,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakMoveTutorHouseMoveTutorScript, -1
