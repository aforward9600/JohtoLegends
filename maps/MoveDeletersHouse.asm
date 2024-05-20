	object_const_def ; object_event constants
	const MOVEDELETERSHOUSE_SUPER_NERD
	const MOVEDELETERSHOUSE_LASS

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

MaxDVsSetter:
	faceplayer
	opentext
	checkevent EVENT_PASSWORD_CHEATER
	iftrue .SetDVs
	writetext StrongestPasswordText
	waitbutton
	closetext
	end

.SetDVs:
	checkflag ENGINE_ACTIVATED_MAX_DVS
	iftrue .UnsetDVs
	writetext SetDVSText
	waitbutton
	closetext
	setflag ENGINE_ACTIVATED_MAX_DVS
	end

.UnsetDVs:
	writetext UnsetDVsText
	waitbutton
	closetext
	clearflag ENGINE_ACTIVATED_MAX_DVS
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

SetDVSText:
	text "You will now"
	line "encounter strong"
	cont "#mon."
	done

UnsetDVsText:
	text "The strong #mon"
	line "will be rare"
	cont "again."
	done

StrongestPasswordText:
	text "Apparently, if you"
	line "speak a certain"
	cont "word before your"
	cont "journey begins,"

	para "you will encounter"
	line "strong #mon."

	para "I don't know what"
	line "that word is, but"
	cont "maybe you will"
	cont "come across it in"
	cont "the future."
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

	db 2 ; object events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveDeleter, -1
	object_event  5,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MaxDVsSetter, -1
