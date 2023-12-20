	object_const_def ; object_event constants
	const CELADONCITY_YOUNGSTER3
	const CELADONCITY_POLIWAG
	const CELADONCITY_TEACHER1
	const CELADONCITY_GRAMPS1
	const CELADONCITY_GRAMPS2
	const CELADONCITY_YOUNGSTER1
	const CELADONCITY_YOUNGSTER2
	const CELADONCITY_TEACHER2
	const CELADONCITY_BIKER

CeladonCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CELADON
	return

CeladonCityFisherScript:
	jumptextfaceplayer CeladonCityFisherText

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

CeladonCityYoungster1Script:
	jumptextfaceplayer CeladonCityYoungster1Text

CeladonCityYoungster2Script:
	jumptextfaceplayer CeladonCityYoungster2Text

CeladonCityTeacher2Script:
	jumptextfaceplayer CeladonCityTeacher2Text

CeladonCityBikerScript:
	jumptextfaceplayer CeladonCityBikerText

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

CeladonCityPokecenterSign:
	jumpstd pokecentersign

CeladonCityHiddenPpUp:
	hiddenitem PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

CeladonCityFisherText:
	text "This Poliwag is my"
	line "partner."

	para "I wonder if it'll"
	line "ever evolve into a"
	cont "frog #mon."

	para "I've got a Water"
	line "Stone for it."
	done

CeladonCityPoliwrathText:
	text "Poliwag: Poli!"
	done

CeladonCityTeacher1Text:
	text "I lost at the slot"
	line "machines again…"

	para "We girls also play"
	line "the slots now."

	para "You should check"
	line "them out too."
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

CeladonCityYoungster1Text:
	text "Want to know a"
	line "secret?"

	para "CELADON MANSION"
	line "has a hidden back"
	cont "door."
	done

CeladonCityYoungster2Text:
	text "They're holding an"
	line "eating contest at"
	cont "the restaurant."

	para "Just watching them"
	line "go at it makes me"
	cont "feel bloated…"
	done

CeladonCityTeacher2Text:
	text "CELADON DEPT.STORE"
	line "has the biggest"

	para "and best selection"
	line "of merchandise."

	para "If you can't get"
	line "it there, you"

	para "can't get it any-"
	line "where."

	para "Gee… I sound like"
	line "a sales clerk."
	done

CeladonCityBikerText:
	text "This city is such"
	line "a dump!"

	para "…Oh yeah. That was"
	line "our fault. Heh!"
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

	db 9 ; object events
	object_event 26, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityFisherScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 27, 11, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityPoliwrath, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 20, 24, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher1Script, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 14, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps1Script, -1
	object_event  8, 31, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps2Script, -1
	object_event 18, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster1Script, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 24, 33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster2Script, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  6, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher2Script, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event  7, 22, SPRITE_BIKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityBikerScript, EVENT_SAFFRON_CITY_FEDS
