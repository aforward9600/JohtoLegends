	object_const_def ; object_event constants
	const GOLDENRODCITY_DIRECTOR
	const GOLDENRODCITY_COOLTRAINER_F3
	const GOLDENRODCITY_LASS2
	const GOLDENRODCITY_COOLTRAINER_F2
	const GOLDENRODCITY_YOUNGSTER2
	const GOLDENRODCITY_LASS
	const GOLDENRODCITY_GRAMPS
	const GOLDENRODCITY_BLACKBELT_1
	const GOLDENRODCITY_BLACKBELT_2
	const GOLDENRODCITY_GRAMPS2
	const GOLDENRODCITY_POKEFAN_M2
	const GOLDENRODCITY_COOLTRAINER_F
	const GOLDENRODCITY_OFFICER
	const GOLDENRODCITY_POKEFAN_M

GoldenrodCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPointAndFloria

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPointAndFloria:
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_REACHED_GOLDENROD
	return

GoldenrodCityPokefanMScript:
	jumptextfaceplayer GoldenrodCityPokefanMText

GoldenrodCityDirectorScript:
	faceplayer
	opentext
	checkevent EVENT_GOLDENROD_TOWER_TAKEOVER
	iftrue .RadioTower
	writetext MyPoorTowerText
	waitbutton
	closetext
	end

.RadioTower:
	writetext RadioTowerText
	waitbutton
	closetext
	end

GoldenrodCityCooltrainerF3Script:
	jumptextfaceplayer GoldenrodCityCooltrainerF3Text

GoldenrodCityLass2Script:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	checkevent EVENT_GOLDENROD_TOWER_TAKEOVER
	iftrue .CurrentlyInvaded
	writetext GoldenrodCityLassInvasionText
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext GoldenrodCityLass2Text_ClearedRadioTower
	waitbutton
	closetext
	end

.CurrentlyInvaded:
	writetext GoldenrodCityLass2Text
	waitbutton
	closetext
	end

GoldenrodCityCooltrainerF2Script:
	faceplayer
	opentext
	writetext GoldenrodCityCooltrainerF2Text
	waitbutton
	closetext
	end

GoldenrodCityYoungster2Script:
	jumptextfaceplayer GoldenrodCityYoungster2Text

GoldenrodCityLassScript:
	jumptextfaceplayer GoldenrodCityLassText

GoldenrodCityGrampsScript:
	jumptextfaceplayer GoldenrodCityGrampsText

GoldenrodCityBlackBelt1Script:
	faceplayer
	opentext
	writetext GoldenrodCityBlackBelt1Text
	waitbutton
	closetext
	turnobject GOLDENRODCITY_BLACKBELT_1, DOWN
	end

GoldenrodCityBlackBelt2Script:
	jumptextfaceplayer GoldenrodCityBlackBelt2Text

GoldenrodCityGramps2Script:
	jumptextfaceplayer GoldenrodCityGramps2Text

GoldenrodCityPokefanM2Script:
	jumptextfaceplayer GoldenrodCityPokefanM2Text

GoldenrodCityCooltrainerFScript:
	jumptextfaceplayer GoldenrodCityCooltrainerFText

GoldenrodCityOfficerScript:
	jumptextfaceplayer GoldenrodCityOfficerText

GoldenrodCityStationSign:
	jumptext GoldenrodCityStationSignText

GoldenrodCityRadioTowerSign:
	jumptext GoldenrodCityRadioTowerSignText

GoldenrodDeptStoreSign:
	jumptext GoldenrodDeptStoreSignText

GoldenrodGymSign:
	jumptext GoldenrodGymSignText

GoldenrodCitySign:
	jumptext GoldenrodCitySignText

GoldenrodCityBikeShopSign:
	jumptext GoldenrodCityBikeShopSignText

GoldenrodCityGameCornerSign:
	jumptext GoldenrodCityGameCornerSignText

GoldenrodCityNameRaterSign:
	jumptext GoldenrodCityNameRaterSignText

GoldenrodCityUndergroundSignNorth:
	jumptext GoldenrodCityUndergroundSignNorthText

GoldenrodCityUndergroundSignSouth:
	jumptext GoldenrodCityUndergroundSignSouthText

GoldenrodCityPokecenterSign:
	jumpstd pokecentersign

