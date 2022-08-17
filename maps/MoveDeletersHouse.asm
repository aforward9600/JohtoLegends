	object_const_def ; object_event constants
	const MOVEDELETERSHOUSE_SUPER_NERD

MoveDeletersHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MoveDeleter:
	checkevent EVENT_GOT_A_POKEMON_FROM_MASTER
	iftrue .MoveDeletionScript
	jumptextfaceplayer MoveDeleterNoMonText

.MoveDeletionScript:
	faceplayer
	opentext
	special MoveDeletion
	waitbutton
	closetext
	end

MoveDeletersHouseBookshelf:
	jumpstd difficultbookshelf

MoveDeleterTelevision:
	jumpstd televisionscript

MoveDeleterNoMonText:
	text "Um… Oh, yes, I'm"
	line "the Move Deleter."

	para "I can make #mon"
	line "forget moves."

	para "Shall I make a"
	line "#mon forget?"

	para "....Hey!"

	para "You don't even"
	line "have a #mon!"
	done

MoveDeletersHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, BLACKTHORN_CITY, 6
	warp_event  3,  7, BLACKTHORN_CITY, 6

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, MoveDeletersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MoveDeletersHouseBookshelf
	bg_event  2,  1, BGEVENT_READ, MoveDeleterTelevision

	db 1 ; object events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveDeleter, -1
