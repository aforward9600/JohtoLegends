	object_const_def ; object_event constants
	const CERULEANCAVEB1F_MEWTWO
	const CERULEANCAVEB1F_POKEBALL

CeruleanCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Mewtwo

.Mewtwo:
	checkevent EVENT_CAUGHT_MEWTWO
	iftrue .MewtwoWillNotAppear
	checkevent EVENT_BEAT_MEWTWO
	iftrue .MewtwoWillNotAppear
	appear CERULEANCAVEB1F_MEWTWO
	return

.MewtwoWillNotAppear:
	disappear CERULEANCAVEB1F_MEWTWO
	return

MewtwoScript:
	opentext
	writetext MewtwoCry
	pause 15
	cry MEWTWO
	waitbutton
	closetext
	loadwildmon MEWTWO, 70
	loadvar VAR_BATTLETYPE, BATTLETYPE_MEWTWO
	startbattle
	ifequal LOSE, .NotBeaten
	disappear CERULEANCAVEB1F_MEWTWO
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtMewtwo
	setevent EVENT_BEAT_MEWTWO
	end

.CaughtMewtwo:
	setevent EVENT_CAUGHT_MEWTWO
	end

.NotBeaten:
	reloadmapafterbattle
	end

CeruleanCaveHiddenBerserkGene:
	hiddenitem BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY

CeruleanCaveB1FMaxRevive:
	itemball MAX_REVIVE

MewtwoCry:
	text "Mewtwo: Mew!"
	done

CeruleanCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  5,  7, CERULEAN_CAVE_1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event 29, 15, BGEVENT_ITEM, CeruleanCaveHiddenBerserkGene

	db 2 ; object events
	object_event 29, 15, SPRITE_MEWTWO, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_SILVER, OBJECTTYPE_SCRIPT, 0, MewtwoScript, EVENT_CERULEAN_CAVE_MEWTWO
	object_event 21,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CeruleanCaveB1FMaxRevive, EVENT_CERULEAN_CAVE_B1F_MAX_REVIVE
