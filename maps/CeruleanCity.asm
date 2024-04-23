	object_const_def ; object_event constants
	const CERULEANCITY_BIKER
	const CERULEANCITY_SUPER_NERD
	const CERULEANCITY_SLOWPOKE
	const CERULEANCITY_DELINQUENT
	const CERULEANCITY_FISHER
	const CERULEANCITY_DAISY
	const CERULEANCITY_VIOLET
	const CERULEANCITY_LILY
	const CERULEANCITY_FISHER2

CeruleanCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN
	return

CeruleanCityBikerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SENSATIONAL_SISTERS
	iftrue .CeruleanCityBiker2
	writetext CeruleanCityBikerText1
	waitbutton
	closetext
	end

.CeruleanCityBiker2:
	writetext CeruleanCityBikerText2
	waitbutton
	closetext
	end

CeruleanCityPokefanMScript:
	jumptextfaceplayer CeruleanCityPokefanMText

CeruleanCityPokefanFScript:
	jumptextfaceplayer CeruleanCityPokefanFText

CeruleanCityDelinquentScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SENSATIONAL_SISTERS
	iftrue .CeruleanCityDelinquent2
	writetext CeruleanCityDelinquentText1
	waitbutton
	closetext
	end

.CeruleanCityDelinquent2:
	writetext CeruleanCityDelinquentText2
	waitbutton
	closetext
	end

CeruleanCityFisherScript:
	jumptextfaceplayer CeruleanCityFisherText

CeruleanCityDaisyScript:
	faceplayer
	opentext
	writetext CeruleanCityDaisyText
	waitbutton
	closetext
	clearevent EVENT_CERULEAN_GYM_DAISY
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear CERULEANCITY_DAISY
	appear CERULEANCITY_VIOLET
	pause 15
	special FadeInQuickly
	end

CeruleanCityVioletScript:
	faceplayer
	opentext
	writetext CeruleanCityVioletText
	waitbutton
	closetext
	clearevent EVENT_CERULEAN_GYM_VIOLET
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear CERULEANCITY_VIOLET
	appear CERULEANCITY_LILY
	pause 15
	special FadeInQuickly
	end

CeruleanCityLilyScript:
	faceplayer
	opentext
	writetext CeruleanCityLilyText
	waitbutton
	closetext
	clearevent EVENT_CERULEAN_GYM_LILY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear CERULEANCITY_LILY
	pause 15
	special FadeInQuickly
	end

CeruleanCitySign:
	jumptext CeruleanCitySignText

CeruleanGymSign:
	jumptext CeruleanGymSignText

CeruleanBikeShopSign:
	jumptext CeruleanBikeShopSignText

CeruleanPoliceSign:
	jumptext CeruleanPoliceSignText

CeruleanCapeSign:
	jumptext CeruleanCapeSignText

CeruleanLockedDoor:
	jumptext CeruleanLockedDoorText

CeruleanCityFisherScript2:
	jumptextfaceplayer CeruleanCityFisherText2

CeruleanOriginalGymSign:
	jumptext CeruleanOriginalGymText

CeruleanCityPokecenterSign:
	jumpstd pokecentersign

CeruleanCityMartSign:
	jumpstd martsign

CeruleanCityBikerText1:
	text "The pool's the"
	line "place to be!"

	para "I get a nice view"
	line "of the ladies!"
	done

CeruleanCityBikerText2:
	text "I'm not going to"
	line "the pool now."

	para "The kids there are"
	line "too tough."
	done

CeruleanCityPokefanMText:
	text "It feels good to"
	line "go outside!"

	para "It's been a"
	line "while!"
	done

CeruleanCityPokefanFText:
	text "Those young girls"
	line "will do great"
	cont "things for us!"

	para "I wish we had the"
	line "strength to take"
	cont "on the Feds"
	cont "ourselves."
	done

CeruleanCityDelinquentText1:
	text "That one Biker"
	line "always stares at"
	cont "me at the pool."

	para "I'm gonna clock"
	line "him if he keeps"
	cont "it up."
	done

CeruleanCityDelinquentText2:
	text "Those girls…"

	para "I think I"
	line "remember them."

	para "It's probably"
	line "time to skip"
	cont "town…"
	done

CeruleanCityFisherText:
	text "Looks like I can"
	line "start fishin'"
	cont "again!"

	para "Yeehaw!"
	done

