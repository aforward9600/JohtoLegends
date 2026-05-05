	object_const_def ; object_event constants
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK

MrPokemonsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_MR_POKEMON
	iftrue .AlwaysNewDiscoveries
	setevent EVENT_TALKED_TO_MR_POKEMON
	writetextend MrPokemonText_ImDependingOnYou

.AlwaysNewDiscoveries:
	checkitem STRANGE_HAIR
	iftrue .GiveMeThatHair
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .MythicalPassword
	writetextend MrPokemonText_AlwaysNewDiscoveries

.GiveMeThatHair:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse .refused
	verbosegiveitem GS_BALL
	iffalse .full
	takeitem STRANGE_HAIR
	setevent EVENT_FOREST_IS_RESTLESS
	setflag ENGINE_FOREST_IS_RESTLESS
	sjump .AlwaysNewDiscoveries

.refused
	writetextend MrPokemonText_Disappointed

.full
	closetext
	end

.MythicalPassword:
	writetextend MythicalPasswordText

MrPokemonsHouse_ForeignMagazines:
	jumptext MrPokemonsHouse_ForeignMagazinesText

MrPokemonsHouse_BrokenComputer:
	jumptext MrPokemonsHouse_BrokenComputerText

MrPokemonsHouse_StrangeCoins:
	jumptext MrPokemonsHouse_StrangeCoinsText

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step RIGHT
	step UP
	step_end

MrPokemonsHouse_OakWalksToPlayer:
	step DOWN
	step LEFT
	step LEFT
	step_end

MrPokemonsHouse_OakExits:
	step DOWN
	step LEFT
	turn_head DOWN
	step_sleep 2
	step_end

MrPokemonText_ImDependingOnYou:
	text_ntag "Mr. #mon"
	text "It's you!"

	para "I heard you"
	line "disappeared after"
	cont "you left the Day"
	cont "Care!"

	para "Well, it looks"
	line "like you're safe"
	cont "at any rate."

	para "And it looks like"
	line "your wing is safe"
	cont "as well."

	para "I'm guessing you're"
	line "not going to trade"
	cont "it…"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text_ntag "Mr. #mon"
	text "I'm always looking"
	line "to expand my"
	cont "collection."

	para "If you find any-"
	line "thing rare, let me"
	cont "make an offer."
	done

MrPokemonText_GimmeTheScale:
	text_ntag "Mr. #mon"
	text "Hm? That Hair!"
	line "What's that?"
	cont "What's that from?"

	para "That's rare!"
	line "I, I want it…"

	para "<PLAY_G>, would you"
	line "care to trade it?"

	para "I can offer this"
	line "GS Berry."

	para "I'm not sure of"
	line "its origins, but"
	cont "the rumors said"
	cont "that these berries"
	cont "summoned the"
	cont "guardian of Ilex"
	cont "Forest."

	para "I don't know the"
	line "validity of those"
	cont "claims."

	para "Do we have a deal?"
	done

MrPokemonText_Disappointed:
	text_ntag "Mr. #mon"
	text "That's disappoint-"
	line "ing. That happens"
	cont "to be very rare."
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "It's packed with"
	line "foreign magazines."

	para "Can't even read"
	line "their titles…"
	done

MrPokemonsHouse_BrokenComputerText:
	text "It's a big com-"
	line "puter. Hmm. It's"
	cont "broken."
	done

MrPokemonsHouse_StrangeCoinsText:
	text "A whole pile of"
	line "strange coins!"

	para "Maybe they're from"
	line "another country…"
	done

MythicalPasswordText:
	text_ntag "Mr. #mon"
	text "I often wonder"
	line "about this Strange"
	cont "Hair…"

	para "Where did it come"
	line "from?"

	para "Perhaps a MYTHICAL"
	line "#mon dropped it"
	cont "somewhere?"

	para "It's quite a"
	line "mystery…"
	done

MrPokemonsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_30, 2
	warp_event  3,  7, ROUTE_30, 2

	db 0 ; coord events

	db 5 ; bg events
	bg_event  0,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  1,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  6,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  6,  4, BGEVENT_READ, MrPokemonsHouse_StrangeCoins

	db 1 ; object events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
