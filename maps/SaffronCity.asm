	object_const_def ; object_event constants
	const SAFFRONCITY_SUPER_NERD
	const SAFFRONCITY_YOUNGSTER
	const SAFFRONCITY_COOLTRAINER_M
	const SAFFRONCITY_COOLTRAINER_F
	const SAFFRONCITY_BIKER3
	const SAFFRONCITY_BIKER1
	const SAFFRONCITY_BIKER2
	const SAFFRONCITY_LASS2
	const SAFFRONCITY_BLACK_BELT
	const SAFFRONCITY_DELINQUENT
	const SAFFRONCITY_ROUGHNECK
	const SAFFRONCITY_DELINQUENT2
	const SAFFRONCITY_ROUGHNECK2
	const SAFFRONCITY_LASS1
	const SAFFRONCITY_POKEFAN_F

SaffronCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SAFFRON
	return

SaffronCitySuperNerdScript:
	jumptextfaceplayer SaffronCitySuperNerdText

SaffronCityYoungsterScript:
	jumptextfaceplayer SaffronCityYoungsterText

SaffronCityCooltrainerMScript:
	jumptextfaceplayer SaffronCityCooltrainerMText

SaffronCityCooltrainerFScript:
	jumptextfaceplayer SaffronCityCooltrainerFText

SaffronCityBiker3Script:
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronCityBiker3After
	jumptextfaceplayer SaffronCityBiker3Text

.SaffronCityBiker3After:
	jumptextfaceplayer SaffronCityBiker3Text2

SaffronCityBiker1Script:
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronCityBiker1After
	jumptextfaceplayer SaffronCityBiker1Text

.SaffronCityBiker1After:
	jumptextfaceplayer SaffronCityBiker1Text2

SaffronCityBiker2Script:
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronCityBiker2After
	jumptextfaceplayer SaffronCityBiker2Text

.SaffronCityBiker2After:
	jumptextfaceplayer SaffronCityBiker2Text2

SaffronCityDelinquentScript:
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronCityDelinquentAfter
	jumptextfaceplayer SaffronCityDelinquentText

.SaffronCityDelinquentAfter:
	jumptextfaceplayer SaffronCityDelinquentText2

SaffronCityDelinquent2Script:
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronCityDelinquent2After
	jumptextfaceplayer SaffronCityDelinquent2Text

.SaffronCityDelinquent2After:
	jumptextfaceplayer SaffronCityDelinquent2Text2

SaffronCityRoughneckScript:
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronCityRoughneckAfter
	jumptextfaceplayer SaffronCityRoughneckText

.SaffronCityRoughneckAfter:
	jumptextfaceplayer SaffronCityRoughneckText2

SaffronCityRoughneck2Script:
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronCityRoughneck2After
	jumptextfaceplayer SaffronCityRoughneck2Text

.SaffronCityRoughneck2After:
	jumptextfaceplayer SaffronCityRoughneck2Text2

SaffronCityLass2Script:
	jumptextfaceplayer SaffronCityLass2Text

SaffronCityBlackBeltScript:
	jumptextfaceplayer SaffronCityBlackBeltText

SaffronCityLass1Script:
	jumptextfaceplayer SaffronCityLass1Text

SaffronCityPokefanFScript:
	jumptextfaceplayer SaffronCityPokefanFText

SaffronCitySign:
	jumptext SaffronCitySignText

SaffronGymSign:
	jumptext SaffronGymSignText

FightingDojoSign:
	jumptext FightingDojoSignText

SilphCoSign:
	jumptext SilphCoSignText

MrPsychicsHouseSign:
	jumptext MrPsychicsHouseSignText

SaffronCityPokecenterSign:
	jumpstd pokecentersign

SaffronCityMartSign:
	jumpstd martsign

SaffronCitySuperNerdText:
	text "I can finally re-"
	line "start my social"
	cont "experiments!"
	done

SaffronCityYoungsterText:
	text "Yay! Fresh air!"
	done

SaffronCityCooltrainerMText:
	text "About time Koichi"
	line "found his spine"
	cont "again!"
	done

SaffronCityCooltrainerFText:
	text "That Sabrina is"
	line "tough!"

	para "She'll make a"
	line "great Gym Leader"
	cont "and do our city"
	cont "proud!"
	done

SaffronCityBiker3Text:
	text "This town is our"
	line "Cloyster, and all"
	cont "the people are our"
	cont "Clamperls!"
	done

SaffronCityBiker3Text2:
	text "I got my butt"
	line "kicked earlier by"
	cont "some kid!"

	para "We were the kings"
	line "here!"

	para "Stupid Gym Leaders"
	line "and them inspiring"
	cont "people!"
	done

SaffronCityBiker1Text:
	text "Heheheheh!"

	para "Just waitin' for"
	line "the blackmail"
	cont "money!"

	para "Come to papa!"

	para "…Hey!"

	para "You're not the one"
	line "with the goods!"

	para "Get outta here!"
	done

SaffronCityBiker1Text2:
	text "This ain't good…"

	para "Silph ain't paying"
	line "us anymore…"

	para "What am I gonna"
	line "tell the boss?"
	done

SaffronCityBiker2Text:
	text "Brapapapap!"

	para "Screeeeech!"

	para "Move it or lose"
	line "it, loser!"
	done

SaffronCityBiker2Text2:
	text "You're not gonna"
	line "arrest me for"
	cont "disturbing the"
	cont "peace, are ya?"
	done

SaffronCityLass2Text:
	text "It feels so good"
	line "to have our city"
	cont "back!"
	done

SaffronCitySignText:
	text "Saffron City"

	para "Shining, Golden"
	line "Land of Commerce"
	done

