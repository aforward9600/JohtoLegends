	object_const_def ; object_event constants
	const RIVALSHOUSE1F_DAD
	const RIVALSHOUSE1F_MOM

RivalsHouse1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RivalsDadScript:
	faceplayer
	opentext
	writetext RivalsDadText
	verbosegiveitem LAPRAS_CALLB
	waitbutton
	closetext
	end

RivalsMomScript:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	faceplayer
	opentext
	writetext RivalsMom1Text
	waitbutton
	closetext
	end

.Female:
	faceplayer
	opentext
	writetext RivalsMom2Text
	waitbutton
	closetext
	end

RivalsHouseBookshelf:
	jumpstd magazinebookshelf

RivalsDadText:
	text "Yeah, I know, I"
	line "need to fix the"
	cont "sign out front."

	para "It's so faded, no"
	line "one knows we live"
	cont "here."

	para "A real problem"
	line "when the mailman"
	cont "comes."
	done

RivalsMom1Text:
	text "Hi, <PLAYER>!"

	para "Dahlia has already"
	line "left. She should"
	cont "be in Ice Path by"
	cont "now."

	para "Have fun!"
	done

RivalsMom2Text:
	text "Hi, <PLAYER>!"

	para "Draco has already"
	line "left. He should"
	cont "be in Ice Path by"
	cont "now."

	para "Have fun!"
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
