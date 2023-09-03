	object_const_def ; object_event constants
	const POWERPLANT_ZAPDOS
	const POWERPLANT_ENGINEER1
	const POWERPLANT_ENGINEER2
	const POWERPLANT_POKE_BALL1
	const POWERPLANT_POKE_BALL2
	const POWERPLANT_POKE_BALL3
	const POWERPLANT_ELECTRODE1
	const POWERPLANT_ELECTRODE2
	const POWERPLANT_POKE_BALL4

PowerPlant_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Zapdos

.Zapdos:
	checkevent EVENT_CAUGHT_ZAPDOS
	iftrue .ZapdosWillNotAppear
	checkevent EVENT_BEAT_ZAPDOS
	iftrue .ZapdosWillNotAppear
	appear POWERPLANT_ZAPDOS
	return

.ZapdosWillNotAppear:
	disappear POWERPLANT_ZAPDOS
	return

PowerPlantZapdosScript:
	opentext
	writetext ZapdosCry
	pause 15
	cry ZAPDOS
	waitbutton
	closetext
	loadwildmon ZAPDOS, 70
	loadvar VAR_BATTLETYPE, BATTLETYPE_LEGENDARY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear POWERPLANT_ZAPDOS
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtZapdos
	setevent EVENT_BEAT_ZAPDOS
	end

.CaughtZapdos:
	setevent EVENT_CAUGHT_ZAPDOS
	end

.NotBeaten:
	reloadmapafterbattle
	end

PowerPlantEngineerScript:
	faceplayer
	opentext
	checkevent EVENT_POWER_PLANT_ZAPDOS
	iftrue .ZapdosGone
	writetext PowerPlantEngineerText
	waitbutton
	closetext
	end

.ZapdosGone:
	writetext PowerPlantEngineerText2
	waitbutton
	closetext
	end

PowerPlantEngineer2Script:
	jumptextfaceplayer PowerPlantEngineerText3

PowerPlantElectirizer:
	itemball ELECTIRIZER

PowerPlantMaxElixer:
	itemball MAX_ELIXER

PowerPlantRareCandy:
	itemball RARE_CANDY

PowerPlantPPUp:
	itemball PP_UP

PowerPlantElectrode1:
	cry ELECTRODE
	loadwildmon ELECTRODE, 70
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear POWERPLANT_ELECTRODE1
	reloadmapafterbattle
	end

.NotBeaten:
	reloadmapafterbattle
	end

PowerPlantElectrode2:
	cry ELECTRODE
	loadwildmon ELECTRODE, 70
	startbattle
	ifequal LOSE, .NotBeaten
	disappear POWERPLANT_ELECTRODE2
	reloadmapafterbattle
	end

.NotBeaten:
	reloadmapafterbattle
	end

ZapdosCry:
	text "Zapdos: Gyaoo!"
	done

PowerPlantEngineerText3:
	text "Even when Zapdos"
	line "isn't here,"

	para "the other #mon"
	line "generate enough"
	cont "electricity to"
	cont "power Kanto."

	para "Hopefully someday"
	line "we'll have the"
	cont "place running."
	done

PowerPlantEngineerText:
	text "Zapdos disappeared"
	line "a while ago, but"
	cont "now it's back."

	para "It produces a lot"
	line "of electricity for"
	cont "the region since"
	cont "the plant shut"
	cont "down."
	done

PowerPlantEngineerText2:
	text "Zapdos is gone"
	line "again…"
	done

PowerPlant_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  4, 35, ROUTE_10_NORTH, 2
	warp_event  5, 35, ROUTE_10_NORTH, 2
	warp_event  0, 11, ROUTE_10_NORTH, 2

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event  4,  9, SPRITE_ZAPDOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantZapdosScript, EVENT_POWER_PLANT_ZAPDOS
	object_event  6, 13, SPRITE_ENGINEER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantEngineerScript, -1
	object_event 17, 26, SPRITE_ENGINEER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantEngineer2Script, -1
	object_event 21, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PowerPlantElectirizer, EVENT_POWER_PLANT_ELECTIRIZER
	object_event 37, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 1, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PowerPlantMaxElixer, EVENT_POWER_PLANT_MAX_ELIXER
	object_event 22, 34, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PowerPlantRareCandy, EVENT_POWER_PLANT_RARE_CANDY
	object_event 34,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantElectrode1, EVENT_POWER_PLANT_ELECTRODE_1
	object_event 25, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PowerPlantElectrode2, EVENT_POWER_PLANT_ELECTRODE_2
	object_event 28,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, PowerPlantPPUp, EVENT_POWER_PLANT_PP_UP
