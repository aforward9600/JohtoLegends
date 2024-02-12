	object_const_def ; object_event constants
	const VERMILIONCITY_SCHOOLBOY
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_LASS
	const VERMILIONCITY_SAILOR
	const VERMILIONCITY_SOLDIER

VermilionCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VERMILION
	return

VermilionCitySchoolboyScript:
	jumptextfaceplayer VermilionCitySchoolboyText

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	refreshscreen
	pokepic MACHOP
	cry MACHOP
	waitbutton
	closepokepic
	opentext
	writetext VermilionMachopText1
	waitbutton
	closetext
	end

VermilionCitySuperNerdScript:
	jumptextfaceplayer VermilionCitySuperNerdText

VermilionCitySailorScript:
	jumptextfaceplayer VermilionCitySailorText

VermilionCitySoldierScript:
	jumptextfaceplayer VermilionCitySoldierText

VermilionCityLassScript:
	jumptextfaceplayer VermilionCityLassText

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityDiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokecenterSign:
	jumpstd pokecentersign

VermilionCityMartSign:
	jumpstd martsign

VermilionCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

VermilionCityBarracksSign:
	jumptext VermilionCityBarracksSignText

VermilionCitySchoolboyText:
	text "I wanna join the"
	line "army when I grow"
	cont "up!"

	para "I'll save everyone"
	line "and look cool!"
	done

VermilionMachopOwnerText:
	text "I bought the old"
	line "Gym here, and I'll"
	cont "build something"
	cont "else."

	para "First, I just need"
	line "to demolish the"
	cont "Gym."
	done

VermilionMachopText1:
	text "Machop: Guooh"
	line "gogogoh!"
	done

VermilionMachopText2:
	text "A MACHOP is growl-"
	line "ing while stomping"
	cont "the ground flat."
	done

VermilionCitySuperNerdText:
	text "All these houses"
	line "are just going to"
	cont "collapse."

	para "We should probably"
	line "get to fixing them"
	cont "up soon."

	para "The soldiers will"
	line "save us from any"
	cont "further damage."
	done

UnknownText_0x1aab64:
	text "SNORLAX is snoring"
	line "peacefully…"
	done

UnknownText_0x1aab84:
	text "The #GEAR was"
	line "placed near the"
	cont "sleeping SNORLAX…"

	para "…"

	para "SNORLAX woke up!"
	done

VermilionCitySignText:
	text "Vermilion City"

	para "The Port of"
	line "Exquisite Sunsets"
	done

VermilionGymSignText:
	text "Vermilion City"
	line "#mon Gym"
	cont "Leader: …"

	para "The rest of the"
	line "text is illegible…"
	done

PokemonFanClubSignText:
	text "#mon Fan Club"

	para "All #mon Fans"
	line "Welcome!"
	done

VermilionCityDiglettsCaveSignText:
	text "Diglett's Cave"
	done

VermilionCityPortSignText:
	text "Vermilion Port"
	line "Entrance"
	done

VermilionCityBarracksSignText:
	text "Vermilion City"
	line "Barracks"

	para "Only authorized"
	line "personnel allowed."
	done

VermilionCitySailorText:
	text "Even with these"
	line "soldiers, ships"
	cont "won't sail!"

	para "Argh! I'm so"
	line "mad!"
	done

VermilionCitySoldierText:
	text "Left, right, left,"
	line "right."

	para "All clear for now!"
	done

VermilionCityLassText:
	text "When the soldiers"
	line "first came, we all"
	cont "hated them."

	para "After the Feds"
	line "burned down the"
	cont "Gym, they helped"
	cont "kick them out."

	para "Now they're our"
	line "protectors."
	done

VermilionCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event  5,  5, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 13, POKEMON_FAN_CLUB, 1
	warp_event 13, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 13, VERMILION_MART, 2
	warp_event 21, 17, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event 10, 19, VERMILION_GYM, 1
	warp_event 19, 31, VERMILION_PORT_PASSAGE, 1
	warp_event 20, 31, VERMILION_PORT_PASSAGE, 2
	warp_event 34,  7, DIGLETTS_CAVE, 1

	db 0 ; coord events

	db 9 ; bg events
	bg_event 25,  3, BGEVENT_READ, VermilionCitySign
	bg_event 25,  9, BGEVENT_READ, VermilionGymSign
	bg_event  5, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event 33,  9, BGEVENT_READ, VermilionCityDiglettsCaveSign
	bg_event 27, 15, BGEVENT_READ, VermilionCityPortSign
	bg_event 10,  5, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 22, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 12, 19, BGEVENT_ITEM, VermilionCityHiddenFullHeal
	bg_event  5, 19, BGEVENT_READ, VermilionCityBarracksSign

	db 7 ; object events
	object_event 18, 12, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCitySchoolboyScript, -1
	object_event 29,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	object_event 27,  5, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionMachop, -1
	object_event 21,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerdScript, -1
	object_event 28, 12, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionCityLassScript, -1
	object_event 24, 24, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCitySailorScript, -1
	object_event  8, 21, SPRITE_ENGINEER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySoldierScript, -1
