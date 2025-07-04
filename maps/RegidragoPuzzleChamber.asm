	object_const_def ; object_event constants

RegidragoPuzzleChamber_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoor

.HiddenDoor:
	checkevent EVENT_WALL_OPENED_IN_REGIDRAGO_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $2e
.WallOpen:
	return

RegidragoPuzzleChamberWallRight:
	checkevent EVENT_WALL_OPENED_IN_REGIDRAGO_CHAMBER
	iftrue WallIsOpen
RegidragoPuzzleChamberWallLeft:
	opentext
	writetext RegidragoWallText
	setval UNOWNWORDS_REGIDRAGO
	special DisplayUnownWords
	closetext
	checkevent EVENT_WALL_OPENED_IN_REGIDRAGO_CHAMBER
	iftrue .Finish
	checkitem DRAGON_FANG
	iftrue .OpenWall
.Finish:
	end

.OpenWall:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30
	reloadmappart
	earthquake 50
	setevent EVENT_WALL_OPENED_IN_REGIDRAGO_CHAMBER
	end
	

WallIsOpen:
	opentext
	writetext RegidragoOpenText
	waitbutton
	closetext
	end

RegidragoOpenText:
	text "The wall is open."
	done

RegidragoWallText:
	text "There are some"
	line "dots here, as well"
	cont "as a different"
	cont "language."
	done

RegidragoPuzzleChamber_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, MT_EMBER, 3
	warp_event  4,  7, MT_EMBER, 3
	warp_event  4,  0, REGIDRAGO_CHAMBER, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  0, BGEVENT_READ, RegidragoPuzzleChamberWallLeft
	bg_event  4,  0, BGEVENT_READ, RegidragoPuzzleChamberWallRight

	db 0 ; object events
	