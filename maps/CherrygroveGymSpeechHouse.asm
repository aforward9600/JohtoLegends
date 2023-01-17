	object_const_def ; object_event constants
	const CHERRYGROVEGYMSPEECHHOUSE_CYNTHIA

CherrygroveGymSpeechHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .CynthiaMeetsYou ; SCENE_CHERRYGROVECITYHOUSE_NOTHING
	scene_script .DummyScene1 ; SCENE_CHERRYGROVECITYHOUSE_MEET_CYNTHIA

	db 0 ; callbacks

.DummyScene1:
	end

.CynthiaMeetsYou:
	showemote EMOTE_SHOCK, CHERRYGROVEGYMSPEECHHOUSE_CYNTHIA, 15
	playmusic MUSIC_CYNTHIA_ENCOUNTER
	pause 15
	applymovement CHERRYGROVEGYMSPEECHHOUSE_CYNTHIA, CherrygroveCynthiaMovement
	opentext
	writetext CherrygroveCynthiaMeetingText
	yesorno
	iffalse .RefusedCynthiaBattle1
	writetext CherrygroveCynthiaLetsDoThisText
	waitbutton
	closetext
	readvar VAR_BADGES
	ifequal 7, .CynthiaBattle2
	winlosstext CynthiaBeatenAgainText, Cynthia2LastMonText
	loadtrainer TOURIST, CYNTHIA5
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_CYNTHIA_ENCOUNTER
	opentext
	writetext YoureAsStrongAsEverText
	waitbutton
	closetext
	setevent EVENT_BEAT_CHERRYGROVE_CYNTHIA
	applymovement CHERRYGROVEGYMSPEECHHOUSE_CYNTHIA, CherrygroveCynthiaMovement2
	turnobject CHERRYGROVEGYMSPEECHHOUSE_CYNTHIA, DOWN
	special RestartMapMusic
	waitsfx
	playmapmusic
	setscene SCENE_CHERRYGROVECITYHOUSE_NOTHING
	end

.CynthiaBattle2:
	winlosstext CynthiaBeatenAgainText, Cynthia2LastMonText
	loadtrainer TOURIST, CYNTHIA4
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_CYNTHIA_ENCOUNTER
	opentext
	writetext YoureAsStrongAsEverText
	waitbutton
	closetext
	setevent EVENT_BEAT_CHERRYGROVE_CYNTHIA
	applymovement CHERRYGROVEGYMSPEECHHOUSE_CYNTHIA, CherrygroveCynthiaMovement2
	turnobject CHERRYGROVEGYMSPEECHHOUSE_CYNTHIA, DOWN
	special RestartMapMusic
	waitsfx
	playmapmusic
	setscene SCENE_CHERRYGROVECITYHOUSE_NOTHING
	end

.RefusedCynthiaBattle1:
	writetext CynthiaSomeOtherTimeText
	waitbutton
	closetext
	applymovement CHERRYGROVEGYMSPEECHHOUSE_CYNTHIA, CherrygroveCynthiaMovement2
	turnobject CHERRYGROVEGYMSPEECHHOUSE_CYNTHIA, DOWN
	special RestartMapMusic
	waitsfx
	playmapmusic
	setscene SCENE_CHERRYGROVECITYHOUSE_NOTHING
	end

CherrygroveGymSpeechHouseCynthiaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHERRYGROVE_CYNTHIA
	iftrue .BeatenCherrygroveCynthia
	playmusic MUSIC_CYNTHIA_ENCOUNTER
	writetext CherrygroveCynthiaAskBattleText
	yesorno
	iffalse .RefusedCynthiaBattle
	writetext CherrygroveCynthiaLetsDoThisText
	waitbutton
	closetext
	readvar VAR_BADGES
	ifequal 7, .CynthiaBattle1
	winlosstext CynthiaBeatenAgainText, Cynthia2LastMonText
	loadtrainer TOURIST, CYNTHIA5
	startbattle
	reloadmapafterbattle
	opentext
	writetext YoureAsStrongAsEverText
	waitbutton
	closetext
	setevent EVENT_BEAT_CHERRYGROVE_CYNTHIA
	special RestartMapMusic
	waitsfx
	playmapmusic
	end

.CynthiaBattle1:
	winlosstext CynthiaBeatenAgainText, Cynthia2LastMonText
	loadtrainer TOURIST, CYNTHIA4
	startbattle
	reloadmapafterbattle
	opentext
	writetext YoureAsStrongAsEverText
	waitbutton
	closetext
	setevent EVENT_BEAT_CHERRYGROVE_CYNTHIA
	end

.BeatenCherrygroveCynthia:
	writetext CynthiaHelloAgainText
	waitbutton
	closetext
	end

.RefusedCynthiaBattle:
	writetext CynthiaSomeOtherTimeText
	waitbutton
	closetext
	end

CherrygroveCynthiaMovement:
	big_step DOWN
	big_step DOWN
	step_end

CherrygroveCynthiaMovement2:
	big_step UP
	big_step UP
	step_end

CherrygroveGymSpeechHouseBookshelf:
	jumpstd picturebookshelf

Cynthia2LastMonText:
	text "We can still win"
	line "this!"
	done

CherrygroveCynthiaAskBattleText:
	text "Keeping well?"

	para "The Gible I gave"
	line "you seems to have"
	cont "served you well."

	para "Would you like to"
	line "battle again?"
	done

CherrygroveCynthiaLetsDoThisText:
	text "After you, then."
	done

YoureAsStrongAsEverText:
	text "It looks like I've"
	line "been beaten again."

	para "You're quite the"
	line "trainer."

	para "I've decided to"
	line "stay here for a"
	cont "while before"
	cont "heading out."

	para "What will I do"
	line "now?"

	para "Not sure."

	para "I'll come to me"
	line "eventually."
	done

CynthiaHelloAgainText:
	text "Hello again."

	para "I'm still just"
	line "thinking about"
	cont "what to do."
	done

CynthiaSomeOtherTimeText:
	text "Some other time"
	line "then."
	done

CynthiaBeatenAgainText:
	text "My Garchomp…"
	done

CherrygroveCynthiaMeetingText:
	text "Fancy meeting you"
	line "here."

	para "I'm renting from a"
	line "friend of mine"
	cont "while they're on"

	para "vacation in the"
	line "Sinnoh region."

	para "Mind battling me"
	line "again?"
	done

CherrygroveGymSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 3
	warp_event  3,  7, CHERRYGROVE_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CherrygroveGymSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CherrygroveGymSpeechHouseBookshelf

	db 1 ; object events
	object_event  2,  4, SPRITE_CYNTHIA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveGymSpeechHouseCynthiaScript, EVENT_CHERRYGROVE_CYNTHIA
