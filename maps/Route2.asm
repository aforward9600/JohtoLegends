	object_const_def ; object_event constants
	const ROUTE2_BIKER
	const ROUTE2_LASS
	const ROUTE2_COOLTRAINER_M
	const ROUTE2_POKE_BALL1
	const ROUTE2_POKE_BALL2
	const ROUTE2_FRUIT_TREE

Route2_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBikerBrandon:
	trainer BIKER, BIKER_BRANDON, EVENT_BEAT_BIKER_BRANDON, BikerBrandonSeenText, BikerBrandonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerBrandonAfterBattleText
	waitbutton
	closetext
	end

Route2LassScript:
	jumptextfaceplayer Route2LassText

TrainerCooltrainerMGary:
	trainer COOLTRAINERM, GARY, EVENT_BEAT_COOLTRAINERM_GARY, CooltrainerMGarySeenText, CooltrainerMGaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerMGaryAfterBattleText
	waitbutton
	closetext
	end

Route2Sign:
	jumptext Route2SignText

Route2DiglettsCaveSign:
	jumptext Route2DiglettsCaveSignText

Route2Carbos:
	itemball CARBOS

Route2Elixer:
	itemball ELIXER

Route2FruitTree:
	fruittree FRUITTREE_ROUTE_2

BikerBrandonSeenText:
	text "Beep beep!"

	para "Outta the way!"
	done

BikerBrandonBeatenText:
	text "I got run over…"
	done

BikerBrandonAfterBattleText:
	text "Ow!"

	para "I ran over my"
	line "foot!"
	done

CooltrainerMGarySeenText:
	text "My cousin in Johto"
	line "gave me a #mon"
	cont "before the embargo"
	cont "happened."
	done

CooltrainerMGaryBeatenText:
	text "Neat, huh?"
	done

CooltrainerMGaryAfterBattleText:
	text "Salamence is a"
	line "great #mon!"

	para "Ferocious and"
	line "cuddly!"
	done

Route2SignText:
	text "Route 2"

	para "Viridian City -"
	line "Pewter City"

	para "Viridian Forest"
	line "ahead."
	done

Route2DiglettsCaveSignText:
	text "Diglett's Cave"
	done

Route2LassText:
	text "In that house, a"
	line "guy will give you"
	cont "a Nugget."

	para "No idea why,"
	line "especially in this"
	cont "economy."

	para "And if he's just"
	line "giving them away,"
	cont "why doesn't he have"
	cont "a bigger house?"
	done

Route2_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 15, 15, ROUTE_2_NUGGET_HOUSE, 1
	warp_event 15, 31, ROUTE_2_GATE, 3
	warp_event 16, 27, ROUTE_2_GATE, 1
	warp_event 17, 27, ROUTE_2_GATE, 2
	warp_event 12,  7, DIGLETTS_CAVE, 3
	warp_event  4, 30, VIRIDIAN_FOREST, 1
	warp_event  5, 30, VIRIDIAN_FOREST, 2
	warp_event  2,  9, VIRIDIAN_FOREST, 3
	warp_event  3,  9, VIRIDIAN_FOREST, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  7, 51, BGEVENT_READ, Route2Sign
	bg_event 11,  9, BGEVENT_READ, Route2DiglettsCaveSign

	db 6 ; object events
	object_event  4, 43, SPRITE_BIKER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerBrandon, -1
	object_event 17, 10, SPRITE_LASS, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route2LassScript, -1
	object_event  4,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerMGary, -1
	object_event 19,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Carbos, EVENT_ROUTE_2_CARBOS
	object_event 16, 50, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route2Elixer, EVENT_ROUTE_2_ELIXER
	object_event 17, 42, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route2FruitTree, -1
