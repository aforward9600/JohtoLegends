	object_const_def ; object_event constants
	const MAHOGANYREDGYARADOSSPEECHHOUSE_BLACK_BELT
	const MAHOGANYREDGYARADOSSPEECHHOUSE_TEACHER
	const MAHOGANYREDGYARADOSSPEECHHOUSE_HERACROSS

MahoganyRedGyaradosSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyRedGyaradosSpeechHouseBlackBeltScript:
	jumptextfaceplayer MahoganyRedGyaradosSpeechHouseBlackBeltText

MahoganyRedGyaradosSpeechHouseTeacherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SNUBBULLCALL
	iftrue .AlreadyGotSnubbullCall
	writetext SnubbullCallIntroText
	buttonsound
	verbosegiveitem SNUBBULLCALL
	iffalse .BagFull
	setevent EVENT_GOT_SNUBBULLCALL
.AlreadyGotSnubbullCall:
	writetext SnubbullCallDoneText
	waitbutton
.BagFull:
	closetext
	end

MahoganyRedGyaradosSpeechHouseHeracrossScript:
	refreshscreen
	pokepic HERACROSS
	cry HERACROSS
	waitbutton
	closepokepic
	opentext
	writetext MahoganyRedGyaradosSpeechHouseHeracrossText
	waitbutton
	closetext
	end

MahoganyRedGyaradosSpeechHouseUnusedBookshelf1:
; unused
	jumpstd picturebookshelf

MahoganyRedGyaradosSpeechHouseUnusedBookshelf2:
; unused
	jumpstd magazinebookshelf

MahoganyTelevision:
	jumpstd televisionscript

MahoganyRedGyaradosSpeechHouseBlackBeltText:
	text "A Heracross once"
	line "fell on my head"
	cont "after I used a"

	para "Snubbull Call."

	para "Now it's my best"
	line "friend."
	done

SnubbullCallIntroText:
	text "Some #mon can"
	line "only be found in"
	cont "trees."

	para "How can you get"
	line "them out? Easy!"

	para "Just one blow on"
	line "this call will"
	cont "summon a Snubbull"

	para "to you. They'll"
	line "headbutt trees and"
	cont "knock them to the"
	cont "ground."
	done

SnubbullCallDoneText:
	text "Go out and enjoy"
	line "using Snubbulls"
	cont "to catch more"
	cont "#mon!"
	done

MahoganyRedGyaradosSpeechHouseTeacherText_RocketsInRadioTower:
	text "I've been hearing"
	line "laughter on the"

	para "radio…"
	line "It's creepy."
	done

MahoganyRedGyaradosSpeechHouseHeracrossText:
	text "Heracross: Cross!"
	done

MahoganyRedGyaradosSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, MAHOGANY_TOWN, 2
	warp_event  3,  7, MAHOGANY_TOWN, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, MahoganyTelevision

	db 3 ; object events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyRedGyaradosSpeechHouseBlackBeltScript, -1
	object_event  6,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyRedGyaradosSpeechHouseTeacherScript, -1
	object_event  1,  3, SPRITE_HERACROSS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, MahoganyRedGyaradosSpeechHouseHeracrossScript, -1
	