CeruleanCityDaisyText:
	text "Daisy: Shhh!"

	para "I'm hiding from my"
	line "sisters!"

	para "…You wanna battle"
	line "us?"

	para "You want us to"
	line "fight the Feds?"

	para "Cool! I'll head to"
	line "the pool!"
	done

CeruleanCityVioletText:
	text "Violet: Go away!"

	para "We're playing hide"
	line "and seek!"

	para "…Wait, you think"
	line "I'm strong, and"
	cont "that I can take on"
	cont "the Federation?"

	para "Teehee, thanks!"

	para "So, you wanna"
	line "battle?"

	para "Alrighty!"

	para "Come to the pool"
	line "for the battle!"
	done

CeruleanCityLilyText:
	text "Lily: Eeeek!"

	para "…Oh, I'm sorry."

	para "I thought you were"
	line "someone else."

	para "C-can I help you?"

	para "…You think I can"
	line "fight the Feds?"

	para "…The Feds…"

	para "………………………………"

	para "…You know…"

	para "The Feds were the"
	line "who killed our"
	cont "parents…"

	para "My sisters try to"
	line "forget that day,"

	para "but I can't…"

	para "I want to make"
	line "them pay…"

	para "…I'll be at the"
	line "pool…"
	done

CeruleanCitySignText:
	text "Cerulean City"

	para "A Mysterious Blue"
	line "Aura Surrounds It"
	done

CeruleanGymSignText:
	text "Cerulean City"
	line "Pool."
	done

CeruleanBikeShopSignText:
	text "Miracle Bicycle"

	para "Trendsetter of the"
	line "Bicycle Boom!"
	done

CeruleanPoliceSignText:
	text "The Gym's been"
	line "burned down…"
	done

CeruleanOriginalGymText:
	text "Cerulean City"
	line "#mon Gym"
	cont "Leader: …"

	para "The rest of the"
	line "text is illegible…"
	done

CeruleanCapeSignText:
	text "Cerulean Cape"
	line "Ahead"
	done

CeruleanLockedDoorText:
	text "It's locked…"
	done

CeruleanCityFisherText2:
	text "Man, we got a lot"
	line "work to do fixing"
	cont "up this bridge…"
	done

CeruleanCity_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  7, 15, CERULEAN_GYM_BADGE_SPEECH_HOUSE, 1
	warp_event 13, 19, CERULEAN_TRADE_SPEECH_HOUSE, 1
	warp_event 19, 21, CERULEAN_POKECENTER_1F, 1
	warp_event 30, 23, CERULEAN_GYM, 1
	warp_event 25, 29, CERULEAN_MART, 2
	warp_event 14, 29, CERULEAN_BIKE_SHOP, 1

	db 0 ; coord events

	db 8 ; bg events
	bg_event 23, 23, BGEVENT_READ, CeruleanCitySign
	bg_event 27, 25, BGEVENT_READ, CeruleanGymSign
	bg_event 11, 29, BGEVENT_READ, CeruleanBikeShopSign
	bg_event 30, 17, BGEVENT_READ, CeruleanPoliceSign
	bg_event 23,  7, BGEVENT_READ, CeruleanCapeSign
	bg_event 20, 21, BGEVENT_READ, CeruleanCityPokecenterSign
	bg_event 26, 29, BGEVENT_READ, CeruleanCityMartSign
	bg_event 25, 17, BGEVENT_READ, CeruleanOriginalGymSign

	db 9 ; object events
	object_event 11, 23, SPRITE_BIKER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityBikerScript, EVENT_SAFFRON_CITY_FEDS
	object_event 23, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCityPokefanMScript, EVENT_CERULEAN_CITY_CIVILLIANS
	object_event  7, 27, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCityPokefanFScript, EVENT_CERULEAN_CITY_CIVILLIANS
	object_event 20, 25, SPRITE_DAISY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityDelinquentScript, EVENT_SAFFRON_CITY_FEDS
	object_event 30, 26, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityFisherScript, EVENT_CERULEAN_CITY_CIVILLIANS
	object_event 11, 10, SPRITE_SENSATIONAL_BLONDE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityDaisyScript, EVENT_CERULEAN_CITY_DAISY
	object_event  5, 33, SPRITE_SENSATIONAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityVioletScript, EVENT_CERULEAN_CITY_VIOLET
	object_event 27,  8, SPRITE_SENSATIONAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityLilyScript, EVENT_CERULEAN_CITY_LILY
	object_event 21,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityFisherScript2, EVENT_CERULEAN_CITY_CIVILLIANS
