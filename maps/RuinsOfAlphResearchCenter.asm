	object_const_def ; object_event constants
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenter_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING
	scene_script .GetUnownDex ; SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.GetUnownDex:
	prioritysjump .GetUnownDexScript
	end

.ScientistCallback:
	checkscene
	ifequal SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	return

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	return

.GetUnownDexScript:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x5926f
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext RuinsOfAlphResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x59274
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x59276
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetextend RuinsOfAlphResearchCenterScientist3_PrinterAvailable

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetextend RuinsOfAlphResearchCenterScientist1Text

.UnownAppeared:
	writetextend RuinsOfAlphResearchCenterScientist1Text_UnownAppeared

.GotUnownDex:
	writetextend RuinsOfAlphResearchCenterScientist1Text_GotUnownDex

.GotAllUnown:
	writetextend RuinsOfAlphResearchCenterScientist1Text_GotAllUnown

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	checkevent EVENT_DECO_UNOWN_DOLL
	iftrue .GotUnownDoll
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetextend RuinsOfAlphResearchCenterScientist2Text

.UnownAppeared:
	writetextend RuinsOfAlphResearchCenterScientist2Text_UnownAppeared

.GotAllUnown:
	setevent EVENT_DECO_UNOWN_DOLL
	writetext RuinsOfAlphResearchCenterScientist2Text_GotAllUnown
	buttonsound
	waitsfx
	writetext PlayerGotUnownDollText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
.GotUnownDoll:
	writetextend GotUnownDollText

RuinsOfAlphResearchCenterComputer:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetextend RuinsOfAlphResearchCenterComputerText

.GotAllUnown:
	writetextend RuinsOfAlphResearchCenterComputerText_GotAllUnown

RuinsOfAlphResearchCenterPrinter:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetextend RuinsOfAlphResearchCenterPrinterText_DoesntWork

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

RuinsOfAlphResearchCenterBookshelf:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText

MovementData_0x5926f:
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

MovementData_0x59274:
	step DOWN
	step_end

MovementData_0x59276:
	step UP
	step_end

RuinsOfAlphResearchCenterModifiedDexText:
	text "Done!"

	para "I added more pages"
	line "to your Journal."

	para "Now you can record"
	line "more Unown data."

	para "You should record"
	line "them in the"
	cont "sequence that they"
	cont "were caught."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "<PLAYER>'s Journal"
	line "was improved."
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "The Unown you"
	line "catch will all be"
	cont "recorded."

	para "Check to see how"
	line "many kinds exist."
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "You caught all the"
	line "Unown variations?"

	para "That's a great"
	line "achievement!"

	para "I've set up the"
	line "printer here for"
	cont "handling Unown."

	para "Feel free to use"
	line "it anytime."
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "The Ruins are"
	line "about 1500 years"
	cont "old."

	para "But it's not known"
	line "why they were"
	cont "built--or by whom."
	done

RuinsOfAlphResearchCenterScientist1Text_GotUnownDex:
	text "I wonder how many"
	line "kinds of #mon"
	cont "are in the Ruins?"
	done

RuinsOfAlphResearchCenterScientist1Text_UnownAppeared:
	text "#mon appeared"
	line "in the Ruins?"

	para "That's incredible"
	line "news!"

	para "We'll need to"
	line "investigate this."
	done

RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "Our investigation,"
	line "with your help, is"

	para "giving us insight"
	line "into the Ruins."

	para "The Ruins appear"
	line "to have been built"

	para "as a habitat for"
	line "#mon."
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "There are odd pat-"
	line "terns drawn on the"

	para "walls of the"
	line "Ruins."

	para "They must be the"
	line "keys for unravel-"
	cont "ing the mystery"
	cont "of the Ruins."
	done

RuinsOfAlphResearchCenterScientist2Text_UnownAppeared:
	text "The strange #-"
	line "mon you saw in the"
	cont "Ruins?"

	para "They appear to be"
	line "very much like the"

	para "drawings on the"
	line "walls there."

	para "Hmm…"

	para "That must mean"
	line "there are many"
	cont "kinds of them…"
	done

RuinsOfAlphResearchCenterScientist2Text_GotAllUnown:
	text "You caught all the"
	line "Unown! Impressive!"

	para "Here, take this"
	line "toy I made!"

	para "It'll make your"
	line "room mysterious!"
	done

PlayerGotUnownDollText:
	text "<PLAYER> received"
	line "Unown Doll!"
	done

GotUnownDollText:
	text "Liking the doll?"

	para "Really brightens"
	line "up the room!"
	done

RuinsOfAlphEarthquakeText:
	text "What was that?"

	para "An earthquake?"

	para "I hope the ruins"
	line "weren't damaged"
	cont "at all…"
	done

RuinsOfAlphResearchCenterComputerText:
	text "Ruins OF Alph"

	para "Exploration"
	line "Year 10"
	done

RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "Mystery #mon"
	line "Name: Unown"

	para "A total of 26"
	line "kinds found."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "This doesn't seem"
	line "to work yet."
	done

RuinsOfAlphResearchCenterUnownPrinterText:
	text "Unown may be"
	line "printed out."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "There are many"
	line "academic books."

	para "Ancient Ruins…"
	line "Mysteries of the"
	cont "Ancients…"
	done

RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 6
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 6

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  4, BGEVENT_READ, RuinsOfAlphResearchCenterComputer
	bg_event  7,  1, BGEVENT_READ, RuinsOfAlphResearchCenterPrinter

	db 3 ; object events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
