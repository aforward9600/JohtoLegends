	object_const_def ; object_event constants
	const ROUTE47_HIKER
	const ROUTE47_YOUNGSTER
	const ROUTE47_COOLTRAINERF
	const ROUTE47_POKEBALL1
	const ROUTE47_POKEBALL2
	const ROUTE47_POKEBALL3
	const ROUTE47_SUICUNE

Route47_MapScripts:
	db 2 ; scene scripts
	scene_script .Dummy0 ; SCENE_DEFAULT
	scene_script .Dummy1 ; SCENE_FINISHED

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .MakeBridgesPriority
	callback MAPCALLBACK_OBJECTS, .SuicuneAppears

.Dummy0:
	end

.Dummy1:
	end

.MakeBridgesPriority:
	checkscene
	iffalse .DontChangeBridges
	changeblock 42, 24, $63
	changeblock 44, 24, $55
	changeblock 46, 24, $55
	changeblock 48, 24, $55
	changeblock 50, 24, $62
	changeblock 44, 18, $5c
	changeblock 46, 18, $5c
	changeblock 48, 18, $5c
	changeblock 20, 24, $5c
	changeblock 22, 24, $5c
	changeblock 24, 24, $5c
	changeblock 18, 16, $63
	changeblock 20, 16, $55
	changeblock 22, 16, $55
	changeblock 24, 16, $55
	changeblock 26, 16, $64
	return

.DontChangeBridges:
	changeblock 42, 24, $18
	changeblock 44, 24, $17
	changeblock 46, 24, $17
	changeblock 48, 24, $17
	changeblock 44, 18, $17
	changeblock 50, 24, $16
	changeblock 46, 18, $17
	changeblock 48, 18, $17
	changeblock 20, 24, $17
	changeblock 22, 24, $17
	changeblock 24, 24, $17
	changeblock 18, 16, $18
	changeblock 20, 16, $17
	changeblock 22, 16, $17
	changeblock 24, 16, $17
	changeblock 26, 16, $38
	return

.SuicuneAppears:
	checkevent EVENT_CAUGHT_SUICUNE
	iftrue .SuicuneWillNotAppear
	checkevent EVENT_BEAT_SUICUNE
	iftrue .SuicuneWillNotAppear
	checkevent EVENT_BEAT_LAIR_ARIANA
	iftrue .SuicuneMayAppear
.SuicuneWillNotAppear:
	disappear ROUTE47_SUICUNE
	return

.SuicuneMayAppear:
	appear ROUTE47_SUICUNE
	return

TrainerHikerPhil:
	trainer HIKER, PHIL1, EVENT_BEAT_HIKER_PHIL, HikerPhilSeenText, HikerPhilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerPhilAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperEmil:
	trainer CAMPER, EMIL, EVENT_BEAT_CAMPER_EMIL, CamperEmilSeenText, CamperEmilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperEmilAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerFTeresa:
	trainer COOLTRAINERF, TERESA, EVENT_BEAT_COOLTRAINERF_TERESA, CooltrainerFTeresaSeenText, CooltrainerFTeresaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFTeresaAfterBattleText
	waitbutton
	closetext
	end

Route47Suicune:
	opentext
	writetext SuicuneCry
	pause 15
	cry SUICUNE
	waitbutton
	closetext
	loadwildmon SUICUNE, 60
	loadvar VAR_BATTLETYPE, BATTLETYPE_SUICUNE
	startbattle
	ifequal LOSE, .NotBeaten
	disappear ROUTE47_SUICUNE
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtSuicune
	setevent EVENT_BEAT_SUICUNE
	end

.CaughtSuicune:
	setevent EVENT_CAUGHT_SUICUNE
	end

.NotBeaten:
	reloadmapafterbattle
	end

Route47ItemBallScript:
	itemball TM_GIGA_DRAIN

Route47ItemBall2Script:
	itemball REVIVE

Route47DawnStoneScript:
	itemball DAWN_STONE

Route47Sign:
	jumptext Route47SignText

Route47SuperNerdScript:
	jumptextfaceplayer Route47SuperNerdText

;MakeBridgesPriority:
;	changeblock 22, 12, $55
;	changeblock 23, 12, $55
;	changeblock 24, 12, $55
;	changeblock 22,  9, $5C
;	changeblock 23,  9, $5C
;	changeblock 24,  9, $5C
;	changeblock 10, 12, $5C
;	changeblock 11, 12, $5C
;	changeblock 12, 12, $5C
;	changeblock 10,  8, $55
;	changeblock 11,  8, $55
;	changeblock 11,  8, $55
;	end

HikerPhilSeenText:
	text "I like the caves"
	line "here."

	para "As a Hiker, how"
	line "could I not?"
	done

HikerPhilBeatenText:
	text "Dang!"
	done

HikerPhilAfterBattleText:
	text "You should give"
	line "spelunking a try."

	para "Just don't get"
	line "crushed by a rock."

	para "Not very fun, I"
	line "assure you."
	done

CamperEmilSeenText:
	text "I'm going to catch"
	line "a bunch of #mon"
	cont "at the Wild Area."

	para "How about you?"
	done

CamperEmilBeatenText:
	text "I need some"
	line "better #mon."
	done

CamperEmilAfterBattleText:
	text "I love my #mon,"
	line "but I want some"
	cont "better fighters,"
	cont "too."
	done

CooltrainerFTeresaSeenText:
	text "This place is"
	line "nature at its"
	cont "finest."
	done

CooltrainerFTeresaBeatenText:
	text "Wow! That was a"
	line "battle!"
	done

CooltrainerFTeresaAfterBattleText:
	text "The Wild Area is"
	line "gorgeous as well."
	done

Route47SignText:
	text "Route 47"
	line "Cianwood City -"
	cont "Route 48"
	done

SuicuneCry:
	text "Suicune: Drdrradr!"
	done

Route47SuperNerdText:
	text "This is all that"
	line "remains of an"
	cont "ancient tower."

	para "There's an old myth"
	line "that a #mon of"
	cont "the sky used to"
	cont "rest here."

	para "There are similar"
	line "myths about the"
	cont "Sky Pillar in the"
	cont "Hoenn region."

	para "Nobody has seen"
	line "such a #mon"
	cont "like that in a"
	cont "long time, so it's"
	cont "probably not true."
	done

Route47_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 67, 21, CLIFFS_EDGE_GATE, 4
	warp_event 53, 21, CLIFF_CAVE, 1
	warp_event 52, 17, CLIFF_CAVE, 4
	warp_event 53, 27, CLIFF_CAVE_B1F, 2
	warp_event 11, 23, EMBEDDED_TOWER, 1

	db 0 ; coord events
;	coord_event 53, 28, SCENE_DEFAULT, MakeBridgesPriority
;	coord_event 11, 24, SCENE_DEFAULT, MakeBridgesPriority

	db 1 ; bg events
	bg_event 23,  1, BGEVENT_READ, Route47Sign

	db 8 ; object events
	object_event 59, 26, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerHikerPhil, -1
	object_event 37, 22, SPRITE_CAMPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperEmil, -1
	object_event 23,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerFTeresa, -1
	object_event 36, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, Route47ItemBallScript, EVENT_GOT_TM52_ENERGY_BALL
	object_event 39, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47ItemBall2Script, EVENT_ROUTE_47_REVIVE
	object_event 31, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47DawnStoneScript, EVENT_ROUTE_47_DAWN_STONE
	object_event  7,  4, SPRITE_SUICUNE_P, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route47Suicune, EVENT_ROUTE_47_SUICUNE
	object_event  8, 24, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route47SuperNerdScript, -1
