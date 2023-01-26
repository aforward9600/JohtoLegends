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
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .RivalsHouseDraco
	checkevent EVENT_GOT_DRATINI_FROM_MASTER
	iftrue .RivalsHouseDahliaDratini
	winlosstext, RivalsHouseDefeatedText, RivalsHouseLastMonText
	setlasttalked RIVALSHOUSE2F_RIVAL
	loadtrainer DEPRESSED_DAHLIA, DAHLIA_DRATINI_2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .RivalsHouseVictorious1

.RivalsHouseDahliaDratini:
	winlosstext, RivalsHouseDefeatedText, RivalsHouseLastMonText
	setlasttalked RIVALSHOUSE2F_RIVAL
	loadtrainer DEPRESSED_DAHLIA, DAHLIA_LARVITAR_2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .RivalsHouseVictorious1

.RivalsHouseDraco:
	checkevent EVENT_GOT_DRATINI_FROM_MASTER
	iftrue .RivalsHouseDracoDratini
	winlosstext, RivalsHouseDefeatedText, RivalsHouseLastMonText
	setlasttalked RIVALSHOUSE2F_RIVAL
	loadtrainer DEPRESSED_DRACO, DRACO_DRATINI_2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .RivalsHouseVictorious1

.RivalsHouseDracoDratini:
	winlosstext, RivalsHouseDefeatedText, RivalsHouseLastMonText
	setlasttalked RIVALSHOUSE2F_RIVAL
	loadtrainer DEPRESSED_DRACO, DRACO_LARVITAR_2
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
.RivalsHouseVictorious1:
	playmusic MUSIC_UNWAVERING_HEART
	pause 15
	opentext
	writetext IKnowWhatINeedToDoText
	waitbutton
	closetext
	pause 30
	readvar VAR_FACING
	ifequal LEFT, .RivalLeavesHouse
	applymovement RIVALSHOUSE2F_RIVAL, RivalLeavesHouseMovement1
	sjump .RivalIsGone

.RivalLeavesHouse:
	applymovement RIVALSHOUSE2F_RIVAL, RivalLeavesHouseMovement2
.RivalIsGone:
	playsound SFX_EXIT_BUILDING
	disappear RIVALSHOUSE2F_RIVAL
	setevent EVENT_OPEN_DARK_CAVE_HIDEOUT
	setevent EVENT_BEAT_RIVALS_HOUSE_RIVAL
	setevent EVENT_HIDEOUT_RAIKOU
	setevent EVENT_HOOH_LUGIA_ROOM_RIVAL1
	setevent EVENT_HOOH_LUGIA_ROOM_RIVAL2
	setevent EVENT_HOOH_LUGIA_ROOM_RIVAL3
	setevent EVENT_HOOH_LUGIA_ROOM_OFFICER
	waitsfx
	playmapmusic
	end

RivalsHouse2FBookshelf:
	jumpstd magazinebookshelf

PikachuPoster:
	jumptext PikachuPosterText

RivalLeavesHouseMovement1:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step_end

RivalLeavesHouseMovement2:
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

RivalsHouseDefeatedText:
	text "………Thanks <PLAYER>…"

	para "I think I know"
	line "what to do…"
	done

RivalsHouseLastMonText:
	text "……This again, huh?"
	done

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

IKnowWhatINeedToDoText:
	text "…Thanks again."

	para "…Ever since Bell"
	line "Tower, I can't stop"
	cont "thinking about"
	cont "those #mon…"

	para "I've made a"
	line "decision."

	para "I'm going after"
	line "them."

	para "I'll rescue those"
	line "#mon, and I"
	cont "need your help…"

	para "I think I know"
	line "where they are…"

	para "Dark Cave."

	para "It's the perfect"
	line "spot for them."
	
	para "It's been blocked"
	line "off for months"
	cont "now, and not too"
	cont "many people go"
	cont "in there."

	para "I have a good"
	line "feeling about"
	cont "this…"

	para "I'm going on"
	line "ahead…"

	para "…See you there…"
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
