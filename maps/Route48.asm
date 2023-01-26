	object_const_def ; object_event constants
	const ROUTE48_FIREBREATHER
	const ROUTE48_POKE_BALL
	const ROUTE48_FRUITTREE

Route48_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFirebreatherFarrel:
	trainer FIREBREATHER, FARREL, EVENT_BEAT_FIREBREATHER_FARREL, FirebreatherFarrelSeenText, FirebreatherFarrelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherFarrelAfterBattleText
	waitbutton
	closetext
	end

Route48Nugget:
	itemball NUGGET

Route48FruitTree:
	fruittree FRUITTREE_ROUTE_48

Route48Sign:
	jumptext Route48SignText

FirebreatherFarrelSeenText:
	text "Wonder if there"
	line "are any Fire-"
	cont "Type #mon in"

	para "the Wild Area?"
	done

FirebreatherFarrelBeatenText:
	text "Hot, hot, hot!"
	done

FirebreatherFarrelAfterBattleText:
	text "It doesn't seem"
	line "like a good place"
	cont "for Fire-Types to"
	cont "roam freely."
	done

Route48SignText:
	text "Route 48"
	line "Route 47 -"
	cont "Wild Area"
	done

Route48_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event 29,  7, BGEVENT_READ, Route48Sign

	db 3 ; object events
	object_event 15,  6, SPRITE_FIREBREATHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherFarrel, -1
	object_event  6,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route48Nugget, EVENT_ROUTE_48_NUGGET
	object_event 28,  6, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route48FruitTree, -1
