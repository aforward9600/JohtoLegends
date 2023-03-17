NownPuzzleRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .CheckWall ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	checkevent EVENT_WALL_OPENED_IN_NOWN_PUZZLE_ROOM
	iftrue .OpenWall
	end

.OpenWall:
	prioritysjump .WallOpenScript
	end

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_WALL_OPENED_IN_NOWN_PUZZLE_ROOM
	iftrue .WallOpen
	changeblock 4, 0, $2e ; closed wall
.WallOpen:
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

NownPuzzleRoomPuzzle:
	checkevent EVENT_WALL_OPENED_IN_NOWN_PUZZLE_ROOM
	iftrue .PuzzleDone
	refreshscreen
	setval UNOWNPUZZLE_NOWN
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30 ; open wall
	reloadmappart
	earthquake 50
	setscene SCENE_FINISHED
	setevent EVENT_WALL_OPENED_IN_NOWN_PUZZLE_ROOM
	closetext
	end

.PuzzleDone:
	opentext
	writetext PuzzleDoneText
	waitbutton
	closetext
	end

NownPuzzleRoomAncientReplica:
	jumptext NownPuzzleRoomAncientReplicaText

NownPuzzleRoomDescriptionSign:
	jumptext NownPuzzleRoomDescriptionText

NownPuzzleRoomWallPatternLeft:
	opentext
	writetext NownPuzzleRoomWallPatternLeftText
	setval UNOWNWORDS_DO_NOT
	special DisplayUnownWords
	setval UNOWNWORDS_FINISH
	special DisplayUnownWords
	setval UNOWNWORDS_PUZZLE
	special DisplayUnownWords
	setval UNOWNWORDS_HORROR
	special DisplayUnownWords
	setval UNOWNWORDS_WITHIN
	special DisplayUnownWords
	closetext
	end

NownPuzzleRoomWallPatternRight:
	checkevent EVENT_WALL_OPENED_IN_NOWN_PUZZLE_ROOM
	iftrue .WallOpen
	opentext
	writetext NownPuzzleRoomWallPatternRightText
	setval UNOWNWORDS_DO_NOT
	special DisplayUnownWords
	setval UNOWNWORDS_FINISH
	special DisplayUnownWords
	setval UNOWNWORDS_PUZZLE
	special DisplayUnownWords
	setval UNOWNWORDS_HORROR
	special DisplayUnownWords
	setval UNOWNWORDS_WITHIN
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	opentext
	writetext NownPuzzleRoomWallHoleText
	waitbutton
	closetext
	end

NownPuzzleRoomSkyfallTopMovement:
	skyfall_top
	step_end

NownPuzzleRoomWallPatternLeftText:
	text "Patterns appeared"
	line "on the walls…"
	done

NownPuzzleRoomUnownText:
; unused
	text "It's UNOWN text!"
	done

NownPuzzleRoomWallPatternRightText:
	text "Patterns appeared"
	line "on the walls…"
	done

NownPuzzleRoomWallHoleText:
	text "There's a big hole"
	line "in the wall!"
	done

NownPuzzleRoomAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "mon."
	done

NownPuzzleRoomDescriptionText:
	text "With its 9 eyes,"
	line "none escape its"
	cont "gaze."

	para "So many fell to"
	line "insanity upon"
	cont "glancing at it."

	para "Do not repeat"
	line "their mistakes."

	para "Flee."
	done

PuzzleDoneText:
	text "The puzzle is"
	line "complete."

	para "Were your actions"
	line "a mistake?"
	done

NownPuzzleRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  9, RUINS_OF_ALPH_INNER_CHAMBER, 10
	warp_event  4,  9, RUINS_OF_ALPH_INNER_CHAMBER, 11
	warp_event  4,  0, NOWN_ROOM, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event  2,  3, BGEVENT_READ, NownPuzzleRoomAncientReplica
	bg_event  5,  3, BGEVENT_READ, NownPuzzleRoomAncientReplica
	bg_event  3,  2, BGEVENT_UP, NownPuzzleRoomPuzzle
	bg_event  4,  2, BGEVENT_UP, NownPuzzleRoomDescriptionSign
	bg_event  3,  0, BGEVENT_UP, NownPuzzleRoomWallPatternLeft
	bg_event  4,  0, BGEVENT_UP, NownPuzzleRoomWallPatternRight

	db 0 ; object events
