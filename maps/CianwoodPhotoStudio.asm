	object_const_def ; object_event constants
	const CIANWOODPHOTOSTUDIO_FISHING_GURU

CianwoodPhotoStudio_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakMoveTutorScript:
	faceplayer
	opentext
	writetext EcruteakMoveTutorAskTeachAMoveText
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .Refused
	yesorno
	iffalse .Refused
	writetext EcruteakMoveTutorWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .FirePunch
	ifequal 2, .Thunderpunch
	ifequal 3, .IcePunch
	ifequal 4, .PixiePunch
	sjump .Incompatible

.FirePunch:
	loadmoveindex FIRE_PUNCH
	writetext TeachMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.Thunderpunch:
	loadmoveindex THUNDERPUNCH
	writetext TeachMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.IcePunch:
	loadmoveindex ICE_PUNCH
	writetext TeachMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.PixiePunch:
	loadmoveindex PIXIE_PUNCH
	writetext TeachMoveText
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.Refused:
	writetext EcruteakMoveTutorVeryWellText
	waitbutton
	closetext
	end

.Incompatible:
	writetext EcruteakMoveTutorHmTooBadText
	waitbutton
	closetext
	end

.TeachMove:
	writetext EcruteakMoveTutorPowerfulFistsText
	takemoney YOUR_MONEY, 1000
	buttonsound
	writetext EcruteakMoveTutorFarewellText
	waitbutton
	closetext
	end

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y - 0
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "Fire Punch@"
	db "Thunderpunch@"
	db "Ice Punch@"
	db "Pixie Punch@"
	db "Cancel@"

CianwoodTelevision:
	jumpstd televisionscript

EcruteakMoveTutorAskTeachAMoveText:
	text "There are moves"
	line "that are used with"
	cont "a #mon's fists."

	para "Would you like a"
	line "#mon to learn"
	cont "one?"

	para "It's only ¥1,000."
	done

EcruteakMoveTutorVeryWellText:
	text "Hmph. Very well."
	line "Return if you"
	cont "change your mind."
	done

EcruteakMoveTutorWhichMoveShouldITeachText:
	text "Which move shall"
	line "suit your style?"
	done

EcruteakMoveTutorPowerfulFistsText:
	text "Your #mon's"
	line "fists are now pow-"
	cont "erful."
	done

EcruteakMoveTutorFarewellText:
	text "Use them wisely."
	done

EcruteakMoveTutorHmTooBadText:
	text "How unfortunate."
	done

TeachMoveText:
	text_start
	done

CianwoodPhotoStudio_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 5
	warp_event  3,  7, CIANWOOD_CITY, 5

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, CianwoodTelevision

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakMoveTutorScript, -1
