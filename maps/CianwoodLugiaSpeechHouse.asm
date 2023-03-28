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
	checkevent EVENT_GOT_EEVEE
	iftrue .GiveStones
	writetext TheresAnEeveeText
	waitbutton
	closetext
	end

.GiveStones:
	checkevent EVENT_GOT_STONE_FROM_THEATRE
	iftrue .NoStones
	writetext YouGotAnEeveeText
	waitbutton
	loadmenu DanceTheatreStonesMenu
	verticalmenu
	closewindow
	ifequal 1, .WaterStone
	ifequal 2, .ThunderStone
	ifequal 3, .FireStone
	ifequal 4, .SunStone
	ifequal 5, .NewMenu
	sjump .MaybeLater

.NewMenu:
	loadmenu DanceTheatreStonesMenu2
	verticalmenu
	closewindow
	ifequal 1, .MoonStone
	ifequal 2, .LeafStone
	ifequal 3, .IceStone
	ifequal 4, .ShinyStone
	ifequal 5, .MaybeLater
	sjump .MaybeLater

.NoStones:
	writetext HowIsYourEeveeText
	waitbutton
	closetext
	end

.WaterStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem WATER_STONE
	writetext VaporeonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.ThunderStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem THUNDERSTONE
	writetext JolteonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.FireStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem FIRE_STONE
	writetext FlareonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.SunStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem SUN_STONE
	writetext EspeonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.MoonStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem MOON_STONE
	writetext UmbreonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.LeafStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem LEAF_STONE
	writetext LeafeonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.IceStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem ICE_STONE
	writetext GlaceonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.ShinyStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem SHINY_STONE
	writetext SylveonText
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.MaybeLater:
	writetext OKMaybeNextTimeText
	waitbutton
	closetext
	end

DanceTheatreStonesMenu:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y - 0
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 5 ; items
	db "Water Stone@"
	db "Thunderstone@"
	db "Fire Stone@"
	db "Sun Stone@"
	db "Next Page@"

DanceTheatreStonesMenu2:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, TEXTBOX_Y - 0
	dw .MenuData2
	db 1 ; default option

.MenuData2:
	db STATICMENU_CURSOR ; flags
	db 5 ; items	
	db "Moon Stone@"
	db "Leaf Stone@"
	db "Ice Stone@"
	db "Shiny Stone@"
	db "Cancel@"

CianwoodLugiaSpeechHouseLassScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseLassText

CianwoodLugiaSpeechHouseTwinScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTwinText

CianwoodLugiaSpeechHouseBookshelf:
	jumpstd picturebookshelf

YouGotAnEeveeText:
	text "Oh, I see you have"
	line "an Eevee."

	para "The most versatile"
	line "of #mon, Eevee"
	cont "can evolve into"
	cont "one of 8 forms."

	para "I can give you an"
	line "item to evolve it,"
	cont "but only one."

	para "Choose wisely."
	done

HereYouGoText:
	text "Here you go."
	done

VaporeonText:
	text "Vaporeon the Water"
	line "type. An excellent"
	cont "choice."
	done

JolteonText:
	text "Jolteon the Elect-"
	line "ric type. An exce-"
	cont "llent choice."
	done

FlareonText:
	text "Flareon the Fire"
	line "type. An excellent"
	cont "choice."
	done

EspeonText:
	text "Espeon the Psychic"
	line "type. An excellent"
	cont "choice."
	done

UmbreonText:
	text "Umbreon the Dark"
	line "type. An excellent"
	cont "choice."
	done

LeafeonText:
	text "Leafeon the Grass"
	line "type. An excellent"
	cont "choice."
	done

GlaceonText:
	text "Glaceon the Ice"
	line "type. An excellent"
	cont "choice."
	done

SylveonText:
	text "Sylveon the Fairy"
	line "type. An excellent"
	cont "choice."
	done

HowIsYourEeveeText:
	text "How's your Eevee?"

	para "Has it evolved"
	line "yet?"
	done

OKMaybeNextTimeText:
	text "OK. Perhaps later."
	done

CianwoodLugiaSpeechHouseTeacherText:
	text "You came from"
	line "Olivine?"

	para "Do you remember"
	line "the four islands"
	cont "along the way?"

	para "I heard that a "
	line "mythical sea crea-"
	cont "ture is hiding in"
	cont "them."
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
	line "special item to"
	cont "get past them."
	done

TheresAnEeveeText:
	text "If you go to the"
	line "Dance Theatre in"
	cont "Ecruteak City,"

	para "you can battle a"
	line "Kimono Girl, and"
	cont "if you win,"

	para "she'll give you an"
	line "Eevee!"

	para "Come back after"
	line "you win, and I'll"
	cont "give you something"
	cont "nice!"
	done

CianwoodLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 6
	warp_event  3,  7, CIANWOOD_CITY, 6

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf
	bg_event  2,  1, BGEVENT_READ, CianwoodTelevision

	db 3 ; object events
	object_event  2,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTeacherScript, -1
	object_event  6,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseLassScript, -1
	object_event  0,  2, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTwinScript, -1
