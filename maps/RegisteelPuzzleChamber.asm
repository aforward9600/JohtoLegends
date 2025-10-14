	object_const_def ; object_event constants

RegisteelPuzzleChamber_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoor

.HiddenDoor:
	checkevent EVENT_WALL_OPENED_IN_REGISTEEL_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $0d
.WallOpen:
	return

RegisteelPuzzleChamberRock:
	opentext
	writetext RegisteelRockText
	setval UNOWNWORDS_REGISTEEL
	special DisplayUnownWords
	closetext
	checkevent EVENT_WALL_OPENED_IN_REGISTEEL_CHAMBER
	iftrue .Finish
	checkitem METAL_COAT
	iftrue .OpenWall
.Finish:
	end

.OpenWall:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $13
	reloadmappart
	earthquake 50
	setevent EVENT_WALL_OPENED_IN_REGISTEEL_CHAMBER
	end

RegisteelRockText:
	text "There are some"
	line "dots here."
	done

RegisteelPuzzleChamber_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  5, DOTTED_HOLE_ENTRANCE, 3
	warp_event  5,  1, REGISTEEL_CHAMBER, 1
	warp_event  3,  5, DOTTED_HOLE_B4F, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  5, BGEVENT_READ, RegisteelPuzzleChamberRock

	db 0 ; object events
	