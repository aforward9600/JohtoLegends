	object_const_def ; object_event constants
	const RIVALSHOUSE2F_PIKACHU
	const RIVALSHOUSE2F_RIVAL

RivalsHouse2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .DisappearRival

.DisappearRival:
	checkevent EVENT_RIVAL_NEW_BARK_TOWN
	iffalse .RivalDisappears
	return

.RivalDisappears:
	disappear RIVALSHOUSE2F_RIVAL
	return

PikachuDoll:
	jumptext PikachuText

RivalsHouse2FRival:
	faceplayer
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .RivalsHouseBattle
	writetext RivalSilenceText
	waitbutton
	closetext
	end

.RivalsHouseBattle:
	writetext PleaseBattleMeText
	waitbutton
	closetext
	end

RivalsHouse2FBookshelf:
	jumpstd magazinebookshelf

PikachuPoster:
	jumptext PikachuPosterText

PikachuText:
	text "It's a Pikachu"
	line "doll! Cool!"
	done

PikachuPosterText:
	text "It's a poster of"
	line "a Pikachu!"
	done

RivalSilenceText:
	text "………………………………"
	done

PleaseBattleMeText:
	text "……………Please"
	line "battle me again…"

	para "I need to know"
	line "if I'm strong"
	cont "enough…"
	done

RivalsHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  0, RIVALS_HOUSE_1F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  1, BGEVENT_READ, RivalsHouse2FBookshelf
	bg_event  6,  0, BGEVENT_READ, PikachuPoster

	db 2 ; object events
	object_event  3,  1, SPRITE_PIKACHU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PikachuDoll, -1
	object_event  3,  3, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RivalsHouse2FRival, EVENT_RIVALS_HOUSE_RIVAL
