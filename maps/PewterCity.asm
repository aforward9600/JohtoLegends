	object_const_def ; object_event constants
	const PEWTERCITY_LASS
	const PEWTERCITY_BUG_CATCHER
	const PEWTERCITY_GRAMPS
	const PEWTERCITY_DELINQUENT
	const PEWTERCITY_BIKER
	const PEWTERCITY_SCHOOLBOY
	const PEWTERCITY_FRUIT_TREE1
	const PEWTERCITY_FRUIT_TREE2

PewterCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PEWTER
	return

PewterCityCooltrainerFScript:
	jumptextfaceplayer PewterCityCooltrainerFText

PewterCityBugCatcherScript:
	jumptextfaceplayer PewterCityBugCatcherText

PewterCitySchoolboyScript:
	jumptextfaceplayer PewterCitySchoolboyText

PewterCityGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .GotSilverWing
	writetext PewterCityGrampsText
	waitbutton
	closetext
	end

.GotSilverWing:
	writetext PewterCityGrampsText_GotSilverWing
	waitbutton
	closetext
	end

PewterCityDelinquentScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterCityDelinquentAfter
	writetext PewterCityDelinquentText1
	waitbutton
	closetext
	end

.PewterCityDelinquentAfter:
	writetext PewterCityDelinquentText2
	waitbutton
	closetext
	end

PewterCityBikerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterCityBikerAfter
	writetext PewterCityBikerText1
	waitbutton
	closetext
	end

.PewterCityBikerAfter:
	writetext PewterCityBikerText2
	waitbutton
	closetext
	end

PewterCitySign:
	jumptext PewterCitySignText

PewterGymSign:
	jumptext PewterGymSignText

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterCityMtMoonGiftShopSign:
	jumptext PewterCityMtMoonGiftShopSignText

PewterCityWelcomeSign:
	jumptext PewterCityWelcomeSignText

PewterCityPokecenterSign:
	jumpstd pokecentersign

PewterCityMartSign:
	jumpstd martsign

PewterCityFruitTree1:
	fruittree FRUITTREE_PEWTER_CITY_1

PewterCityFruitTree2:
	fruittree FRUITTREE_PEWTER_CITY_2

PewterCityCooltrainerFText:
	text "I think we should"
	line "restore the old"
	cont "Gym."

	para "Maybe make it into"
	line "a museum."
	done

PewterCityBugCatcherText:
	text "My… my garden…"

	para "Those Feds…"

	para "They used Sludge"
	line "on my beautiful"
	cont "flowers…"

	para "I… I'd make them"
	line "pay,"
	
	para "if I was strong"
	line "enough…"
	done

PewterCityBugCatcherText2:
	text "The Feds are gone,"
	line "but my garden is"
	cont "still ruined…"

	para "It's gonna take"
	line "years to fix"
	cont "this!"
	done

PewterCityGrampsText:
	text "The Feds don't"
	line "harass old-timers"
	cont "like me often."

	para "I suppose they"
	line "don't see any sport"
	cont "in it."
	done

PewterCityGrampsText_GotSilverWing:
	text "Flint has come"
	line "back to us."

	para "Some people may be"
	line "a little miffed at"
	cont "him for disappear-"

	para "ing like that."

	para "He's here now, and"
	line "that's all that"
	cont "matters."
	done

PewterCitySignText:
	text "Pewter City"
	line "A Stone Gray City"
	done

PewterGymSignText:
	text "Pewter City"
	line "#mon Gym"
	cont "Leader: …"

	para "The rest of the"
	line "text is illegible…"
	done

PewterMuseumSignText:
	text "Pewter City Quarry"

	para "Caution: Heavy"
	line "rocks may cause"
	cont "injury."
	done

PewterCityMtMoonGiftShopSignText:
	text "Mt.Moon ahead."
	done

PewterCityWelcomeSignText:
	text "Welcome To"
	line "Pewter City!"

	para "There's a little"
	line "graffiti here…"

	para "Feds Rule!"
	done

PewterCityDelinquentText1:
	text "Look at me funny,"
	line "and you're heading"
	cont "to the hospital!"
	done

PewterCityDelinquentText2:
	text "Hey, how's it"
	line "going?"
	done

PewterCityBikerText1:
	text "Look at the old"
	line "gym here."

	para "Hehehe!"

	para "That was our"
	line "handiwork!"

	para "The Leader fled"
	line "like a coward!"

	para "We aren't even"
	line "bothering to look"
	cont "for him!"

	para "He's not a threat!"
	done

PewterCityBikerText2:
	text "Flint's back?"

	para "Uh-oh…"

	para "We can't handle him"
	line "on our own…"
	done

PewterCitySchoolboyText:
	text "I don't think it"
	line "will be long"
	cont "before we can"
	cont "restore the city."
	done

PewterCity_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 29, 13, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 16, 17, PEWTER_GYM, 1
	warp_event 23, 17, PEWTER_MART, 2
	warp_event 13, 25, PEWTER_POKECENTER_1F, 1
	warp_event  7, 29, PEWTER_SNOOZE_SPEECH_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 25, 23, BGEVENT_READ, PewterCitySign
	bg_event 15,  9, BGEVENT_READ, PewterGymSign
	bg_event 11, 17, BGEVENT_READ, PewterMuseumSign
	bg_event 33, 19, BGEVENT_READ, PewterCityMtMoonGiftShopSign
	bg_event 19, 29, BGEVENT_READ, PewterCityWelcomeSign
	bg_event 14, 25, BGEVENT_READ, PewterCityPokecenterSign
	bg_event 24, 17, BGEVENT_READ, PewterCityMartSign

	db 8 ; object events
	object_event 20, 16, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityCooltrainerFScript, EVENT_PEWTER_CITY_CIVILLIANS
	object_event 26, 27, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityBugCatcherScript, -1
	object_event 31, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	object_event 13, 29, SPRITE_DAISY, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityDelinquentScript, EVENT_SAFFRON_CITY_FEDS
	object_event  8,  4, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityBikerScript, EVENT_SAFFRON_CITY_FEDS
	object_event 32, 26, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCitySchoolboyScript, EVENT_PEWTER_CITY_CIVILLIANS
	object_event 32,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree1, -1
	object_event 30,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree2, -1
