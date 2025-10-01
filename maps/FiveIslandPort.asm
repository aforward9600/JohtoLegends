	object_const_def ; object_event constants
	const FIVEISLANDPORT_SAILOR

FiveIslandPort_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FiveIslandPortSailorScript:
	opentext
	writetext VermilionPortSeviiText
	waitbutton
	loadmenu FiveIslandMenu
	verticalmenu
	ifequal 1, .OneIsland
	ifequal 2, .TwoIsland
	ifequal 3, .ThreeIsland
	ifequal 4, .FourIsland
	ifequal 5, .SixIsland
	ifequal 6, .SevenIsland
	ifequal 7, .VermilionPort
	sjump .Cancel

.OneIsland
	getlandmarkname STRING_BUFFER_5, ONE_ISLAND
	writetext SeviiIslandText
	scall SeviiPortLeave
	warp ONE_ISLAND_PORT, 5, 3
	end

.TwoIsland
	getlandmarkname STRING_BUFFER_5, TWO_ISLAND
	writetext SeviiIslandText
	scall SeviiPortLeave
	warp TWO_ISLAND_PORT, 5, 3
	end

.ThreeIsland
	getlandmarkname STRING_BUFFER_5, THREE_ISLAND
	writetext SeviiIslandText
	scall SeviiPortLeave
	warp THREE_ISLAND_PORT, 5, 3
	end

.FourIsland
	getlandmarkname STRING_BUFFER_5, FOUR_ISLAND
	writetext SeviiIslandText
	scall SeviiPortLeave
	warp FOUR_ISLAND_PORT, 5, 3
	end

.SixIsland
	getlandmarkname STRING_BUFFER_5, SIX_ISLAND
	writetext SeviiIslandText
	scall SeviiPortLeave
	warp SIX_ISLAND_PORT, 5, 3
	end

.SevenIsland
	getlandmarkname STRING_BUFFER_5, SEVEN_ISLAND
	writetext SeviiIslandText
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

FiveIslandMenu:
	db MENU_BACKUP_TILES
	menu_coords 0, 0, 17, 16
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 7 ; items
	db "One Island@"
	db "Two Island@"
	db "Three Island@"
	db "Four Island@"
	db "Six Island@"
	db "Seven Island@"
	db "Vermilion City@"

FiveIslandPort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  0, FIVE_ISLAND, 1
	warp_event  5,  0, FIVE_ISLAND, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FiveIslandPortSailorScript, -1
	