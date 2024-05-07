	object_const_def ; object_event constants
	const VIRIDIANCITY_GRAMPS1
	const VIRIDIANCITY_GRAMPS2
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER
	const VIRIDIANCITY_BIKER1
	const VIRIDIANCITY_BIKER2

ViridianCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	return

ViridianCityCoffeeGramps:
	faceplayer
	opentext
	writetext ViridianCityCoffeeGrampsQuestionText
	yesorno
	iffalse .no
	writetext ViridianCityCoffeeGrampsBelievedText
	waitbutton
	closetext
	end

.no:
	writetext ViridianCityCoffeeGrampsDoubtedText
	waitbutton
	closetext
	end

ViridianCityBikerScript2:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GIOVANNI
	iftrue .ViridianCityAlternateBiker2
	writetext ViridianCityBikerText3
	waitbutton
	closetext
	end

.ViridianCityAlternateBiker2:
	writetext ViridianCityBikerText4
	waitbutton
	closetext
	end

ViridianCityBikerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GIOVANNI
	iftrue .ViridianCityAlternateBiker
	writetext ViridianCityBikerText
	waitbutton
	closetext
	end

.ViridianCityAlternateBiker:
	writetext ViridianCityBikerText2
	waitbutton
	closetext
	end

ViridianCityGrampsNearGym:
	faceplayer
	opentext
	checkevent EVENT_BEAT_GIOVANNI
	iftrue .BlueReturned
	writetext ViridianCityGrampsNearGymText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianCityGrampsNearGymBlueReturnedText
	waitbutton
	closetext
	end

ViridianCityDreamEaterFisher:
	jumptextfaceplayer ViridianCityDreamEaterFisherText

ViridianCityYoungsterScript:
	jumptextfaceplayer ViridianCityYoungsterText

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityWelcomeSign:
	jumptext ViridianCityWelcomeSignText

TrainerHouseSign:
	jumptext TrainerHouseSignText

ViridianCityPokecenterSign:
	jumpstd pokecentersign

ViridianCityMartSign:
	jumpstd martsign

ViridianCityCoffeeGrampsQuestionText:
	text "Hey, kid! I just"
	line "had a double shot"

	para "of espresso, and"
	line "I am wired!"

	para "I need to talk to"
	line "someone, so you'll"
	cont "have to do!"

	para "I might not look"
	line "like much now, but"

	para "I was an expert at"
	line "catching #mon."

	para "Do you believe me?"
	done

ViridianCityCoffeeGrampsBelievedText:
	text "Good, good. Yes, I"
	line "was something out"

	para "of the ordinary,"
	line "let me tell you!"

	para "Of course, with"
	line "this old knee of"
	cont "mine, I couldn't do"
	cont "anything against"
	cont "those Feds!"
	done

ViridianCityCoffeeGrampsDoubtedText:
	text "What? You little"
	line "whelp!"

	para "If I were just a"
	line "bit younger, I'd"

	para "show you a thing"
	line "or two. Humph!"
	done

ViridianCityGrampsNearGymText:
	text "Our city is so"
	line "small, the"

	para "Federation only"
	line "have Tweedle-dum"
	cont "and Tweedle-idiot"
	cont "over there."

	para "Wish there was a"
	line "Gym Leader to"
	cont "smack them up!"
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "Finally, the new"
	line "Leader is putting"
	cont "some fear into"
	cont "those morons!"

	para "It's funny…"

	para "I didn't realize"
	line "he owned this"
	cont "building."

	para "Wonder why he's"
	line "away so often?"
	done

ViridianCityDreamEaterFisherText:
	text "Yawn!"

	para "I must have dozed"
	line "off in the sun."

	para "…I had this dream"
	line "about a Drowzee"

	para "eating my dream."
	line "Weird, huh?"

	para "Oh well…"

	para "Back to sleep!"
	done

ViridianCityYoungsterText:
	text "I can go and see"
	line "Prof. Oak again"
	cont "now!"
	done

ViridianCitySignText:
	text "Viridian City"

	para "The Eternally"
	line "Green Paradise"
	done

ViridianGymSignText:
	text "Viridian City"
	line "#mon Gym"
	cont "Leader: …"

	para "The rest of the"
	line "text is illegible…"
	done

ViridianCityWelcomeSignText:
	text "Welcome to"
	line "Viridian City,"

	para "The Gateway to"
	line "Indigo Plateau"
	done

TrainerHouseSignText:
	text "Viridian City"
	line "Storage"

	para "See owner for"
	line "storage rentals."
	done

ViridianCityBikerText:
	text "Hey kid!"

	para "You should be"
	line "inside!"

	para "Outside is Fed"
	line "territory!"
	done

ViridianCityBikerText2:
	text "Oh no…"

	para "Viridian City has"
	line "a new Leader…"

	para "This isn't good…"
	done

ViridianCityBikerText3:
	text "Isn't my bike just"
	line "so cool?"

	para "Well, you can't"
	line "have it!"
	done

ViridianCityBikerText4:
	text "Maybe I should"
	line "sell my bike and"
	cont "skip town…"
	done

ViridianCity_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 32,  7, VIRIDIAN_GYM, 1
	warp_event 21,  9, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 17, 17, BGEVENT_READ, ViridianCitySign
	bg_event 21, 15, BGEVENT_READ, ViridianGymSign
	bg_event 19,  1, BGEVENT_READ, ViridianCityWelcomeSign
	bg_event 27,  7, BGEVENT_READ, TrainerHouseSign
	bg_event 24, 25, BGEVENT_READ, ViridianCityPokecenterSign
	bg_event 30, 19, BGEVENT_READ, ViridianCityMartSign

	db 6 ; object events
	object_event 18,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, EVENT_VIRIDIAN_CITY_CIVILLIANS
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, -1
	object_event  6, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, EVENT_VIRIDIAN_CITY_CIVILLIANS
	object_event 17, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungsterScript, EVENT_VIRIDIAN_CITY_CIVILLIANS
	object_event 12, 20, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityBikerScript2, EVENT_SAFFRON_CITY_FEDS
	object_event 21, 20, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityBikerScript, EVENT_SAFFRON_CITY_FEDS
