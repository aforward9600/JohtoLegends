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
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .RedsHouse1FTV2
	jumptext RedsHouse1FTVText

.RedsHouse1FTV2:
	jumptext RedsHouse1FTVText2

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

	para "Our studio will"
	line "run out of funds"
	cont "at this rate."

	para "We can only hope"
	line "for a miracle…"
	done

RedsHouse1FTVText2:
	text "Breaking news!"

	para "The Federation boss"
	line "has been defeated!"

	para "There is no sight"
	line "of him!"

	para "He was taken down"
	line "by the current"
	cont "Champion and their"
	cont "friends!"

	para "The #mon League"
	line "has confirmed that"
	cont "they will accept"
	cont "Kanto back into"
	cont "League!"

	para "The embargo should"
	line "soon be over!"

	para "We will continue"
	line "to monitor the"
	cont "situation!"
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
