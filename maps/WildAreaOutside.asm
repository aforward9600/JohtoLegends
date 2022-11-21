	object_const_def ; object_event constants
	const WILDAREAOUTSIDE_RIVAL
	const WILDAREAOUTSIDE_GRAMPS
	const WILDAREAOUTSIDE_TWIN

WildAreaOutside_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_WILD_AREA_OUTSIDE_RIVAL

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.DummyScene0:
	end

.DummyScene1:
	end

.Flypoint:
	setflag ENGINE_FLYPOINT_WILD_AREA
	return

RivalWalksUpLeft:
	special FadeOutMusic
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female1
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject, PLAYER, DOWN
	appear WILDAREAOUTSIDE_RIVAL
	playmusic MUSIC_DAHLIA_ENCOUNTER
	applymovement WILDAREAOUTSIDE_RIVAL, RivalMovesUp
	turnobject WILDAREAOUTSIDE_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext HeyRivalText
	waitbutton
	closetext
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar1
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_RIVAL
	loadtrainer RIVAL3, RIVAL3_C_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious1

.Larvitar1:
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_RIVAL
	loadtrainer RIVAL3, RIVAL3_C_DRATINI
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious1

.AfterVictorious1:
	playmusic MUSIC_DAHLIA_AFTER_BATTLE
	opentext
	writetext YouWonOnceAgainText
	buttonsound
	verbosegiveitem PIDGEOT_CALL
	setevent EVENT_GOT_PIDGEOT_CALL
	writetext PidgeotCallText
	waitbutton
	closetext
	opentext
	writetext ByTheWayText
	waitbutton
	closetext
	turnobject WILDAREAOUTSIDE_RIVAL, UP
	turnobject PLAYER, UP
	opentext
	writetext ThisIsTheWildAreaText
	waitbutton
	closetext
	applymovement WILDAREAOUTSIDE_RIVAL, RivalLeavesWildAreaMovement
	playsound SFX_EXIT_BUILDING
	disappear WILDAREAOUTSIDE_RIVAL
	setevent EVENT_WILD_AREA_RIVAL_BEAT
	clearevent EVENT_OLIVINE_GYM_JASMINE
	setevent EVENT_CIANWOOD_GYM_RIVAL1
	setscene SCENE_DEFAULT
	special FadeOutMusic
	pause 10
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

.Female1:
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject, PLAYER, DOWN
	appear WILDAREAOUTSIDE_RIVAL
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement WILDAREAOUTSIDE_RIVAL, RivalMovesUp
	turnobject WILDAREAOUTSIDE_RIVAL, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext HeyRivalText
	waitbutton
	closetext
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar2
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_RIVAL
	loadtrainer RIVAL4, RIVAL4_C_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious2

.Larvitar2:
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_RIVAL
	loadtrainer RIVAL4, RIVAL4_C_DRATINI
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious2

.AfterVictorious2:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext YouWonOnceAgainText
	buttonsound
	verbosegiveitem PIDGEOT_CALL
	setevent EVENT_GOT_PIDGEOT_CALL
	writetext PidgeotCallText
	waitbutton
	closetext
	opentext
	writetext ByTheWayText
	waitbutton
	closetext
	turnobject WILDAREAOUTSIDE_RIVAL, UP
	turnobject PLAYER, UP
	opentext
	writetext ThisIsTheWildAreaText
	waitbutton
	closetext
	applymovement WILDAREAOUTSIDE_RIVAL, RivalLeavesWildAreaMovement
	playsound SFX_EXIT_BUILDING
	disappear WILDAREAOUTSIDE_RIVAL
	setevent EVENT_WILD_AREA_RIVAL_BEAT
	clearevent EVENT_OLIVINE_GYM_JASMINE
	setevent EVENT_CIANWOOD_GYM_RIVAL1
	setscene SCENE_DEFAULT
	special FadeOutMusic
	pause 10
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

RivalWalksUpRight:
	special FadeOutMusic
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female2
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject, PLAYER, DOWN
	moveobject WILDAREAOUTSIDE_RIVAL, 9, 12
	appear WILDAREAOUTSIDE_RIVAL
	playmusic MUSIC_DAHLIA_ENCOUNTER
	applymovement WILDAREAOUTSIDE_RIVAL, RivalMovesUp
	turnobject WILDAREAOUTSIDE_RIVAL, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext HeyRivalText
	waitbutton
	closetext
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar3
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_RIVAL
	loadtrainer RIVAL3, RIVAL3_C_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious3

.Larvitar3:
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_RIVAL
	loadtrainer RIVAL3, RIVAL3_C_DRATINI
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious3

.AfterVictorious3:
	playmusic MUSIC_DAHLIA_AFTER_BATTLE
	opentext
	writetext YouWonOnceAgainText
	buttonsound
	verbosegiveitem PIDGEOT_CALL
	setevent EVENT_GOT_PIDGEOT_CALL
	writetext PidgeotCallText
	waitbutton
	closetext
	opentext
	writetext ByTheWayText
	waitbutton
	closetext
	turnobject WILDAREAOUTSIDE_RIVAL, UP
	turnobject PLAYER, UP
	opentext
	writetext ThisIsTheWildAreaText
	waitbutton
	closetext
	applymovement WILDAREAOUTSIDE_RIVAL, RivalLeavesWildAreaMovement
	playsound SFX_EXIT_BUILDING
	disappear WILDAREAOUTSIDE_RIVAL
	setevent EVENT_WILD_AREA_RIVAL_BEAT
	clearevent EVENT_OLIVINE_GYM_JASMINE
	setevent EVENT_CIANWOOD_GYM_RIVAL1
	setscene SCENE_DEFAULT
	special FadeOutMusic
	pause 10
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

