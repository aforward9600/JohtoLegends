	object_const_def ; object_event constants
	const VERMILIONPORT_SAILOR2
	const VERMILIONPORT_SUPER_NERD

VermilionPort_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_VERMILIONPORT_LEAVE_SHIP

	db 0 ; callbacks

.DummyScene0:
	end

.LeaveFastShip:
	applymovement PLAYER, MovementPlayerLeavesShip
	setscene SCENE_DEFAULT
	end

VermilionPortSailorScript:
	faceplayer
	turnobject PLAYER, LEFT
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .skip2
	writetext UnknownText_0x74f4d
	waitbutton
	closetext
	end

.skip2:
;	writetext WalkThisWayText
;	waitbutton
;	closetext
;	end
	writetext UnknownText_0x74fa7
	waitbutton
	closetext
	end

VermilionPortWalkUpToShipScript:
	turnobject VERMILIONPORT_SAILOR2, RIGHT
	turnobject PLAYER, LEFT
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .skip
	writetext UnknownText_0x74f4d
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74ef5
	end

.Cancel:
	writetext UnknownText_0x74fa7
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74ef5
	end

.skip
	writetext UnknownText_0x750a6
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74ef5
	end

	checkflag ENGINE_FLYPOINT_ONE_ISLAND
	iftrue .VermilionPortMenu
	writetext HeadToOneIslandText
	yesorno
	iffalse .Cancel
	setevent EVENT_LOST_BOY_TWO_ISLAND
	setevent EVENT_FIVE_ISLAND_FERROPEXOLA
	sjump .OneIsland

.VermilionPortMenu
	writetext VermilionPortSeviiText
	waitbutton
	loadmenu VermilionPortMenu
	verticalmenu
	ifequal 1, .OneIsland
	ifequal 2, .TwoIsland
	ifequal 3, .ThreeIsland
	ifequal 4, .FourIsland
	ifequal 5, .FiveIsland
	ifequal 6, .SixIsland
	ifequal 7, .SevenIsland
	sjump .Cancel

.OneIsland
	writetext OneIslandText
	scall VermilionPortLeave
	warp ONE_ISLAND_PORT, 5, 3
	end

.TwoIsland
	writetext TwoIslandText
	scall VermilionPortLeave
	warp TWO_ISLAND_PORT, 5, 3
	end

.ThreeIsland
	writetext ThreeIslandText
	scall VermilionPortLeave
	warp THREE_ISLAND_PORT, 5, 3
	end

.FourIsland
	writetext FourIslandText
	scall VermilionPortLeave
	warp FOUR_ISLAND_PORT, 5, 3
	end

.FiveIsland
	writetext FiveIslandText
	scall VermilionPortLeave
	warp FIVE_ISLAND_PORT, 5, 3
	end

.SixIsland
	writetext SixIslandText
	scall VermilionPortLeave
	warp SIX_ISLAND_PORT, 5, 3
	end

.SevenIsland
	writetext SevenIslandText
	scall VermilionPortLeave
	warp SEVEN_ISLAND_PORT, 5, 3
	end

VermilionPortLeave:
	waitbutton
	writetext AllAboardText
	waitbutton
	closetext
	pause 5
	applymovement PLAYER, PlayerGoesToShipMovement
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playsound SFX_BOAT
	pause 5
	waitsfx
	end

VermilionPortSuperNerdScript:
	faceplayer
	opentext
	writetext UnknownText_0x750a6
	waitbutton
	closetext
	end

VermilionPortHiddenIron:
	hiddenitem IRON, EVENT_VERMILION_PORT_HIDDEN_IRON

VermilionPortMenu:
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
	db "Five Island@"
	db "Six Island@"
	db "Seven Island@"

MovementData_0x74ef1:
	step DOWN
	step_end

MovementData_0x74ef3:
	step UP
	step_end

MovementData_0x74ef5:
	step RIGHT
	turn_head LEFT
	step_end

PlayerGoesToShipMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74efe:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementPlayerLeavesShip:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step_end

UnknownText_0x74f4d:
	text "You'll have to"
	line "leave."

	para "There are no ships"
	line "that are sailing"
	cont "right now."
	done

UnknownText_0x74fa7:
	text "Come back if you"
	line "wish to sail."
	done

UnknownText_0x750a6:
	text "How I miss the"
	line "smell of the sea."

	para "Someday, I shall"
	line "take to the waves"
	cont "once again!"
	done

OneIslandText:
	text "You'd like to go to"
	line "One Island?"
	done

TwoIslandText:
	text "You'd like to go to"
	line "Two Island?"
	done

ThreeIslandText:
	text "You'd like to go to"
	line "Three Island?"
	done

FourIslandText:
	text "You'd like to go to"
	line "Four Island?"
	done

FiveIslandText:
	text "You'd like to go to"
	line "Five Island?"
	done

SixIslandText:
	text "You'd like to go to"
	line "Six Island?"
	done

SevenIslandText:
	text "You'd like to go to"
	line "Seven Island?"
	done

AllAboardText:
	text "Alright!"

	para "All aboard!"
	done

HeadToOneIslandText:
	text "Now that the Feds"
	line "are no more, we"
	cont "can sail to the"
	cont "Sevii Islands once"
	cont "again!"

	para "I can take you to"
	line "One Island first,"
	cont "then you can go"
	cont "to the others any"
	cont "time you want."

	para "Whaddya say?"
	done

VermilionPortSeviiText:
	text "Where would you"
	line "like to go?"
	done

VermilionPort_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  5, VERMILION_PORT_PASSAGE, 5

	db 1 ; coord events
	coord_event  7, 11, SCENE_DEFAULT, VermilionPortWalkUpToShipScript

	db 1 ; bg events
	bg_event 16, 12, BGEVENT_ITEM, VermilionPortHiddenIron

	db 2 ; object events
	object_event  6, 11, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPortSailorScript, -1
	object_event 12, 10, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionPortSuperNerdScript, -1
