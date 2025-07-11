	object_const_def ; object_event constants

RegirockPuzzleChamber_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoor

.HiddenDoor:
	checkevent EVENT_WALL_OPENED_IN_REGIROCK_CHAMBER
	iftrue .WallOpen
	changeblock 2, 0, $0d
.WallOpen:
	return

RegirockPuzzleChamberRock:
	opentext
	writetext RegirockRockText
	setval UNOWNWORDS_REGIROCK
	special DisplayUnownWords
	closetext
	checkevent EVENT_WALL_OPENED_IN_REGIROCK_CHAMBER
	iftrue .Finish
	checkitem HARD_STONE
	iftrue .OpenWall
.Finish:
	end

.OpenWall:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 2, 0, $13
	reloadmappart
	earthquake 50
	setevent EVENT_WALL_OPENED_IN_REGIROCK_CHAMBER
	end

RegirockRockText:
	text "There are some"
	line "dots here."
	done

RegirockPuzzleChamber_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  5, ALTERING_CAVE, 2
	warp_event  3,  1, REGIROCK_CHAMBER, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  3, BGEVENT_READ, RegirockPuzzleChamberRock

	db 0 ; object events
	