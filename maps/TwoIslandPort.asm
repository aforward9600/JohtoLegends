	object_const_def ; object_event constants
	const TWOISLANDPORT_SAILOR

TwoIslandPort_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TwoIslandPortSailorScript:
	opentext
	writetext VermilionPortSeviiText
	waitbutton
	loadmenu TwoIslandMenu
	verticalmenu
	ifequal 1, .OneIsland
	ifequal 2, .ThreeIsland
	ifequal 3, .FourIsland
	ifequal 4, .FiveIsland
	ifequal 5, .SixIsland
	ifequal 6, .SevenIsland
	ifequal 7, .VermilionPort
	sjump .Cancel

.OneIsland
	writetext OneIslandText
	scall SeviiPortLeave
	warp ONE_ISLAND_PORT, 5, 3
	end

.ThreeIsland
	writetext ThreeIslandText
	scall SeviiPortLeave
	warp THREE_ISLAND_PORT, 5, 3
	end

.FourIsland
	writetext FourIslandText
	scall SeviiPortLeave
	warp FOUR_ISLAND_PORT, 5, 3
	end

.FiveIsland
	writetext FiveIslandText
	scall SeviiPortLeave
	warp FIVE_ISLAND_PORT, 5, 3
	end

.SixIsland
	writetext SixIslandText
	scall SeviiPortLeave
	warp SIX_ISLAND_PORT, 5, 3
	end

.SevenIsland
	writetext SevenIslandText
	scall SeviiPortLeave
	warp SEVEN_ISLAND_PORT, 5, 3
	end

.VermilionPort
	writetext VermilionPortText
	scall SeviiPortLeave
	setmapscene, VERMILION_PORT, SCENE_VERMILIONPORT_LEAVE_SHIP
	turnobject, PLAYER, UP
	warp VERMILION_PORT, 7, 17
	end

.Cancel
	writetext UnknownText_0x74fa7
	waitbutton
	closetext
	end

TwoIslandMenu:
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 17, 16
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 7 ; items
	db "One Island@"
	db "Three Island@"
	db "Four Island@"
	db "Five Island@"
	db "Six Island@"
	db "Seven Island@"
	db "Vermilion City@"

TwoIslandPort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  0, TWO_ISLAND, 1
	warp_event  5,  0, TWO_ISLAND, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TwoIslandPortSailorScript, -1
	