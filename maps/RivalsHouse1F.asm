	object_const_def ; object_event constants
	const RIVALSHOUSE1F_DAD
	const RIVALSHOUSE1F_MOM

RivalsHouse1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalsDadScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_RIVALS_HOUSE_RIVAL
	iftrue .RivalIsGone
	checkevent EVENT_RIVALS_HOUSE_RIVAL
	iffalse .WhatHappenedToRival
	writetext RivalsDadText
	waitbutton
	closetext
	end

.RivalIsGone:
	writetext RivalIsGoneText
	waitbutton
	closetext
	end

.WhatHappenedToRival:
	writetext WhatHappenedToRivalText
	waitbutton
	closetext
	end

RivalsMomScript:
	faceplayer
	opentext
	checkevent EVENT_ICE_PATH_B1F_RIVAL1
	iftrue .KeepAnEyeOnThem
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	faceplayer
	opentext
	writetext RivalsMom1Text
	waitbutton
	closetext
	end

.Female:
	writetext RivalsMom2Text
	waitbutton
	closetext
	end

.KeepAnEyeOnThem:
	checkevent EVENT_RIVALS_HOUSE_RIVAL
	iffalse .HopeTheyreOk
	writetext KeepAnEyeOnThemText
	waitbutton
	closetext
	end

.HopeTheyreOk:
	writetext HopeTheyreOkText
	waitbutton
	closetext
	end

RivalsHouseBookshelf:
	jumpstd magazinebookshelf

RivalsDadText:
	text "My kid's finally"
	line "going on a"
	cont "#mon journey!"

	para "Oh, it's enough"
	line "to bring a tear"

	para "to my eye!"

	para "Sniff..."
	done

RivalsMom1Text:
	text "Hi, <PLAYER>!"

	para "<RIVAL> has already"
	line "left. She should"
	cont "be in Ice Path by"
	cont "now."

	para "Have fun!"
	done

RivalsMom2Text:
	text "Hi, <PLAYER>!"

	para "<RIVAL> has already"
	line "left. He should"
	cont "be in Ice Path by"
	cont "now."

	para "Have fun!"
	done

WhatHappenedToRivalText:
	text "<RIVAL> just came"
	line "home and looks"
	cont "pretty upset."

	para "What happened out"
	line "there?"
	done

RivalIsGoneText:
	text "And just like"
	line "that, <RIVAL>"
	cont "is gone again."

	para "You kids sure"
	line "have a lot more"
	cont "energy than me!"
	done

KeepAnEyeOnThemText:
	text "Keep an eye on my"
	line "<RIVAL> for me,"
	cont "alright?"
	done

HopeTheyreOkText:
	text "<RIVAL> is"
	line "upstairs, and"
	cont "didn't seem"
	cont "happy."

	para "I hope nothing"
	line "serious has"
	cont "happened."
	done

RivalsHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, BLACKTHORN_CITY, 3
	warp_event  3,  7, BLACKTHORN_CITY, 3
	warp_event  6,  0, RIVALS_HOUSE_2F, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, RivalsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, RivalsHouseBookshelf

	db 2 ; object events
	object_event  5,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RivalsDadScript, -1
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RivalsMomScript, EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
