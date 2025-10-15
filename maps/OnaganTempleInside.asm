	object_const_def ; object_event constants

OnaganTempleInside_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoor

.HiddenDoor:
	checkevent EVENT_WALL_OPENED_IN_REGIGIGAS_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $9f
.WallOpen:
	return

OnaganTempleInsideWall2:
	checkevent EVENT_WALL_OPENED_IN_REGIGIGAS_CHAMBER
	iftrue WallOpen
OnaganTempleInsideWall:
	opentext
	writetext OnaganTempleInsideText
	setval UNOWNWORDS_REGIGIGAS
	special DisplayUnownWords
	closetext
	checkevent EVENT_WALL_OPENED_IN_REGIGIGAS_CHAMBER
	iftrue .Finish
	checkevent EVENT_CAUGHT_REGIROCK
	iffalse .Finish
	checkevent EVENT_CAUGHT_REGICE
	iffalse .Finish
	checkevent EVENT_CAUGHT_REGISTEEL
	iffalse .Finish
	checkevent EVENT_CAUGHT_REGIELEKI
	iffalse .Finish
	checkevent EVENT_CAUGHT_REGIDRAGO
	iftrue .OpenWall
.Finish:
	end

.OpenWall:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $9d
	reloadmappart
	earthquake 50
	setevent EVENT_WALL_OPENED_IN_REGIGIGAS_CHAMBER
	end

WallOpen:
	jumptext RegigigasOpenWallText

OnaganTemplePillar:
	jumptext OnaganTemplePillarText

OnaganTempleInsideText:
	text "There are some"
	line "dots here."
	done

RegigigasOpenWallText:
	text "The wall is open."
	done

OnaganTemplePillarText:
	text "The dots are too"
	line "faded to decipher."
	done

OnaganTempleInside_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  9, ONAGAN_TEMPLE_OUTSIDE, 1
	warp_event  4,  9, ONAGAN_TEMPLE_OUTSIDE, 1
	warp_event  4,  0, REGIGIGAS_CHAMBER, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event  3,  0, BGEVENT_READ, OnaganTempleInsideWall
	bg_event  4,  0, BGEVENT_READ, OnaganTempleInsideWall2
	bg_event  2,  7, BGEVENT_READ, OnaganTemplePillar
	bg_event  2,  3, BGEVENT_READ, OnaganTemplePillar
	bg_event  5,  3, BGEVENT_READ, OnaganTemplePillar
	bg_event  5,  7, BGEVENT_READ, OnaganTemplePillar

	db 0 ; object events
	