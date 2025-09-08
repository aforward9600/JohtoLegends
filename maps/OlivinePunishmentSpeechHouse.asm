	object_const_def ; object_event constants
	const OLIVINEPUNISHMENTSPEECHHOUSE_POKEFAN_M
	const OLIVINEPUNISHMENTSPEECHHOUSE_GRANDPA

OlivinePunishmentSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivinePunishmentSpeechHouseDaughter:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GiveStones
	writetextend TheresAnEeveeText

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
	sjump .FinishEvolutionStone

.ThunderStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem THUNDERSTONE
	writetext JolteonText
	sjump .FinishEvolutionStone

.FireStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem FIRE_STONE
	writetext FlareonText
	sjump .FinishEvolutionStone

.SunStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem SUN_STONE
	writetext EspeonText
	sjump .FinishEvolutionStone

.MoonStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem MOON_STONE
	writetext UmbreonText
	sjump .FinishEvolutionStone

.LeafStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem LEAF_STONE
	writetext LeafeonText
	sjump .FinishEvolutionStone

.IceStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem ICE_STONE
	writetext GlaceonText
	sjump .FinishEvolutionStone

.ShinyStone:
	writetext HereYouGoText
	buttonsound
	verbosegiveitem SHINY_STONE
	writetext SylveonText
.FinishEvolutionStone
	waitbutton
	closetext
	setevent EVENT_GOT_STONE_FROM_THEATRE
	end

.MaybeLater:
	writetextend OKMaybeNextTimeText

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

OlivinePunishmentSpeechHouseSwarmGuy:
	jumptextfaceplayer OlivinePunishmentSpeechHouseSwarmGuyText

OlivinePunishmentSpeechHouseBookshelf1:
	jumpstd genericsink

SwarmChannel:
	jumpstd swarmscript

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

OlivinePunishmentSpeechHouseSwarmGuyText:
	text "You here to watch"
	line "the Swarm Channel?"

	para "It's great!"

	para "They let you know"
	line "where a swarm of"
	cont "#mon appear!"

	para "It changes every"
	line "day, and sometimes"

	para "you may not get a"
	line "swarm."

	para "I've heard that"
	line "uniquely colored"
	cont "#mon can show"

	para "more often in such"
	line "swarms!"
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

OlivinePunishmentSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, OLIVINE_CITY, 4
	warp_event  5,  7, OLIVINE_CITY, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, OlivinePunishmentSpeechHouseBookshelf1
	bg_event  4,  1, BGEVENT_READ, SwarmChannel

	db 2 ; object events
	object_event  1,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePunishmentSpeechHouseDaughter, -1
	object_event  6,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePunishmentSpeechHouseSwarmGuy, -1