DirectorStopsYou:
	applymovement GOLDENRODCITY_DIRECTOR, DirectorStopsYouMovement
	turnobject PLAYER, DOWN
	opentext
	writetext PleaseHelpMyTowerText
	waitbutton
	closetext
	applymovement GOLDENRODCITY_DIRECTOR, DirectorStepsBackMovement
	turnobject GOLDENRODCITY_DIRECTOR, UP
	setscene SCENE_FINISHED
	end

DirectorStopsYouMovement:
	step LEFT
	step LEFT
	step UP
	step_end

DirectorStepsBackMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step_resume

GoldenrodCityPokefanMText:
	text "See that building"
	line "over there?"

	para "There's going to"
	line "be an underground"
	cont "path going to the"
	cont "north part of the"
	cont "city."

	para "It's going to be"
	line "a haven for ne're-"
	cont "do-wells, mark my"
	cont "words!"
	done

MyPoorTowerText:
	text "Oh, my poor tower."
	done

RadioTowerText:
	text "Soon, this tower"
	line "will be a radio"
	cont "tower, and the"
	cont "gift of radio will"
	cont "be available to"
	cont "all in Johto!"
	done

GoldenrodCityCooltrainerF3Text:
	text "Apparently there's"
	line "a black market for"

	para "evolution items"
	line "here in the city."

	para "But it's not the"
	line "easiest place to"
	cont "find."
	done

GoldenrodCityLassInvasionText:
	text "Now they can't"
	line "build the radio"
	cont "tower!"

	para "Someone needs to"
	line "help!"
	done

GoldenrodCityLass2Text:
	text "I can't wait for"
	line "the radio tower to"

	para "be complete!"

	para "Finally, I'll be"
	line "able to listen to"
	cont "my favorite songs"
	cont "on the go, like"

	para "Call Me Magby!"
	done

GoldenrodCityLass2Text_ClearedRadioTower:
	text "I hope the tower"
	line "incident doesn't"

	para "delay the const-"
	line "ruction..."
	done

GoldenrodCityCooltrainerF2Text:
	text "The Dept. Store"
	line "has almost any-"
	cont "thing you need."

	para "It's the largest"
	line "store in all of"
	cont "Johto!"
	done

GoldenrodCityYoungster2Text:
	text "The Gym Leader is"
	line "actually from the"
	cont "farm on Route 39."

	para "He's a tough dude."
	done

GoldenrodCityLassText:
	text "The man at that"
	line "house rates your"
	cont "#mon names."

	para "He can even rename"
	line "your #mon."
	done

GoldenrodCityGrampsText:
	text "This side of town"
	line "will be modernized"

	para "just like the East"
	line "side soon enough."

	para "This town used to"
	line "be so peaceful"
	cont "back in my day."
	done

GoldenrodCityBlackBelt1Text:
	text "Nobody is allowed"
	line "in the tower right"
	cont "now."

	para "We're planning on"
	line "starting the"
	cont "demolition soon."

	para "You may want to"
	line "steer clear."
	done

GoldenrodCityBlackBelt2Text:
	text "I...I couldn't do"
	line "anything."

	para "There were too"
	line "many of them."
	done

GoldenrodCityGramps2Text:
	text "What happened?"

	para "Why are we all"
	line "freaking out?"
	done

GoldenrodCityPokefanM2Text:
	text "See?"

	para "Ne'er-do-wells,"
	line "already causing"
	cont "havoc!"

	para "No one ever"
	line "listens to me!"
	done

GoldenrodCityCooltrainerFText:
	text "Oh no!"

	para "Where're the cops"
	line "when you need 'em?"
	done

GoldenrodCityOfficerText:
	text "Beat it, kid."

	para "I'm investigating"
	line "a potential crime"
	cont "here."

	para "See all these"
	line "flower petals?"

	para "That's littering,"
	line "and it's a crime!"

	para "I shall bring"
	line "these criminals to"
	cont "justice!"
	done

GoldenrodCityStationSignText:
	text "Goldenrod City"
	line "Police Station"
	done

GoldenrodCityRadioTowerSignText:
	text "Goldenrod City"
	line "Tower"
	done

GoldenrodDeptStoreSignText:
	text "Full Selection of"
	line "#mon Goods!"

	para "Goldenrod City"
	line "Dept.Store"
	done

