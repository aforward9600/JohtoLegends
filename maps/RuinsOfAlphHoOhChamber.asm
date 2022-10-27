	object_const_def
	const RUINSOFALPH_CYNTHIA

RuinsOfAlphHoOhChamber_MapScripts:
	db 2 ; scene scripts
	scene_script .CheckWall ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	special HoOhChamber
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .OpenWall
	end

.OpenWall:
	prioritysjump .WallOpenScript
	end

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $2e ; closed wall
.WallOpen:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse .FloorClosed
	return

.FloorClosed:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	return

.WallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30 ; open wall
	reloadmappart
	earthquake 50
	setscene SCENE_FINISHED
	closetext
	end

RuinsOfAlphHoOhChamberPuzzle:
	refreshscreen
	setval UNOWNPUZZLE_HO_OH
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_HO_OH_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_X_TO_Z
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, RuinsOfAlphHoOhChamberSkyfallTopMovement
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphCynthiaScript:
	playmusic MUSIC_CYNTHIA_ENCOUNTER
	faceplayer
	opentext
	writetext HowIsGibleDoingText
	yesorno
	iffalse .ShowMeLater
	special ReturnShuckle
	ifequal SHUCKIE_WRONG_MON, .wrong
	ifequal SHUCKIE_REFUSED, .nothappy
	ifequal SHUCKIE_HAPPY, .superhappy
	ifequal SHUCKIE_FAINTED, .nothappy
	; SHUCKIE_RETURNED
.nothappy
	writetext GibleIsNotHappyText
	waitbutton
	closetext
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

.ShowMeLater
	writetext ShowMeLaterText
	waitbutton
	closetext
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

.wrong
	writetext GibleIsNotHereText
	waitbutton
	closetext
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

.superhappy
	writetext GibleIsVeryHappyText
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RUINSOFALPH_CYNTHIA
	pause 15
	setevent EVENT_RUINS_OF_ALPH_CYNTHIA
	clearevent EVENT_CHERRYGROVE_CYNTHIA
	special FadeInQuickly
	pause 15
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

RuinsOfAlphHoOhChamberAncientReplica:
	jumptext RuinsOfAlphHoOhChamberAncientReplicaText

RuinsOfAlphHoOhChamberDescriptionSign:
	jumptext RuinsOfAlphHoOhChamberDescriptionText

RuinsOfAlphHoOhChamberWallPatternLeft:
	opentext
	writetext RuinsOfAlphHoOhChamberWallPatternLeftText
	setval UNOWNWORDS_HO_OH
	special DisplayUnownWords
	closetext
	end

RuinsOfAlphHoOhChamberWallPatternRight:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .WallOpen
	opentext
	writetext RuinsOfAlphHoOhChamberWallPatternRightText
	setval UNOWNWORDS_HO_OH
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	opentext
	writetext RuinsOfAlphHoOhChamberWallHoleText
	waitbutton
	closetext
	end

RuinsOfAlphHoOhChamberSkyfallTopMovement:
	skyfall_top
	step_end

RuinsOfAlphHoOhChamberWallPatternLeftText:
	text "Patterns appeared"
	line "on the walls…"
	done

RuinsOfAlphHoOhChamberUnownText:
; unused
	text "It's UNOWN text!"
	done

RuinsOfAlphHoOhChamberWallPatternRightText:
	text "Patterns appeared"
	line "on the walls…"
	done

RuinsOfAlphHoOhChamberWallHoleText:
	text "There's a big hole"
	line "in the wall!"
	done

RuinsOfAlphHoOhChamberAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "mon."
	done

RuinsOfAlphHoOhChamberDescriptionText:
	text "A #mon that"
	line "flew gracefully on"

	para "rainbow-colored"
	line "wings."
	done

HowIsGibleDoingText:
	text "Hello again,"
	line "<PLAYER>."

	para "I'm here studying"
	line "the Ruins of Alph."

	para "This place is"
	line "quite fascinating."

	para "There are similar"
	line "ruins in Solaceon"
	cont "Town near my home-"
	cont "town."

	para "On an unrelated"
	line "note,"

	para "How is the Gible"
	line "I gave to you?"

	para "Will you please"
	line "let me see?"
	done

GibleIsNotHappyText:
	text "………………"

	para "It seems Gible"
	line "is not very happy"
	cont "at the moment…"

	para "Please return"
	line "later when Gible"
	cont "is trusting of"
	cont "you…"
	done

GibleIsNotHereText:
	text "………………"

	para "You don't have"
	line "Gible with you…"

	para "Please return"
	line "later when you"
	cont "have Gible."
	done

CynthiaWouldLikeToBattleText:
	text "………………"

	para "I would like to"
	line "battle with you"
	cont "again, please."

	para "This will help me"
	line "to better"
	cont "understand you."
	done

CynthiaRuinsVictory:
	text "Looks like I was"
	line "right."
	done

CynthiaRuinsDefeat:
	text "Looks like I was"
	line "wrong."
	done

GibleIsVeryHappyText:
	text "………………"

	para "It seems I was"
	line "wise to give Gible"
	cont "to you."

	para "Gible is very"
	line "happy to be with"
	cont "a trainer like"
	cont "you."

	para "You may keep Gible"
	line "with you."

	para "I hope that it"
	line "continues to grow"
	cont "alongside the"
	cont "trainer it loves."

	para "Perhaps we will"
	line "meet again later."

	para "And when we do"
	line "meet again, I'd"
	cont "like to battle."

	para "Farewell…"
	done

ShowMeLaterText:
	text "I guess you are"
	line "not ready to show"
	cont "me how Gible is"
	cont "doing just yet…"

	para "Please return"
	line "later when you"
	cont "are ready."
	done

RuinsOfAlphHoOhChamber_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 1
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 1
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 2
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 3
	warp_event  4,  0, RUINS_OF_ALPH_HO_OH_ITEM_ROOM, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphHoOhChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphHoOhChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphHoOhChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphHoOhChamberDescriptionSign
	bg_event  3,  0, BGEVENT_UP, RuinsOfAlphHoOhChamberWallPatternLeft
	bg_event  4,  0, BGEVENT_UP, RuinsOfAlphHoOhChamberWallPatternRight

	db 1 ; object events
	object_event  2,  6, SPRITE_CYNTHIA, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphCynthiaScript, EVENT_RUINS_OF_ALPH_CYNTHIA
