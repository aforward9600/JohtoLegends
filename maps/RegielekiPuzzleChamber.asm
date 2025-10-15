	object_const_def ; object_event constants

RegielekiPuzzleChamber_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoor

.HiddenDoor:
	checkevent EVENT_WALL_OPENED_IN_REGIELEKI_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $0d
.WallOpen:
	return

RegielekiPuzzleChamberRock:
	opentext
	writetext RegielekiRockText
	setval UNOWNWORDS_REGIELEKI
	special DisplayUnownWords
	closetext
	checkevent EVENT_WALL_OPENED_IN_REGIELEKI_CHAMBER
	iftrue .Finish
	checkitem MAGNET
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
	setevent EVENT_WALL_OPENED_IN_REGIELEKI_CHAMBER
	end

RegielekiRockText:
	text "There are some"
	line "dots here."
	done

RegielekiPuzzleChamber_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  7, LOST_CAVE_ROOM_9, 4
	warp_event  5,  1, LOST_CAVE_REGIELEKI, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  5, BGEVENT_READ, RegielekiPuzzleChamberRock

	db 0 ; object events
	