	object_const_def ; object_event constants

RegicePuzzleChamber_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoor

.HiddenDoor:
	checkevent EVENT_WALL_OPENED_IN_REGICE_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $0d
.WallOpen:
	return

RegicePuzzleChamberRock:
	opentext
	writetext RegiceRockText
	setval UNOWNWORDS_REGICE
	special DisplayUnownWords
	closetext
	checkevent EVENT_WALL_OPENED_IN_REGICE_CHAMBER
	iftrue .Finish
	checkitem NEVERMELTICE
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
	setevent EVENT_WALL_OPENED_IN_REGICE_CHAMBER
	end

RegiceRockText:
	text "There are some"
	line "dots here."
	done

RegicePuzzleChamber_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5,  7, ICEFALL_CAVE_BACK_CAVE, 2
	warp_event  5,  1, REGICE_CHAMBER, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  5, BGEVENT_READ, RegicePuzzleChamberRock

	db 0 ; object events
	