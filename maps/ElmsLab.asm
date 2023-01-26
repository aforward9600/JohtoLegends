	object_const_def ; object_event constants
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OAK

ElmsLab_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetElm ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ELMSLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_ELMSLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_ELMSLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_ELMSLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_ELMSLAB_AIDE_GIVES_POTION

	db 0 ; callbacks

.MeetElm:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_SPOKE_WITH_ELM
	iftrue .NewElmScript
	writetext FirstElmText
	waitbutton
	closetext
	setevent EVENT_SPOKE_WITH_ELM
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	setevent EVENT_DARK_CAVE_GUARD
	setevent EVENT_MASTERS_HOUSE_MASTER
	end

.NewElmScript:
	writetext SecondElmText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

ElmsAideScript:
	faceplayer
	opentext
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

MeetCopScript2:
	applymovement PLAYER, MeetCopScript2_StepLeft

MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
ElmsLabOakScript:
	playmusic MUSIC_PROF_OAK
	turnobject ELMSLAB_OAK, LEFT
	opentext
	writetext ElmsLabOfficerText1
	waitbutton
	closetext
	applymovement ELMSLAB_OAK, OfficerLeavesMovement
	disappear ELMSLAB_OAK
	setscene SCENE_ELMSLAB_NOTHING
	special RestartMapMusic
	pause 15
	end

ElmsLabWindow:
	opentext
	writetext ElmsLabWindowText1
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabTrashcan2:
; unused
	jumpstd trashcan

ElmsLabBookshelf:
	jumpstd difficultbookshelf

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCyndaquilMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterTotodileMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

FirstElmText:
	text "Hello!"

	para "Who might you be?"

	para "……<PLAYER>? I see!"
	
	para "I am Prof. Elm!"

	para "I'm a researcher of"
	line "#mon evolution!"

	para "Where do they come"
	line "from?"

	para "How do they"
	line "change?"

	para "These are the"
	line "answers I seek!"

	para "Feel free to look"
	line "through the book-"
	cont "shelves for my"
	cont "notes!"

	para "They could help!"
	done

SecondElmText:
	text "Have my notes been"
	line "helpful?"

	para "I look forward to"
	line "learning more"
	cont "about #mon!"
	done

ElmPokeBallText:
	text "It contains a"
	line "#mon caught by"
	cont "Prof.Elm."
	done

ElmsLabHealingMachineText2:
	text "Would you like to"
	line "heal your #mon?"
	done

AideText_AlwaysBusy:
	text "I can't wait to"
	line "start working for"
	cont "Prof. Elm!"
	done

ElmsLabOfficerText1:
	text "Hm?"

	para "You there!"
	line "That journal you"
	cont "have!"

	para "May I see it?"

	para "………Wonderful!"

	para "These drawings and"
	line "descriptions are"
	cont "so detailed!"

	para "You did all these?"
	line "Truly incredible!"

	para "I'm working on a"
	line "high-tech"
	cont "encyclopedia of"
	cont "#mon!"

	para "It's still in the"
	line "early stages, so I"
	cont "haven't made one."

	para "…Oh, where are my"
	line "manners? I haven't"
	cont "introduced myself!"

	para "I am Prof. Oak."

	para "I was visiting my"
	line "student, er, I"
	cont "mean, my former"
	cont "student Elm."

	para "He has recently"
	line "become a #mon"
	cont "Professor himself,"
	cont "and I wanted to"
	cont "congratulate him!"

	para "And your name is?"

	para "………Ah, <PLAYER>,"
	line "is it?"

	para "Well met!"

	para "I'm afraid I must"
	line "be going, but I"
	cont "think we will meet"
	cont "again soon!"
	done

ElmsLabWindowText1:
	text "The window's open."

	para "A pleasant breeze"
	line "is blowing in."
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> opened a"
	line "book."

	para "Eevee is"
	line "incredible!"

	para "It can evolve into"
	line "8 different"
	cont "#mon!"

	para "Water Stone:"
	line "Vaporeon."
	
	para "Thunderstone:"
	line "Jolteon."

	para "Fire Stone:"
	line "Flareon."

	para "Sun Stone:"
	line "Espeon."

	para "Moon Stone:"
	line "Umbreon."

	para "Leaf Stone:"
	line "Leafeon."

	para "Ice Stone:"
	line "Glaceon."

	para "Shiny Stone:"
	line "Sylveon."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> opened a"
	line "book."

	para "Dusk Stone can be"
	line "used to evolve"
	cont "Murkrow, Dusclops"
	cont "and Misdreavus!"

	para "Astounding!"

	para "Shiny Stone can"
	line "be used to evolve"
	cont "Togetic and Eevee!"

	para "Remarkable!"

	para "Dawn Stone can be"
	line "used to evolve"
	cont "Kirlia and"
	cont "Snorunt!"
	
	para "Note: Only male"
	line "Kirlia and female"
	cont "Snorunt evolve by"
	cont "this manner."

	para "Need to research"
	line "further."

	para "Ice Stone can be"
	line "used to evolve"
	cont "Piloswine and"
	cont "Eevee!"

	para "Stupendous!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> opened a"
	line "book."

	para "Link Cable:"

	para "In the past,"
	line "certain #mon"
	cont "required trading"
	cont "between two people"
	cont "to evolve."

	para "In recent years,"
	line "Silph Co. created"
	cont "an artificial"
	cont "device to induce"
	cont "evolution called"
	cont "the Link Cable!"

	para "Kadabra, Machoke,"
	line "Graveler, and"
	cont "Haunter are"
	cont "compatible."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> opened a"
	line "book."

	para "Sneasel and Gligar"
	line "evolve through"
	cont "the use of Razor"
	cont "items, Claw and"
	cont "Fang respectively."

	para "Electabuzz and"
	line "Magmar evolve with"
	cont "Electrizer and"
	cont "Magmarizer"
	cont "respectively."

	para "These items are"
	line "not manufactured"
	cont "in Johto, and are"
	cont "often trafficked"
	cont "from Sinnoh."

	para "So I've heard."
	done

ElmsLabTrashcanText:
	text "The wrapper from"
	line "the snack Prof.Elm"
	cont "ate is in there…"
	done

ElmsLabPCText:
	text "Observations On"
	line "#mon Evolution"

	para "…It says on the"
	line "screen…"
	done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	db 2 ; coord events
	coord_event  4,  5, SCENE_DEFAULT, MeetCopScript
	coord_event  5,  5, SCENE_DEFAULT, MeetCopScript2

	db 16 ; bg events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, ElmsLabTrashcan
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	db 6 ; object events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LookAtElmPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LookAtElmPokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LookAtElmPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  5,  3, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsLabOakScript, EVENT_ELMS_LAB_OAK