.Female2:
	turnobject, PLAYER, DOWN
	moveobject WILDAREAOUTSIDE_RIVAL, 9, 12
	appear WILDAREAOUTSIDE_RIVAL
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement WILDAREAOUTSIDE_RIVAL, RivalMovesUp
	turnobject WILDAREAOUTSIDE_RIVAL, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext HeyRivalText
	waitbutton
	closetext
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar4
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_RIVAL
	loadtrainer RIVAL4, RIVAL4_C_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious4

.Larvitar4:
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_RIVAL
	loadtrainer RIVAL4, RIVAL4_C_DRATINI
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious4

.AfterVictorious4:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext YouWonOnceAgainText
	buttonsound
	verbosegiveitem PIDGEOT_CALL
	setevent EVENT_GOT_PIDGEOT_CALL
	writetext PidgeotCallText
	waitbutton
	closetext
	opentext
	writetext ByTheWayText
	waitbutton
	closetext
	turnobject WILDAREAOUTSIDE_RIVAL, UP
	turnobject PLAYER, UP
	opentext
	writetext ThisIsTheWildAreaText
	waitbutton
	closetext
	applymovement WILDAREAOUTSIDE_RIVAL, RivalLeavesWildAreaMovement
	playsound SFX_EXIT_BUILDING
	disappear WILDAREAOUTSIDE_RIVAL
	setevent EVENT_WILD_AREA_RIVAL_BEAT
	clearevent EVENT_OLIVINE_GYM_JASMINE
	setevent EVENT_CIANWOOD_GYM_RIVAL1
	setscene SCENE_DEFAULT
	special FadeOutMusic
	pause 10
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

WildAreaOutsideOldManScript:
	jumptextfaceplayer WildAreaOutsideOldManText

WildAreaOutsideTwinScript:
	jumptextfaceplayer WildAreaOutsideTwinText

RivalMovesUp:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

RivalLeavesWildAreaMovement:
	step UP
	step_end

WildAreaOutsideSign:
	jumptext WildAreaOutsideSignText

HeyRivalText:
	text "Hey <PLAYER>, you"
	line "made it!"

	para "Let's have a"
	line "battle to celebr-"
	cont "ate our victory"
	cont "at the Gym!"
	done

RivalWildAreaWinText:
	text "Lost again, huh?"
	done

RivalWildAreaLossText:
	text "We keep ending up"
	line "in this position!"
	done

YouWonOnceAgainText:
	text "Well, you won once"
	line "again. I need to"
	cont "work on my skills."

	para "Here, have this as"
	line "a gift for your"
	cont "win."
	done

PidgeotCallText:
	text "That's a Pidgeot"
	line "Call. You can sum-"
	cont "mon a Pidgeot to"
	cont "fly you to any"
	cont "location you've"
	cont "already been to."

	para "I have an extra,"
	line "so I don't mind"
	cont "giving you one."
	done

ByTheWayText:
	text "Oh, by the way,"
	line "the other reason"
	cont "I asked you to"
	cont "come here is this."
	done

ThisIsTheWildAreaText:
	text "This is the Wild"
	line "Area."

	para "It has a lot of"
	line "wild #mon here,"
	cont "and they're all"
	cont "free to catch."

	para "I'm going to spend"
	line "some time here to"
	cont "fill out my team."

	para "See you later!"
	done

WildAreaOutsideOldManText:
	text "Back in my day,"
	line "those buildings"
	cont "weren't there."

	para "We had to endure"
	line "the walk from"
	cont "Cianwood, through"
	cont "the dangerous"
	cont "caves, all without"
	cont "healing!"

	para "Even worse, if you"
	line "came here without"
	cont "any #balls, you"
	cont "were out of luck!"
	done

WildAreaOutsideTwinText:
	text "Yay!"

	para "So many #mon!"
	done

WildAreaOutsideSignText:
	text "Wild Area"

	para "Catch #mon to"
	line "your heart's"
	cont "content!"
	done

WildAreaOutside_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 17, WILD_AREA_POKECENTER, 1
	warp_event 13, 17, WILD_AREA_MART, 1
	warp_event  9,  6, WILD_AREA_1, 1
	warp_event 10,  6, WILD_AREA_1, 2

	db 2 ; coord events
	coord_event  9,  7, SCENE_WILD_AREA_RIVAL, RivalWalksUpLeft
	coord_event 10,  7, SCENE_WILD_AREA_RIVAL, RivalWalksUpRight

	db 1 ; bg events
	bg_event  8,  8, BGEVENT_READ, WildAreaOutsideSign

	db 3 ; object events
	object_event 10, 12, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_WILD_AREA_OUTSIDE_RIVAL1
	object_event  4, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildAreaOutsideOldManScript, -1
	object_event 13, 11, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WildAreaOutsideTwinScript, -1
