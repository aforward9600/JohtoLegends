	object_const_def ; object_event constants

RegidragoPuzzleChamber_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoor

.HiddenDoor:
	checkevent EVENT_WALL_OPENED_IN_REGIDRAGO_CHAMBER
	iftrue .WallOpen
	changeblock 2, 0, $0d
.WallOpen:
	return

RegidragoPuzzleChamberRock:
	opentext
	writetext RegidragoRockText
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
	changeblock 2, 0, $13
	reloadmappart
	earthquake 50
	setevent EVENT_WALL_OPENED_IN_REGIDRAGO_CHAMBER
	end

RegidragoRockText:
	text "There are some"
	line "dots here."
	done

RegidragoPuzzleChamber_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  5, MT_EMBER, 3
	warp_event  3,  1, REGIDRAGO_CHAMBER, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  3, BGEVENT_READ, RegidragoPuzzleChamberRock

	db 0 ; object events
	