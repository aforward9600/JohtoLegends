	object_const_def ; object_event constants
	const KURTSHOUSE_YOUNGSTER
	const KURTSHOUSE_SLOWPOKE
	const KURTSHOUSE_KURT

KurtsHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .KurtSaturday

.KurtSaturday:
	checkevent EVENT_BEAT_KURT
	iftrue .IsItSaturday
	disappear KURTSHOUSE_KURT
	return

.IsItSaturday:
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .KurtAppears
	disappear KURTSHOUSE_KURT
	return

.KurtAppears:
	appear KURTSHOUSE_KURT
	return

KurtsHouseYoungster:
	faceplayer
	opentext
	writetext KurtsHouseAskTeachAMoveText
	checkmoney YOUR_MONEY, 2000
	ifequal HAVE_LESS, .Refused
	yesorno
	iffalse .Refused
	writetext KurtsHouseWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .UTurn
	ifequal 2, .VoltSwitch
	sjump .Incompatible

.UTurn:
	loadmoveindex U_TURN
	writetext TeachSwitchMoveText2
	waitbutton
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.VoltSwitch:
	loadmoveindex VOLT_SWITCH
	writetext TeachSwitchMoveText2
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
	db 3 ; items
	db "U Turn@"
	db "Volt Switch@"
	db "Cancel@"

.Refused:
	writetext YoullBeBackText
	waitbutton
	closetext
	end

.TeachMove:
	writetext KurtsHouseNiceMoveText
	takemoney YOUR_MONEY, 2000
	buttonsound
	writetext KurtsHouseGoodLuckText
	waitbutton
	closetext
	end

.Incompatible:
	writetext KurtsHouseHowUnfortunateText
	waitbutton
	closetext
	end

KurtsHouseSlowpoke:
	refreshscreen
	pokepic SLOWPOKE
	cry SLOWPOKE
	waitbutton
	closepokepic
	opentext
	writetext KurtsHouseSlowpokeText
	waitbutton
	closetext
	end

KurtsHouseKurtScript:
	faceplayer
	opentext
	writetext KurtsHouseKurtText
	waitbutton
	closetext
	turnobject KURTSHOUSE_KURT, UP
	end

KurtsHouseOakPhoto:
	jumptext KurtsHouseOakPhotoText

KurtsHouseCelebiStatue:
	jumptext KurtsHouseCelebiStatueText

KurtsHouseBookshelf:
	jumpstd difficultbookshelf

KurtsHouseRadio:
	jumpstd televisionscript

KurtsHouseAskTeachAMoveText:
	text "I'm just here to"
	line "watch Kurt's"
	cont "house."

	para "While we're here,"
	line "would you like me"
	cont "to teach your"

	para "#mon a neat"
	line "switching move?"

	para "It's only ¥2,000."
	done

KurtsHouseWhichMoveShouldITeachText:
	text "Which move should"
	line "I teach?"
	done

KurtsHouseNiceMoveText:
	text "It's a nice move,"
	line "huh?"
	done

TeachSwitchMoveText2:
	text "Which #mon?"
	done

KurtsHouseGoodLuckText:
	text "Good luck on your"
	line "journey."
	done

YoullBeBackText:
	text "You'll be back."

	para "Someday you'll"
	line "make a U Turn."
	done

KurtsHouseHowUnfortunateText:
	text "Aw, fine."
	done

KurtsHouseSlowpokeText:
	text "Slowpoke: …"
	line "Yawn?"
	done

KurtsHouseOakPhotoText:
	text "A photo of young"
	line "Kurt with another"
	cont "young man."

	para "The other man is"
	line "holding a trophy."

	para "It says:"

	para "Me and Sam."
	done

KurtsHouseCelebiStatueText:
	text "It's a statue of"
	line "the forest's pro-"
	cont "tector."
	done

KurtsHouseKurtText:
	text "Hm?"

	para "Oh, it's you…"

	para "I'm just tinkering"
	line "away on some"
	cont "# Balls."

	para "It doesn't make me"
	line "any money, but"
	cont "it's still fun."

	para "…Sigh…"

	para "I miss my old"
	line "livelihood…"

	para "Being a Leader's"
	line "not bad, but it's"
	cont "not as fun…"

	para "My son makes good"
	line "money, at least…"
	done

KurtsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, AZALEA_TOWN, 4
	warp_event  4,  7, AZALEA_TOWN, 4

	db 0 ; coord events

	db 7 ; bg events
	bg_event  6,  1, BGEVENT_READ, KurtsHouseRadio
	bg_event  8,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  9,  0, BGEVENT_READ, KurtsHouseOakPhoto
	bg_event  5,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  2,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  3,  1, BGEVENT_READ, KurtsHouseBookshelf
	bg_event  4,  1, BGEVENT_READ, KurtsHouseCelebiStatue

	db 3 ; object events
	object_event  5,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsHouseYoungster, -1
	object_event  6,  3, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsHouseSlowpoke, -1
	object_event 14,  3, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, KurtsHouseKurtScript, EVENT_KURTS_HOUSE_KURT_1
