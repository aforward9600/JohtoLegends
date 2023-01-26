	object_const_def ; object_event constants
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_MOTHER
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3

EcruteakCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ECRUTEAK_MOTHER

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	return

EcruteakCityGramps1Script:
	faceplayer
	opentext
	checkevent EVENT_TIN_TOWER_TAKEOVER
	iftrue .Toldyou
	writetext EcruteakCityGramps1Text
	waitbutton
	closetext
	end

.Toldyou:
	writetext EcruteakCityGrampsToldYouText
	waitbutton
	closetext
	end

EcruteakCityGramps2Script:
	jumptextfaceplayer EcruteakCityGramps2Text

EcruteakCityGramps3Script:
	jumptextfaceplayer EcruteakCityGramps3Text

EcruteakCityLass1Script:
	jumptextfaceplayer EcruteakCityLass1Text

EcruteakCityMotherScript:
	faceplayer
	opentext
	writetext EcruteakCityMotherText
	waitbutton
	closetext
	end

EcruteakCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_TIN_TOWER_TAKEOVER
	iftrue .CalmDown
	writetext EcruteakCityFisherText
	waitbutton
	closetext
	end

.CalmDown:
	writetext EcruteakCityFisherText_CalmDown
	waitbutton
	closetext
	end

EcruteakCityYoungsterScript:
	jumptextfaceplayer EcruteakCityYoungsterText

EcruteakCitySign:
	jumptext EcruteakCitySignText

EcruteakGymSign:
	jumptext EcruteakGymSignText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokecenterSign:
	jumpstd pokecentersign

EcruteakCityMartSign:
	jumpstd martsign

EcruteakCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION

EcruteakCityMotherWalks:
	applymovement ECRUTEAKCITY_MOTHER, EcruteakMotherWalksMovement
	turnobject PLAYER, RIGHT
	opentext
	writetext ThankYouForSavingDaughterText
	buttonsound
	verbosegiveitem TM_CALM_MIND
	iffalse .BagFull
	writetext ThatsCalmMindText
	waitbutton
	closetext
	applymovement ECRUTEAKCITY_MOTHER, EcruteakMotherWalksAwayMovement
	disappear ECRUTEAKCITY_MOTHER
	setevent EVENT_ECRUTEAK_CITY_MOTHER
	clearevent EVENT_AFTER_RESCUING_BURNED_TOWER_GIRL
	setscene SCENE_DEFAULT
	end

.BagFull:
	closetext
	end

EcruteakMotherWalksMovement:
	step UP
	step UP
	step LEFT
	step_end

EcruteakMotherWalksAwayMovement:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step_end

EcruteakCityMotherText:
	text "Oh, no. Oh, no…"

	para "My daughter is"
	line "missing."

	para "No… She couldn't"
	line "have gone to the"
	cont "Burned Tower."

	para "I told her not to"
	line "go near it…"

	para "People seem to"
	line "disappear there…"

	para "Oh, what should I"
	line "do…?"
	done

EcruteakCityGramps1Text:
	text "It's true!"

	para "I saw them!"

	para "They're here to"
	line "take our Clefairy"
	cont "away!"

	para "I won't give up"
	line "without a fight!"
	done

EcruteakCityGramps2Text:
	text "Ah, child."
	line "Have you learned"

	para "to dance like Rui"
	line "the Kimono Girl?"

	para "If you go to their"
	line "Dance Theater, an"

	para "odd old man will"
	line "give you something"
	cont "nice, I hear."
	done

EcruteakCityLass1Text:
	text "It's always so"
	line "peaceful here."

	para "I love it."
	done

EcruteakCityLass2Text:
	text "The tower that"
	line "used to be here…"

	para "My grandma told me"
	line "it used to be much"
	cont "taller."
	done

EcruteakCityLass2Text_ReleasedBeasts:
	text "Three big #MON"
	line "ran off in differ-"
	cont "ent directions."
	cont "What were they?"
	done

