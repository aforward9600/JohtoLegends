	object_const_def ; object_event constants
	const DARKCAVEBLACKTHORNENTRANCE_OFFICER
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL1
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL2
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL3

DarkCaveBlackthornEntrance_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearHideoutEntrace

.ClearHideoutEntrace:
	checkevent EVENT_OPEN_DARK_CAVE_HIDEOUT
	iftrue, .Done
	changeblock 6, 0, $0d ; wall
.Done:
	return

DarkCaveBlackthornEntranceOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_OPEN_DARK_CAVE_HIDEOUT
	iftrue .OfficerLeaves
	writetext DarkCaveBlackthornEntranceOfficerText
	waitbutton
	closetext
	end

.OfficerLeaves:
	writetext IllGoSeeTheChiefText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .OfficerLeaves1
	applymovement DARKCAVEBLACKTHORNENTRANCE_OFFICER, OfficerLeavesMovement1
	disappear DARKCAVEBLACKTHORNENTRANCE_OFFICER
	end

.OfficerLeaves1:
	applymovement DARKCAVEBLACKTHORNENTRANCE_OFFICER, OfficerLeavesMovement2
	disappear DARKCAVEBLACKTHORNENTRANCE_OFFICER
	end

DarkCaveBlackthornEntranceRevive:
	itemball REVIVE

DarkCaveBlackthornEntranceTMSnore:
	itemball AWAKENING

DarkCaveBlackthornEntranceBlackGlasses:
	itemball BLACKGLASSES

OfficerLeavesMovement1:
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

OfficerLeavesMovement2:
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

DarkCaveBlackthornEntranceOfficerText:
	text "Hm…"

	para "I thought I saw"
	line "one of those men"
	cont "in black come"
	cont "through here…"

	para "Must be my"
	line "imagination…"
	done

IllGoSeeTheChiefText:
	text "I was right!"

	para "I thought there"
	line "was something"
	cont "fishy here!"

	para "This wall just"
	line "collapsed when I"
	cont "knocked on it!"

	para "Someone else just"
	line "barged through"
	cont "before I could"
	cont "investigate!"

	para "…What's that?"

	para "Your friend came"
	line "through here?"

	para "Then it was"
	line "probably them."

	para "You better go and"
	line "help them."

	para "I'll go and get"
	line "the Chief!"

	para "He'll be able to"
	line "handle this!"
	done

DarkCaveBlackthornEntrance_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 27,  3, DARK_CAVE_NEW_ENTRANCE, 2
	warp_event  3, 25, DARK_CAVE_VIOLET_ENTRANCE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  7,  2, SPRITE_OFFICER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveBlackthornEntranceOfficerScript, -1
	object_event 21, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceRevive, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_REVIVE
	object_event  7, 22, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceTMSnore, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_TM_SNORE
	object_event 11, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceBlackGlasses, EVENT_GOT_BLACKGLASSES_IN_DARK_CAVE
