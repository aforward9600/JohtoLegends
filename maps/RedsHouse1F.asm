	object_const_def ; object_event constants
	const REDSHOUSE1F_REDS_MOM

RedsHouse1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

RedsMom:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .MetAlready
	writetext RedsMomText1
	waitbutton
	closetext
	end
.MetAlready:
	writetext RedsMomText2
	waitbutton
	closetext
	end

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FBookshelf:
	jumpstd picturebookshelf

RedsMomText1:
	text "Hi…"

	para "My boyfriend is"
	line "travelling right"
	cont "now out of the"
	cont "region…"

	para "What if he tries"
	line "to come back and"
	cont "he can't?"

	para "Ohhh…"
	done

RedsMomText2:
	text "I just got a"
	line "letter!"

	para "My boyfriend will"
	line "be home soon, and"
	cont "just in time for"
	cont "the embargo to"
	cont "lift!"

	para "Yes!"

	para "Maybe now he'll be"
	line "ready to start a"
	cont "family…"
	done

RedsHouse1FTVText:
	text "In other news…"

	para "Our studio will run"
	line "out of funds at"
	cont "this rate."

	para "We can only hope"
	line "for a miracle…"
	done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, PALLET_TOWN, 1
	warp_event  3,  7, PALLET_TOWN, 1
	warp_event  7,  0, REDS_HOUSE_2F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  1,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  2,  1, BGEVENT_READ, RedsHouse1FTV

	db 1 ; object events
	object_event  5,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1
