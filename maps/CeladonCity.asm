	object_const_def ; object_event constants
	const CELADONCITY_YOUNGSTER1
	const CELADONCITY_POLIWAG
	const CELADONCITY_FISHER
	const CELADONCITY_GRAMPS1
	const CELADONCITY_GRAMPS2
	const CELADONCITY_COOLTRAINER_F
	const CELADONCITY_TEACHER
	const CELADONCITY_DELINQUENT
	const CELADONCITY_BIKER
	const CELADONCITY_ROUGHNECK
	const CELADONCITY_BIKER2
	const CELADONCITY_BIKER3
	const CELADONCITY_ROUGHNECK2
	const CELADONCITY_DELINQUENT2

CeladonCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CELADON
	return

CeladonCityYoungster1Script:
	jumptextfaceplayer CeladonCityYoungster1Text

CeladonCityPoliwrath:
	refreshscreen
	pokepic POLIWAG
	cry POLIWAG
	waitbutton
	closepokepic
	opentext
	writetext CeladonCityPoliwrathText
	waitbutton
	closetext
	end

CeladonCityTeacher1Script:
	jumptextfaceplayer CeladonCityTeacher1Text

CeladonCityGramps1Script:
	jumptextfaceplayer CeladonCityGramps1Text

CeladonCityGramps2Script:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .CeladonCityGramps2
	jumptextfaceplayer CeladonCityGramps2Text

.CeladonCityGramps2:
	jumptextfaceplayer CeladonCityGramps3Text

CeladonCityCooltrainerFScript:
	jumptextfaceplayer CeladonCityCooltrainerFText

CeladonCityDelinquentScript:
	jumptextfaceplayer CeladonCityDelinquentText

CeladonCityDelinquent2Script:
	jumptextfaceplayer CeladonCityDelinquent2Text

CeladonCityBikerScript:
	jumptextfaceplayer CeladonCityBikerText

CeladonCityBiker2Script:
	jumptextfaceplayer CeladonCityBiker2Text

CeladonCityBiker3Script:
	jumptextfaceplayer CeladonCityBiker3Text

CeladonCityRoughneckScript:
	jumptextfaceplayer CeladonCityRoughneckText

CeladonCityGuardScript:
	jumptextfaceplayer CeladonCityGuardText

CeladonCitySign:
	jumptext CeladonCitySignText

CeladonGymSign:
	jumptext CeladonGymSignText

CeladonCityDeptStoreSign:
	jumptext CeladonCityDeptStoreSignText

CeladonCityMansionSign:
	jumptext CeladonCityMansionSignText

CeladonCityGameCornerSign:
	jumptext CeladonCityGameCornerSignText

CeladonCityTrainerTips:
	jumptext CeladonCityTrainerTipsText

CeladonCityFisherScript:
	jumptextfaceplayer CeladonCityFisherText

CeladonCityPokecenterSign:
	jumpstd pokecentersign

CeladonCityHiddenPpUp:
	hiddenitem PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

CeladonCityYoungster1Text:
	text "This Poliwag is my"
	line "partner."

	para "I wonder if it'll"
	line "ever evolve into a"
	cont "frog #mon."

	para "I've got a Water"
	line "Stone for it."
	done

CeladonCityFisherText:
	text "I'd like to do"
	line "my fire-breathing"
	cont "tricks for the"
	cont "people,"

	para "but I feel like"
	line "that would be"
	cont "insensitive,"

	para "given the events"
	line "of the last two"
	cont "years…"
	done

CeladonCityPoliwrathText:
	text "Poliwag: Poli!"
	done

CeladonCityTeacher1Text:
	text "Since the Feds are"
	line "gone, I hope I can"
	cont "start teaching"
	cont "again."
	done

CeladonCityGramps1Text:
	text "I had hoped I"
	line "would be safe from"
	cont "from the Feds."

	para "Looking at my"
	line "windows, it would"
	cont "appear not…"
	done

CeladonCityGramps2Text:
	text "The Feds are such"
	line "idiots!"

	para "This greenhouse is"
	line "protected by a"
	cont "tree that those"
	cont "morons can't seem"
	cont "to cut down!"
	done

CeladonCityGramps3Text:
	text "Nihihi! Now that"
	line "those Feds are"
	cont "gone, I can get"
	cont "back to looking"
	cont "at the ladies in"
	cont "the greenhouse!"
	done

CeladonCityCooltrainerFText:
	text "Our poor city was"
	line "hit hard…"

	para "It'll take a lot of"
	line "work to get this"
	cont "place back in good"
	cont "shape."
	done