GoldenrodGymSignText:
	text "Goldenrod City"
	line "#mon Gym"
	cont "Leader: Milton"

	para "The Rough and"
	line "Tough Wrangler!"
	done

GoldenrodCitySignText:
	text "Goldenrod City"

	para "The Festive City"
	line "of Opulent Charm"
	done

GoldenrodCityBikeShopSignText:
	text "Cops, keep out."
	done

GoldenrodCityGameCornerSignText:
	text "Your Playground!"

	para "Goldenrod City"
	line "Game Corner"
	done

GoldenrodCityNameRaterSignText:
	text "Name Rater"

	para "Get Your #mon"
	line "Nicknames Rated"
	done

GoldenrodCityUndergroundSignNorthText:
	text "Underground"
	line "Coming soon"
	done

GoldenrodCityUndergroundSignSouthText:
	text "Underground"
	line "Coming soon"
	done

PleaseHelpMyTowerText:
	text "Please trainer,"
	line "help me!"

	para "These people in"
	line "black uniforms"
	cont "have invaded my"
	cont "tower!"

	para "Not only can we"
	line "not begin demo-"
	cont "lition, but"
	cont "there's something"
	cont "on the top floor"
	cont "that I'm worried"
	cont "about!"

	para "There's an item"
	line "hidden on the top"
	cont "floor!"

	para "Please, get it"
	line "before they do!"
	done

GoldenrodCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event 24,  7, GOLDENROD_GYM, 1
	warp_event 29, 29, GOLDENROD_BIKE_SHOP, 1
	warp_event 31, 21, GOLDENROD_HAPPINESS_RATER, 1
	warp_event  5, 25, BILLS_FAMILYS_HOUSE, 1
	warp_event  9, 13, GOLDENROD_JAIL, 2
	warp_event 29,  5, GOLDENROD_FLOWER_SHOP, 1
	warp_event 33,  9, GOLDENROD_PP_SPEECH_HOUSE, 1
	warp_event 15,  7, GOLDENROD_NAME_RATER, 1
	warp_event 24, 27, GOLDENROD_DEPT_STORE_1F, 1
	warp_event 14, 21, GOLDENROD_GAME_CORNER, 1
	warp_event  5, 15, RADIO_TOWER_1F, 1
	warp_event 19,  1, ROUTE_35_GOLDENROD_GATE, 3
	warp_event 15, 27, GOLDENROD_POKECENTER_1F, 1

	db 1 ; coord events
	coord_event,  5, 16, SCENE_DEFAULT, DirectorStopsYou

	db 11 ; bg events
	bg_event 10, 14, BGEVENT_READ, GoldenrodCityStationSign
	bg_event  4, 17, BGEVENT_READ, GoldenrodCityRadioTowerSign
	bg_event 26, 27, BGEVENT_READ, GoldenrodDeptStoreSign
	bg_event 26,  9, BGEVENT_READ, GoldenrodGymSign
	bg_event 22, 18, BGEVENT_READ, GoldenrodCitySign
	bg_event 28, 30, BGEVENT_READ, GoldenrodCityBikeShopSign
	bg_event 16, 22, BGEVENT_READ, GoldenrodCityGameCornerSign
	bg_event 12,  7, BGEVENT_READ, GoldenrodCityNameRaterSign
	bg_event  8,  6, BGEVENT_READ, GoldenrodCityUndergroundSignNorth
	bg_event 12, 30, BGEVENT_READ, GoldenrodCityUndergroundSignSouth
	bg_event 16, 27, BGEVENT_UP, GoldenrodCityPokecenterSign

	db 14 ; object events
	object_event  7, 18, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityDirectorScript, EVENT_GOLDENROD_CITY_DIRECTOR
	object_event 30, 17, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF3Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12, 16, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityLass2Script, -1
	object_event 20, 26, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 19, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17, 10, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 11, 27, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityGrampsScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  5, 16, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityBlackBelt1Script, EVENT_GOLDENROD_CITY_GUARD_1
	object_event  6, 16, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityBlackBelt2Script, EVENT_GOLDENROD_CITY_GUARD_2
	object_event  8, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityGramps2Script, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 10, 18, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityPokefanM2Script, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 11, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerFScript, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 29,  7, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityOfficerScript, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event  7, 29, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityPokefanMScript, EVENT_GOLDENROD_CITY_CIVILIANS
