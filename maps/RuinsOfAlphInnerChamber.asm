	object_const_def ; object_event constants
	const RUINSOFALPHINNERCHAMBER_FISHER
	const RUINSOFALPHINNERCHAMBER_TEACHER
	const RUINSOFALPHINNERCHAMBER_GRAMPS

RuinsOfAlphInnerChamber_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHINNERCHAMBER_NOTHING
	scene_script .UnownAppear ; SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .NownRoomDoor

.DummyScene0:
	end

.UnownAppear:
	prioritysjump .StrangePresenceScript
	end

.StrangePresenceScript:
	opentext
	writetext RuinsOfAlphStrangePresenceText
	waitbutton
	closetext
	setscene SCENE_RUINSOFALPHINNERCHAMBER_NOTHING
	setevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	end

.NownRoomDoor:
	checkevent EVENT_OPENED_NOWN_ROOM
	iftrue .OpenWall
	changeblock 6, 0, $36 ; wall
	return

.OpenWall:
	return

RuinsOfAlphInnerChamberFisherScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberFisherText

RuinsOfAlphInnerChamberTeacherScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberTeacherText

RuinsOfAlphInnerChamberGrampsScript:
	jumptextfaceplayer RuinsOfAlphInnerChamberGrampsText

RuinsOfAlphInnerChamberStatue:
	jumptext RuinsOfAlphInnerChamberStatueText

RuinsOfAlphInnerChamberScientistScript:
	faceplayer
	opentext
	checkevent EVENT_OPENED_NOWN_ROOM
	iftrue .ScientistScript2
	writetext RuinsOfAlphInnerChamberScientistText1
	waitbutton
	closetext
	end

.ScientistScript2:
	writetext RuinsOfAlphInnerChamberScientistText2
	waitbutton
	closetext
	end

RuinsOfAlphNownWall:
	checkevent EVENT_OPENED_NOWN_ROOM
	iftrue .Done
	opentext
	writetext RuinsOfAlphInnerChamberWallPatternText
	setval UNOWNWORDS_GATHER
	special DisplayUnownWords
	setval UNOWNWORDS_EVERY
	special DisplayUnownWords
	setval UNOWNWORDS_UNOWN
	special DisplayUnownWords
	closetext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	end

.GotAllUnown:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	refreshscreen $86
	playsound SFX_STRENGTH
	changeblock 6, 0, $33 ; open wall
	reloadmappart
	earthquake 50
	setevent EVENT_OPENED_NOWN_ROOM
	closetext
.Done:
	end

RuinsOfAlphStrangePresenceText:
	text "There is a strange"
	line "presence here…"
	done

RuinsOfAlphInnerChamberFisherText:
	text "This is a big"
	line "room, but there's"
	cont "nothing here."
	done

RuinsOfAlphInnerChamberTeacherText:
	text "This place has a"
	line "mystical quality"
	cont "to it."

	para "It feels sort of"
	line "ethereal even."
	done

RuinsOfAlphInnerChamberGrampsText:
	text "Ancient buildings"
	line "are often tombs of"
	cont "kings."

	para "Like the pyramids,"
	line "for instance."
	done

RuinsOfAlphInnerChamberStatueText:
	text "It's a replica of"
	line "an ancient #-"
	cont "mon."
	done

RuinsOfAlphInnerChamberWallPatternText:
	text "Patterns appeared"
	line "on the walls…"
	done

RuinsOfAlphInnerChamberScientistText1:
	text "Hm…"

	para "Does this wall"
	line "look different"
	cont "from the rest?"

	para "The others appear"
	line "to spell nonsense,"
	cont "but not this one."

	para "It seems to have a"
	line "message, but what?"
	done

RuinsOfAlphInnerChamberScientistText2:
	text "Wow, there was a"
	line "room behind here!"

	para "I wonder what's"
	line "in there?"
	done

RuinsOfAlphInnerChamber_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event 10, 13, RUINS_OF_ALPH_OUTSIDE, 5
	warp_event  3, 15, RUINS_OF_ALPH_HO_OH_CHAMBER, 3
	warp_event  4, 15, RUINS_OF_ALPH_HO_OH_CHAMBER, 4
	warp_event 15,  3, RUINS_OF_ALPH_KABUTO_CHAMBER, 3
	warp_event 16,  3, RUINS_OF_ALPH_KABUTO_CHAMBER, 4
	warp_event  3, 21, RUINS_OF_ALPH_OMANYTE_CHAMBER, 3
	warp_event  4, 21, RUINS_OF_ALPH_OMANYTE_CHAMBER, 4
	warp_event 15, 24, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 3
	warp_event 16, 24, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 4
	warp_event  6,  0, NOWN_PUZZLE_ROOM, 1
	warp_event  7,  0, NOWN_PUZZLE_ROOM, 2

	db 0 ; coord events

	db 28 ; bg events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17,  3, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  2,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  5,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17,  8, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  2, 13, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 13, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  2, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  5, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 18, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  2, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  5, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  8, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 11, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 14, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event 17, 24, BGEVENT_READ, RuinsOfAlphInnerChamberStatue
	bg_event  6,  0, BGEVENT_READ, RuinsOfAlphNownWall
	bg_event  7,  0, BGEVENT_READ, RuinsOfAlphNownWall

	db 4 ; object events
	object_event  3,  7, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberFisherScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event 14, 13, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberTeacherScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event 11, 19, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberGrampsScript, EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	object_event  6,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphInnerChamberScientistScript, -1