SaffronGymSignText:
	text "Saffron City"
	line "#mon Gym"
	cont "Leader: Koichi"

	para "The Master of"
	line "Fighting #mon!"
	done

FightingDojoSignText:
	text "Psychic Institute"

	para "Train your mind."
	done

SilphCoSignText:
	text "Silph Co."
	line "Office Building"
	done

MrPsychicsHouseSignText:
	text "Mr. Psychic's"
	line "House"
	done

SaffronCityBlackBeltText:
	text "I was told by Gym"
	line "Leader Koichi to"
	cont "not let anyone"
	cont "into the Psychic"
	cont "Institute."

	para "No idea, why."

	para "I'm just doing my"
	line "duty."

	para "Go to the Gym if"
	line "you want to talk"
	cont "with the Leader."
	done

SaffronCityDelinquentText:
	text "I wish I was in"
	line "Celadon City"
	cont "instead."

	para "At least they have"
	line "a department store"
	cont "there!"
	done

SaffronCityDelinquentText2:
	text "I should probably"
	line "buy some plain"
	cont "clothes and get"
	cont "out of here…"
	done

SaffronCityRoughneckText:
	text "Koichi was such a"
	line "joke!"

	para "Dude gave up 'fore"
	line "we even started!"

	para "Pathetic!"
	done

SaffronCityRoughneckText2:
	text "Koichi was one"
	line "thing, but this"
	cont "Sabrina sounds"
	cont "like trouble…"
	done

SaffronCityDelinquent2Text:
	text "This big building"
	line "is off-limits"
	cont "according to the"
	cont "boss."

	para "I'm bored!"
	done

SaffronCityDelinquent2Text2:
	text "I wasn't planning"
	line "on doing anything,"
	cont "I swear!"
	done

SaffronCityRoughneck2Text:
	text "All the people are"
	line "holed up in their"
	cont "houses!"

	para "Heh! They're all"
	line "scared of us!"

	para "Just goes to show:"

	para "You don't mess with"
	line "the Feds!"
	done

SaffronCityRoughneck2Text2:
	text "Please don't hurt"
	line "me!"
	done

SaffronCityLass1Text:
	text "I think there"
	line "should be a fan"
	cont "club for famous"
	cont "trainers here."

	para "Don't you think"
	line "that's a good"
	cont "idea!"
	done

SaffronCityPokefanFText:
	text "I'll be able to"
	line "meet up with my"
	cont "friends and gossip"
	cont "again!"

	para "It feels so good"
	line "to be free again!"
	done

SaffronCity_MapEvents:
	db 0, 0 ; filler

	db 14 ; warp events
	warp_event 26,  3, FIGHTING_DOJO, 1
	warp_event 34,  3, SAFFRON_GYM, 1
	warp_event 25, 11, SAFFRON_MART, 2
	warp_event  9, 29, SAFFRON_POKECENTER_1F, 1
	warp_event 27, 29, MR_PSYCHICS_HOUSE, 1
	warp_event 18, 21, SILPH_CO_1F, 1
	warp_event  9,  3, COPYCATS_HOUSE_1F, 1
	warp_event 18,  3, ROUTE_5_SAFFRON_GATE, 3
	warp_event  0, 24, ROUTE_7_SAFFRON_GATE, 3
	warp_event  0, 25, ROUTE_7_SAFFRON_GATE, 4
	warp_event 16, 33, ROUTE_6_SAFFRON_GATE, 1
	warp_event 17, 33, ROUTE_6_SAFFRON_GATE, 2
	warp_event 39, 22, ROUTE_8_SAFFRON_GATE, 1
	warp_event 39, 23, ROUTE_8_SAFFRON_GATE, 2

	db 0 ; coord events

	db 7 ; bg events
	bg_event 21,  5, BGEVENT_READ, SaffronCitySign
	bg_event 25,  5, BGEVENT_READ, SaffronGymSign
	bg_event 33,  5, BGEVENT_READ, FightingDojoSign
	bg_event 15, 21, BGEVENT_READ, SilphCoSign
	bg_event 25, 29, BGEVENT_READ, MrPsychicsHouseSign
	bg_event 10, 29, BGEVENT_READ, SaffronCityPokecenterSign
	bg_event 26, 11, BGEVENT_READ, SaffronCityMartSign

	db 15 ; object events
	object_event  7, 14, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCitySuperNerdScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 19, 30, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungsterScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 20, 24, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerMScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 32,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerFScript, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 28, 14, SPRITE_BIKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityBiker3Script, EVENT_SAFFRON_CITY_FEDS
	object_event 15, 16, SPRITE_BIKER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronCityBiker1Script, EVENT_SAFFRON_CITY_FEDS
	object_event 35, 22, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityBiker2Script, EVENT_SAFFRON_CITY_FEDS
	object_event 19,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityLass2Script, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 34,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityBlackBeltScript, EVENT_SAFFRON_CITY_BLACK_BELT
	object_event  6,  5, SPRITE_DAISY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityDelinquentScript, EVENT_SAFFRON_CITY_FEDS
	object_event 22, 30, SPRITE_ROUGHNECK, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SaffronCityRoughneckScript, EVENT_SAFFRON_CITY_FEDS
	object_event 16, 25, SPRITE_DAISY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityDelinquent2Script, EVENT_SAFFRON_CITY_FEDS
	object_event  3, 21, SPRITE_ROUGHNECK, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, SaffronCityRoughneck2Script, EVENT_SAFFRON_CITY_FEDS
	object_event 33, 14, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityLass1Script, EVENT_SAFFRON_CITY_CIVILLIANS
	object_event 30, 24, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SaffronCityPokefanFScript, EVENT_SAFFRON_CITY_CIVILLIANS
