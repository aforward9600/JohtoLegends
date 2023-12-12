	object_const_def ; object_event constants
	const GHOSTHOUSE_HEX_MANIAC
	const GHOSTHOUSE_DUSKNOIR

GhostHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Dusknoir

.Dusknoir:
	checkevent EVENT_BEAT_HEX_MANIAC_EDALYN
	iftrue .DusknoirAppears
.DusknoirDisappears:
	disappear GHOSTHOUSE_DUSKNOIR
	return

.DusknoirAppears:
	checkevent EVENT_BEAT_DUSKNOIR
	iftrue .DusknoirDisappears
	checkevent EVENT_CAUGHT_DUSKNOIR
	iftrue .DusknoirDisappears
	appear GHOSTHOUSE_DUSKNOIR
	return

GhostHouseHexManiacScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_HEX_MANIAC_EDALYN
	iftrue .DoneFight
	checktime NITE
	iffalse .NoFight
	writetext HexManiacEdalynBattleText
	waitbutton
	closetext
	winlosstext HexManiacEdalynBeatenText, 0
	loadtrainer HEX_MANIAC, EDALYN
	startbattle
	reloadmapafterbattle
	opentext
	writetext ItShouldAppearText
	waitbutton
	closetext
	pause 15
	cry DUSKNOIR
	pause 10
	showemote EMOTE_SHOCK, GHOSTHOUSE_HEX_MANIAC, 15
	turnobject GHOSTHOUSE_HEX_MANIAC, UP
	opentext
	writetext ItsHereText
	waitbutton
	closetext
	pause 10
	turnobject PLAYER, UP
	pause 10
	appear GHOSTHOUSE_DUSKNOIR
	refreshscreen
	cry DUSKNOIR
	pause 10
	opentext
	writetext GoOnAndFightItText
	waitbutton
	closetext
	setevent EVENT_BEAT_HEX_MANIAC_EDALYN
	end

.NoFight:
	writetext ComeBackAtNightText
	waitbutton
	closetext
	end

.DoneFight:
	checkevent EVENT_BEAT_DUSKNOIR
	iftrue .HexManiacBeatDusknoir
	checkevent EVENT_CAUGHT_DUSKNOIR
	iftrue .HexManiacCaughtDusknoir
	writetext GoOnAndFightItText
	waitbutton
	closetext
	end

.HexManiacBeatDusknoir:
	writetext YouBeatItText
	waitbutton
	closetext
	end

.HexManiacCaughtDusknoir:
	writetext YouCaughtItText
	waitbutton
	closetext
	end

GhostHouseDusknoirScript:
	faceplayer
	opentext
	writetext GhostHouseDusknoirText
	pause 15
	cry DUSKNOIR
	waitbutton
	closetext
	loadwildmon DUSKNOIR, 45
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear GHOSTHOUSE_DUSKNOIR
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtDusknoir
	setevent EVENT_BEAT_DUSKNOIR
	end

.CaughtDusknoir:
	setevent EVENT_CAUGHT_DUSKNOIR
	end

.NotBeaten:
	reloadmapafterbattle
	end

HexManiacEdalynBattleText:
	text "Ah, night time."

	para "This house is"
	line "haunted, and at"
	cont "night, it appears…"

	para "Let's have a"
	line "battle to summon"
	cont "the ghost."
	done

HexManiacEdalynBeatenText:
	text "Will it appear?"
	done

ItShouldAppearText:
	text "Hm…"

	para "It should appear"
	line "now…"
	done

ItsHereText:
	text "…It's heeeeere…"
	done

GoOnAndFightItText:
	text "A Dusknoir…"

	para "It looks odd…"

	para "Go on and fight"
	line "it…"

	para "You've earned it."
	done

ComeBackAtNightText:
	text "Come back at"
	line "night…"

	para "If you're brave"
	line "enough…"
	done

YouBeatItText:
	text "You beat it…"

	para "Maybe it will"
	line "return…"
	done

YouCaughtItText:
	text "You caught it…"

	para "…nice…"
	done

GhostHouseDusknoirText:
	text "Dusknoir: Noirrr!"
	done

GhostHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, VIOLET_CITY, 3
	warp_event  4,  7, VIOLET_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  4, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GhostHouseHexManiacScript, -1
	object_event  4,  1, SPRITE_DUSKNOIR, SPRITEMOVEDATA_POKEMON, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GhostHouseDusknoirScript, EVENT_GHOST_HOUSE_DUSKNOIR
