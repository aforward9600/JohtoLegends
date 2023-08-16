	object_const_def ; object_event constants
	const CIANWOODCITY_STANDING_YOUNGSTER1
	const CIANWOODCITY_POKEFAN_M
	const CIANWOODCITY_LASS
	const CIANWOODCITY_ROCK1
	const CIANWOODCITY_ROCK2
	const CIANWOODCITY_ROCK3
	const CIANWOODCITY_ROCK4
	const CIANWOODCITY_ROCK5
	const CIANWOODCITY_ROCK6
	const CIANWOODCITY_LASS1
	const CIANWOODCITY_STANDING_YOUNGSTER2
	const CIANWOODCITY_POKE_BALL
	const CIANWOODCITY_SCHOOLBOY2

CianwoodCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_CIANWOODCITY_NOTHING
	scene_script .DummyScene1 ; SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPointAndSuicune

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPointAndSuicune:
	setflag ENGINE_FLYPOINT_CIANWOOD
	return

CianwoodCityChucksWife:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM_FLY
	iftrue .GotFly
	writetext ChucksWifeEasierToFlyText
	buttonsound
	checkevent EVENT_BEAT_CHUCK
	iftrue .BeatChuck
	writetext ChucksWifeBeatChuckText
	waitbutton
	closetext
	end

.BeatChuck:
	writetext ChucksWifeGiveHMText
	buttonsound
	verbosegiveitem TM_FLY
	iffalse .Done
	setevent EVENT_GOT_TM_FLY
	writetext ChucksWifeFlySpeechText
	buttonsound
.GotFly:
	writetext ChucksWifeChubbyText
	waitbutton
.Done:
	closetext
	end

ForestTrade:
	faceplayer
	opentext
	trade NPC_TRADE_FOREST
	waitbutton
	closetext
	end

CianwoodCityYoungster:
	jumptextfaceplayer CianwoodCityYoungsterText

CianwoodCityPokefanM:
	jumptextfaceplayer CianwoodCityPokefanMText

CianwoodCityLassScript:
	jumptextfaceplayer CianwoodCityLassText

CliffsEdgeGateGuardScript:
	jumptextfaceplayer CianwoodCityUnusedText

CianwoodCitySign:
	jumptext CianwoodCitySignText

CianwoodGymSign:
	jumptext CianwoodGymSignText

CianwoodPharmacySign:
	jumptext CianwoodPharmacySignText

CianwoodPhotoStudioSign:
	jumptext CianwoodPhotoStudioSignText

CianwoodPokeSeerSign:
	jumptext CianwoodPokeSeerSignText

CianwoodPokecenterSign:
	jumpstd pokecentersign

CianwoodCityRock:
	jumpstd smashrock

CianwoodCityItemBallScript:
	itemball TM_ROCK_TOMB

CianwoodCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

CianwoodCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

ChucksWifeEasierToFlyText:
	text "Hey, you're a"
	line "trainer, right?"

	para "I have a request"
	line "for you."

	para "Can you beat the"
	line "apprentice Gym"
	cont "Leader, Chuck?"

	para "He's so handsome,"
	line "but he's always so"
	cont "preoccupied with"
	cont "training, that he"
	cont "won't pay any"
	cont "attention to me."

	para "If you beat him,"
	line "maybe he'll stop"
	cont "being so focused."

	para "If you beat him,"
	line "come and see me."
	cont "I'll give you a"
	cont "gift."
	done

ChucksWifeBeatChuckText:
	text "But don't under-"
	line "estimate him."

	para "His muscles are"
	line "as strong as his"
	cont "battling skills."
	done

ChucksWifeGiveHMText:
	text "You did it!"

	para "Now he'll start"
	line "to pay attention"
	cont "to me!"

	para "Here, have this"
	line "TM!"
	done

ChucksWifeFlySpeechText:
	text "It's Fly."

	para "#mon can avoid"
	line "attacks and deal"
	cont "damage the next"
	cont "turn."
	done

ChucksWifeChubbyText:
	text "Heheh!"

	para "Chuck will be"
	line "mine!"
	done

CianwoodCityYoungsterText:
	text "If you use a,"
	line "Pidgeot Call, you"

	para "can get back to"
	line "Olivine instantly."
	done

CianwoodCityPokefanMText:
	text "Boulders to the"
	line "north of town can"
	cont "be crushed."

	para "They may be hiding"
	line "something."

	para "You could use a"
	line "Golem Call to"
	cont "break them."

	para "I think I remember"
	line "hearing about a"
	cont "man in Mt.Mortar"
	cont "who gives them out"
	cont "to trainers."
	done

CianwoodCityLassText:
	text "The Wild Area on"
	line "Route 48 is great"
	cont "for catching"
	cont "#mon."

	para "I recommend check-"
	line "ing it out."
	done

CianwoodCityUnusedText:
	text "They're installing"
	line "fences in the"
	cont "Cliff's Edge Gate."

	para "We need to ensure"
	line "that no more"
	cont "injuries occur."
	done

CianwoodCitySignText:
	text "Cianwood City"

	para "A Port Surrounded"
	line "by Rough Seas"
	done

CianwoodGymSignText:
	text "Cianwood City"
	line "#mon Gym"

	para "Leader: Chigusa"

	para "The elegant danci-"
	line "ng fighter!"
	done

CianwoodPharmacySignText:
	text "500 Years of"
	line "Tradition"

	para "Cianwood City"
	line "Pharmacy"

	para "We Await Your"
	line "Medicinal Queries"
	done

CianwoodPhotoStudioSignText:
	text "Master of Fists"

	para "Teach your #mon"
	line "a punching move."
	done

CianwoodPokeSeerSignText:
	text "The # Seer"
	line "Ahead"
	done

CianwoodCity_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 17, 41, MANIAS_HOUSE, 1
	warp_event  8, 43, CIANWOOD_GYM, 1
	warp_event 23, 43, CIANWOOD_POKECENTER_1F, 1
	warp_event 15, 47, CIANWOOD_PHARMACY, 1
	warp_event  9, 31, CIANWOOD_PHOTO_STUDIO, 1
	warp_event 15, 37, CIANWOOD_LUGIA_SPEECH_HOUSE, 1
	warp_event  5, 17, POKE_SEERS_HOUSE, 1
	warp_event  4, 23, CLIFFS_EDGE_GATE, 1

	db 0 ; coord events

	db 8 ; bg events
	bg_event 20, 34, BGEVENT_READ, CianwoodCitySign
	bg_event  7, 45, BGEVENT_READ, CianwoodGymSign
	bg_event 24, 43, BGEVENT_READ, CianwoodPokecenterSign
	bg_event 19, 47, BGEVENT_READ, CianwoodPharmacySign
	bg_event  8, 32, BGEVENT_READ, CianwoodPhotoStudioSign
	bg_event  8, 24, BGEVENT_READ, CianwoodPokeSeerSign
	bg_event  4, 19, BGEVENT_ITEM, CianwoodCityHiddenRevive
	bg_event  5, 29, BGEVENT_ITEM, CianwoodCityHiddenMaxEther

	db 13 ; object events
	object_event 21, 37, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodCityYoungster, -1
	object_event 17, 33, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityPokefanM, -1
	object_event 12, 37, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodCityLassScript, -1
	object_event  8, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  9, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  5, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  5, 29, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 46, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
	object_event  4, 24, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CliffsEdgeGateGuardScript, EVENT_CLIFFS_EDGE_GATE_GUARD
	object_event 10, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, CianwoodCityItemBallScript, EVENT_CIANWOOD_CITY_ITEM_BALL
	object_event 18, 44, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ForestTrade, -1
