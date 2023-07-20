	object_const_def ; object_event constants
	const CERULEANCITY_COOLTRAINER_M
	const CERULEANCITY_SUPER_NERD
	const CERULEANCITY_SLOWPOKE
	const CERULEANCITY_COOLTRAINER_F
	const CERULEANCITY_FISHER
	const CERULEANCITY_DAISY
	const CERULEANCITY_VIOLET
	const CERULEANCITY_LILY

CeruleanCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CERULEAN
	return

CeruleanCityCooltrainerMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext CeruleanCityCooltrainerMText1
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext CeruleanCityCooltrainerMText2
	waitbutton
	closetext
	end

CeruleanCitySuperNerdScript:
	jumptextfaceplayer CeruleanCitySuperNerdText

CeruleanCitySlowbro:
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	end

CeruleanCityCooltrainerFScript:
	faceplayer
	opentext
	writetext CeruleanCityCooltrainerFText1
	waitbutton
	closetext
	turnobject CERULEANCITY_COOLTRAINER_F, LEFT
	opentext
	writetext CeruleanCityCooltrainerFText2
	waitbutton
	closetext
	opentext
	writetext CeruleanCitySlowbroText
	cry SLOWBRO
	waitbutton
	closetext
	opentext
	writetext CeruleanCityCooltrainerFText3
	waitbutton
	closetext
	end

CeruleanCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	iftrue .MetCeruleanRocket
.ReturnedMachinePart:
	writetext CeruleanCityFisherText
	waitbutton
	closetext
	end

.MetCeruleanRocket:
	writetext CeruleanCityFisherRocketTipText
	waitbutton
	closetext
	end

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

CeruleanOriginalGymSign:
	jumptext CeruleanOriginalGymText

CeruleanCityPokecenterSign:
	jumpstd pokecentersign

CeruleanCityMartSign:
	jumpstd martsign

CeruleanCityHiddenBerserkGene:
	hiddenitem BERSERK_GENE, EVENT_FOUND_BERSERK_GENE_IN_CERULEAN_CITY

CeruleanCityCooltrainerMText1:
	text "KANTO's POWER"
	line "PLANT?"

	para "It's near the end"
	line "of ROUTE 9, the"

	para "road that heads"
	line "east from here."

	para "I think there was"
	line "an accident of"
	cont "some sort there."
	done

CeruleanCityCooltrainerMText2:
	text "You're collecting"
	line "every single kind"
	cont "of #MON?"

	para "That must be quite"
	line "a challenge, but"
	cont "it sounds fun too."
	done

CeruleanCitySuperNerdText:
	text "The CAPE in the"
	line "north is a good"

	para "place for dates."
	line "Girls like it!"
	done

CeruleanCitySlowbroText:
	text "SLOWBRO: Yarah?"
	done

CeruleanCityCooltrainerFText1:
	text "My SLOWBRO and I"
	line "make an awesome"
	cont "combination!"
	done

CeruleanCityCooltrainerFText2:
	text "SLOWBRO, show me"
	line "your CONFUSION!"
	done

CeruleanCityCooltrainerFText3:
	text "…"
	done

CeruleanCityFisherText:
	text "I'm a huge fan of"
	line "CERULEAN GYM's"
	cont "MISTY."
	done

CeruleanCityFisherRocketTipText:
	text "I saw this shady"
	line "guy go off toward"
	cont "CERULEAN's CAPE."
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

	db 9 ; bg events
	bg_event 23, 23, BGEVENT_READ, CeruleanCitySign
	bg_event 27, 25, BGEVENT_READ, CeruleanGymSign
	bg_event 11, 29, BGEVENT_READ, CeruleanBikeShopSign
	bg_event 30, 17, BGEVENT_READ, CeruleanPoliceSign
	bg_event 23,  7, BGEVENT_READ, CeruleanCapeSign
	bg_event 20, 21, BGEVENT_READ, CeruleanCityPokecenterSign
	bg_event 26, 29, BGEVENT_READ, CeruleanCityMartSign
	bg_event  2, 12, BGEVENT_ITEM, CeruleanCityHiddenBerserkGene
	bg_event 25, 17, BGEVENT_READ, CeruleanOriginalGymSign

	db 8 ; object events
	object_event 15, 23, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerMScript, -1
	object_event 23, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCitySuperNerdScript, -1
	object_event 20, 24, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanCitySlowbro, -1
	object_event 21, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanCityCooltrainerFScript, -1
	object_event 30, 26, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityFisherScript, -1
	object_event 11, 10, SPRITE_SENSATIONAL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityDaisyScript, EVENT_CERULEAN_CITY_DAISY
	object_event  5, 33, SPRITE_SENSATIONAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCityVioletScript, EVENT_CERULEAN_CITY_VIOLET
	object_event 27,  8, SPRITE_SENSATIONAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanCityLilyScript, EVENT_CERULEAN_CITY_LILY
