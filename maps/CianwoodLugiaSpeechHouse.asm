	object_const_def ; object_event constants
	const CIANWOODLUGIASPEECHHOUSE_TEACHER
	const CIANWOODLUGIASPEECHHOUSE_LASS
	const CIANWOODLUGIASPEECHHOUSE_TWIN

CianwoodLugiaSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodLugiaSpeechHouseTeacherScript:
	faceplayer
	opentext
	writetext FossilExchangeText
	loadmenu .FossilMenu
	verticalmenu
	closewindow
	ifequal 1, .OldAmber
	ifequal 2, .HelixFossil
	ifequal 3, .DomeFossil
	sjump .Refused

.Refused:
	writetextend NoFossilText

.FossilMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "Old Amber@"
	db "Helix Fossil@"
	db "Dome Fossil@"
	db "Cancel@"

.OldAmber:
	checkitem OLD_AMBER
	iffalse .DontHaveFossil
	takeitem OLD_AMBER
	scall ExchangeFossilScript
	iffalse .NoRoom1
	sjump .GaveFossil

.HelixFossil:
	checkitem HELIX_FOSSIL
	iffalse .DontHaveFossil
	takeitem HELIX_FOSSIL
	scall ExchangeFossilScript
	iffalse .NoRoom2
	sjump .GaveFossil

.DomeFossil:
	checkitem DOME_FOSSIL
	iffalse .DontHaveFossil
	takeitem DOME_FOSSIL
	scall ExchangeFossilScript
	iffalse .NoRoom3
	sjump .GaveFossil

.DontHaveFossil:
	jumptext DontHaveFossilText

.GaveFossil:
	writetextend FinishedFossilExchangeText

.NoRoom1:
	giveitem OLD_AMBER
	writetextend NoRoomFossilText

.NoRoom2:
	giveitem HELIX_FOSSIL
	writetextend NoRoomFossilText

.NoRoom3:
	giveitem DOME_FOSSIL
	writetextend NoRoomFossilText

ExchangeFossilScript:
	writetext HereIsYourItemText
	buttonsound
	random 10
	ifequal 0, .EonMail
	ifequal 1, .PPUp
	ifequal 2, .RareCandy
	ifequal 3, .AbilityPill
	ifequal 4, .MaxRevive
	ifequal 5, .PeatBlock
	ifequal 6, .AirBalloon
	ifequal 7, .LightClay
	ifequal 8, .WeatherRock
	ifequal 9, .Nugget

.EonMail
	verbosegiveitem EON_MAIL
	end

.PPUp
	verbosegiveitem PP_UP
	end

.RareCandy
	verbosegiveitem RARE_CANDY
	end

.AbilityPill
	verbosegiveitem ABILITY_PILL
	end

.MaxRevive
	verbosegiveitem MAX_REVIVE
	end

.PeatBlock
	verbosegiveitem PEAT_BLOCK
	end

.AirBalloon
	verbosegiveitem AIR_BALLOON
	end

.LightClay
	verbosegiveitem LIGHT_CLAY
	end

.WeatherRock
	verbosegiveitem WEATHER_ROCK
	end

.Nugget
	verbosegiveitem NUGGET
	end

CianwoodLugiaSpeechHouseLassScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseLassText

CianwoodLugiaSpeechHouseTwinScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTwinText

CianwoodLugiaSpeechHouseBookshelf:
	jumpstd genericsink

FossilExchangeText:
	text "If you have any"
	line "extra fossils, I"
	cont "will trade you"
	cont "rare items."
	done

DontHaveFossilText:
	text "You don't have a"
	line "fossil for me…"
	done

NoFossilText:
	text "Fine…"
	done

HereIsYourItemText:
	text "Thanks! Here you"
	line "go!"
	done

FinishedFossilExchangeText:
	text "Enjoy!"
	done

NoRoomFossilText:
	text "You don't have"
	line "room!"
	done

CianwoodLugiaSpeechHouseLassText:
	text "I heard that you"
	line "can only see it if"

	para "you have a Silver"
	line "Wing."

	para "It must have the"
	line "same scent as the"
	cont "creature."
	done

CianwoodLugiaSpeechHouseTwinText:
	text "I've heard that"
	line "the whirlpools"

	para "around the islands"
	line "are caused by the"
	cont "sea creature."

	para "You might need a"
	line "special tune to"
	cont "get past them."
	done

CianwoodLugiaSpeechHouse_MapEvents:
	db 2 ; warp events
	warp_event  4,  7, CIANWOOD_CITY, 6
	warp_event  5,  7, CIANWOOD_CITY, 6

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf

	db 3 ; object events
	object_event  3,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTeacherScript, -1
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseLassScript, -1
	object_event  0,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTwinScript, -1
