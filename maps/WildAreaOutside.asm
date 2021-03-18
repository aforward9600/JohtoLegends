	object_const_def ; object_event constants
	const WILDAREAOUTSIDE_KRIS ; if male
	const WILDAREAOUTSIDE_CHRIS ; if female

WildAreaOutside_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_WILD_AREA_OUTSIDE_RIVAL

	db 0 ; callbacks
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
	appear WILDAREAOUTSIDE_KRIS
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement WILDAREAOUTSIDE_KRIS, RivalMovesUp
	turnobject WILDAREAOUTSIDE_KRIS, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext HeyRivalText
	waitbutton
	closetext
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar1
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_KRIS
	loadtrainer RIVAL3, RIVAL3_C_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious1

.Larvitar1:
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_KRIS
	loadtrainer RIVAL3, RIVAL3_C_DRATINI
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious1

.AfterVictorious1:
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
	turnobject WILDAREAOUTSIDE_KRIS, UP
	turnobject PLAYER, UP
	opentext
	writetext ThisIsTheWildAreaText
	waitbutton
	closetext
	applymovement WILDAREAOUTSIDE_KRIS, RivalLeavesWildAreaMovement
	playsound SFX_EXIT_BUILDING
	disappear WILDAREAOUTSIDE_KRIS
	setevent EVENT_WILD_AREA_RIVAL_BEAT
	clearevent EVENT_OLIVINE_GYM_JASMINE
	special FadeOutMusic
	pause 10
	special RestartMapMusic
	waitsfx
	end

.Female1:
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject, PLAYER, DOWN
	appear WILDAREAOUTSIDE_CHRIS
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement WILDAREAOUTSIDE_CHRIS, RivalMovesUp
	turnobject WILDAREAOUTSIDE_CHRIS, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext HeyRivalText
	waitbutton
	closetext
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar2
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_CHRIS
	loadtrainer RIVAL4, RIVAL4_C_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious2

.Larvitar2:
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_CHRIS
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
	turnobject WILDAREAOUTSIDE_CHRIS, UP
	turnobject PLAYER, UP
	opentext
	writetext ThisIsTheWildAreaText
	waitbutton
	closetext
	applymovement WILDAREAOUTSIDE_CHRIS, RivalLeavesMovement
	playsound SFX_EXIT_BUILDING
	disappear WILDAREAOUTSIDE_CHRIS
	setevent EVENT_WILD_AREA_RIVAL_BEAT
	clearevent EVENT_OLIVINE_GYM_JASMINE
	special FadeOutMusic
	pause 10
	special RestartMapMusic
	waitsfx
	end

RivalWalksUpRight:
	special FadeOutMusic
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female2
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject, PLAYER, DOWN
	moveobject WILDAREAOUTSIDE_KRIS, 8, 11
	appear WILDAREAOUTSIDE_KRIS
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement WILDAREAOUTSIDE_KRIS, RivalMovesUp
	turnobject WILDAREAOUTSIDE_KRIS, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext HeyRivalText
	waitbutton
	closetext
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar3
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_KRIS
	loadtrainer RIVAL3, RIVAL3_C_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious3

.Larvitar3:
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_KRIS
	loadtrainer RIVAL3, RIVAL3_C_DRATINI
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious3

.AfterVictorious3:
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
	turnobject WILDAREAOUTSIDE_KRIS, UP
	turnobject PLAYER, UP
	opentext
	writetext ThisIsTheWildAreaText
	waitbutton
	closetext
	applymovement WILDAREAOUTSIDE_KRIS, RivalLeavesMovement
	playsound SFX_EXIT_BUILDING
	disappear WILDAREAOUTSIDE_KRIS
	setevent EVENT_WILD_AREA_RIVAL_BEAT
	clearevent EVENT_OLIVINE_GYM_JASMINE
	special FadeOutMusic
	pause 10
	special RestartMapMusic
	waitsfx
	end

.Female2:
	turnobject, PLAYER, DOWN
	moveobject WILDAREAOUTSIDE_CHRIS, 8, 11
	appear WILDAREAOUTSIDE_CHRIS
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_RIVAL_ENCOUNTER
	applymovement WILDAREAOUTSIDE_CHRIS, RivalMovesUp
	turnobject WILDAREAOUTSIDE_CHRIS, RIGHT
	turnobject PLAYER, LEFT
	opentext
	writetext HeyRivalText
	waitbutton
	closetext
	checkevent EVENT_GOT_LARVITAR_FROM_MASTER
	iftrue .Larvitar4
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_CHRIS
	loadtrainer RIVAL4, RIVAL4_C_LARVITAR
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterVictorious4

.Larvitar4:
	winlosstext RivalWildAreaWinText, RivalWildAreaLossText
	setlasttalked WILDAREAOUTSIDE_CHRIS
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
	turnobject WILDAREAOUTSIDE_CHRIS, UP
	turnobject PLAYER, UP
	opentext
	writetext ThisIsTheWildAreaText
	waitbutton
	closetext
	applymovement WILDAREAOUTSIDE_CHRIS, RivalLeavesWildAreaMovement
	playsound SFX_EXIT_BUILDING
	disappear WILDAREAOUTSIDE_CHRIS
	setevent EVENT_WILD_AREA_RIVAL_BEAT
	clearevent EVENT_OLIVINE_GYM_JASMINE
	special FadeOutMusic
	pause 10
	special RestartMapMusic
	waitsfx
	end

RivalMovesUp:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

RivalLeavesWildAreaMovement:
	step UP
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
	text "Hey, I won this"
	line "time!"
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

WildAreaOutsideSignText:
	text "Wild Area"

	para "Catch #mon to"
	line "your heart's"
	cont "content!"
	done

WildAreaOutside_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5, 15, WILD_AREA_POKECENTER, 1

	db 2 ; coord events
	coord_event  8,  6, SCENE_WILD_AREA_RIVAL, RivalWalksUpLeft
	coord_event  9,  6, SCENE_WILD_AREA_RIVAL, RivalWalksUpRight

	db 1 ; bg events
	bg_event  7,  6, BGEVENT_READ, WildAreaOutsideSign

	db 2 ; object events
	object_event  9,  11, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_WILD_AREA_OUTSIDE_RIVAL1
	object_event  9,  11, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_WILD_AREA_OUTSIDE_RIVAL2