CeladonCityDelinquentText:
	text "We smashed out the"
	line "windows in this"
	cont "city."

	para "Get in our way,"
	line "and we'll smash you"
	cont "too!"
	done

CeladonCityBikerText:
	text "This city is such"
	line "a dump!"

	para "…Oh yeah. That was"
	line "our fault. Heh!"
	done

CeladonCityBiker2Text:
	text "Whoo!"

	para "Feds rule!"

	para "This city is ours!"
	done

CeladonCitySignText:
	text "Celadon City"

	para "The City of"
	line "Rainbow Dreams"
	done

CeladonGymSignText:
	text "Celadon City"
	line "#mon Gym"
	cont "Leader: …"

	para "The rest of the"
	line "text is illegible…"

	para "Looks like there's"
	line "graffiti here…"

	para "Kanto Federation"
	line "hideout."

	para "Go away!"

	para "Feds rule!"
	done

CeladonCityDeptStoreSignText:
	text "Find What You"
	line "Need at Celadon"
	cont "Dept.Store!"
	done

CeladonCityMansionSignText:
	text "Celadon Mansion"
	done

CeladonCityGameCornerSignText:
	text "Celadon City"
	line "Botanical Garden"
	done

CeladonCityTrainerTipsText:
	text "Trainer Tips"

	para "Guard Spec."
	line "protects #mon"

	para "against Special"
	line "attacks such as"
	cont "fire and water."

	para "Get your items at"
	line "Celadon Dept."
	cont "Store!"
	done

CeladonCityGuardText:
	text "I'll beat the tar"
	line "outta you if you"
	cont "don't back off!"
	done

CeladonCityBiker3Text:
	text "Argh! That stupid"
	line "building over"
	cont "there is mocking"
	cont "us!"

	para "It's making me"
	line "mad!"

	para "We should smash"
	line "its windows!"

	para "If only we could"
	line "get over there…"
	done

CeladonCityRoughneckText:
	text "You like all the"
	line "graffiti?"

	para "I came up with the"
	line "design!"

	para "The boss loved it!"
	done

CeladonCityDelinquent2Text:
	text "You know, it's odd"
	line "to say, but I like"
	cont "walking amongst"
	cont "the dead trees."

	para "It's calming."
	done

CeladonCity_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event  4,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 16,  9, CELADON_MANSION_1F, 1
	warp_event 16,  3, CELADON_MANSION_1F, 3
	warp_event 17,  3, CELADON_MANSION_1F, 3
	warp_event 29,  9, CELADON_POKECENTER_1F, 1
	warp_event 20, 19, FED_HIDEOUT_1F, 1
	warp_event 10, 29, CELADON_GYM, 1
	warp_event 25, 29, CELADON_CAFE, 1

	db 0 ; coord events

	db 8 ; bg events
	bg_event 23, 21, BGEVENT_READ, CeladonCitySign
	bg_event 19, 21, BGEVENT_READ, CeladonGymSign
	bg_event  6,  9, BGEVENT_READ, CeladonCityDeptStoreSign
	bg_event 13,  9, BGEVENT_READ, CeladonCityMansionSign
	bg_event 11, 31, BGEVENT_READ, CeladonCityGameCornerSign
	bg_event 29, 21, BGEVENT_READ, CeladonCityTrainerTips
	bg_event 30,  9, BGEVENT_READ, CeladonCityPokecenterSign
	bg_event 37, 21, BGEVENT_ITEM, CeladonCityHiddenPpUp

	db 14 ; object events
	object_event 26, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster1Script, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 27, 11, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityPoliwrath, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 20, 24, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityFisherScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 14, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps1Script, -1
	object_event  8, 31, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps2Script, -1
	object_event  6, 14, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityCooltrainerFScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 24, 33, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher1Script, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 18, 13, SPRITE_DAISY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityDelinquentScript, EVENT_SAFFRON_CITY_FEDS
	object_event  7, 22, SPRITE_BIKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityBikerScript, EVENT_SAFFRON_CITY_FEDS
	object_event 20, 20, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCityGuardScript, EVENT_CELADON_CITY_GUARD
	object_event 29, 24, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityBiker2Script, EVENT_SAFFRON_CITY_FEDS
	object_event 16, 29, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCityBiker3Script, EVENT_SAFFRON_CITY_FEDS
	object_event  9, 10, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCityRoughneckScript, EVENT_SAFFRON_CITY_FEDS
	object_event  9,  2, SPRITE_DAISY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityDelinquent2Script, -1