EcruteakCityFisherText:
	text "My grandfather"
	line "says he's seen men"
	cont "in black recently."

	para "He says they're"
	line "here to take our"
	cont "Clefairy back to"

	para "some secret base."

	para "Don't mind him."
	line "He also thinks the"
	cont "League has been"

	para "putting chemicals"
	line "in the water that"
	cont "changes the mating"

	para "patterns of the"
	line "Politoed."
	done

EcruteakCityFisherText_CalmDown:
	text "Calm down,"
	line "Grandpa!"

	para "Maybe they're just"
	line "here to inspect"
	cont "the tower?"
	done

EcruteakCityYoungsterText:
	text "The second floor"
	line "of the Burned"
	cont "Tower looks like"

	para "it will collapse"
	line "any time now."
	done

EcruteakCityGramps3Text:
	text "Eusine and Morty"
	line "have been found."

	para "Thank goodness."
	done

ThankYouForSavingDaughterText:
	text "Oh, you're the one"
	line "who rescued my"
	cont "little girl!"

	para "Thank you so much!"

	para "I don't know how"
	line "I can repay you!"

	para "Here, have this!"
	done

ThatsCalmMindText:
	text "That's Calm Mind!"

	para "It raises the"
	line "Special Attack and"
	cont "Special Defense of"

	para "the user!"

	para "I thought of that"
	line "since you put my"
	cont "mind at rest!"

	para "Please, come visit"
	line "us at any time!"
	done

EcruteakCitySignText:
	text "Ecruteak City"
	line "A Historical City"

	para "Where the Past"
	line "Meets the Present"
	done

EcruteakGymSignText:
	text "Ecruteak City"
	line "#mon Gym"
	cont "Leader: Enoki"

	para "The Terrifying"
	line "Ghost user"
	done

EcruteakDanceTheaterSignText:
	text "Ecruteak Dance"
	line "Theater"
	done

BurnedTowerSignText:
	text "Burned Tower"

	para "It was destroyed"
	line "by a mysterious"
	cont "fire."

	para "Please stay away,"
	line "as it is unsafe."
	done

EcruteakCityGrampsToldYouText:
	text "See?! I told you!"

	para "They're here for"
	line "our Clefairy!"

	para "I'm not going down"
	line "without a fight,"
	cont "you hooligans!"
	done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	db 13 ; warp events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 18, 11, ECRUTEAK_TIN_TOWER_ENTRANCE, 1
	warp_event  0, 18, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 19, ROUTE_38_ECRUTEAK_GATE, 4
	warp_event 23, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 21, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 21, DANCE_THEATRE, 1
	warp_event 29, 21, ECRUTEAK_MART, 2
	warp_event  6, 27, ECRUTEAK_GYM, 1
	warp_event 13, 27, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event  5, 16, ECRUTEAK_MOVE_TUTOR_HOUSE, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1

	db 1 ; coord events
	coord_event  5,  7, SCENE_ECRUTEAK_MOTHER, EcruteakCityMotherWalks

	db 7 ; bg events
	bg_event 15, 21, BGEVENT_READ, EcruteakCitySign
	bg_event  8, 28, BGEVENT_READ, EcruteakGymSign
	bg_event 21, 21, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event  2, 10, BGEVENT_READ, BurnedTowerSign
	bg_event 24, 27, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 30, 21, BGEVENT_READ, EcruteakCityMartSign
	bg_event 23, 14, BGEVENT_ITEM, EcruteakCityHiddenHyperPotion

	db 7 ; object events
	object_event 18, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps1Script, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps2Script, -1
	object_event 30, 16, SPRITE_PICNICKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass1Script, -1
	object_event  7,  9, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityMotherScript, EVENT_ECRUTEAK_CITY_MOTHER
	object_event 19, 15, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 11, 20, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityYoungsterScript, -1
	object_event  3,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps3Script, EVENT_ECRUTEAK_CITY_GRAMPS
