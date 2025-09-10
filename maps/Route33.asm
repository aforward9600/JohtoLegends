	object_const_def ; object_event constants
	const ROUTE33_POKEFAN_M
	const ROUTE33_LASS
	const ROUTE33_FRUIT_TREE
	const ROUTE33_HIKER2

Route33_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route33LassScript:
	faceplayer
	opentext
	checkevent EVENT_UNION_CAVE_BLOCKER
	iftrue .HikerGone
	writetextend Route33LassText

.HikerGone:
	writetextend Route33TeacherText

TrainerHikerAnthony:
	trainer HIKER, ANTHONY1, EVENT_BEAT_HIKER_ANTHONY, HikerAnthony2SeenText, HikerAnthony2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetextend HikerAnthony2AfterText

Route33HikerScript:
	jumptextfaceplayer Route33HikerText

Route33Sign:
	jumptext Route33SignText

Route33FruitTree:
	fruittree FRUITTREE_ROUTE_33

HikerAnthony2SeenText:
	text "I wanna go through"
	line "the tunnel, but"

	para "a fellow Hiker is"
	line "blocking the path."

	para "Can you believe"
	line "that?!"
	done

HikerAnthony2BeatenText:
	text "Whoa! You've got"
	line "more zip than me!"
	done

HikerAnthony2AfterText:
	text "I never thought"
	line "I'd see the day"
	cont "a Hiker would stop"

	para "another Hiker from"
	line "hiking!"
	done

Route33LassText:
	text "Oh, that man!"

	para "I need to get to"
	line "Violet City, but"

	para "he won't let me"
	line "through!"

	para "How annoying…"
	done

Route33TeacherText:
	text "Oh, he's gone"
	line "now…"

	para "Guess I can get"
	line "to Violet City"
	cont "now."
	done

Route33HikerText:
	text "Hold it!"

	para "There's been a"
	line "lot of scary"
	cont "noises coming from"

	para "inside Union Cave!"

	para "It's probably a"
	line "monster!"

	para "Don't worry, we'll"
	line "get to the bottom"
	cont "of this!"
	done

Route33SignText:
	text "Route 33"
	done

Route33_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11,  9, UNION_CAVE_1F, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11, 11, BGEVENT_READ, Route33Sign

	db 4 ; object events
	object_event  6, 13, SPRITE_HIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerHikerAnthony, -1
	object_event  9, 15, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route33LassScript, -1
	object_event 14, 16, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route33FruitTree, -1
	object_event 11, 10, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route33HikerScript, EVENT_UNION_CAVE_BLOCKER
