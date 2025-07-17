	object_const_def ; object_event constants
	const LAKEOFRAGEHIDDENPOWERHOUSE_FISHER

LakeOfRageHiddenPowerHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

HiddenPowerGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM10_HIDDEN_POWER
	iftrue .AlreadyGotItem
	writetext HiddenPowerGuyText1
	buttonsound
	verbosegiveitem TM_HIDDEN_POWER
	setevent EVENT_GOT_TM10_HIDDEN_POWER
	writetext HiddenPowerGuyText2
	waitbutton
	sjump .CheckHiddenPower
.AlreadyGotItem:
	writetext HiddenPowerGuyText3
	waitbutton
.CheckHiddenPower:
	special HiddenPowerGuru
.Done:
	waitbutton
	closetext
	end

HiddenPowerHouseBookshelf:
	jumpstd genericsink

HiddenPowerGuyText1:
	text "…You have strayed"
	line "far…"

	para "Here I have medi-"
	line "tated. Inside me,"

	para "a new power has"
	line "been awakened."

	para "Let me share my"
	line "power with your"
	cont "#mon."

	para "Take this, child."
	done

HiddenPowerGuyText2:
	text "Do you see it? It"
	line "is Hidden Power!"

	para "It draws out the"
	line "power of #mon"
	cont "for attacking."

	para "Remember this: its"
	line "type depends on"
	cont "the #mon using"
	cont "it."
	done

HiddenPowerGuyText3:
	text "I am meditating…"
	done

LakeOfRageHiddenPowerHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, LAKE_OF_RAGE, 1
	warp_event  5,  7, LAKE_OF_RAGE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, HiddenPowerHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HiddenPowerHouseBookshelf
	bg_event  4,  1, BGEVENT_READ, LakeOfRageTelevision

	db 1 ; object events
	object_event  3,  3, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HiddenPowerGuy, -1
