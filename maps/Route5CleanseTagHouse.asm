	object_const_def ; object_event constants
	const ROUTE5CLEANSETAGHOUSE_GRANNY

Route5CleanseTagHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route5CleanseTagHouseGrannyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEANSE_TAG
	iftrue .GotCleanseTag
	writetext Route5CleanseTagHouseGrannyText1
	buttonsound
	verbosegiveitem CLEANSE_TAG
	iffalse .NoRoom
	setevent EVENT_GOT_CLEANSE_TAG
.GotCleanseTag:
	writetext Route5CleanseTagHouseGrannyText2
	waitbutton
.NoRoom:
	closetext
	end

HouseForSaleBookshelf:
	jumpstd difficultbookshelf

Route5CleanseTagHouseGrannyText1:
	text "Ever wanted to"
	line "ward off wild"
	cont "#mon?"

	para "Take this Cleanse"
	line "Tag."
	done

Route5CleanseTagHouseGrannyText2:
	text "Maybe I should set"
	line "up a daycare here"
	cont "for any upstart"
	cont "trainers."
	done

Route5CleanseTagHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_5, 4
	warp_event  3,  7, ROUTE_5, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, HouseForSaleBookshelf
	bg_event  1,  1, BGEVENT_READ, HouseForSaleBookshelf

	db 1 ; object events
	object_event  2,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route5CleanseTagHouseGrannyScript, -1
