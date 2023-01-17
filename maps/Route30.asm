	object_const_def ; object_event constants
	const ROUTE30_YOUNGSTER2
	const ROUTE30_YOUNGSTER3
	const ROUTE30_BUG_CATCHER
	const ROUTE30_YOUNGSTER4
	const ROUTE30_FRUIT_TREE1
	const ROUTE30_FRUIT_TREE2
	const ROUTE30_COOLTRAINER_F
	const ROUTE30_POKE_BALL

Route30_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerYoungsterCotton:
	trainer YOUNGSTER, COTTON, EVENT_BEAT_YOUNGSTER_COTTON, YoungsterCottonSeenText, YoungsterCottonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterCottonAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerMJacques:
	trainer COOLTRAINERM, JACQUES, EVENT_BEAT_COOLTRAINERM_JACQUES, CooltrainerMJacquesSeenText, CooltrainerMJacquesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerMJacquesRematchText
	yesorno
	iffalse .Refused
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext CooltrainerMJacquesLetsDoItText
	waitbutton
	winlosstext CooltrainerMJacquesBeatenText, 0
	loadtrainer COOLTRAINERM, JACQUES
	startbattle
	reloadmapafterbattle
	closetext
	end

.Refused:
	writetext CooltrainerMJacquesRefusedText
	waitbutton
	closetext
	end

TrainerBugCatcherAnton:
	trainer BUG_CATCHER, ANTON, EVENT_BEAT_BUG_CATCHER_ANTON, BugCatcherAntonSeenText, BugCatcherAntonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherAntonAfterText
	waitbutton
	closetext
	end

Route30YoungsterScript:
	jumptextfaceplayer Route30YoungsterText

Route30LassScript:
	jumptextfaceplayer Route30LassText

Route30Sign:
	jumptext Route30SignText

MrPokemonsHouseDirectionsSign:
	jumptext MrPokemonsHouseDirectionsSignText

MrPokemonsHouseSign:
	jumptext MrPokemonsHouseSignText

Route30MaxRevive:
	itemball MAX_REVIVE

Route30FruitTree1:
	fruittree FRUITTREE_ROUTE_30_1

Route30FruitTree2:
	fruittree FRUITTREE_ROUTE_30_2

Route30HiddenPotion:
	hiddenitem RARE_CANDY, EVENT_ROUTE_30_HIDDEN_RARE_CANDY

YoungsterCottonSeenText:
	text "My grandpa says he"
	line "did something to"
	cont "fiddy men in the"
	cont "war."

	para "I don't know what"
	line "he means."
	done

YoungsterCottonBeatenText:
	text "Bwaaaah!"
	done

YoungsterCottonAfterText:
	text "My dad says he"
	line "didn't fight in"

	para "the war, so I"
	line "don't know who to"
	cont "believe."
	done

CooltrainerMJacquesSeenText:
	text "There's no Gym in"
	line "Cherrygrove,"

	para "so there's no"
	line "point going there."
	done

CooltrainerMJacquesBeatenText:
	text "Nice one!"
	done

CooltrainerMJacquesRematchText:
	text "Cherrygrove doesn't"
	line "really have"
	cont "anything,"

	para "so do you want to"
	line "battle again?"
	done

CooltrainerMJacquesLetsDoItText:
	text "Sounds good to me!"
	done

CooltrainerMJacquesRefusedText:
	text "Well, if you won't"
	line "battle me, I heard"
	cont "a really strong"

	para "trainer is staying"
	line "in Cherrygrove."

	para "Maybe I should ask"
	line "for a battle."
	done

BugCatcherAntonSeenText:
	text "I'm the stronest"
	line "Bug Catcher in"
	cont "Johto!"
	done

BugCatcherAntonBeatenText:
	text "Not strong enough!"
	done

BugCatcherAntonAfterText:
	text "At least I think"
	line "I am."

	para "You know of any"
	line "Bug Catchers"
	cont "than me?"

	para "I doubt it."
	done

Route30YoungsterText:
	text "Mr.#mon's"
	line "house? It's a bit"
	cont "farther north."

	para "He's got some"
	line "neat stuff."
	done

Route30LassText:
	text "Cherrygrove City"
	line "is so beautiful"
	cont "this time of year."

	para "The cherry"
	line "blossoms really"
	cont "stand out."
	done

Route30SignText:
	text "Route 30"

	para "Violet City -"
	line "Cherrygrove City"

	para "Cooltrainer Jacque"
	line "is bored!"
	done

MrPokemonsHouseDirectionsSignText:
	text "Mr.#mon's house"
	line "straight ahead!"
	done

MrPokemonsHouseSignText:
	text "Mr.#mon's house"
	done

Route30_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7, 39, ROUTE_30_BERRY_HOUSE, 1
	warp_event 17,  5, MR_POKEMONS_HOUSE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  9, 43, BGEVENT_READ, Route30Sign
	bg_event 13, 29, BGEVENT_READ, MrPokemonsHouseDirectionsSign
	bg_event 15,  5, BGEVENT_READ, MrPokemonsHouseSign
	bg_event 14,  9, BGEVENT_ITEM, Route30HiddenPotion

	db 8 ; object events
	object_event 10, 42, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterCotton, 0
	object_event  5, 23, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerMJacques, -1
	object_event  4,  7, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherAnton, -1
	object_event 11, 32, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route30LassScript, -1
	object_event  5, 39, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30FruitTree1, -1
	object_event 11,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30FruitTree2, -1
	object_event  2, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route30YoungsterScript, -1
	object_event  8, 35, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route30MaxRevive, EVENT_ROUTE_30_ANTIDOTE
